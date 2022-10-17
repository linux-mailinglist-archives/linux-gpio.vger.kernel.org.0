Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CC36004CE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 03:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiJQBWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 21:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiJQBWe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 21:22:34 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3DF3FEC7
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 18:22:32 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id l28so6924612qtv.4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 18:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJC/C2BLjnH4T9gw4OMMV2TeMJs+hTwat/hVDusDAwI=;
        b=ipyeeN9HmExppd49QQffMvI0WlWTgWePaMt2GDoGEc6Vzy+JPwXDSYBlWP1aChF1IP
         Cy0TxssbRu5xttvXZpTijx513z+McHDamhKgE3yg5vEu/S2hJ/8A7KQRhAsvR6HBt72d
         DADSBnUBa+ow7VL4+6CaDjvcuRBPmElFZxyDokvRluJHYrsEgZR26pA8Wbt00CHmVgKz
         EsW45Ex3wGiy3WTeAkRZ0SEAJcpOxKBslCb6WsIhhos6GY+eN//XhH9vVH7EcWRVRPu0
         /tGSehd2XpVFiOMDc5UdgT4WCdQpWvU0pPNP6DhYMaHbC27kYzOEXoEwUrRQpFswDiSS
         rNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJC/C2BLjnH4T9gw4OMMV2TeMJs+hTwat/hVDusDAwI=;
        b=niAVxD6VAIN2dHXy7yNfwij11lhOXTGvSS3w45VzeJPvzJzz3FQQSZ47mgBqfwoZLg
         0uYQIwTjwoP8Do1REVQsBdNJKd91gF0oyZ+MkoccT9c1AtAn9wrrmF33C2hgAR9lr4xk
         m/G9x5HYSEOyJjQsnzeS86y4tpKT+BMQS2EVsJKuAQyZi04ru4CD4bXFHUT+aRIfYjFm
         4LnWqBHl033d3oIbwoIKqV//JJKMf5278t9KHoL6oh/AIERkNRwIl4IfamuiLaX1jUcT
         LsZu8yAGuQQAn8AF5xW1oULHq+WdiGpWvFqa8RmMyj/zZNAoatGet0A2x6rMsgTA6t7E
         V38w==
X-Gm-Message-State: ACrzQf0ivbqP9tWykg+mCXKbIb8NBkKvtL6hjYJxfgOwC24n0ipWDNYw
        5J+Xo3MCmSs3USkJjm+FWNALDA==
X-Google-Smtp-Source: AMsMyM6VvUEdlZGLu/ikWeEMm9C17nlMpiXpCGvmQ1X3M5hDoSH8HcuAltSTtApZpEFwcFxRQ5RULg==
X-Received: by 2002:ac8:5dce:0:b0:35b:a78d:cd24 with SMTP id e14-20020ac85dce000000b0035ba78dcd24mr7072235qtx.464.1665969751145;
        Sun, 16 Oct 2022 18:22:31 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:bb7d:1aa4:bef8:ec27])
        by smtp.gmail.com with ESMTPSA id b13-20020ac87fcd000000b0039a610a04b1sm7011349qtk.37.2022.10.16.18.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 18:22:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: msm8974: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 21:22:25 -0400
