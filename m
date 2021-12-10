Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592FF470522
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238479AbhLJQF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238115AbhLJQF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:05:58 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7958DC061746;
        Fri, 10 Dec 2021 08:02:23 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t18so15650869wrg.11;
        Fri, 10 Dec 2021 08:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ChFk72t851+aV2Ogjln4o5C3/5+cLRU/SLpTwsm2C8c=;
        b=HdsjwWmtUQuMw+cBYt5/rOmaGki1Dr67L/fgYLxX3tTeFp3GMq977uaWLyAF0j7TsE
         u1zQbGhdD1gC98eUrzt7nOYxs74428lxTEaA+FNGqP/3AzSgnGUoZjENyCeXMIRAoVrc
         xsUi8k4l7lppnfv/cqhfhSuNaijYZmcYOdlmm1zn6/aYKWqaB3p+/uwcNCNMQ+k0k29N
         hI3nprVYJDAcWpPBY9Vbyzay8ToLxc5Lys7d1coQWvau0YPSmdsd7rhzmZS6Y0aokX+w
         M4agh4AdfSjgExLnKOKIthXXK6Z3trkwAtJ6NYHUpIjTfbHKrpKyAOHNTh8Qw6oVThbc
         CFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ChFk72t851+aV2Ogjln4o5C3/5+cLRU/SLpTwsm2C8c=;
        b=YiLFK7gecZp2I/fZZfEYXLPjIJOieoUDzpsJSBBXN02Dv1WKAKrxJ24EA8JSdDOwRK
         1HZUDzEaNRHDprGGbwtMbdGYw0Vl3b/Svmgjb5NNkF8SNHna89kLpmb04BSMsjTsycVu
         6HDqrlU9huAzhRWBQj+2l58bfcF6hMddwvOI1Iw3fdIcJLr7jmgtkzpa/xhujukn7uEh
         B6JqMZrBC6ksZjwTWLhOcX/Zjw5RxTuRussL5m+1C39mD0uLw5NvaIoWiV91wBRIEIFl
         VgG6Xr98SgyOXsX4ONs7nwCaxsJ64no8dzNrrG0UfVtcnRyaPfNHKOjbJgwHOGBZ7N31
         oLGg==
X-Gm-Message-State: AOAM5309BFyBTumyj/COm9WsC4XcrwXie7F6xvnlGl8fIHZw49MimuyX
        /db6CSGh4d82W3NMd/g2Bmk=
X-Google-Smtp-Source: ABdhPJxucWJqV5J5bMAX6eKgBv/GZiCpxhE0aFZKPpDqvZ8FOvqlnOeo4o3lqjKo2De7T0tLl2MQPA==
X-Received: by 2002:a5d:6547:: with SMTP id z7mr14498474wrv.597.1639152142025;
        Fri, 10 Dec 2021 08:02:22 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id e3sm2982871wrp.8.2021.12.10.08.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 5/6] arm64: tegra: Add main and AON GPIO controllers on Tegra234
Date:   Fri, 10 Dec 2021 17:02:05 +0100
Message-Id: <20211210160206.872998-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
References: <20211210160206.872998-1-thierry.reding@gmail.com>
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

