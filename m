Return-Path: <linux-gpio+bounces-238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426D7F0C26
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 08:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B722B1C20975
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 07:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC98C5224;
	Mon, 20 Nov 2023 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iXigQ3gu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D281A1
	for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:09 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso10863375e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463668; x=1701068468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDJFuAkxoAAAFxgz7hC7RfGlOkGB3yAjNrGdDF3wBw8=;
        b=iXigQ3gumKghlUB4EcJqvu/PGx6Vj4LyTq9i8JWgpique6ct9SM5hVYsZvzugmZwWa
         e1GlCOY9vn/Uw8Uwf0L1Bw6xsiZ1pH1vmAuYNu/rpovXsZKuxaofNjUPo6XxaNYf7DKK
         mt4Y8hBDtK0Jhmb1wB/imOBEv+C/cz9fEZDjvDgjOQHrFhqoijp41CsJE/Q8a+HtFqoJ
         vJ5ao4Ve+tt9sDXMSrmqkTCHBOAwieljLJplemznDb+Qurgs3KjvMTm1Wb6PJivW/H4e
         ECwcv3Od0oe9dNvjUaMbCWSj8ZKQUv2loLWksWB7qvWM0W31uNmq4AstXtDBj544IR+W
         HQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463668; x=1701068468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDJFuAkxoAAAFxgz7hC7RfGlOkGB3yAjNrGdDF3wBw8=;
        b=VQiKb2oZBo7FeHZBxWidc/xmNZNhNAYfhTWwB56NSkvYOqWA0huuuUjhS9H9x4Hvj7
         NjIat57d5uC8j+XlVlq6XRbJnFxcLfl/XZ8eRgTx6NksKNO1cylnd5IgMwaYWMtb7GL1
         eTCZTn7NiA0Fr7fmsO1qrDuWmUt/TyFlMfyH1rkBk2Rnbsk91z50VgcXOHZOU0mwomL2
         dYEedjSx2Fid5NFK+iwL8IoO45Cw1EgdNbwLnRGMd2d4OMrQ5p7fRJQ/WsQW38xriMPZ
         3X1ZbfR6Up44Mg26xvZvbC/LSHxTVsXBRoAWVrlgDSAXeqGXLCG7syrlqOf2Q40gOnsX
         uCow==
X-Gm-Message-State: AOJu0YzjEtCNTQKyM2cxV4wcgpx+9A+JARl59PG5qIy32HnS88M3i2zP
	+p08hzk2XLUHuJdAWvuE4Q4VgQ==
X-Google-Smtp-Source: AGHT+IFdZD01DHq4eQNzHXtPEzp6vTkd1cCzbxzLp4oTOb/wADDYmHoaiTF9FA7lphWv7r0vUz/O4g==
X-Received: by 2002:a05:6000:186d:b0:32d:a54a:f57c with SMTP id d13-20020a056000186d00b0032da54af57cmr5218229wri.25.1700463667954;
        Sun, 19 Nov 2023 23:01:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 04/14] clk: renesas: r9a08g045-cpg: Add clock and reset support for ETH0 and ETH1
Date: Mon, 20 Nov 2023 09:00:14 +0200
Message-Id: <20231120070024.4079344-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S has 2 Gigabit Ethernet interfaces available. Add clock and reset
support for both of them.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 6ff40763a00a..e78dbc74df27 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -181,9 +181,11 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 	DEF_G3S_DIV("P3", R9A08G045_CLK_P3, CLK_PLL3_DIV2_4, DIVPL3C, G3S_DIVPL3C_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_FIXED("P3_DIV2", CLK_P3_DIV2, R9A08G045_CLK_P3, 1, 2),
+	DEF_FIXED("ZT", R9A08G045_CLK_ZT, CLK_PLL3_DIV2_8, 1, 1),
 	DEF_FIXED("S0", R9A08G045_CLK_S0, CLK_SEL_PLL4, 1, 2),
 	DEF_FIXED("OSC", R9A08G045_OSCCLK, CLK_EXTAL, 1, 1),
 	DEF_FIXED("OSC2", R9A08G045_OSCCLK2, CLK_EXTAL, 1, 3),
+	DEF_FIXED("HP", R9A08G045_CLK_HP, CLK_PLL6, 1, 2),
 };
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
@@ -217,6 +219,16 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(PERI_COM, BIT(11))),
 	DEF_MOD("sdhi2_aclk",		R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11,
 					MSTOP(PERI_COM, BIT(11))),
+	DEF_COUPLED("eth0_axi",		R9A08G045_ETH0_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 0,
+					MSTOP(PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0,
+					MSTOP(PERI_COM, BIT(2))),
+	DEF_MOD("eth0_refclk",		R9A08G045_ETH0_REFCLK, R9A08G045_CLK_HP, 0x57c, 8, 0),
+	DEF_COUPLED("eth1_axi",		R9A08G045_ETH1_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 1,
+					MSTOP(PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1,
+					MSTOP(PERI_COM, BIT(3))),
+	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9, 0),
 	DEF_MOD("scif0_clk_pck",	R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0,
 					MSTOP(MCPU2, BIT(1))),
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0, 0),
@@ -228,6 +240,8 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
+	DEF_RST(R9A08G045_ETH0_RST_HW_N, 0x87c, 0),
+	DEF_RST(R9A08G045_ETH1_RST_HW_N, 0x87c, 1),
 	DEF_RST(R9A08G045_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A08G045_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G045_GPIO_PORT_RESETN, 0x898, 1),
-- 
2.39.2


