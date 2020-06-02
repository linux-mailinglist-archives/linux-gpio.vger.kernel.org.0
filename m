Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70D21EBCC8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 15:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgFBNOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 09:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgFBNOd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 09:14:33 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455F7C08C5C0
        for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2020 06:14:33 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id q13so10053119edi.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2020 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XVaBawq5z+XXpKkroBKO8PqW/GxFoYcZjt6wh1I53xU=;
        b=okcfNkFR1LeQOaSQ7P+W7WeFPTwIGoshNEE68HoP3P6tJQw0q1wYIpazYd5UZgJQnb
         1JkWIogob1Izaw/RG7knVwpleyFQxaIcp1IyMyxU7ft8U7VALaicMvUD3W9n6F5WAlea
         UYZo4aYgF9UTMwf9qSr2npmQxElO7y0uqZK6IFq6v62e/K0NCMvVe6JwrLHPxoXv+KR4
         vQjxWWl/CMgwDc/ZKQpwoFGdwdnBsBnkle5y1TntCW529EWMS/RnVttFjxXE55uPaYaL
         hH35h5sap2waDc8MvR3V9KUhYlNkN8W+s8ARS7ZHsU4P/ma/CmxD2Jw+0qgxHEUJVa3X
         kkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XVaBawq5z+XXpKkroBKO8PqW/GxFoYcZjt6wh1I53xU=;
        b=szqJI3rqCzupHdDlhInWWFiF8bEfJKsm6JyQieYjc/MkFY1sKhrBJV1axEzhmRhj8u
         byYXo58DeOMb7T7nRYqql9PIicTqN+pWJaYcscoKz8vw5KoVRoNWMSbuEQ1Y8HDDF2O2
         aok86NqExCghu7234M9Lrkj5GQGbjFgxfot4whOQhNnjMxNlRnCWXDd20UFpEpppAwPP
         xrjuvDypJch76VnFysN/ZgjTEpgmKUfg2+tePbssUTo2AtAMDQWW5D2yit/ps1NH89KH
         Ad7DbrI2lz6QA0bPwInQrw+ap/IB8w/aMAn4BoLQrOjD6eXyFq69iKdL8ugjusimfZmU
         UBkA==
X-Gm-Message-State: AOAM531wlNmXNHm7RDr+woK7RX3LuDx6db3xKEc3ThaOpPSi/gAnpm7Q
        Jl96hRxjcdy7ORy6fimknleKKA==
X-Google-Smtp-Source: ABdhPJxzbHWq9v7de7GejtiJ3HvvTUw/uEqelVIuImeAuzei3E6fLsQxLPffSqcSs5j/Uevo8ng0nQ==
X-Received: by 2002:aa7:c245:: with SMTP id y5mr1254646edo.189.1591103671800;
        Tue, 02 Jun 2020 06:14:31 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id a9sm1574144edr.23.2020.06.02.06.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 06:14:31 -0700 (PDT)
Date:   Tue, 2 Jun 2020 15:14:28 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200602131428.GA496390@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio-ranges properties to the gpio controller nodes.

These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
A csv file with this data is available for reference [2].

[0] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
[1] http://www.ti.com/lit/ds/symlink/am3358.pdf
[2] https://gist.github.com/pdp7/6ffaddc8867973c1c3e8612cfaf72020

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Notes:
There was previous dicussion relevant to this patch:
https://lore.kernel.org/linux-gpio/20200525131731.GA948395@x1/

Here is the list I compiled which shows the mapping between a gpioline
and the pin number including the memory address for the pin control
register

gpiochip,gpio-line,pinctrl-PIN,pinctrl-address
0,0,82,44e10948
0,1,83,44e1094c
0,2,84,44e10950
0,3,85,44e10954
0,4,86,44e10958
0,5,87,44e1095c
0,6,88,44e10960
0,7,89,44e10964
0,8,52,44e108d0
0,9,53,44e108d4
0,10,54,44e108d8
0,11,55,44e108dc
0,12,94,44e10978
0,13,95,44e1097c
0,14,96,44e10980
0,15,97,44e10984
0,16,71,44e1091c
0,17,72,44e10920
0,18,135,44e10a1c
0,19,108,44e109b0
0,20,109,44e109b4
0,21,73,44e10924
0,22,8,44e10820
0,23,9,44e10824
0,26,10,44e10828
0,27,11,44e1082c
0,28,74,44e10928
0,29,81,44e10944
0,30,28,44e10870
0,31,29,44e10874
1,0,0,44e10800
1,1,1,44e10804
1,2,2,44e10808
1,3,3,44e1080c
1,4,4,44e10810
1,5,5,44e10814
1,6,6,44e10818
1,7,7,44e1081c
1,8,90,44e10968
1,9,91,44e1096c
1,10,92,44e10970
1,11,93,44e10974
1,12,12,44e10830
1,13,13,44e10834
1,14,14,44e10838
1,15,15,44e1083c
1,16,16,44e10840
1,17,17,44e10844
1,18,18,44e10848
1,19,19,44e1084c
1,20,20,44e10850
1,21,21,44e10854
1,22,22,44e10858
1,23,23,44e1085c
1,24,24,44e10860
1,25,25,44e10864
1,26,26,44e10868
1,27,27,44e1086c
1,28,30,44e10878
1,29,31,44e1087c
1,30,32,44e10880
1,31,33,44e10884
2,0,34,44e10888
2,1,35,44e1088c
2,2,36,44e10890
2,3,37,44e10894
2,4,38,44e10898
2,5,39,44e1089c
2,6,40,44e108a0
2,7,41,44e108a4
2,8,42,44e108a8
2,9,43,44e108ac
2,10,44,44e108b0
2,11,45,44e108b4
2,12,46,44e108b8
2,13,47,44e108bc
2,14,48,44e108c0
2,15,49,44e108c4
2,16,50,44e108c8
2,17,51,44e108cc
2,18,77,44e10934
2,19,78,44e10938
2,20,79,44e1093c
2,21,80,44e10940
2,22,56,44e108e0
2,23,57,44e108e4
2,24,58,44e108e8
2,25,59,44e108ec
2,26,60,44e108f0
2,27,61,44e108f4
2,28,62,44e108f8
2,29,63,44e108fc
2,30,64,44e10900
2,31,65,44e10904
3,0,66,44e10908
3,1,67,44e1090c
3,2,68,44e10910
3,3,69,44e10914
3,4,70,44e10918
3,5,98,44e10988
3,6,99,44e1098c
3,9,75,44e1092c
3,10,76,44e10930
3,13,141,44e10a34
3,14,100,44e10990
3,15,101,44e10994
3,16,102,44e10998
3,17,103,44e1099c
3,18,104,44e109a0
3,19,105,44e109a4
3,20,106,44e109a8
3,21,107,44e109ac

