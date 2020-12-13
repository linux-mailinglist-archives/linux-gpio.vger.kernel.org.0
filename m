Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25E42D914D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 01:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406995AbgLNAH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 19:07:28 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59695 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727178AbgLNAHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 19:07:21 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id B9C9058031C;
        Sun, 13 Dec 2020 18:55:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 13 Dec 2020 18:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=sGIZhzHz1FkZQ
        G0+QrmOXj6Tw3VH/mhTS+rkKDVcsCg=; b=FrTtfyvogqIvxKdUFX7jJ1JMVQtwo
        XKMgnj1yVmODuWaJbWKdTgEsPENp0+H5O6a4BD5QJ3x5UmIDbSalbJBfSHdCMf2i
        L7hU4MOqSnvxFJqbBzRYAXbFO8UrEYSlBycSJmx1Tat1i3wNrZT5PBfwPIH6ut3Y
        OfGNQF53CoxJpkRIapDpGws+HIIf6IaGcJua+o41H8hUSS2nrMW2bmyKjN8thA+s
        s9Jj3nn5a8qW9sTb0XnlKZ50LYLFQ5AeWJ418H6l8/k0Vz2Hjq0qcOitkbW72GMr
        a+pEIpyMBK5ifCRL2liz0fIrNl9skoF7lYikLlZU/ZNnkvV3rOtW9cCtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=sGIZhzHz1FkZQG0+QrmOXj6Tw3VH/mhTS+rkKDVcsCg=; b=BPUbXeFw
        EA6oiCDciMSGpT4W1tgy0jnoWfAR7aJ5wQl2hIWII9wat0XsV2rvnJ8veVEVUkj4
        p78pVAv5cMF988cNJS3tWoJrdRWkeh49yx7Hi9URlmqQheFrFpAHmxfddfRffYeG
        rXiLojLZB103cdwSPvaE0meOuNX5o15Sv/DbXDdlKf/p92rnR67eFdr5lO7bur80
        1EOjPVMlbiqMweu6IjSwsMnu1RjIykCFFeFmJcGoWmcxtPINb3ipP4Lz4kvCRa88
        dBT0pi3R4lNuJOPi2c/g5dsRUhzVwXdg3mkr4jhFQm/wB+UQ1jFH7vn5rjsGiZW9
        lvQX/VTB8d08Ow==
X-ME-Sender: <xms:3anWX6c68Q5ppKtMX7ulMrU7SxL21McqrbjCoLmRICgcg0zt8PZShQ>
    <xme:3anWX0MfUkMBRTjrQed3B1q-5n9Iv9fDvS8ehhIeYEazt03JGrxspqEvpu1EHVc0F
    _1MYxUAS0fKpGENSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:3anWX7jZMVWlBba2TU5WKOciWkCZ42zzSfCDMrKVOB6ZIypjwygllQ>
    <xmx:3anWX39vWJoRCw31QnS9ngdjl_7noU2HS4esBqK71ZkpYFatb72tFg>
    <xmx:3anWX2tXK1NBdBrUI8bfKLBS6iEwLGewsUxaJgcUJsZa1HDnCYSKuw>
    <xmx:3anWX7PBO82vkderhqZoE5-hXBMs3oS11CJXJlG1mERyvqGN71o6xg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id E71B0108005C;
        Sun, 13 Dec 2020 18:55:08 -0500 (EST)
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
Subject: [PATCH 3/4] arm64: dts: allwinner: h6: Add RSB controller node
Date:   Sun, 13 Dec 2020 17:55:05 -0600
Message-Id: <20201213235506.25201-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213235506.25201-1-samuel@sholland.org>
References: <20201213235506.25201-1-samuel@sholland.org>
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
index 34cfd68ca523..dd47176e432d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -1014,6 +1014,11 @@ r_ir_rx_pin: r-ir-rx-pin {
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
@@ -1045,6 +1050,20 @@ r_i2c: i2c@7081400 {
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

