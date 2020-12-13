Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D44B2D9146
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 01:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406942AbgLNAGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 19:06:37 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:48103 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727178AbgLNAGe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 19:06:34 -0500
X-Greylist: delayed 639 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Dec 2020 19:06:33 EST
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3900758031E;
        Sun, 13 Dec 2020 18:55:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 13 Dec 2020 18:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Me9oM9C7gnSn/
        bA00pvi332g4ULeBtBRmI4/Jx5+WEQ=; b=gXa30+dBr8ufc2i05s4lmoVnr2ywy
        KbppxPWMHR4+KAiurzY5e/tUw/g7Os5y206E0tNeoOTCT5S4hKmomdOoQSAZwnzL
        KA2i2gTAkeToLGK5dNfElkSwEzvElLKZK7c65R3cDvULSRDFJ6OcuDPvcewYkmoz
        bixlShUDlz6afyf2ff2rp8KQegIg2jpBd4jh3SARGweRm+I5yFTNjqBdW1iXGgPe
        SG/LIBR0nVueB21Jp8d1Xlrj5Z4kNUIBSkh0o8us2UwHcYy+wXAQ2OHJuPeqAVQv
        HyJP0D+bGSvyxm7bLBCI5/iCQrFl/f/ZKBp7l6n3b7pksYy2uWFjOJu1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Me9oM9C7gnSn/bA00pvi332g4ULeBtBRmI4/Jx5+WEQ=; b=mDwfNPpT
        LNtriOV2SrX4lcB0j0r7z4dQZ/BmLbYQbJDRoimbu+L1aPw3L6cIcEu9wzosaljm
        AgyK1gEk3V9zFZdXHaUy1p0C816+7nKYvGBzHurHwwfA628nkBreA+d//WGXbOFs
        u8a8MmjHiPYmZSFDfMqB7aMCdj8wssPuPdo96I19lrJLEU3DCjtBxyjrdQLQxZPr
        4f83iHUPxV5M5QHKwFatmhqK3snr6TzybYL33Wp7fzKr92LZV9cu+Q7ArAeDFqOi
        wvhWRGlHc4k7Wh6ekTyQoXfVlpJJz1WMgSU/oo1m+rc4X7ERRsFdNSg6Yy7M8uA9
        ZwWyZQH/OoZxRw==
X-ME-Sender: <xms:3qnWX7M0ruqg3dxx2gUCfHe55I6qaseudMGEJRi2VqMW3MjoT-IfHw>
    <xme:3qnWX7LQx2YgkQw4jfLOIflPa3fkAPpUt2E3KUMN1lUrrsCd2Q8t6VgS2MkrWMj1b
    rvwohUIF-IVsPgPDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:3qnWX7LFY-kwwbVukB4BRsZK8mBUFAoBrPwd_ClKvOVwyCpUPNMBsw>
    <xmx:3qnWX15p9CHpn6VN-E39D-T4ridUKjjFDCfAzvV09oQEWDgT8ziKjQ>
    <xmx:3qnWX1cxF-U8hUTSgwZ9D7aOf79EX34GekClvJ6ssoeUOVHDLo56JA>
    <xmx:3qnWX1tviz8pX_qbDPqH6dDFkMnyivo_Xr6s3_WCKGOQ-0yytCk6bw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8A12D1080057;
        Sun, 13 Dec 2020 18:55:09 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection
Date:   Sun, 13 Dec 2020 17:55:06 -0600
Message-Id: <20201213235506.25201-5-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213235506.25201-1-samuel@sholland.org>
References: <20201213235506.25201-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On boards where the only peripheral connected to PL0/PL1 is an X-Powers
PMIC, configure the connection to use the RSB bus rather than the I2C
bus. Compared to the I2C controller that shares the pins, the RSB
controller allows a higher bus frequency, and it is more CPU-efficient.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 416e0fa76ba7..8a95abfc2ebb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -158,12 +158,28 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_i2c {
+&r_ir {
+	linux,rc-map-name = "rc-beelink-gs1";
+	status = "okay";
+};
+
+&r_pio {
+	/*
+	 * FIXME: We can't add that supply for now since it would
+	 * create a circular dependency between pinctrl, the regulator
+	 * and the RSB Bus.
+	 *
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&r_rsb {
 	status = "okay";
 
-	axp805: pmic@36 {
+	axp805: pmic@745 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x36>;
+		reg = <0x745>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -281,22 +297,6 @@ sw {
 	};
 };
 
-&r_ir {
-	linux,rc-map-name = "rc-beelink-gs1";
-	status = "okay";
-};
-
-&r_pio {
-	/*
-	 * PL0 and PL1 are used for PMIC I2C
-	 * don't enable the pl-supply else
-	 * it will fail at boot
-	 *
-	 * vcc-pl-supply = <&reg_aldo1>;
-	 */
-	vcc-pm-supply = <&reg_aldo1>;
-};
-
 &rtc {
 	clocks = <&ext_osc32k>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 8a8d1a608e30..e86360ea022e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -222,12 +222,16 @@ &pio {
 	vcc-pg-supply = <&reg_vcc_wifi_io>;
 };
 
-&r_i2c {
+&r_ir {
+	status = "okay";
+};
+
+&r_rsb {
 	status = "okay";
 
-	axp805: pmic@36 {
+	axp805: pmic@745 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x36>;
+		reg = <0x745>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -339,10 +343,6 @@ sw {
 	};
 };
 
-&r_ir {
-	status = "okay";
-};
-
 &rtc {
 	clocks = <&ext_osc32k>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 0d5f9aeb96d0..96635588e9a6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -128,12 +128,20 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_i2c {
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	vcc-pm-supply = <&reg_bldo3>;
+};
+
+&r_rsb {
 	status = "okay";
 
-	axp805: pmic@36 {
+	axp805: pmic@745 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x36>;
+		reg = <0x745>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -248,14 +256,6 @@ sw {
 	};
 };
 
-&r_ir {
-	status = "okay";
-};
-
-&r_pio {
-	vcc-pm-supply = <&reg_bldo3>;
-};
-
 &rtc {
 	clocks = <&ext_osc32k>;
 };
-- 
2.26.2

