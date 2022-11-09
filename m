Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD88162290C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 11:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiKIKvv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 05:51:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiKIKvt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 05:51:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3161209E
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 02:51:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id j4so25121466lfk.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coHdJafi29GCpCUt/Krw8ZYkusDRjtP3ISPQSVzm+uU=;
        b=CZW504uUGt8GZtS5yACmXALMcE08tH6uabwUVez/B/HQaK7fjxBi9Gr1G/iNd8Qh5R
         5QWBDoZs5iBO216tIuiG6hkTymPFF+CV0f/Qxa6LOaGgoYIS0L+ybLSvcdwXB0nFr5BN
         XvRrS5KJaR2tcgi9ttA9h4FOUdiEZ/13im5BcDHEpigedf47ctKz93BgMLuDhpodOI9q
         Q+8isS1u1xwvGVm89mlqSlxA3bbzSNcs0Etev5UgqMFNxx7aVol58CCplU6eWrbfpDqg
         rWwz7xza/w2m5Na8VAk4jaNiJ98XXBrz/pMsipfwWlIhKZZW19sordFG8Ow29utB8DfO
         runw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coHdJafi29GCpCUt/Krw8ZYkusDRjtP3ISPQSVzm+uU=;
        b=6kAk9TIwX1lylrSuyak+cEfIQ3+n9MiIK3SB2r51mlWSOrSs4Y81wMZBv3RFTHLVI3
         280BVXsQVbesOWphkx6ZQ0CP+Bu00pLM6lU4CtOFh8DokYJPBSvJEFQAp/dF84tdKSyi
         KaVJIkhE3GDk07SbSuvtS3tPlv0NumVYyRzrcn8IAh2+e+YKq2JH+ihHWIERzR7aj5G3
         r0gjEAXRpgLsBwlbXnisTfaJsc2wefudWaUrD41lqqLFoEgaHBn0rnHqSH4TzHGZ3SPD
         9en71nR5l5/bBaoiqOpu4i6mKQRqHhHjn2uHaJkpa7Qd5cm7Zdj6ZXQAXLfZ5Lyzx+UI
         MAEg==
X-Gm-Message-State: ANoB5pkUlhkW4h+EryoJyb6lT3ZaXWy6mEiDTtG/B3l2zAnPtfkCZyQ7
        PwO717KB2Mkfu5+12Bo7TyqZrg==
X-Google-Smtp-Source: AA0mqf69CuJKkqag1pef3KyZ6TqRSRu6tY0RQtWSpT+VNVpIuARV26DjLK+HTbSZTsrqrCALf6uODA==
X-Received: by 2002:a05:6512:3502:b0:4b2:2cff:8437 with SMTP id h2-20020a056512350200b004b22cff8437mr6693775lfs.413.1667991105965;
        Wed, 09 Nov 2022 02:51:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b004b005150e92sm2167508lfg.127.2022.11.09.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 02:51:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: qcom-msm8960-cdp: align TLMM pin configuration with DT schema
Date:   Wed,  9 Nov 2022 11:51:40 +0100
Message-Id: <20221109105140.48196-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109105140.48196-1-krzysztof.kozlowski@linaro.org>
References: <20221109105140.48196-1-krzysztof.kozlowski@linaro.org>
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
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Add Rb tag
---
 arch/arm/boot/dts/qcom-msm8960-cdp.dts | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index 3a484ac53917..9a3a510f88ca 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -60,33 +60,32 @@ &gsbi5_serial {
 };
 
 &msmgpio {
-	spi1_default: spi1_default {
-		 mux {
-			pins = "gpio6", "gpio7", "gpio9";
-			function = "gsbi1";
-		 };
-
-		 mosi {
+	spi1_default: spi1-default-state {
+		 mosi-pins {
 			pins = "gpio6";
+			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
 		 };
 
-		 miso {
+		 miso-pins {
 			pins = "gpio7";
+			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
 		 };
 
-		 cs {
+		 cs-pins {
 			pins = "gpio8";
+			function = "gpio";
 			drive-strength = <12>;
 			bias-disable;
 			output-low;
 		 };
 
-		 clk {
+		 clk-pins {
 			pins = "gpio9";
+			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
 		 };
-- 
2.34.1

