Return-Path: <linux-gpio+bounces-243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC17F0C41
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 08:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9412811CD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F1D5398;
	Mon, 20 Nov 2023 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EdydqE1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3549C170A
	for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:27 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40859c466efso13375935e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463686; x=1701068486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gF7ROVUzexEO6eYW9ULN0tSzlP+u8dbLjimCuAOb78=;
        b=EdydqE1ogSA/ea4laHIBxpXkHNvRcZoFCoa+j58ENePT0vpzWz6e8SM4KynrbT4v/d
         HZg5AdTiVDgndEikuSXpNZO0C+aLF8TSgjiHpXW2tEA8v7bViEaeHR5Dah5GuCUWavA+
         OUfnaWhBRqs/UVtVRRpxmgUhliluoQ0bdaA/uCr1YecjN7a8X0vHeF7o3sIZY8LL3nZt
         nfaIqG4L1WmvqK/EhdEU7EWF0TRVoGxBx5eAkgr0JWnOkkkCpfxzvTtIoQOqblCdhtxn
         ufrvpN3iLWkur40n/FHQKJCgQ0NIov1mNlc4aWN6ZlaFSriLsziikK7CrO/ZurJ5diiP
         OVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463686; x=1701068486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gF7ROVUzexEO6eYW9ULN0tSzlP+u8dbLjimCuAOb78=;
        b=wu++YGgXkWf3rVN1egVgI0+OVy2lMoHQXTGe1Ic5P3MIk3dx2vW1+li8FoDRFZbkFT
         XLOlhzGiEgNJHrF+BNt1ifKag2JO2x/Z5zMsldiITDBI7ANbepqTD4fPY88XESt7gQG7
         Z8LSRoNJKzcAu6qV1c2/bV9jSV1+8xDOspOVW8nCXSPGBNlL8bN3e2wnV3+BPjgK8zDq
         DOGjumfT374q4kDoYMjAbCHykjC5ci9FU0bf1oZY9inFVjIQaZFC6s5VAf2vHk9p7bib
         1MNoPOiS3Wh1cFpFCCWlXDVcPqR30TpqeSo8fxOpbv+Ul0Po3A/sGoz2FJ4YB9VHYb/o
         4QCw==
X-Gm-Message-State: AOJu0YwqESsVy2QFSnzCeImYityIJ/TC5Fz03kb9nPp4CqIqWp4vRX1u
	2k1umMrQoToN2N1DNgXE7ZE/Ig==
X-Google-Smtp-Source: AGHT+IFpSc9vJOkAH8ZZKRntYbsKYHwY7ln9QIIt991sOXeyZlCbm/maHxsQMIggxvFKODPr/K3O/g==
X-Received: by 2002:a5d:540a:0:b0:32f:7f2c:de2e with SMTP id g10-20020a5d540a000000b0032f7f2cde2emr4126889wrv.36.1700463686402;
        Sun, 19 Nov 2023 23:01:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:20 -0800 (PST)
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
Subject: [PATCH 08/14] pinctrl: renesas: rzg2l: Add output enable support
Date: Mon, 20 Nov 2023 09:00:18 +0200
Message-Id: <20231120070024.4079344-9-claudiu.beznea.uj@bp.renesas.com>
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

Some of the Ethernet pins on RZ/G3S (but also valid for RZ/G2L) need to
have direction of the IO buffer set as output for Ethernet to work
properly. On RZ/G3S these pins are P1_0/P7_0, P1_1/P7_1 with could have
the following Ethernet functions: TXC/TX_CLK or TX_CTL/TX_EN. To be able
to configure this the output enable has been implemented. This is
implemented with 2 per-platform read/write functions to be able to simply
validate the pins supporting this on a platform basis. Moreover, on RZ/G2L
the register though which these settings could be done is 8 bits long
whereas on RZ/G3S this is a 32 bit register. The Ethernet pins supporting
OEN are different. These differences could be handled in platform specific
OEN read/write functions.

