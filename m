Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28392E8B8F
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 11:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbhACKBS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 05:01:18 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53895 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbhACKBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 05:01:17 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id C63375803E4;
        Sun,  3 Jan 2021 05:00:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 03 Jan 2021 05:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=LZ7PuAqRkqcLx
        40eoM2uefOkifLs8JNhxV9A8QPxP/0=; b=fkNKL5ZoE/Cj3CQAk53oc4NRdSb0t
        4xKxYppsh5EgqY4nqlsj06FlgjXEZC8VQrvQvYYbMRIkpjjPYOr4RTJ+KUYMcwyE
        69vbFXf50cxS2aygdW9fzHICwViJy0j9McvQeugD3GKdfdDmkp/wHa5kUTqWW1KK
        1qroOAoQj8Z5xraKxvvFJaMUr08LcnClOcBRm+Jle9Px70HvbfhyK4ewX6YvdcYU
        lBlPMvhDYHbMPzjOf65Yb6LJAIud+7MdgunGYF9c23ZcvTN/y5qX+ayb94IXj3U7
        c5nks4ef98z9xkA4fzQr1ed+4mvM8JtK9e+x58UGRgwbvm8Vd73y2mifw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=LZ7PuAqRkqcLx40eoM2uefOkifLs8JNhxV9A8QPxP/0=; b=BmcjSj5H
        /r5Ate/o9E6JNzOPHXFf/U2svgoGcj+OIxQG16M+thKS440S++pV0q8z/7JmNQxI
        4bKBcmtmdE7e4S/LQrTthZMXC3CaFr8+x85gE3634vYJr1a3IMLdLff+A/Cca4y/
        boeHwXyWp4w96fUNGpRhBbJRlZyUlU02XLHZvA9AOEGCuYF+ZLE5Q9q5Iw6HFv0M
        hJR7f1B/N+FRxaNi/k//ftMm3cPUSBusIuoiGXgKLN55JLwiFU5FuK5WowPyElcz
        FYcqEYVwotellvHvYUutqeGmBKeliup8n5qsBlWiGZB9p19iI2c/Ed/SQNRpasNq
        DL76hAh+r+dxTg==
X-ME-Sender: <xms:qZXxX9yNoW-MAInC0Trxp4Cq5lUbPC3JtHRt1nwTXt-WpQEGbn1hpw>
    <xme:qZXxX9QqA4SImw4oy-9YOhxXuh_WPRKPS_qnhltlqivq8ih_mJdKXC9dxFLuUexb9
    Lr8670V2Glyh7rdUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:qZXxX3UMpFhf7t1qcNTh0XCQghdZOHHCxRoMNmWSNSGD4GssDr6IKA>
    <xmx:qZXxX_jXyVd_y-5BL1XOmvh9H71sX_mu2br56raij5MaTyOWyDZGsw>
    <xmx:qZXxX_CI3R2Mzebbq-5alv4NsKiZitijKURjfPCSBLNbxD6nco3QHw>
    <xmx:qpXxX_xsTDNNcC_W3PEcHSkz3QZa_O8GVtUynyo1NZ3HRnl_mw1mqA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 264591080057;
        Sun,  3 Jan 2021 05:00:09 -0500 (EST)
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
Subject: [PATCH v2 1/4] clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
Date:   Sun,  3 Jan 2021 04:00:04 -0600
Message-Id: <20210103100007.32867-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
References: <20210103100007.32867-1-samuel@sholland.org>
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
 include/dt-bindings/clock/sun50i-h6-r-ccu.h | 2 ++
 include/dt-bindings/reset/sun50i-h6-r-ccu.h | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

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
index 76136132a13e..890368d252c4 100644
--- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
@@ -21,4 +21,6 @@
 #define CLK_IR			11
 #define CLK_W1			12
 
+#define CLK_R_APB2_RSB		13
+
 #endif /* _DT_BINDINGS_CLK_SUN50I_H6_R_CCU_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
index 01c84dba49a4..7950e799c76d 100644
--- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
@@ -13,5 +13,6 @@
 #define RST_R_APB2_I2C		4
 #define RST_R_APB1_IR		5
 #define RST_R_APB1_W1		6
+#define RST_R_APB2_RSB		7
 
 #endif /* _DT_BINDINGS_RST_SUN50I_H6_R_CCU_H_ */
-- 
2.26.2

