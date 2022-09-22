Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514715E6C7B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbiIVT6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbiIVT5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:21 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA06810D65B
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:14 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x29so12303569ljq.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4+1bZaIVoOr4/FZ9DpEoNNyvB6I9uDIqPPe+8PG5bQg=;
        b=ngETRjRzjtPvlf5pcMgID63FO4eB3Tydqa2WjHh1PgNSkBh7Q5mjuW9m4str2wGJbu
         WRI+ox7m6u7bp64OBzTDT9BmVFjDPNwVWGf3N4xvuPKTthy5uCveuxY+Rp4mI2TuFrUW
         OXUfg+XQhjR047NsrF/tB524qHsomDOfbqkE1mJySGo3lkeulNRQ0HzxRBbLt72LVsrR
         fBNOTz1yA7wFhih7D/ShWQfJfNmhaLA9Gn9aUO2zTgEJ8S3Ap9ME7ny+5kNy89j0yJnb
         ziVQfPjexNHRjvzNynH3H02dHa3/U206dWjWWxlyi42LJR35xyEHtVlrxVa3rC5jHUme
         lkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4+1bZaIVoOr4/FZ9DpEoNNyvB6I9uDIqPPe+8PG5bQg=;
        b=T+IVcPqxHb6RQdXH8h709RwcUudl76+tQ78Z8c+zodyvilB4cymYA0FeSZzGbG8o0s
         pb7GwLC6kjtwPanD8l0NvmmRDZivYPgICmt0bFHEySeNh5jd5JEskxGlznEPhDaIP2Cm
         Jrj3TWEsNdkyNi0/amMEJWklXlpnNxrYSUmH7FBxi9EsSh/1L5dX2imKluxd9l093Yfv
         d+FdYLAQhF1Gn6JyLLvolyDZ4PQpnOgEpx+g0+zbZdSiS7OmYloQNdMOuzhJiB5+9ipV
         CNHiNnI0wrT8h+wbTsfexIZ54rhbDU/bRG8Nmc25knasQPs4vODgD7mc9MwITX1yDczg
         m32A==
X-Gm-Message-State: ACrzQf2qm40A5UdW112S2eH5G05XhQH9BwfeXOQDI9AusxcLZFJ/Shkd
        dG+uhF7c4bWzLRD3F0k0UTko4g==
X-Google-Smtp-Source: AMsMyM5PrsNRRmX0jGoM9yqKuUVpGppVcSCrfKB3LZmEue+6v1BD7Vi48/U6wEpKjUbr7aZoGtsLcA==
X-Received: by 2002:a05:651c:1786:b0:26c:5a70:cf21 with SMTP id bn6-20020a05651c178600b0026c5a70cf21mr1604722ljb.347.1663876632381;
        Thu, 22 Sep 2022 12:57:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:57:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/12] arm64: dts: qcom: sm8250: align LPASS pin configuration with DT schema
Date:   Thu, 22 Sep 2022 21:56:51 +0200
Message-Id: <20220922195651.345369-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects LPASS pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 44 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8f402b912c62..e0416d611b66 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2388,8 +2388,8 @@ lpass_tlmm: pinctrl@33c0000{
 				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
 			clock-names = "core", "audio";
 
-			wsa_swr_active: wsa-swr-active-pins {
-				clk {
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
 					pins = "gpio10";
 					function = "wsa_swr_clk";
 					drive-strength = <2>;
@@ -2397,7 +2397,7 @@ clk {
 					bias-disable;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio11";
 					function = "wsa_swr_data";
 					drive-strength = <2>;
@@ -2407,8 +2407,8 @@ data {
 				};
 			};
 
-			wsa_swr_sleep: wsa-swr-sleep-pins {
-				clk {
+			wsa_swr_sleep: wsa-swr-sleep-state {
+				clk-pins {
 					pins = "gpio10";
 					function = "wsa_swr_clk";
 					drive-strength = <2>;
@@ -2416,7 +2416,7 @@ clk {
 					bias-pull-down;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio11";
 					function = "wsa_swr_data";
 					drive-strength = <2>;
@@ -2426,14 +2426,14 @@ data {
 				};
 			};
 
-			dmic01_active: dmic01-active-pins {
-				clk {
+			dmic01_active: dmic01-active-state {
+				clk-pins {
 					pins = "gpio6";
 					function = "dmic1_clk";
 					drive-strength = <8>;
 					output-high;
 				};
-				data {
+				data-pins {
 					pins = "gpio7";
 					function = "dmic1_data";
 					drive-strength = <8>;
@@ -2441,8 +2441,8 @@ data {
 				};
 			};
 
-			dmic01_sleep: dmic01-sleep-pins {
-				clk {
+			dmic01_sleep: dmic01-sleep-state {
+				clk-pins {
 					pins = "gpio6";
 					function = "dmic1_clk";
 					drive-strength = <2>;
@@ -2450,7 +2450,7 @@ clk {
 					output-low;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio7";
 					function = "dmic1_data";
 					drive-strength = <2>;
@@ -2459,8 +2459,8 @@ data {
 				};
 			};
 
-			rx_swr_active: rx_swr-active-pins {
-				clk {
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
 					pins = "gpio3";
 					function = "swr_rx_clk";
 					drive-strength = <2>;
@@ -2468,7 +2468,7 @@ clk {
 					bias-disable;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio4", "gpio5";
 					function = "swr_rx_data";
 					drive-strength = <2>;
@@ -2477,8 +2477,8 @@ data {
 				};
 			};
 
-			tx_swr_active: tx_swr-active-pins {
-				clk {
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
 					pins = "gpio0";
 					function = "swr_tx_clk";
 					drive-strength = <2>;
@@ -2486,7 +2486,7 @@ clk {
 					bias-disable;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio1", "gpio2";
 					function = "swr_tx_data";
 					drive-strength = <2>;
@@ -2495,8 +2495,8 @@ data {
 				};
 			};
 
-			tx_swr_sleep: tx_swr-sleep-pins {
-				clk {
+			tx_swr_sleep: tx-swr-sleep-state {
+				clk-pins {
 					pins = "gpio0";
 					function = "swr_tx_clk";
 					drive-strength = <2>;
@@ -2504,7 +2504,7 @@ clk {
 					bias-pull-down;
 				};
 
-				data1 {
+				data1-pins {
 					pins = "gpio1";
 					function = "swr_tx_data";
 					drive-strength = <2>;
@@ -2512,7 +2512,7 @@ data1 {
 					bias-bus-hold;
 				};
 
-				data2 {
+				data2-pins {
 					pins = "gpio2";
 					function = "swr_tx_data";
 					drive-strength = <2>;
-- 
2.34.1