Add support for OEN and enable it for RZ/G3S.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 106 +++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1401bb215686..e942204e08a2 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,6 +57,7 @@
 #define PIN_CFG_FILCLKSEL		BIT(12)
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
+#define PIN_CFG_OEN			BIT(15)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -109,6 +110,7 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
+#define ETH_MODE		(0x3018)
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -195,6 +197,7 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
+	const struct rzg2l_cfg_ops *ops;
 };
 
 /**
@@ -228,6 +231,16 @@ struct rzg2l_pinctrl {
 	struct rzg2l_pinctrl_pin_settings *settings;
 };
 
+/*
+ * struct rzg2l_cfg_ops - platform specific configuration ops
+ * @read_oen: read OEN function
+ * @write_oen: write OEN function
+ */
+struct rzg2l_cfg_ops {
+	u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
+	int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen);
+};
+
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
@@ -776,6 +789,67 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
+static bool rzg3s_oen_is_supported(u32 caps, u8 pin)
+{
+	if (!(caps & PIN_CFG_OEN))
+		return false;
+
+	/*
+	 * Only pins 0 and 1 of P1 and P7 are supporting this thus add a simple
+	 * check for this here.
+	 */
+	if (pin > 1)
+		return false;
+
+	return true;
+}
+
+static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin)
+{
+	if (pin)
+		pin *= 2;
+
+	if (offset / RZG2L_PINS_PER_PORT == 7)
+		pin += 1;
+
+	return pin;
+}
+
+static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+{
+	u8 bit;
+
+	if (!rzg3s_oen_is_supported(caps, pin))
+		return 0;
+
+	bit = rzg3s_pin_to_oen_bit(offset, pin);
+
+	return !(readl(pctrl->base + ETH_MODE) & BIT(bit));
+}
+
+static int rzg3s_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+{
+	unsigned long flags;
+	u32 val;
+	u8 bit;
+
+	if (!rzg3s_oen_is_supported(caps, pin))
+		return -EINVAL;
+
+	bit = rzg3s_pin_to_oen_bit(offset, pin);
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	val = readl(pctrl->base + ETH_MODE);
+	if (oen)
+		val &= ~BIT(bit);
+	else
+		val |= BIT(bit);
+	writel(val, pctrl->base + ETH_MODE);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -813,6 +887,16 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		break;
 
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (!(pctrl->data->ops && pctrl->data->ops->read_oen))
+			return -EINVAL;
+
+		arg = pctrl->data->ops->read_oen(pctrl, cfg, _pin, bit);
+		if (!arg)
+			return -EINVAL;
+
+		break;
+
 	case PIN_CONFIG_POWER_SOURCE:
 		ret = rzg2l_get_power_source(pctrl, _pin, cfg);
 		if (ret < 0)
@@ -915,6 +999,16 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 		}
 
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			if (!(pctrl->data->ops && pctrl->data->ops->write_oen))
+				return -EINVAL;
+
+			arg = pinconf_to_config_argument(_configs[i]);
+			ret = pctrl->data->ops->write_oen(pctrl, cfg, _pin, bit, !!arg);
+			if (ret)
+				return ret;
+			break;
+
 		case PIN_CONFIG_POWER_SOURCE:
 			settings.power_source = pinconf_to_config_argument(_configs[i]);
 			break;
@@ -1365,7 +1459,8 @@ static const u32 r9a07g043_gpio_configs[] = {
 static const u32 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x20, RZG3S_MPXED_PIN_FUNCS(A)),			/* P0  */
 	RZG2L_GPIO_PORT_PACK(5, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
-								PIN_CFG_IO_VMC_ETH0)),	/* P1 */
+								PIN_CFG_IO_VMC_ETH0)) |
+				      PIN_CFG_IEN | PIN_CFG_OEN,			/* P1 */
 	RZG2L_GPIO_PORT_PACK(4, 0x31, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH0)),	/* P2 */
 	RZG2L_GPIO_PORT_PACK(4, 0x32, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
@@ -1375,7 +1470,8 @@ static const u32 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(5, 0x21, RZG3S_MPXED_PIN_FUNCS(A)),			/* P5  */
 	RZG2L_GPIO_PORT_PACK(5, 0x22, RZG3S_MPXED_PIN_FUNCS(A)),			/* P6  */
 	RZG2L_GPIO_PORT_PACK(5, 0x34, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
-								PIN_CFG_IO_VMC_ETH1)),	/* P7 */
+								PIN_CFG_IO_VMC_ETH1)) |
+				      PIN_CFG_IEN | PIN_CFG_OEN,			/* P7 */
 	RZG2L_GPIO_PORT_PACK(5, 0x35, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH1)),	/* P8 */
 	RZG2L_GPIO_PORT_PACK(4, 0x36, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
@@ -1958,6 +2054,11 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.func_base = 1,
 };
 
+static const struct rzg2l_cfg_ops rzg3s_ops = {
+	.read_oen = rzg3s_read_oen,
+	.write_oen = rzg3s_write_oen,
+};
+
 static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.port_pins = rzg2l_gpio_names,
 	.port_pin_configs = r9a07g043_gpio_configs,
@@ -1987,6 +2088,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.n_port_pins = ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
 	.hwcfg = &rzg3s_hwcfg,
+	.ops = &rzg3s_ops,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.39.2


