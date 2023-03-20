Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFCD06C1AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 16:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbjCTP7M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 11:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjCTP6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 11:58:19 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D86D531
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:27 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o7so10822880wrg.5
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EuK8D3JNAqpny7OspN8xAc6Jzm+Cu/RZugCo6caMi4=;
        b=Bq8A9y2+rcSkmKUYGbL7WaVyx448VKVw1TdbSyaIyIsH181EUbUC9IAxrPin2XtvWt
         k1hOqArE/bJcnYFfEZIpD2gayLjRO/beCUj8Yk11HWnc1ySFlXs2fpymtbSpMaUZ45If
         k/8CqL0nXFNh2Dr0OOT5p5YpMdLVaOB2+1tXPWqEigpHQRNAvn07f4VQurZXQG0oaEHy
         CxO493qK3dQqv0mH/HupPC2HARC9hMV+cKboZScWsd8oHdCHieFjzGYW2Bxs07TEuewn
         o05WAVHz8DdmryzXOUpt6Z4jB0t0nkWyMZwDqLNuJZLqDVjXzMmGyR6D9BDVr4icEKmH
         dcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EuK8D3JNAqpny7OspN8xAc6Jzm+Cu/RZugCo6caMi4=;
        b=ACyLZ3DrdztyHyjxpIrf9uI5xxx/X/1I6qdhnkLxIO9pdnkSZPRNu8TmZ/wm/Mgihc
         Tyn3oi+NMGvRJ2EgeZUHx7eSA8fXsocz2c7oeCQlJS3Bacbp//F1lLAqXkoB48Yc92fh
         dsHr40VQ/r3OJHazyJdm7aff1giNNA9JoUwYFpuaeDLlGEbKiaF0EJCpVdrRklgKSiP4
         2x5CCBzLs4lwGtMXtphajFUXImESc9KHTp4AiXF62FLLGqpaykKwjEktL2h2EQSAoy/b
         kzm66i8zYxqvWzsENFQiXKZ5AY5ErlSj2zJNcJ7HDYqccWAU6hvJUCpQpN8r+NA2rnXh
         rDww==
X-Gm-Message-State: AO0yUKVAUcearlOPND6GSt5a0XG6J2W3VIb6iNtZ+rV79EMZb48BTFgQ
        eB3hWi+2E/CRlPUsHh1K+soy+w==
X-Google-Smtp-Source: AK7set9mZKHf1/y1jc5gy9GO+0fgH6vMkUru3AVb/QoZV/aDdSqUOz8LghLGSE9LBvicyh5a0SF3Yg==
X-Received: by 2002:a5d:4650:0:b0:2d0:cf21:a40d with SMTP id j16-20020a5d4650000000b002d0cf21a40dmr12150282wrs.10.1679327345625;
        Mon, 20 Mar 2023 08:49:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:49:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 15/15] arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes
Date:   Mon, 20 Mar 2023 16:48:41 +0100
Message-Id: <20230320154841.327908-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
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

Add GPIO controller nodes to PMICs that have the GPIO hooked up on
sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 276070b62ccd..574c20caf9eb 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -78,6 +78,16 @@ pmm8654au_0_pon_resin: resin {
 				status = "disabled";
 			};
 		};
+
+		pmm8654au_0_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8654au_0_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmm8654au_1: pmic@2 {
@@ -99,6 +109,16 @@ pmm8654au_2: pmic@4 {
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmm8654au_2_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8654au_2_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmm8654au_3: pmic@6 {
-- 
2.37.2

