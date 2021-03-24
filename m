Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2F5348493
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 23:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhCXWYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 18:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhCXWYn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 18:24:43 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D735C0613DE
        for <linux-gpio@vger.kernel.org>; Wed, 24 Mar 2021 15:24:43 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y5so18580060pfn.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Mar 2021 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+f7vy8L6BaKbuHNfVQy1QFqCIe47nQIq59LKEtEf7QU=;
        b=BLDat+XvSUT0zkvpExCAkP6lb6FeIM4gmxj5t5SuthD1U3Z8c0HWR68B+v4oP0aVcO
         4XFNeBu8YTbZ4ty4BhcQFDG5Nh6ni8eX3QYFKejzs879ryF6/d1p+timMlNgBNpOetaX
         2ZQ2QNjdA49jqsc+Gl0sdffK7L17uw39UdvdB4fsDjkSHcoICb+OwvjkeYfOE2+L8hP1
         jHOuqROv6fj/jqnnrraJZbOOU13qKbcfqlTdQZZqZCf+YO21Sk2X5QKZ4PmUfLfvttzn
         6uHT0ozJFVbYu4L2ISi2AymJoYr3eC0JWKPx3IYAg57sWcCCCa4WCtxZTQl4YKHGgjwM
         5YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+f7vy8L6BaKbuHNfVQy1QFqCIe47nQIq59LKEtEf7QU=;
        b=N/Jdumq3rPbIPCTuQU36x7nZcLakJ/S8Iz9vT4PqsL86rp4kxjV6HLYQ7oXlqhqLEA
         QyMBbao33qtmtfnCAp2PdFuZ7J4193LHAKR494R2EwNNH9v/BYynJ60DpelP5WkWKThM
         qXcJ+gcSgHysaeMVln6bTqkdvRE7F/BLr3vebBOH0cE0rBrW8MK/PnpQDfszvA4ZXKoV
         HibHBTe22vmzR8X8RwGdzVt0niNbIHwS0O6d73CDtpFmZY0aSC1Bm0kLxalSD6r0S9E6
         mplGu3T0aW3L1cS0tLPGkFp3jPLHM5HSGmJo5Y1BHh9VnzPbrd51UuPBvIZJkD7ui4Ki
         /WSw==
X-Gm-Message-State: AOAM530+5mo8XQQDFV6lLvacyKa0Al8BDf3iObtp5adPAUOkcvikw5l8
        ajvPC42mYjPm1KgZn1RKbhcyxg==
X-Google-Smtp-Source: ABdhPJw4bZ+bZPEpzltN4cKXjYCf3h7CebEwVwZhyFqqluFlYz9hDBItR/ZydLAcUALfeyxTjlILDg==
X-Received: by 2002:a17:902:8494:b029:e6:cb9a:9fd5 with SMTP id c20-20020a1709028494b02900e6cb9a9fd5mr5581678plo.81.1616624682358;
        Wed, 24 Mar 2021 15:24:42 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:2535:883:67bb:5fbf])
        by smtp.gmail.com with ESMTPSA id f11sm3445015pga.34.2021.03.24.15.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:24:41 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, bcousson@baylibre.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] ARM: dts: am335x-boneblack.dts: unique gpio-line-names
Date:   Wed, 24 Mar 2021 15:22:02 -0700
Message-Id: <20210324222201.674905-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Based on linux-gpio discussion [1], it is best practice to make the
gpio-line-names unique. Generic names like "[ethernet]" are replaced
with the name of the unique signal on the AM3358 SoC ball corresponding
to the gpio line. "[NC]" is also renamed to the standard "NC" name to
represent "not connected".