Message-Id: <20221017012225.8579-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017012225.8579-1-krzysztof.kozlowski@linaro.org>
References: <20221017012225.8579-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.  All
nodes for GPIOs must also define the function property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 14 ++--
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   | 16 ++--
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 77 ++++++++++---------
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     | 20 ++---
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts | 36 ++++-----
 ...-msm8974pro-sony-xperia-shinano-castor.dts | 31 ++++----
 6 files changed, 98 insertions(+), 96 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 91716298ec5e..dc04f315026d 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -272,34 +272,34 @@ &sdhc_2 {
 };
 
 &tlmm {
-	sdc1_on: sdc1-on {
-		clk {
+	sdc1_on: sdc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdc2_on: sdc2-on {
-		clk {
+	sdc2_on: sdc2-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <10>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 
-		cd {
+		cd-pins {
 			pins = "gpio62";
 			function = "gpio";
 			drive-strength = <2>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
index 5a70683d9103..221a11e1d17d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -442,7 +442,7 @@ &smbb {
 };
 
 &tlmm {
-	ts_int_pin: touch-int {
+	ts_int_pin: touch-int-state {
 		pins = "gpio61";
 		function = "gpio";
 		drive-strength = <2>;
@@ -450,34 +450,34 @@ ts_int_pin: touch-int {
 		input-enable;
 	};
 
-	sdc1_on: sdc1-on {
-		clk {
+	sdc1_on: sdc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdc2_on: sdc-on {
-		clk {
+	sdc2_on: sdc-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <10>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 
-		cd {
+		cd-pins {
 			pins = "gpio62";
 			function = "gpio";
 			drive-strength = <2>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..3b0072f13a97 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1253,61 +1253,62 @@ tlmm: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
-			sdc1_off: sdc1-off {
-				clk {
+			sdc1_off: sdc1-off-state {
+				clk-pins {
 					pins = "sdc1_clk";
 					bias-disable;
 					drive-strength = <2>;
 				};
 
-				cmd {
+				cmd-pins {
 					pins = "sdc1_cmd";
 					bias-pull-up;
 					drive-strength = <2>;
 				};
 
-				data {
+				data-pins {
 					pins = "sdc1_data";
 					bias-pull-up;
 					drive-strength = <2>;
 				};
 			};
 
-			sdc2_off: sdc2-off {
-				clk {
+			sdc2_off: sdc2-off-state {
+				clk-pins {
 					pins = "sdc2_clk";
 					bias-disable;
 					drive-strength = <2>;
 				};
 
-				cmd {
+				cmd-pins {
 					pins = "sdc2_cmd";
 					bias-pull-up;
 					drive-strength = <2>;
 				};
 
-				data {
+				data-pins {
 					pins = "sdc2_data";
 					bias-pull-up;
 					drive-strength = <2>;
 				};
 
-				cd {
+				cd-pins {
 					pins = "gpio54";
+					function = "gpio";
 					bias-disable;
 					drive-strength = <2>;
 				};
 			};
 
-			blsp1_uart2_default: blsp1-uart2-default {
-				rx {
+			blsp1_uart2_default: blsp1-uart2-default-state {
+				rx-pins {
 					pins = "gpio5";
 					function = "blsp_uart2";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
-				tx {
+				tx-pins {
 					pins = "gpio4";
 					function = "blsp_uart2";
 					drive-strength = <4>;
@@ -1315,15 +1316,15 @@ tx {
 				};
 			};
 
-			blsp2_uart1_default: blsp2-uart1-default {
-				tx-rts {
+			blsp2_uart1_default: blsp2-uart1-default-state {
+				tx-rts-pins {
 					pins = "gpio41", "gpio44";
 					function = "blsp_uart7";
 					drive-strength = <2>;
 					bias-disable;
 				};
 
-				rx-cts {
+				rx-cts-pins {
 					pins = "gpio42", "gpio43";
 					function = "blsp_uart7";
 					drive-strength = <2>;
@@ -1331,22 +1332,22 @@ rx-cts {
 				};
 			};
 
-			blsp2_uart1_sleep: blsp2-uart1-sleep {
+			blsp2_uart1_sleep: blsp2-uart1-sleep-state {
 				pins = "gpio41", "gpio42", "gpio43", "gpio44";
 				function = "gpio";
 				drive-strength = <2>;
 				bias-pull-down;
 			};
 
-			blsp2_uart4_default: blsp2-uart4-default {
-				tx-rts {
+			blsp2_uart4_default: blsp2-uart4-default-state {
+				tx-rts-pins {
 					pins = "gpio53", "gpio56";
 					function = "blsp_uart10";
 					drive-strength = <2>;
 					bias-disable;
 				};
 
-				rx-cts {
+				rx-cts-pins {
 					pins = "gpio54", "gpio55";
 					function = "blsp_uart10";
 					drive-strength = <2>;
@@ -1354,42 +1355,42 @@ rx-cts {
 				};
 			};
 
-			blsp1_i2c1_default: blsp1-i2c1-default {
+			blsp1_i2c1_default: blsp1-i2c1-default-state {
 				pins = "gpio2", "gpio3";
 				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c1_sleep: blsp1-i2c1-sleep {
+			blsp1_i2c1_sleep: blsp1-i2c1-sleep-state {
 				pins = "gpio2", "gpio3";
 				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			blsp1_i2c2_default: blsp1-i2c2-default {
+			blsp1_i2c2_default: blsp1-i2c2-default-state {
 				pins = "gpio6", "gpio7";
 				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c2_sleep: blsp1-i2c2-sleep {
+			blsp1_i2c2_sleep: blsp1-i2c2-sleep-state {
 				pins = "gpio6", "gpio7";
 				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			blsp1_i2c3_default: blsp1-i2c3-default {
+			blsp1_i2c3_default: blsp1-i2c3-default-state {
 				pins = "gpio10", "gpio11";
 				function = "blsp_i2c3";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c3_sleep: blsp1-i2c3-sleep {
+			blsp1_i2c3_sleep: blsp1-i2c3-sleep-state {
 				pins = "gpio10", "gpio11";
 				function = "blsp_i2c3";
 				drive-strength = <2>;
@@ -1400,14 +1401,14 @@ blsp1_i2c3_sleep: blsp1-i2c3-sleep {
 
 			/* BLSP1_I2C5 info is missing */
 
-			blsp1_i2c6_default: blsp1-i2c6-default {
+			blsp1_i2c6_default: blsp1-i2c6-default-state {
 				pins = "gpio29", "gpio30";
 				function = "blsp_i2c6";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c6_sleep: blsp1-i2c6-sleep {
+			blsp1_i2c6_sleep: blsp1-i2c6-sleep-state {
 				pins = "gpio29", "gpio30";
 				function = "blsp_i2c6";
 				drive-strength = <2>;
@@ -1417,14 +1418,14 @@ blsp1_i2c6_sleep: blsp1-i2c6-sleep {
 
 			/* BLSP2_I2C1 info is missing */
 
-			blsp2_i2c2_default: blsp2-i2c2-default {
+			blsp2_i2c2_default: blsp2-i2c2-default-state {
 				pins = "gpio47", "gpio48";
 				function = "blsp_i2c8";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp2_i2c2_sleep: blsp2-i2c2-sleep {
+			blsp2_i2c2_sleep: blsp2-i2c2-sleep-state {
 				pins = "gpio47", "gpio48";
 				function = "blsp_i2c8";
 				drive-strength = <2>;
@@ -1435,48 +1436,48 @@ blsp2_i2c2_sleep: blsp2-i2c2-sleep {
 
 			/* BLSP2_I2C4 info is missing */
 
-			blsp2_i2c5_default: blsp2-i2c5-default {
+			blsp2_i2c5_default: blsp2-i2c5-default-state {
 				pins = "gpio83", "gpio84";
 				function = "blsp_i2c11";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp2_i2c5_sleep: blsp2-i2c5-sleep {
+			blsp2_i2c5_sleep: blsp2-i2c5-sleep-state {
 				pins = "gpio83", "gpio84";
 				function = "blsp_i2c11";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			blsp2_i2c6_default: blsp2-i2c6-default {
+			blsp2_i2c6_default: blsp2-i2c6-default-state {
 				pins = "gpio87", "gpio88";
 				function = "blsp_i2c12";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp2_i2c6_sleep: blsp2-i2c6-sleep {
+			blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
 				pins = "gpio87", "gpio88";
 				function = "blsp_i2c12";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			spi8_default: spi8_default {
-				mosi {
+			spi8_default: spi8_default-state {
+				mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
 				};
-				miso {
+				miso-pins {
 					pins = "gpio46";
 					function = "blsp_spi8";
 				};
-				cs {
+				cs-pins {
 					pins = "gpio47";
 					function = "blsp_spi8";
 				};
-				clk {
+				clk-pins {
 					pins = "gpio48";
 					function = "blsp_spi8";
 				};
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index ff6e0066768b..3e32685d8cf8 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -408,36 +408,36 @@ &smbb {
 };
 
 &tlmm {
-	sdc1_on: sdc1-on {
-		clk {
+	sdc1_on: sdc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdc2_on: sdc2-on {
-		clk {
+	sdc2_on: sdc2-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <10>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 	};
 
-	wcnss_pin_a: wcnss-pin-active {
-		wlan {
+	wcnss_pin_a: wcnss-pin-active-state {
+		wlan-pins {
 			pins =  "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
 			function = "wlan";
 
@@ -445,7 +445,7 @@ wlan {
 			bias-pull-down;
 		};
 
-		bt {
+		bt-pins {
 			pins = "gpio35", "gpio43", "gpio44";
 			function = "bt";
 
@@ -453,7 +453,7 @@ bt {
 			bias-pull-down;
 		};
 
-		fm {
+		fm-pins {
 			pins = "gpio41", "gpio42";
 			function = "fm";
 
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index 983e10c3d863..5bbdd5eb183b 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -706,57 +706,57 @@ &sdhc_3 {
 
 &tlmm {
 	/* This seems suspicious, but somebody with this device should look into it. */
-	blsp2_uart2_pins_active: blsp2-uart2-pins-active {
+	blsp2_uart2_pins_active: blsp2-uart2-pins-active-state {
 		pins = "gpio45", "gpio46", "gpio47", "gpio48";
 		function = "blsp_uart8";
 		drive-strength = <8>;
 		bias-disable;
 	};
 
-	blsp2_uart2_pins_sleep: blsp2-uart2-pins-sleep {
+	blsp2_uart2_pins_sleep: blsp2-uart2-pins-sleep-state {
 		pins = "gpio45", "gpio46", "gpio47", "gpio48";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
-	bt_pins: bt-pins {
-		hostwake {
+	bt_pins: bt-pins-state {
+		hostwake-pins {
 			pins = "gpio75";
 			function = "gpio";
 			drive-strength = <16>;
 			input-enable;
 		};
 
-		devwake {
+		devwake-pins {
 			pins = "gpio91";
 			function = "gpio";
 			drive-strength = <2>;
 		};
 	};
 
-	sdc1_on: sdhc1-on {
-		clk {
+	sdc1_on: sdhc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <4>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <4>;
 			bias-pull-up;
 		};
 	};
 
-	sdc3_on: sdc3-on {
+	sdc3_on: sdc3-on-state {
 		pins = "gpio35", "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
 		function = "sdc3";
 		drive-strength = <8>;
 		bias-disable;
 	};
 
-	sdhc3_cd_pin: sdc3-cd-on {
+	sdhc3_cd_pin: sdc3-cd-on-state {
 		pins = "gpio62";
 		function = "gpio";
 
@@ -764,49 +764,49 @@ sdhc3_cd_pin: sdc3-cd-on {
 		bias-disable;
 	};
 
-	sdc2_on: sdhc2-on {
-		clk {
+	sdc2_on: sdhc2-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <6>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 	};
 
-	i2c_touchkey_pins: i2c-touchkey {
+	i2c_touchkey_pins: i2c-touchkey-state {
 		pins = "gpio95", "gpio96";
 		function = "gpio";
 		input-enable;
 		bias-pull-up;
 	};
 
-	i2c_led_gpioex_pins: i2c-led-gpioex {
+	i2c_led_gpioex_pins: i2c-led-gpioex-state {
 		pins = "gpio120", "gpio121";
 		function = "gpio";
 		input-enable;
 		bias-pull-down;
 	};
 
-	gpioex_pin: gpioex {
+	gpioex_pin: gpioex-state {
 		pins = "gpio145";
 		function = "gpio";
 		bias-pull-up;
 		drive-strength = <2>;
 	};
 
-	wifi_pin: wifi {
+	wifi_pin: wifi-state {
 		pins = "gpio92";
 		function = "gpio";
 		input-enable;
 		bias-pull-down;
 	};
 
-	panel_te_pin: panel {
+	panel_te_pin: panel-state {
 		pins = "gpio12";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 3f45f5c5d37b..d446ac1f75ea 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -548,41 +548,42 @@ &smbb {
 };
 
 &tlmm {
-	lcd_backlight_en_pin_a: lcd-backlight-vddio {
+	lcd_backlight_en_pin_a: lcd-backlight-vddio-state {
 		pins = "gpio69";
+		function = "gpio";
 		drive-strength = <10>;
 		output-low;
 		bias-disable;
 	};
 
-	sdc1_on: sdc1-on {
-		clk {
+	sdc1_on: sdc1-on-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc1_cmd", "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdc2_on: sdc2-on {
-		clk {
+	sdc2_on: sdc2-on-state {
+		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <6>;
 			bias-disable;
 		};
 
-		cmd-data {
+		cmd-data-pins {
 			pins = "sdc2_cmd", "sdc2_data";
 			drive-strength = <6>;
 			bias-pull-up;
 		};
 
-		cd {
+		cd-pins {
 			pins = "gpio62";
 			function = "gpio";
 			drive-strength = <2>;
@@ -590,22 +591,22 @@ cd {
 		};
 	};
 
-	sdc3_on: sdc3-on {
-		clk {
+	sdc3_on: sdc3-on-state {
+		clk-pins {
 			pins = "gpio40";
 			function = "sdc3";
 			drive-strength = <10>;
 			bias-disable;
 		};
 
-		cmd {
+		cmd-pins {
 			pins = "gpio39";
 			function = "sdc3";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 
-		data {
+		data-pins {
 			pins = "gpio35", "gpio36", "gpio37", "gpio38";
 			function = "sdc3";
 			drive-strength = <10>;
@@ -613,7 +614,7 @@ data {
 		};
 	};
 
-	ts_int_pin: ts-int-pin {
+	ts_int_pin: ts-int-pin-state {
 		pins = "gpio86";
 		function = "gpio";
 		drive-strength = <2>;
@@ -621,7 +622,7 @@ ts_int_pin: ts-int-pin {
 		input-enable;
 	};
 
-	bt_host_wake_pin: bt-host-wake {
+	bt_host_wake_pin: bt-host-wake-state {
 		pins = "gpio95";
 		function = "gpio";
 		drive-strength = <2>;
@@ -629,7 +630,7 @@ bt_host_wake_pin: bt-host-wake {
 		output-low;
 	};
 
-	bt_dev_wake_pin: bt-dev-wake {
+	bt_dev_wake_pin: bt-dev-wake-state {
 		pins = "gpio96";
 		function = "gpio";
 		drive-strength = <2>;
-- 
2.34.1

