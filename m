Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A9C3D8FE7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236868AbhG1N4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbhG1N4B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:56:01 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA4FC061757;
        Wed, 28 Jul 2021 06:55:59 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f22so2230783qke.10;
        Wed, 28 Jul 2021 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tcKay3c6C9hrMhtn74mlAVcFV1FvG+ErliMHy1IIxoY=;
        b=darC8OKOI71aM5dPQgy1vXucgnZu/mwcIs2CSjb0RuZr0zGTbHlKIt2BX7Is7PMrFX
         4UqWsvhV5M0BqYah3bvjZy0ZuvuFkYDBXv7pxFPY53fGdbZdsPS+l8WI1EaITn53EuKC
         YLP7OgGg/VlILxz0/jECX3dtntv3/3h/vww1k+6GnusLtR4PTzNk5lbW4jvtqSGDSU7g
         ReJ3c4koHvqZtVYTV5un+nPy+Dh6JSNQVRE39wkrGWZ6Ws7Th3hXSeyaMrjM1l80O4b0
         2rsICw2mYMIR4l+fFhVGi/SPmp19saEGzwNlZlgSGhwNzbFO/JuMbPXKGN+SEco0ph48
         5uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tcKay3c6C9hrMhtn74mlAVcFV1FvG+ErliMHy1IIxoY=;
        b=I22TDVqZqif+YKh5QEgP0Hd2UQc16FiSLK4U4WBknMuEWR75VA+1yKOiqtaI0cZlmz
         dT5MYeBnmN1Dm1hVTzLeOZrRYYd9d7ENTcDOIOB7yu1FHvNQ/fFLoy/Iz7KVLU/XYZ/6
         THJOLHN7ZeBKt3krVcD4ltolvsk65JeUJ5Tyf2aXykWVmzI2i6am/t3JSpDhsO6oSg9Q
         jT/64TNUDzVhClWBo3UbWwDSmJUHux1mA0JHICfxJB+hL5PZpLDFUj+/0hTYjkEwQj58
         GX8If20zwpVZrLDeQKlXAEPcnASq6w6UiUE/6sQ7Nm7YBYRVmwD2jnP9saSbYIs43Alj
         /jVQ==
X-Gm-Message-State: AOAM53055Kj0TNhNhxcxwOAErmndqElT3bVVjsyZQ1qj+k2ihgr1WM1R
        0gHVVRGhtFW+SHA1Emiuaej8ps20jEUE2CYt
X-Google-Smtp-Source: ABdhPJw0z8ytX74Ph/kZ+j0zcEFNcYorj+QzIBa5GqZDctfXT7NmKz3XFmKk4Jg/YWnmekqjWstU6A==
X-Received: by 2002:a37:a04a:: with SMTP id j71mr2805363qke.424.1627480558957;
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:58 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 9/9] arm64: dts: rockchip: add thermal support to Quartz64 Model A
Date:   Wed, 28 Jul 2021 09:55:34 -0400
Message-Id: <20210728135534.703028-10-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the thermal nodes for the Quartz64 Model A.
The Model A supports a single speed gpio fan.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 90cdabfac86b..eb311ea19f6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -26,6 +26,14 @@ gmac1_clkin: external-gmac1-clock {
 		#clock-cells = <0>;
 	};
 
+	fan: gpio_fan {
+		compatible = "gpio-fan";
+		gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		gpio-fan,speed-map = <0    0
+				      4500 1>;
+		#cooling-cells = <2>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -123,6 +131,23 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_hot: cpu_hot {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
@@ -432,6 +457,10 @@ &sdmmc0 {
 	status = "okay";
 };
 
+&tsadc {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer>;
-- 
2.25.1

