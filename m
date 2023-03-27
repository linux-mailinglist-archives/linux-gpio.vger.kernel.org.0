Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F006CA4D0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjC0MyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbjC0Mxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:34 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAB61731
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so7311297wmq.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48DD7pEvZ/2eHfxI/22xeFC054/nof7NI4mSTltG1IA=;
        b=0qkewywTMq3zwtAVbPsYdKJrT9Ha7uSKUBImwC3OtE5INrByAV8rNEuVqACE6cfzKD
         0D/4jKGq6j2FIE2za5gXd+CRGYuzp7hQfZDzTygogRYUuwrU53IE3t0ZFh/dDth4CzS4
         M5yzO79Q8VgoDzskRsLxjHpfuixeAtB9dKmIjaCZi1slEnxWLiiPgXbSH9iUy6GXC2Jf
         urnqrfFkOAHOBgcR674PiX4fbzuXG9Sp011O1SAs+Tz7/UsRiUTHLRaZaCKnG8ABOOeW
         fzeNzh1Ug1GCZRrcxXOb2yAsMAvDr/kuwsmZ5bQTFYJr3ITCjHn4p9lD1K+1EXAwQQhV
         o1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48DD7pEvZ/2eHfxI/22xeFC054/nof7NI4mSTltG1IA=;
        b=IFqs5TtlWgfWi43XEjk5Q7HRP6fmbjT2g9zNfO0oaURuWUQZa8Aajwqk6ttFMtoxX/
         qpfAgxCp5UTKqcFsHMS5G/K8kEb1yJ+vEIcLvYKvI5RE6YrDcYiuPH2Sl8owsEsQXzdC
         ZqVJI8Z0rR8hFRH9CL6Z5HnuYeMbd1KBChRmHqmulYu3f220P6USaIoqZuWOHz0O3TMB
         5P/14Ip7oRc0ZdxT0Puy/ixYa0fJDT5rhQuuTznhGDF3nep4IrDTVQZ8n+RzASbfqMEB
         PxWqefetxK7ellzk9GnNOtb9jX/OZYXk5SPYkwLKCvsN9u8jOAbg8tawJjLC6zycE2M1
         Q/oQ==
X-Gm-Message-State: AO0yUKXna4TD03hgcGnohjiFOKcku7y2iN8RoUmwpXofu0IFGwQJ/XaS
        prRY97KtEdcGnlirY8ksOOkNog==
X-Google-Smtp-Source: AK7set+6ZtIOYq1O+MAd+cqd6ZRV4GQgCbWx3idh54HtPpw4qz3KIu+72QNPITA5E31mz9PVbDMWTA==
X-Received: by 2002:a05:600c:4f91:b0:3ee:501f:c795 with SMTP id n17-20020a05600c4f9100b003ee501fc795mr13082362wmq.1.1679921612541;
        Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 14/18] arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes
Date:   Mon, 27 Mar 2023 14:53:12 +0200
Message-Id: <20230327125316.210812-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
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
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index be12997a080c..7602cca47bae 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -125,6 +125,16 @@ pmm8654au_0_pon_resin: resin {
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
@@ -139,6 +149,16 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pmm8654au_1_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8654au_2_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmm8654au_2: pmic@4 {
@@ -153,6 +173,16 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
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
@@ -167,5 +197,15 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
+
+		pmm8654au_3_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8654au_3_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };
-- 
2.37.2

