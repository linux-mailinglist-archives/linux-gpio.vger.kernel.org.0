Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B4C38C10C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 09:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbhEUHzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 03:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbhEUHzl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 03:55:41 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D54FC06138D
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 00:54:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:18b5:4195:d4ed:57e1])
        by albert.telenet-ops.be with bizsmtp
        id 7KuC2500946MpxJ06KuCnj; Fri, 21 May 2021 09:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz1-007iyX-Nf; Fri, 21 May 2021 09:54:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz1-00A3ua-8U; Fri, 21 May 2021 09:54:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: dra7x-evm: Align GPIO hog names with dt-schema
Date:   Fri, 21 May 2021 09:54:06 +0200
Message-Id: <e8350ea542c92465020f03481d76943168df2935.1621583562.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621583562.git.geert+renesas@glider.be>
References: <cover.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dt-schema for nxp,pcf8575 expects GPIO hogs node names to end with a
'hog' suffix.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/dra7-evm.dts          | 2 +-
 arch/arm/boot/dts/dra71-evm.dts         | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi | 2 +-
 arch/arm/boot/dts/dra76-evm.dts         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 38530dbb89a00b7c..3dcb6e1f49bcf1f0 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -366,7 +366,7 @@ pcf_hdmi: gpio@26 {
 		reg = <0x26>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		p1 {
+		hdmi-audio-hog {
 			/* vin6_sel_s0: high: VIN6, low: audio */
 			gpio-hog;
 			gpios = <1 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 6d2cca6b44883e59..a64364443031525b 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -187,7 +187,7 @@ &pcf_gpio_21 {
 };
 
 &pcf_hdmi {
-	p0 {
+	hdmi-i2c-disable-hog {
 		/*
 		 * PM_OEn to High: Disable routing I2C3 to PM_I2C
 		 * With this PM_SEL(p3) should not matter
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index b65b2dd094d0ff57..f2384277d5dcdc5c 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -268,7 +268,7 @@ pcf_hdmi: pcf8575@26 {
 		 */
 		lines-initial-states = <0x0f2b>;
 
-		p1 {
+		hdmi-audio-hog {
 			/* vin6_sel_s0: high: VIN6, low: audio */
 			gpio-hog;
 			gpios = <1 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 9bd01ae40b1d1fbb..df47ea59c9c404c2 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -381,7 +381,7 @@ pcf_hdmi: pcf8575@26 {
 		reg = <0x26>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		p1 {
+		hdmi-audio-hog {
 			/* vin6_sel_s0: high: VIN6, low: audio */
 			gpio-hog;
 			gpios = <1 GPIO_ACTIVE_HIGH>;
-- 
2.25.1

