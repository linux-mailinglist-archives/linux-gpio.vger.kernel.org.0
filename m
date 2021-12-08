Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B7046D9BC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 18:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237915AbhLHRee (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 12:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhLHRed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 12:34:33 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E5C061746;
        Wed,  8 Dec 2021 09:31:01 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q3so5363190wru.5;
        Wed, 08 Dec 2021 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ChFk72t851+aV2Ogjln4o5C3/5+cLRU/SLpTwsm2C8c=;
        b=GAIBNnkIuSylvuaNhEfdn0NF2s4tW8aH5MGY7pGA3ssjr3sh5xOb5objHW0seksEQD
         dO5Zr5BzoSQk8FSuV6NnNmbYuQk8panNfjMNufgnYN+0d42G2Cd+lqWSkmi1VBdM6EGZ
         kPwrXA+eWPbbG9mgowtMfFIBiBbwqTobMKnQvK8IjHqGIyUw8lFTxcbdP8VkguI5weZ2
         1WEK+8FrqJTq8R25rkumrvIwdxoHDVg/YKCbwLzkIO+QreLubQJV2xZh6UmgpcxZ2bxQ
         2HL5ZeFZfQD7BnwD5rv15pmBW2KIcn7CJqfOtuylED3CEgtEL6wdmtwIgN7Ku3Ge9mfw
         09mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ChFk72t851+aV2Ogjln4o5C3/5+cLRU/SLpTwsm2C8c=;
        b=ToNjQ6duQh4bE8ZuBB44+ImIvdZvU9g1yOX/wvitbUoTjySse3SIAFWR20Xf3CizQW
         TgysQoS5GYWd7n1CpLLEbIrS6liI89n+tGo4Y7w5ubJypXQ6xkgoRBs6Z4UYT03RmUZQ
         ZLfCtqsYYRlKhkiCDnaSHAKMlweUR4id4yNd9GNR1Gis6FrcXkTo4jYfnEYl9D+k+2WD
         lgell2mpvdcxjQtkWjUwsLH+vfXFF7Q4ZoqE4s4Bk9GLVSaclhOUxZxUaxWWUdR06Oz9
         FeBg/CHgcbGSHf8SIHm+LsN50bxgxc62gVBNa6aDVshsShA3U/+2tpCcihSbxnd5zQXF
         1FLQ==
X-Gm-Message-State: AOAM531QhMMo4+QoZn+nBgbvjutR0vJucFqpOOi7KtR1ZGsOYksrGMxN
        wfVNs0taLbp/kHc5mdQO3h0=
X-Google-Smtp-Source: ABdhPJzQC917gVVu/KvPz7xGW4/AdGXSGvkbrnRc5dQmfSwJoFj2UNAwMd6qpqF6DcNRR9t7y5p3wg==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr16080wrp.627.1638984660242;
        Wed, 08 Dec 2021 09:31:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g13sm4882675wrd.57.2021.12.08.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:30:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: tegra: Add main and AON GPIO controllers on Tegra234
Date:   Wed,  8 Dec 2021 18:30:46 +0100
Message-Id: <20211208173047.558108-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These two controllers expose general purpose I/O pins that can be used
to control or monitor a variety of signals.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 74 ++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index bd3a01142704..f715671f0333 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -25,6 +25,65 @@ misc@100000 {
 			status = "okay";
 		};
 
+		gpio: gpio@2200000 {
+			compatible = "nvidia,tegra234-gpio";
+			reg-names = "security", "gpio";
+			reg = <0x02200000 0x10000>,
+			      <0x02210000 0x10000>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra234-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x10000>;
@@ -111,6 +170,21 @@ rtc@c2a0000 {
 			status = "disabled";
 		};
 
+		gpio_aon: gpio@c2f0000 {
+			compatible = "nvidia,tegra234-gpio-aon";
+			reg-names = "security", "gpio";
+			reg = <0x0c2f0000 0x1000>,
+			      <0x0c2f1000 0x1000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		pmc: pmc@c360000 {
 			compatible = "nvidia,tegra234-pmc";
 			reg = <0x0c360000 0x10000>,
-- 
2.34.1

