Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85402E8B8B
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 11:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbhACKBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 05:01:05 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56391 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbhACKA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 05:00:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9B6895803E8;
        Sun,  3 Jan 2021 05:00:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 03 Jan 2021 05:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=nVjtQEK9XaBpR
        QQ15wkj2tc7GfDi4X4brxsvTseHVaQ=; b=gGVCtJkoVvQNimG4iaMquEqwuuliD
        qu4pkYH5Rb8trCBAqbYv3Bt+pCh2iHFXPTIQY6wrJIP0DM7LPCmOiIX4eajjUVO7
        eLgEoJsvtyfRbgxSVctzNFvjDMxgf4PjM86pGEdRuzRolv1JSKD6sJSUPglvcFUX
        bCJW5Q1tnbGSo5QtdjVEa4ojAylhs2OUK+x7eFeZQMOa8KhQeMivpPZNkyAwD8Gc
        LW5geK1QXAIHzXm3p9V4uqcYRZeYK3TB627LtgkrqImJdfF7j+rX4Nspg5LJdS1I
        bzcd454qlv8freCrYwBcaRBuqlJaZWRWAp3nXqAUdRYeCTr9J096ahx1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=nVjtQEK9XaBpRQQ15wkj2tc7GfDi4X4brxsvTseHVaQ=; b=dohiBUMJ
        3NSkS1dRew3RGn54/7yz6k1tuYN9I5sn4Gh1UqmLCRAdb5KLR5mVNMHYI3oxmkdB
        bpEHqq0+PmWUtfdw7Dewi916Dpj02Bgrz8JfqZOP8Uv4efXNH4R2mcQw3lUH3FmE
        AwAlJloOmkfR1ico4uG8WwBjmVW3ar4woM4LKbSftrUFwbAOTlz2FboL762lcTpW
        8d8QVIagd7KJGLUZ7XutBlR1NHUfgi+ZLEKEgy3hFoA4wvbZW/5cAawx7eWNxjZf
        ZjBKmLVzII62qZo6aE7ijeauVauBaPKNIruMCkuRRPS0GFUy1orUVkb8khmuOJja
        rmprdfaxrF6zlw==
X-ME-Sender: <xms:q5XxX3vMXMUK9H_vCUiz7DzsCHJWDBynJ4y6Qp5l6wV9fm2lPS4AsQ>
    <xme:q5XxX44FSMdmZsbecLeilc9_r4gEE2fsFbOzxeyKZYlZi6thUSuH-bn9AxBrG_CEV
    lim5Wd29yP1gh4UIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:q5XxX6hhczK25a-TBfIZo9fZIVBBtAmI04ljXMqY28l7PyDg--U8vQ>
    <xmx:q5XxXylUTzJgo5r9SdTKojocCd2IOE3rNZkmnZTCzhCAuwLVs6bLZw>
    <xmx:q5XxXxu22u9nyPDH4RTWm9erkNSyfGa302ctbw8qZpbG5dY5sdGXYg>
    <xmx:q5XxX2u8wBGyCNRzdU3WmSJAKz3YikbeXYCnDOXgTwMn6ZD1u2cs4A>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id F1864108005F;
        Sun,  3 Jan 2021 05:00:10 -0500 (EST)
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
Subject: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection
Date:   Sun,  3 Jan 2021 04:00:07 -0600
Message-Id: <20210103100007.32867-5-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
References: <20210103100007.32867-1-samuel@sholland.org>
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
index 7c9dbde645b5..3452add30cc4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -150,12 +150,28 @@ &pio {
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
@@ -273,22 +289,6 @@ sw {
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
index 15c9dd8c4479..16702293ac0b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -175,12 +175,16 @@ &pio {
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
@@ -291,10 +295,6 @@ sw {
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
index ebc120a9232f..23e3cb2ffd8d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -112,12 +112,20 @@ &pio {
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
@@ -232,14 +240,6 @@ sw {
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