[1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Tony - I have fixed the conflict so this now applies against mainline.

 arch/arm/boot/dts/am335x-boneblack.dts | 132 ++++++++++++-------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index b4feb85e171a..e2ee8b8c07bc 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -26,54 +26,54 @@ oppnitro-1000000000 {
 
 &gpio0 {
 	gpio-line-names =
-		"[ethernet]",
-		"[ethernet]",
+		"[mdio_data]",
+		"[mdio_clk]",
 		"P9_22 [spi0_sclk]",
 		"P9_21 [spi0_d0]",
 		"P9_18 [spi0_d1]",
 		"P9_17 [spi0_cs0]",
-		"[sd card]",
-		"P9_42A [ecappwm0]",
-		"P8_35 [hdmi]",
-		"P8_33 [hdmi]",
-		"P8_31 [hdmi]",
-		"P8_32 [hdmi]",
+		"[mmc0_cd]",
+		"P8_42A [ecappwm0]",
+		"P8_35 [lcd d12]",
+		"P8_33 [lcd d13]",
+		"P8_31 [lcd d14]",
+		"P8_32 [lcd d15]",
 		"P9_20 [i2c2_sda]",
 		"P9_19 [i2c2_scl]",
 		"P9_26 [uart1_rxd]",
 		"P9_24 [uart1_txd]",
-		"[ethernet]",
-		"[ethernet]",
-		"[usb]",
-		"[hdmi]",
+		"[rmii1_txd3]",
+		"[rmii1_txd2]",
+		"[usb0_drvvbus]",
+		"[hdmi cec]",
 		"P9_41B",
-		"[ethernet]",
+		"[rmii1_txd1]",
 		"P8_19 [ehrpwm2a]",
 		"P8_13 [ehrpwm2b]",
-		"[NC]",
-		"[NC]",
+		"NC",
+		"NC",
 		"P8_14",
 		"P8_17",
-		"[ethernet]",
-		"[ethernet]",
+		"[rmii1_txd0]",
+		"[rmii1_refclk]",
 		"P9_11 [uart4_rxd]",
 		"P9_13 [uart4_txd]";
 };
 
 &gpio1 {
 	gpio-line-names =
-		"P8_25 [emmc]",
-		"[emmc]",
-		"P8_5 [emmc]",
-		"P8_6 [emmc]",
-		"P8_23 [emmc]",
-		"P8_22 [emmc]",
-		"P8_3 [emmc]",
-		"P8_4 [emmc]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
+		"P8_25 [mmc1_dat0]",
+		"[mmc1_dat1]",
+		"P8_5 [mmc1_dat2]",
+		"P8_6 [mmc1_dat3]",
+		"P8_23 [mmc1_dat4]",
+		"P8_22 [mmc1_dat5]",
+		"P8_3 [mmc1_dat6]",
+		"P8_4 [mmc1_dat7]",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
 		"P8_12",
 		"P8_11",
 		"P8_16",
@@ -82,13 +82,13 @@ &gpio1 {
 		"P9_23",
 		"P9_14 [ehrpwm1a]",
 		"P9_16 [ehrpwm1b]",
-		"[emmc]",
+		"[emmc rst]",
 		"[usr0 led]",
 		"[usr1 led]",
 		"[usr2 led]",
 		"[usr3 led]",
-		"[hdmi]",
-		"[usb]",
+		"[hdmi irq]",
+		"[usb vbus oc]",
 		"[hdmi audio]",
 		"P9_12",
 		"P8_26",
@@ -116,38 +116,38 @@ &gpio2 {
 		"P8_38 [hdmi]",
 		"P8_36 [hdmi]",
 		"P8_34 [hdmi]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
+		"[rmii1_rxd3]",
+		"[rmii1_rxd2]",
+		"[rmii1_rxd1]",
+		"[rmii1_rxd0]",
 		"P8_27 [hdmi]",
 		"P8_29 [hdmi]",
 		"P8_28 [hdmi]",
 		"P8_30 [hdmi]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]";
+		"[mmc0_dat3]",
+		"[mmc0_dat2]",
+		"[mmc0_dat1]",
+		"[mmc0_dat0]",
+		"[mmc0_clk]",
+		"[mmc0_cmd]";
 };
 
 &gpio3 {
 	gpio-line-names =
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[i2c0]",
-		"[i2c0]",
-		"[emu]",
-		"[emu]",
-		"[ethernet]",
-		"[ethernet]",
-		"[NC]",
-		"[NC]",
-		"[usb]",
+		"[mii col]",
+		"[mii crs]",
+		"[mii rx err]",
+		"[mii tx en]",
+		"[mii rx dv]",
+		"[i2c0 sda]",
+		"[i2c0 scl]",
+		"[jtag emu0]",
+		"[jtag emu1]",
+		"[mii tx clk]",
+		"[mii rx clk]",
+		"NC",
+		"NC",
+		"[usb vbus en]",
 		"P9_31 [spi1_sclk]",
 		"P9_29 [spi1_d0]",
 		"P9_30 [spi1_d1]",
@@ -156,14 +156,14 @@ &gpio3 {
 		"P9_27",
 		"P9_41A",
 		"P9_25",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]";
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC";
 };
-- 
2.27.0

