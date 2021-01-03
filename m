Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FA02E8B88
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 11:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbhACKA6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 05:00:58 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37569 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbhACKA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 05:00:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id EC58F5803E5;
        Sun,  3 Jan 2021 05:00:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 03 Jan 2021 05:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=S4M8YzkmuoPmt
        oCAT9vras7auucOpjrunI951DT0nOI=; b=Vq4OIzHGe8RbP6Qf2UhN3PHPti2vz
        2CtW7XMQKTmOKhTMJpjOe79SJIYIhF6vy9lqPclO1CerBSfNFipQqxWMd47yE7+o
        o5oXVbyWnOfrMB1yHT28ivo7WREP8CW6AwI07Ccn1WBnoXHUkMOCxDXEnFzEas2+
        HxloF/8o/pF+9oPXxBe3hzOofOcgIJmCLQcdzBJEAuJt1klIMaerP/8tXBMOGYDa
        h32sthnq23+PA5R5/mpB1BFpSWIStjVQuwgZyX7V3wxNTUxfLQwKnti7pCgTPDC8
        oMFqc7r+ZHM+CkBem2tQ5cajpIgWk4hper8BHPIU/sDCnQwW4K4Jvcj8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=S4M8YzkmuoPmtoCAT9vras7auucOpjrunI951DT0nOI=; b=a5hoAGWU
        KEpH1Hugtbz/YkhV+1NE78QSqV7eT+DJYBMnUp5MfrDjVPXspHgSTkiVONp6fQSX
        vivAkVvm+R90+vEyEamD3mmL8mnCf4casbIDBpSkTPukrg4q1BSwWNaajAyIDkdN
        7UVhh2FqQTIViAYqWKgO/m69Hd5UYMv9YsUdNmnrE+NJnOLS+2ZqfpUzkG1gjHZA
        0ayKH/AozmFNYPeugcE9LoGCqNJjjYwk+M1JW/P5C4QrJbDhfZoTPdbYiTNumgQQ
        wTt6yA40icd1FajPSGmFxjYNNUroqGLo0JLCNkArI6NM9Pwm3py+Q2JFwZFUGlG4
        XwcVrR1STvqCng==
X-ME-Sender: <xms:qpXxXyQkO40_-7cC7i_btswRlR7QIbDvHxiQlzZ9VGC_edU9zmQ59Q>
    <xme:qpXxXzkmCIt6xXwWDwhTKNFfCmN2WIdUa44YAl-B943LYLSdXr3-Uds2F1wWDFZ_0
    dpOFxB43i_CwdTp9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:qpXxX7O1rPfgMcMQk48ACVH18g95U8WMwjnGTbOsUnXS6GSGhab_wg>
    <xmx:qpXxX3hseo2T2EiO0JH5TumdyM5z1joryRHlUsUPF0w16bwcBY4aZQ>
    <xmx:qpXxX5iVvo8wInBWkDOOJeL-X0ZQGDZSb8ajdhtC2sxh0XlDf7HmpA>
    <xmx:qpXxX3QWvMIGWdc6XWFPa0kViiH26_1OjXknIci0_z9ejny9ECDKtA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id BAD29108005C;
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
Subject: [PATCH v2 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
Date:   Sun,  3 Jan 2021 04:00:05 -0600
Message-Id: <20210103100007.32867-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
References: <20210103100007.32867-1-samuel@sholland.org>
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

