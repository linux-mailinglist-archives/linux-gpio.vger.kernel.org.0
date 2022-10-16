Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7781B600195
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiJPRBu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiJPRBo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:01:44 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368313912E
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:35 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id hh9so6508471qtb.13
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8p9f8npWVzLL+xxIGq+LPGJqP+UsFdvXgAaWjNbjvo=;
        b=gT2wXcvVAH9ga+HJABZoq3GEaC6GrqraAl+MpfWgdykcbS/9wuHASImxTMUwEJzyL3
         Fx58+FxZ6zWADCAvxq4nBuDbpAavmmYlL+ycSECGV4ojDWarhkNFmgdVzafC6rPzK0ur
         517osDZEJH7G7fcruq9Ce5LGuRISbUGgR7gTEp1L8UwuW0I+T+7pK1rnkQU4d8LgKKEF
         7m7U4zRHsYnI3xyiMps7vhzOLOJwPETJCxnyXXHtL7Lfjwj30QoqhB7MJ/nftiOgUyC3
         VAzEPgCUPz7SzUGfVFCGchrOYfDCyxdxae/JzZzd5yplCeLvgFwiXERo2w3HjoLsd6uO
         xopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8p9f8npWVzLL+xxIGq+LPGJqP+UsFdvXgAaWjNbjvo=;
        b=CGCmuLriWspNj9CVeHlyt6zydhbGXZvSdNKutMW/sylfUAKL+f4O/8wOJ0V5gBrNl7
         AIIjrVNAsAlMyXdhDx1h+Me8841D+cHKg4OzzIc7fxG+YtD6wiAqzNAwAiXzpM4MhDdl
         fxpxeN+Lk5aih9wDv0SyfutDeEQzGUbwG5ogbZAw0CDt2UaH9csOykLDyFhfNvzKiYmz
         vRUKgAvrhvxbuPsdzntQMuxf43jZfu1VUJ0g2Kp6dbmpb7i7zXttYWeGuv6JujtQLR7y
         q0aLLHEV8vxioo0yzqvzGpBkKbcdVa69oo5bWOkH0UrtTpcUhZPEh646OOTEWHmBOcaz
         dS/w==
X-Gm-Message-State: ACrzQf31rJGmus6yRwKid4HzV0g+xjYIJKQfn4VcZ9NZXZjUhNz6cD0D
        nCubJ3qo47YmnKftOc5M10MahA==
X-Google-Smtp-Source: AMsMyM79/fSvT5Io3pb47E7FDD0E8813Z6VfBW85Ah2HacEO0acR0Xo0JgKkr3XVdrMMFP9yz+DMig==
X-Received: by 2002:a05:622a:2d1:b0:39c:c710:5181 with SMTP id a17-20020a05622a02d100b0039cc7105181mr5720424qtx.135.1665939695559;
        Sun, 16 Oct 2022 10:01:35 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 06/34] ARM: dts: qcom: msm8974: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:00:07 -0400
Message-Id: <20221016170035.35014-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 6daceaa87802..8138f37233aa 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -573,43 +573,43 @@ bcrmf@1 {
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
 
-	mpu6515_pin: mpu6515 {
+	mpu6515_pin: mpu6515-state {
 		pins = "gpio73";
 		function = "gpio";
 		bias-disable;
 		input-enable;
 	};
 
-	touch_pin: touch {
-		int {
+	touch_pin: touch-state {
+		int-pins {
 			pins = "gpio5";
 			function = "gpio";
 
@@ -618,7 +618,7 @@ int {
 			input-enable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio8";
 			function = "gpio";
 
@@ -627,25 +627,25 @@ reset {
 		};
 	};
 
-	panel_pin: panel {
+	panel_pin: panel-state {
 		pins = "gpio12";
 		function = "mdp_vsync";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
-	bt_pin: bt {
-		hostwake {
+	bt_pin: bt-state {
+		hostwake-pins {
 			pins = "gpio42";
 			function = "gpio";
 		};
 
-		devwake {
+		devwake-pins {
 			pins = "gpio62";
 			function = "gpio";
 		};
 
-		shutdown {
+		shutdown-pins {
 			pins = "gpio41";
 			function = "gpio";
 		};
-- 
2.34.1

