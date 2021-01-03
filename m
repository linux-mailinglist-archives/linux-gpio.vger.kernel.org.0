Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151562E8B94
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 11:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbhACKBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 05:01:22 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36159 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbhACKBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 05:01:17 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 12F625803E7;
        Sun,  3 Jan 2021 05:00:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 03 Jan 2021 05:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=8gRIQ3rwm89lT
        cTKGKWdo9Q4TRYPDRi0xY9xLkajhkc=; b=DOgJ2do/aDDye7zZ3X7g0v4f3Bifs
        LBspmVwqThEMPHPVmrM/cgrOSaugJXi10Hur4qD98ZBE84rsriLs1HDFPwTm0nNG
        vkL4OPvYF6YwX8jdJ25qxltOkE2gdeQfKbMFBGPrh09vJ9INfsQ6b07o8ZwTcDnT
        e5MojGZua07QLY5pBDILaw/8ZsJErjrIOY/NcwnT2iHa081ymSPu7PPyG35zSfn7
        bBqP8PNlzl49wY53O3dh9fR8ji4EgeIHdMY+Q+ynx4+2+MSqKCf0ohC7D6dkPMpe
        4CJIHrcHlGLUMe70CO8SeUkkOIhVw7ri4qlK/NP4cqCtgyeWnYpAAvRHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=8gRIQ3rwm89lTcTKGKWdo9Q4TRYPDRi0xY9xLkajhkc=; b=Jd20DFu6
        0gVWRjd1VVHf9DslCWmXN93t8ALbCI4qXbQCTfbdh08m6Pe0pj6iVje8/Wh3Ahgb
        sWlNGG0A4kEEOuJmzhVUotIJQJNml3XOTeyOpKyOXyZhwtcVlhx57z7W02JLa+1o
        MXnZIA2Kf0LNrY6mHX8E3BAV19z/FBPp9h8wCp2LhGyZIh9qillH4nFYx8U5orFC
        9DiQIf73Y5D74f3h6OSQYtH4ZXensQPuuU52QTRsyQOLroUZxKU1qPI+TYCf7YTY
        xmHyD+skpWOYf3qD/6OU9AiGL6DtHY9WIu1Z4R+UWXv8OkV7pvGwYwhO4HfhoJi0
        LxXWknDkGprzVg==
X-ME-Sender: <xms:qpXxXyDOH2oBm1d3DdrwJ4SYoiQTp8I2dbCazuHp0pHcZfEUV43xwg>
    <xme:qpXxX8cEsfAa8o3Xilr6-z2S2Oi01nNNyvPjOagFS1EC6P3N9i1UWm-hQ0UCgiHTv
    8O1hWI7WqRSW8o_Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:qpXxXyfIQiBJbe4EYVX-QfLG2Gk4FhAMf45aWrHDAboRyeDXt_ZMBw>
    <xmx:qpXxX4gv4dOtGnYq2ukBJdJXkcBWjHVHYssegBKpg3MjvtXxPAiP7w>
    <xmx:qpXxX2R29Fdc1bkBPG3ZGLJnpBjcLXPpJmwSEF-0pLhAPisUrtdXSg>
    <xmx:q5XxXxH66vDGT4WKaepdyQMAWGQGXCuUpGsn7---WpPUfg-R0Vlhow>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5AAE7108005B;
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
Subject: [PATCH v2 3/4] arm64: dts: allwinner: h6: Add RSB controller node
Date:   Sun,  3 Jan 2021 04:00:06 -0600
Message-Id: <20210103100007.32867-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
References: <20210103100007.32867-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The H6 SoC contains an undocumented but fully functional RSB controller.
Add support for it. The MMIO register address matches other SoCs of the
same generation, and the IRQ matches a hole in the documented IRQ list.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 8a62a9fbe347..b043beea8e6e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -949,6 +949,11 @@ r_ir_rx_pin: r-ir-rx-pin {
 				pins = "PL9";
 				function = "s_cir_rx";
 			};
+
+			r_rsb_pins: r-rsb-pins {
+				pins = "PL0", "PL1";
+				function = "s_rsb";
+			};
 		};
 
 		r_ir: ir@7040000 {
@@ -979,6 +984,20 @@ r_i2c: i2c@7081400 {
 			#size-cells = <0>;
 		};
 
+		r_rsb: rsb@7083000 {
+			compatible = "allwinner,sun8i-a23-rsb";
+			reg = <0x07083000 0x400>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB2_RSB>;
+			clock-frequency = <3000000>;
+			resets = <&r_ccu RST_R_APB2_RSB>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_rsb_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-h6-ths";
 			reg = <0x05070400 0x100>;
-- 
2.26.2

