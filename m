Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B1D2D9152
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 01:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407020AbgLNAH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 19:07:29 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53707 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406976AbgLNAHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 19:07:23 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1CD5C5802FE;
        Sun, 13 Dec 2020 18:55:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 13 Dec 2020 18:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=J0GSHUfgpTlDW
        AoupwbrkZigEcld4uKOryQcDJhnQyI=; b=lrytEQ4Pjh9Md5xPyhu7hjyTJ6TXI
        BEOIo0l3OPYs60LHsPQKHDPMOMt1POBfLFhNGzzP+tCDbycY3D6mvK4Tq1Ve+q2l
        YDABhz7uk/NAu3VY+mY+0WJn62VMMLnzFiKknKPFp0qSMhZZoVHIeskIGeVylYuA
        /tDVjxrAd08ovZt/eiY5U0M0PgjmaxPBUw5b1plMdpN/ZWaTQm94lk7QaIVBaf5/
        hiwlrtiUoY7LLpJcT/rR7EdiPRsslUuKavly3CBNLh39/pu4KytijeM3IfD9nk8J
        hEwnmjDRvWYPAWVEiusPiCnuVO/TANLmDetnx5n9JPAvHPMwNsq7CH4RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=J0GSHUfgpTlDWAoupwbrkZigEcld4uKOryQcDJhnQyI=; b=n0S8TMQ3
        qpsiweqfCym7QAZ4zrU4VuqxDVvQ115sB1NjpMqvjxnYnHRx8GTWKaRlsQZMY/2Q
        OE6ShfY2h64ylVuRG+eyh+3l2Pq3e40Q390WGuLtsjxu/tyTlNpTvTSsFvkHWc4z
        A/RkiTUkDL5mDLjQSlldDpWu/duQGYjhPIUAA40Uz2hlSoKeY1av1IazucQ02iCe
        xaCIz5YPUg5p/FQBo4I0hemKIFFo6oulMfK7nQvJYP/zDxUbsEutnDnnbgxX5zh9
        n3oJ8/OrgFpl9B4EBAhImjt6Dai7Q7N7ucunGZS9ZTLySpG87hOJV5xVNayDG7Gu
        h3YoH+ZVJCjq7A==
X-ME-Sender: <xms:3KnWX3lgpNPy3sybivNvgdCNB75ngoQph0TL7_b3kC2Y6dJ9nZ4wjw>
    <xme:3KnWX63lK_Hsd4Fudu3gC23h6xk0Vke9bOjwBKTRq1igg-7KamhjGBgLTqTqiRNJX
    lPSgRl7kBT8ZN30Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:3KnWX9qQ5tga1nn3aSJ7xWRxVRHnYmfZ6pYjj4epQkgQCrhh4-X9Nw>
    <xmx:3KnWX_n0KlrLxox9_8fCt_jw54ehZ4ObNDgrQ44aj1ICxLRD1Jozxw>
    <xmx:3KnWX13IMfyAbukcjzDQBoqzchGQTzzxamdx6KYZsIe13JMWZmbHrw>
    <xmx:3anWX03fjc2P_c2dvSVVwSWJrCMzxHHXcZOP3dDYms84gRGRxsEzVA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id AB92A1080057;
        Sun, 13 Dec 2020 18:55:07 -0500 (EST)
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
Subject: [PATCH 1/4] clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
Date:   Sun, 13 Dec 2020 17:55:03 -0600
Message-Id: <20201213235506.25201-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213235506.25201-1-samuel@sholland.org>
References: <20201213235506.25201-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While no information about the H6 RSB controller is included in the
datasheet or manual, the vendor BSP and power management blob both
reference the RSB clock parent and register address. These values were
verified by experimentation.

Since this clock/reset are added late, the specifier is added at the end
to maintain the existing DT binding. The code is kept in register order.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
 include/dt-bindings/reset/sun50i-h6-r-ccu.h | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
index 50f8d1bc7046..56e351b513f3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
@@ -91,6 +91,8 @@ static SUNXI_CCU_GATE(r_apb2_uart_clk,	"r-apb2-uart",	"r-apb2",
 		      0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE(r_apb2_i2c_clk,	"r-apb2-i2c",	"r-apb2",
 		      0x19c, BIT(0), 0);
+static SUNXI_CCU_GATE(r_apb2_rsb_clk,	"r-apb2-rsb",	"r-apb2",
+		      0x1bc, BIT(0), 0);
 static SUNXI_CCU_GATE(r_apb1_ir_clk,	"r-apb1-ir",	"r-apb1",
 		      0x1cc, BIT(0), 0);
 static SUNXI_CCU_GATE(r_apb1_w1_clk,	"r-apb1-w1",	"r-apb1",
@@ -130,6 +132,7 @@ static struct ccu_common *sun50i_h6_r_ccu_clks[] = {
 	&r_apb1_pwm_clk.common,
 	&r_apb2_uart_clk.common,
 	&r_apb2_i2c_clk.common,
+	&r_apb2_rsb_clk.common,
 	&r_apb1_ir_clk.common,
 	&r_apb1_w1_clk.common,
 	&ir_clk.common,
@@ -147,6 +150,7 @@ static struct clk_hw_onecell_data sun50i_h6_r_hw_clks = {
 		[CLK_R_APB1_PWM]	= &r_apb1_pwm_clk.common.hw,
 		[CLK_R_APB2_UART]	= &r_apb2_uart_clk.common.hw,
 		[CLK_R_APB2_I2C]	= &r_apb2_i2c_clk.common.hw,
+		[CLK_R_APB2_RSB]	= &r_apb2_rsb_clk.common.hw,
 		[CLK_R_APB1_IR]		= &r_apb1_ir_clk.common.hw,
 		[CLK_R_APB1_W1]		= &r_apb1_w1_clk.common.hw,
 		[CLK_IR]		= &ir_clk.common.hw,
@@ -161,6 +165,7 @@ static struct ccu_reset_map sun50i_h6_r_ccu_resets[] = {
 	[RST_R_APB1_PWM]	=  { 0x13c, BIT(16) },
 	[RST_R_APB2_UART]	=  { 0x18c, BIT(16) },
 	[RST_R_APB2_I2C]	=  { 0x19c, BIT(16) },
+	[RST_R_APB2_RSB]	=  { 0x1bc, BIT(16) },
 	[RST_R_APB1_IR]		=  { 0x1cc, BIT(16) },
 	[RST_R_APB1_W1]		=  { 0x1ec, BIT(16) },
 };
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
index 782117dc0b28..7e290b840803 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
@@ -14,6 +14,6 @@
 
 #define CLK_R_APB2	3
 
-#define CLK_NUMBER	(CLK_W1 + 1)
+#define CLK_NUMBER	(CLK_R_APB2_RSB + 1)
 
 #endif /* _CCU_SUN50I_H6_R_H */
diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
index 76136132a13e..f46ec03848ca 100644
--- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
@@ -15,6 +15,7 @@
 #define CLK_R_APB1_PWM		6
 #define CLK_R_APB2_UART		7
 #define CLK_R_APB2_I2C		8
+#define CLK_R_APB2_RSB		13
 #define CLK_R_APB1_IR		9
 #define CLK_R_APB1_W1		10
 
diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
index 01c84dba49a4..6fe199a7969d 100644
--- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
@@ -11,6 +11,7 @@
 #define RST_R_APB1_PWM		2
 #define RST_R_APB2_UART		3
 #define RST_R_APB2_I2C		4
+#define RST_R_APB2_RSB		7
 #define RST_R_APB1_IR		5
 #define RST_R_APB1_W1		6
 
-- 
2.26.2

