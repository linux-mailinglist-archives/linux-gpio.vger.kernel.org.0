Return-Path: <linux-gpio+bounces-1080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FF80817D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B171F21836
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501541C6A3;
	Thu,  7 Dec 2023 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jMtbvCaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2966410CB
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:15 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54d712c254aso750951a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932894; x=1702537694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8pztiQQJvW9+Mn6ZeFPQfpFGzwj80OOzIuVXmlAIAU=;
        b=jMtbvCaHXoyPfufiMlyvzGyAebCJXcOajHgUDd7NuUX0z1WboDoO614lhR1N7Me0T4
         3KXwWMn9FQt/I2XYT+l8dVakVx+2p+ujRFxIjaf7fNrl9fpBeUX0TnwyQ0UKzRKD8LSY
         kuEW6uLgZDtH7Mtk9zU326h5d9qnXxBvhAm6GSE+CwNDcT2p4JX+mkwBx0G+o/U/msjM
         sROozmEdAmMKr13+zF5tqQeSEHPcyMIPniH/580mXKey49FPC0xiarVO7ErOgF+61i3b
         m5mssbbxFLQc9BXg5TVKomBCorDGViCGQFgyVbh+/7lVZMC7avET44QUhDtGTCPNr4d4
         kXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932894; x=1702537694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8pztiQQJvW9+Mn6ZeFPQfpFGzwj80OOzIuVXmlAIAU=;
        b=Loh6sy7u6bzntSSB8s3017aZxioMdvnq6qpx/4VHZPfOR9QGjQdg3BYEsql4n0OvQ/
         TaE6uRgEq0zGY9nm3gjXnDLugO7qbqzRKAE1S3Hz7KXqaisphDdSuyPAwdWvu59jsN4g
         w27f84XscmCHiRhxwRcFNNkO3MI8xHjruh/7eGaK6nWUel/NlsX1nY2RWRh/E8eT+S55
         ERoF7y4t4BJ+a5kWkprcgaeadcoBGaeXuJpccAzd7IKjCmLg99+ZAYtVdHLrWfW0jN0p
         mF0TEvzm0tU7OEVsxkE8rHO2uAwUMKC/4vcEfLclfWnX6j5/HvIHy6N+/FneVGvJxkEB
         Lsgw==
X-Gm-Message-State: AOJu0YzHjqWST0KdsskPIW9BjmXlQhk8WjE/ydf/0GNOTKlnFyCm+mz1
	2OIWFdmjj2Go6jkizl9ykBGPIg==
X-Google-Smtp-Source: AGHT+IEquNJ3LGoK/iqURqpBr6fKSuGAusD/V+gm0/HJ4c/qkdfjbM3einYaGw245MU4dYq89BceSw==
X-Received: by 2002:a50:d65a:0:b0:54c:4837:8b7f with SMTP id c26-20020a50d65a000000b0054c48378b7fmr1378223edj.77.1701932894161;
        Wed, 06 Dec 2023 23:08:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:13 -0800 (PST)
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
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/11] pinctrl: renesas: rzg2l: Add support to select power source for Ethernet pins
Date: Thu,  7 Dec 2023 09:06:54 +0200
Message-Id: <20231207070700.4156557-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The GPIO controller available on RZ/G3S (but also on RZ/G2L) allows setting
the power source for Ethernet pins. Based on the interface b/w the Ethernet
controller and the Ethernet PHY and board design specific power source need
to be selected. The GPIO controller allows 1.8V, 2.5V and 3.3V power source
selection for Ethernet pins. This could be selected though ETHX_POC
registers (X={0, 1}).

Commit adjust the driver to support this and does proper instantiation for
RZ/G3S and RZ/G2L SoC. On RZ/G2L only get operation has been tested at the
moment.

While at it, as the power registers on RZ/G2L support access sizes of 8
bits and RZ/G3S support access sizes of 8/16/32 bits, changed
writel()/readl() on these registers with writeb()/readb(). This should
allow using the same code for both SoCs w/o any issues.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- removed PVDD_MASK
- use 8 bit helpers to get/set value of power register
- replaced if/else with switch/case everywhere

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 42 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 58786455ecf3..6b082161e821 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -107,8 +107,10 @@
 #define IEN(off)		(0x1800 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
+#define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
 
+#define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 
@@ -116,7 +118,6 @@
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
 
 #define PM_MASK			0x03
-#define PVDD_MASK		0x01
 #define PFC_MASK		0x07
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
@@ -135,10 +136,12 @@
  * struct rzg2l_register_offsets - specific register offsets
  * @pwpr: PWPR register offset
  * @sd_ch: SD_CH register offset
+ * @eth_poc: ETH_POC register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
+	u16 eth_poc;
 };
 
 /**
@@ -604,6 +607,10 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
 		return SD_CH(regs->sd_ch, 0);
 	if (caps & PIN_CFG_IO_VMC_SD1)
 		return SD_CH(regs->sd_ch, 1);
+	if (caps & PIN_CFG_IO_VMC_ETH0)
+		return ETH_POC(regs->eth_poc, 0);
+	if (caps & PIN_CFG_IO_VMC_ETH1)
+		return ETH_POC(regs->eth_poc, 1);
 	if (caps & PIN_CFG_IO_VMC_QSPI)
 		return QSPI;
 
@@ -615,6 +622,7 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS)
 		return pctrl->settings[pin].power_source;
@@ -623,7 +631,18 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	if (pwr_reg < 0)
 		return pwr_reg;
 
-	return (readl(pctrl->base + pwr_reg) & PVDD_MASK) ? 1800 : 3300;
+	val = readb(pctrl->base + pwr_reg);
+	switch (val) {
+	case PVDD_1800:
+		return 1800;
+	case PVDD_2500:
+		return 2500;
+	case PVDD_3300:
+		return 3300;
+	default:
+		/* Should not happen. */
+		return -EINVAL;
+	}
 }
 
 static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps, u32 ps)
@@ -631,17 +650,32 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS) {
 		pctrl->settings[pin].power_source = ps;
 		return 0;
 	}
 
+	switch (ps) {
+	case 1800:
+		val = PVDD_1800;
+		break;
+	case 2500:
+		val = PVDD_2500;
+		break;
+	case 3300:
+		val = PVDD_3300;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
 	if (pwr_reg < 0)
 		return pwr_reg;
 
-	writel((ps == 1800) ? PVDD_1800 : PVDD_3300, pctrl->base + pwr_reg);
+	writeb(val, pctrl->base + pwr_reg);
 	pctrl->settings[pin].power_source = ps;
 
 	return 0;
@@ -1885,6 +1919,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.eth_poc = 0x300c,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -1897,6 +1932,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.regs = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
+		.eth_poc = 0x3010,
 	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
-- 
2.39.2


