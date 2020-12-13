Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729152D9150
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 01:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407017AbgLNAH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 19:07:29 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:54103 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406977AbgLNAHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 19:07:23 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 137465802F7;
        Sun, 13 Dec 2020 18:55:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 13 Dec 2020 18:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=S4M8YzkmuoPmt
        oCAT9vras7auucOpjrunI951DT0nOI=; b=sjSRNP52rSDU5rulL8oGMLG4DeN+J
        J03W29lfJi3z3oTT6M/dej/gAtt72syYSnd1QmISgL+FtI7Ep2gOoZIs/rjydk/S
        Nwf5ECrvr7bd0QpMOjj4x8rtiyVSJfrpO4tC/NYGKd/RukoxZ010MDvN6l4AdmSe
        iSQkLYwi6e4eU1B8/FeraVr/WJoY1Tznfj7SmfQRzSY+Aw9yeQGruFwsRZWikN1j
        FP1Pt0gbq8f8gpExiOSOUQd/OGs2IHOqsNg1hy+cNGRWwKH2Oz7YUwDK/oRuBxzk
        lj+HTJBQSFARK9jxKFfAaVH9Ol75lcJj+31lzt2jGv61Sc5CmhW5LivFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=S4M8YzkmuoPmtoCAT9vras7auucOpjrunI951DT0nOI=; b=l9YrJUnJ
        Tx9Xt46bA15sF41c1yIB/KxRcbpHffjo9Fnnp/V7Vvr4OihWfUBzAIt+tU6ZA5eE
        GWuRAZv1n8g5+aGxFhhiIyK1yk+z0aBWudTZnXVsGDmfXQhXb0iGH6iK6wHHVuOd
        bWYf+Vex4s7TdD/8bmQ1A1aUd2s8hFczQ+hDvYIBuwi+NQOhWXwb2d3SHDJGDpVE
        R5VDy8wsGV3VwVmcpPbtiLyCgRZq+nDBRaxMW3yI/y0gVHR3vfUOaSwd4rW/v5Ux
        889/nbAXMK/DfKWnGxaVHaRyzw4YEtYK4qndJ7QmTKHeQWfMOsF1l5kn1MHVWvi2
        SohseD/VMhPJzg==
X-ME-Sender: <xms:3KnWX9GAlgUpwdCsyIPIVIgi2Vm2tCdK_sB9h4IKhh1u4CWM2B3YuA>
    <xme:3KnWX7zUvURRsFvTyQcO52EuLLx2HNpmarnLDT-A0FJl8ZjVtJcxEVCL3SX_dS0Zi
    T_iine_WTqU6wTLTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:3KnWX-vJ2kWkrlN78TS8_aSKghJMANJ92Xgo1VCpJ8hiouTzUP2IBQ>
    <xmx:3KnWX40uIMZBxvd7J8REM-ius94ZxNpHxy025yAqDhG03yQOGjBG7g>
    <xmx:3KnWX59mr5CZBDMz8RZCjFNaaIrZfIq3rIZDkmhcMOmWRHc5lLnzHw>
    <xmx:3anWX7d7zswX9zEXVZDnzgZyuvYPt1-AcdzDD2-yYfpueL7OU7H6FQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4F5801080063;
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
Subject: [PATCH 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
Date:   Sun, 13 Dec 2020 17:55:04 -0600
Message-Id: <20201213235506.25201-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213235506.25201-1-samuel@sholland.org>
References: <20201213235506.25201-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As there is an RSB controller in the H6 SoC, there should be some pin
configuration for it. While no such configuration is documented, the
"s_i2c" pins are suspiciously on the "alternate" function 3, with no
primary function 2 given. This suggests the primary function for these
pins is actually RSB, and that is indeed the case.

Add the "s_rsb" pin functions so the RSB controller can be used.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c
index 4557e18d5989..c7d90c44e87a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c
@@ -24,11 +24,13 @@ static const struct sunxi_desc_pin sun50i_h6_r_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SCK */
 		  SUNXI_FUNCTION(0x3, "s_i2c"),		/* SCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PL_EINT0 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "s_rsb"),		/* SDA */
 		  SUNXI_FUNCTION(0x3, "s_i2c"),		/* SDA */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),	/* PL_EINT1 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 2),
-- 
2.26.2

