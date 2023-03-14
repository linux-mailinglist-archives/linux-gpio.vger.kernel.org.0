Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496626B9E66
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjCNSbL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjCNSbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:31:09 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DEB1E2A3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:30:58 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso3098910wms.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzfaPBvy2iHf+DRsTEsWZvUw3uhdBHb/tIk1eFva8k=;
        b=jptdwn8EK8j4Em9IgxQcq5UKEO+QZKMjbMGUjGIPOE+hDRjnZbsil+5OpcKsvaWmIY
         wpSKZEVQ0bapKf9W8tBB267EZfyhgIBFxRSsHfGT4p/3kUgEz+TnjJZMTapxtds18Yyr
         mzy3AANoRArTrKWenvHq+Kwfz11S1GIA/FxfeCg16sMaIkkZCKNWh/5YHRNeu+B2DG9u
         CWA7xe13+ske3CO1Frg8aH3S072PnLVkA8LZujcJz4A/pmV32YiPBwKTWtjEx/Si4e2S
         tVicpz4x3ray/TA+wNCxf7XKS2s+X3KhsB88Nwe3hUzDjklvyNGrGTLGgrvtF3FnmB1e
         aEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzfaPBvy2iHf+DRsTEsWZvUw3uhdBHb/tIk1eFva8k=;
        b=f7P5UprHTknpbC4J6k0uq74zdRq6Hwg1UEp9dWYaipzvPb3TU1WW7/mG8BT50BHDWh
         BQ0X5jw4b+cXvbCGmA+lKRmzHHGEpYc/V2Upfxzzoan8yi+m8scwdlle5D2fTjfjCqsT
         On7N/D+H3LTrdv2dm0GmQ9bXxrpoKcdmTcxZ5z3n8wOyq5gOSMk0Cpu6HqWKbGj39QvI
         tIRZ+N1JroD3IlSjgzLIzricgnW068lnv8NUlFMlm6iA9Jdfrl5RQxAZ6R58RgBi4Wv+
         sd8RPdKNtMvJTTKVfZA9I6jVYerR9Ht2aehQmgX9EJ23pwKEk9Kiepv2ai7bQX/TI9q8
         9crw==
X-Gm-Message-State: AO0yUKXBvd2F8LrBrC01UxBYkSo/aSUSPK/UedWYuIFKx1KS8lOhBowY
        C9UW9Fyve2O5wZbft0dTSEsb9Q==
X-Google-Smtp-Source: AK7set/QsBggAASR81HPstv17jWT2SyT/ybiaRFJELtNo/iTKE38tzB+i5v4IdjR0FgMog2gsvyrng==
X-Received: by 2002:a05:600c:4448:b0:3dc:1687:9ba2 with SMTP id v8-20020a05600c444800b003dc16879ba2mr15041784wmn.35.1678818656755;
        Tue, 14 Mar 2023 11:30:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:30:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 03/14] arm64: dts: qcom: sa8775p: add the spmi node
Date:   Tue, 14 Mar 2023 19:30:32 +0100
Message-Id: <20230314183043.619997-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SPMI PMIC Arbiter node for SA8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 428d9e0849b8..22c98ebc4c46 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -943,6 +943,24 @@ apps_smmu: iommu@15000000 {
 		};
 	};
 
+	spmi_bus: spmi@c440000 {
+		compatible = "qcom,spmi-pmic-arb";
+		reg = <0x0 0x0c440000 0x0 0x1100>,
+		      <0x0 0x0c600000 0x0 0x2000000>,
+		      <0x0 0x0e600000 0x0 0x100000>,
+		      <0x0 0x0e700000 0x0 0xa0000>,
+		      <0x0 0x0c40a000 0x0 0x26000>;
+		reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+		qcom,channel = <0>;
+		qcom,ee = <0>;
+		interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "periph_irq";
+		interrupt-controller;
+		#interrupt-cells = <4>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+	};
+
 	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.37.2