On a BeagleBlack Black board (AM3358) with this patch:
cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/gpio-ranges

GPIO ranges handled:
0: gpio-0-31 GPIOS [0 - 7] PINS [82 - 89]
8: gpio-0-31 GPIOS [8 - 11] PINS [52 - 55]
12: gpio-0-31 GPIOS [12 - 15] PINS [94 - 97]
16: gpio-0-31 GPIOS [16 - 17] PINS [71 - 72]
18: gpio-0-31 GPIOS [18 - 18] PINS [135 - 135]
19: gpio-0-31 GPIOS [19 - 20] PINS [108 - 109]
21: gpio-0-31 GPIOS [21 - 21] PINS [73 - 73]
22: gpio-0-31 GPIOS [22 - 23] PINS [8 - 9]
26: gpio-0-31 GPIOS [26 - 27] PINS [10 - 11]
28: gpio-0-31 GPIOS [28 - 28] PINS [74 - 74]
29: gpio-0-31 GPIOS [29 - 29] PINS [81 - 81]
30: gpio-0-31 GPIOS [30 - 31] PINS [28 - 29]
0: gpio-32-63 GPIOS [32 - 39] PINS [0 - 7]
8: gpio-32-63 GPIOS [40 - 43] PINS [90 - 93]
12: gpio-32-63 GPIOS [44 - 59] PINS [12 - 27]
28: gpio-32-63 GPIOS [60 - 63] PINS [30 - 33]
0: gpio-64-95 GPIOS [64 - 81] PINS [34 - 51]
18: gpio-64-95 GPIOS [82 - 85] PINS [77 - 80]
22: gpio-64-95 GPIOS [86 - 95] PINS [56 - 65]
0: gpio-96-127 GPIOS [96 - 100] PINS [66 - 70]
5: gpio-96-127 GPIOS [101 - 102] PINS [98 - 99]
7: gpio-96-127 GPIOS [103 - 104] PINS [75 - 76]
13: gpio-96-127 GPIOS [109 - 109] PINS [141 - 141]
14: gpio-96-127 GPIOS [110 - 117] PINS [100 - 107]

 arch/arm/boot/dts/am33xx-l4.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 5ed7f3c58c0f..340ea331e54d 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -151,6 +151,18 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio0: gpio@0 {
 				compatible = "ti,omap4-gpio";
+				gpio-ranges =	<&am33xx_pinmux  0  82 8>,
+						<&am33xx_pinmux  8  52 4>,
+						<&am33xx_pinmux 12  94 4>,
+						<&am33xx_pinmux 16  71 2>,
+						<&am33xx_pinmux 18 135 1>,
+						<&am33xx_pinmux 19 108 2>,
+						<&am33xx_pinmux 21  73 1>,
+						<&am33xx_pinmux 22   8 2>,
+						<&am33xx_pinmux 26  10 2>,
+						<&am33xx_pinmux 28  74 1>,
+						<&am33xx_pinmux 29  81 1>,
+						<&am33xx_pinmux 30  28 2>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1298,6 +1310,10 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio1: gpio@0 {
 				compatible = "ti,omap4-gpio";
+				gpio-ranges =   <&am33xx_pinmux  0  0  8>,
+						<&am33xx_pinmux  8 90  4>,
+						<&am33xx_pinmux 12 12 16>,
+						<&am33xx_pinmux 28 30  4>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1700,6 +1716,9 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio2: gpio@0 {
 				compatible = "ti,omap4-gpio";
+                                gpio-ranges =	<&am33xx_pinmux  0 34 18>,
+						<&am33xx_pinmux 18 77  4>,
+						<&am33xx_pinmux 22 56 10>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1733,6 +1752,11 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio3: gpio@0 {
 				compatible = "ti,omap4-gpio";
+				gpio-ranges =	<&am33xx_pinmux  0  66 5>,
+						<&am33xx_pinmux  5  98 2>,
+						<&am33xx_pinmux  7  75 2>,
+						<&am33xx_pinmux 13 141 1>,
+						<&am33xx_pinmux 14 100 8>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
-- 
2.25.1

