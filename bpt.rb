class BPT
    class<<self

        def scan_for_distance(content)

            dist, all = 0
            content.gsub!(/^.*edit/m,'')

            case content
           #when /^\d+\+(\d+)=(\d+)(?:km)?/
           #    dist = $1
           #    all = $2
            # msg = "Stawiasz pizze wszystkim 84 + 67 = 151"
           #when /\s?\d+\s?\+\s?(\d+)\s?=\s?(\d+)(?:km)?/
           #    dist = $1
           #    all = $2
            when /(?:edit)?.*?\d+\s*\+\s*(.*?)\s*=\s*(\d+.*?\d+)\s*(?:km)?/
                all_dist = $1

                # pp all_dist

                all = $2
                all.gsub!(/[^0-9]/,'')

                dist = all_dist.split('+').inject(0) { |xxx,x| xxx += x.to_i }
            when / (\d+) km$/
                all = dist = $1
            else
                all = 0
                dist = 0
            end

            return dist.to_i, all.to_i
        end
    end
end


if $0 == __FILE__ 
require 'rubygems'
require 'protest' 
require 'pp'

Protest.describe "Testuje" do

    #Misiek
    #"Zn\303\263w pierwszy post  Mo\305\274e jaka\305\233 premia za to?? 72 km"
    it "First post" do
        msg = "Zn\303\263w pierwszy post  Mo\305\274e jaka\305\233 premia za to?? 72 km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 72, dist
        assert_equal 72, all
    end

    #   #OskarOn14
    it "typical post" do
        msg = "72+12=84km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 12, dist
        assert_equal 84, all
    end

    # Ghost
    it "Ghost typical post" do
        msg = "Stawiasz pizze wszystkim 84 + 67 = 151"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 67, dist
        assert_equal 151, all
    end

    it "Ghost typical post2" do
        msg = "165 + 38 = 203"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 38, dist
        assert_equal 203, all
    end

    it "Ghost typical post3" do
        msg = "318 + 33 = 351 km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 33, dist
        assert_equal 351, all
    end

    # OskarOn14
    it "Oskar i kalkulator" do
        msg = "467+14+20=501kmOSKAAAAAAAAAARRRRR POLECAM KALKULATOR!!!!!!!!!!!!!"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 34, dist
        assert_equal 501, all
    end

    # 896 + 67 + 38 + 24 + 34 + 28 = 1087
    it "Ghost" do
        msg = "896 + 67 + 38 + 24 + 34 + 28 = 1087"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 191, dist
        assert_equal 1087, all
    end

    it "jacek" do
        msg = "dodam swoja pierwsza trase z szosowego D-ca - Tarnobrzeg 145km 1201+145= 1346"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 145, dist
        assert_equal 1346, all
    end

    it "empty" do
        msg = "Jacek Ty czasem nie masz konta na bikestats.pl?"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 0, dist
        assert_equal 0, all
    end

    it "misiek post" do
        msg = "1346  + 25 + 9 + 9 + 12 = 1401 km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 55, dist
        assert_equal 1401, all
    end

    it "jacek post2 " do
        msg = "1430+33=1463   /narazie przesiadam sie na MTB bo boli mnie d... chyba jakies inne siodelko trzeba"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 33, dist
        assert_equal 1463, all
    end

    it "adam post " do
        msg = "1 840 + 37 = 1 877"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 37, dist
        assert_equal 1877, all
    end

    it "oskar znowu atakuje " do
        msg = "3445+32+12+28=3517km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 72, dist
        assert_equal 3517, all
    end

    it "oskar znowu atakuje2" do
        msg = "3 567 + 37 + 48 = 3 652"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 85, dist
        assert_equal 3652, all
    end

    it "Ghost atakuje" do
        msg = "4204 + 60 + 66 + 68 + 40 + 68 + 38 = 4`544"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 340, dist
        assert_equal 4544, all
    end

    it "Dla odmiany Kawix" do
        msg = "4544 + 30 + 35 = 4.609 km"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 65, dist
        assert_equal 4609, all
    end

    it "przemo..." do
        msg = "4609 + 24 = 4633 km góóóóórkiiiiii"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 24, dist
        assert_equal 4633, all
    end

    it "podwojny vvoitek" do
        msg = "4785 + 29 = 4814

        edit:

        4814 + 47 = 4861"
        dist,all = BPT.scan_for_distance(msg)
        assert_equal 47, dist
        assert_equal 4861, all
    end

end
end
