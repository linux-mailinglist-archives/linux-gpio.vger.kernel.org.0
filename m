Return-Path: <linux-gpio+bounces-30739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51652D3AE8B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA1B430B22DA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443E7387370;
	Mon, 19 Jan 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YGDSzlLB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B70734FF59;
	Mon, 19 Jan 2026 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835207; cv=none; b=SeD7T79XlxGLl7hRu7fm8hKCllMGIqWVTx8tslvMMrzdLhrCLh1Cd3nUXB0JIeZIepO5h2eWhy9n9FhcsdBcUklfv5CT8TjwfScFsVPESjQ3DEAvLMa3HJvPpgLrQrc1DYZZFvMH8f38UCV0S3+4tb9dYelf3AtZy6XyC1V87zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835207; c=relaxed/simple;
	bh=OGilbYE/z4gnSGdxPXTXPbsyT0BspvUQERpkut14bYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=byew1SRiJ+BtuYCFV0H7wHQjjlPLXsZM16lEMI5aUUSCntqT2BWzhfOgvxELEAHSeJ8F7V1BAjGQBF5mMYAW3sPb9EaIm45XM6ruk73vgPro4gZl8YIt8d7Ui0wBZXXVCnrw56XZPNgGj4yeWLpR/py9jOcZvnlM6xJHQOdOQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YGDSzlLB; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768835205; x=1800371205;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=OGilbYE/z4gnSGdxPXTXPbsyT0BspvUQERpkut14bYg=;
  b=YGDSzlLBGH99j0ozFwCJ4eNokiNduO7eB2Ja7vhdIgz/3O+O/Adwl/4t
   DrVpBShVRyGKZtk66Eo1fQC+JYfy5s+EdDjrw+d3g+Q5Zv2Gna22NG45f
   /qXHRKiy0ELZDz+19OvUIR5I5XgXussfSZeuQH6ebrN1A6ug+lOeFEvev
   02XnPrRi61TKTt5xB5kobN5X/61Oaz0y6MMViIsOb2vj8CFQARFG92tMg
   4uP+mYWux3K0Ej4WH5ewdZbRUwG/sbJUI+VeplgIPlTSuLaiPcuMRcgDJ
   MaMjvxyPKHXNYUai80s+HXbo26HOd2WsoJ7YFG9UVaR0F3ZesWzcFglNN
   g==;
X-CSE-ConnectionGUID: 1bDZ6aHwSTKUGtJlZF+cag==
X-CSE-MsgGUID: nz/uRV0LRhGrJ/YBegxkCw==
X-IronPort-AV: E=Sophos;i="6.21,238,1763449200"; 
   d="scan'208";a="51363225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2026 08:06:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 19 Jan 2026 08:06:32 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 19 Jan 2026 08:06:30 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 19 Jan 2026 16:06:10 +0100
Subject: [PATCH 2/3] pinctrl: ocelot: Update alt mode reg addr calculation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-2-1228155ed0ee@microchip.com>
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Bartosz Golaszewski <brgl@kernel.org>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Lan9645x is the first chip supported by this driver where the pin stride
is different from the alt mode stride. With 51 pins and up to 7 alt
modes, we have stride = 2 and alt_mode_stride = 3.

The current REG_ALT macro has the implicit assumption that these numbers
are equal, so it does not work for lan9645x.

The pin stride is the 'stride' variable in the driver. It is the size
of certain register groups which depends on the number of pins supported
by the device. Generally we have stride = DIV_ROUND_UP(npins, 32). E.g:

GPIO_OUT_SET0
GPIO_OUT_SET1
...
GPIO_OUT_SETn

The alt mode registers are further replicated by the number of bits
necessary to represent the alt mode. For instance if we need 3 bits to
represent the alt mode:

GPIO_ALT0[0-2]
GPIO_ALT1[0-2]

To set alt mode 3 on pin 12, it is necessary to perform writes

GPIO_ALT0[0] |= BIT(12)
GPIO_ALT0[1] |= BIT(12)
GPIO_ALT0[2] &= ~BIT(12)

The stride and alt mode stride are used by the REG_ALT macro to
calculate the alt mode register address for a given pin.

This adds the option to specify n_alt_modes, which is used to set
info->altm_stride. The default value is info->stride, to make sure
existing devices are unaffected by this change.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 70da3f37567a..4db0439ca8c4 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -358,12 +358,14 @@ struct ocelot_pinctrl {
 	const struct ocelot_pincfg_data *pincfg_data;
 	struct ocelot_pmx_func func[FUNC_MAX];
 	u8 stride;
+	u8 altm_stride;
 	struct workqueue_struct *wq;
 };
 
 struct ocelot_match_data {
 	struct pinctrl_desc desc;
 	struct ocelot_pincfg_data pincfg_data;
+	unsigned int n_alt_modes;
 };
 
 struct ocelot_irq_work {
@@ -1362,7 +1364,7 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
 	return -1;
 }
 
-#define REG_ALT(msb, info, p) (OCELOT_GPIO_ALT0 * (info)->stride + 4 * ((msb) + ((info)->stride * ((p) / 32))))
+#define REG_ALT(msb, info, p) (OCELOT_GPIO_ALT0 * (info)->stride + 4 * ((msb) + ((info)->altm_stride * ((p) / 32))))
 
 static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int selector, unsigned int group)
@@ -2294,6 +2296,9 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	reset_control_reset(reset);
 
 	info->stride = 1 + (info->desc->npins - 1) / 32;
+	info->altm_stride = info->stride;
+	if (data->n_alt_modes)
+		info->altm_stride = fls(data->n_alt_modes);
 
 	regmap_config.max_register = OCELOT_GPIO_SD_MAP * info->stride + 15 * 4;
 

-- 
2.34.1


