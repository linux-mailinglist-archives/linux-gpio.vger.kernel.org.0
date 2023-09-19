Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68BD7A636C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 14:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjISMqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 08:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbjISMqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 08:46:16 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90A4102
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 05:46:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so7100083a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695127565; x=1695732365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLLpoq+DcvN55YeifZ9SGsL5kC0r1lCyLX42UdQGXRo=;
        b=ZM35CBM6YRAPDvoUBrk9km8C+ovnxTJZyhk9lv5c5yUnvFyFiwO/G/QyiWncM7vPU8
         Ndhht4hVSiEy94DtJ7XiAO0fRts8PlhDbcXaZ3paBZUNqka7KkDuuIPUpwE2tLgl4GNN
         tO9hwrAn4ntzhRT8KVasQCeoRoyJ7HhmjaQx9XuhaJh4X6nrU5TMPpZCirFj2oqwfQwl
         RGqSufOhV2AdmrgFbAU7EWdF5egUgzTKWubI+3CckomBpWPFW58gcOr3WHvRZZSApdUV
         z2U00uELE+0Y/FmkYcJi2SAkNQaVNofh/4OidxP9o1HlW1DXljY/xzd0h03GG2acI5aq
         0wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127565; x=1695732365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLLpoq+DcvN55YeifZ9SGsL5kC0r1lCyLX42UdQGXRo=;
        b=cBdca1mublxh6XxcvDSRDuy6Ix12NCspUfJey4LMd38Yh99yN3RboOzIzoyXCB5CSL
         0xe8qyQSBfsoEjYB7D5yIvTQYdaG/umeMS6hoaAKBKQMnIIMb92jZjDPfXP9DGY7eh7A
         k23m5nkVnGhc/eOBjEVGFKlHYgW+DeDgQ2rMVe97R25XJf1Vec1d2RdaOMQSVVqK1qaD
         pzMxW89DFwDvNgM7NSJlEcim3QhumNIXn/ZeM+dScm9C+zvl6M+BdccJJDnwvubZupAY
         8NhJf0AYeLEgYvff3fcdqpymBpkFSoXibO0fT6KJLv9SenhOnR1/eCV7nkwbF5YPVX+q
         LGNQ==
X-Gm-Message-State: AOJu0Yz7Gf3pzR9uM41TX8KIgy5BdJYQ0Ho3axtrI1lWyjFca2rNFgIx
        8fAUjjha/pbgYioJZoithO1d/A==
X-Google-Smtp-Source: AGHT+IFOoSh8VwSk3uaWIZRjca8rl/eH5qw0/LYnlSu9ZwfYCdjYA7p6eBAc6sBe6o86gMi+lEAZdQ==
X-Received: by 2002:a05:6402:206c:b0:530:ad02:a6e8 with SMTP id bd12-20020a056402206c00b00530ad02a6e8mr7303734edb.42.1695127564948;
        Tue, 19 Sep 2023 05:46:04 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm635878edb.66.2023.09.19.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:46:04 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 19 Sep 2023 14:45:55 +0200
Subject: [PATCH v2 1/7] arm64: dts: qcom: sc7280: Mark some nodes as
 'reserved'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230919-fp5-initial-v2-1-14bb7cedadf5@fairphone.com>
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With the standard Qualcomm TrustZone setup, components such as lpasscc,
pdc_reset and watchdog shouldn't be touched by Linux. Mark them with
the status 'reserved' and reenable them in the chrome-common dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  8 +++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 2e1cd219fc18..5d462ae14ba1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -46,6 +46,26 @@ wpss_mem: memory@9ae00000 {
 	};
 };
 
+&lpass_aon {
+	status = "okay";
+};
+
+&lpass_core {
+	status = "okay";
+};
+
+&lpass_hm {
+	status = "okay";
+};
+
+&lpasscc {
+	status = "okay";
+};
+
+&pdc_reset {
+	status = "okay";
+};
+
 /* The PMIC PON code isn't compatible w/ how Chrome EC/BIOS handle things. */
 &pmk8350_pon {
 	status = "disabled";
@@ -84,6 +104,10 @@ &scm {
 	dma-coherent;
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 2af42d0ad99e..3f7f5c99eaf8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2316,6 +2316,7 @@ lpasscc: lpasscc@3000000 {
 			clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
 			clock-names = "iface";
 			#clock-cells = <1>;
+			status = "reserved"; /* Owned by ADSP firmware */
 		};
 
 		lpass_rx_macro: codec@3200000 {
@@ -2467,6 +2468,7 @@ lpass_aon: clock-controller@3380000 {
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
+			status = "reserved"; /* Owned by ADSP firmware */
 		};
 
 		lpass_core: clock-controller@3900000 {
@@ -2477,6 +2479,7 @@ lpass_core: clock-controller@3900000 {
 			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
+			status = "reserved"; /* Owned by ADSP firmware */
 		};
 
 		lpass_cpu: audio@3987000 {
@@ -2547,6 +2550,7 @@ lpass_hm: clock-controller@3c00000 {
 			clock-names = "bi_tcxo";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
+			status = "reserved"; /* Owned by ADSP firmware */
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {
@@ -4243,6 +4247,7 @@ pdc_reset: reset-controller@b5e0000 {
 			compatible = "qcom,sc7280-pdc-global";
 			reg = <0 0x0b5e0000 0 0x20000>;
 			#reset-cells = <1>;
+			status = "reserved"; /* Owned by firmware */
 		};
 
 		tsens0: thermal-sensor@c263000 {
@@ -5239,11 +5244,12 @@ msi-controller@17a40000 {
 			};
 		};
 
-		watchdog@17c10000 {
+		watchdog: watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc7280", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			status = "reserved"; /* Owned by Gunyah hyp */
 		};
 
 		timer@17c20000 {

-- 
2.42.0

