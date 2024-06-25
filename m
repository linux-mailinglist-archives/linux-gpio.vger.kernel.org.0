Return-Path: <linux-gpio+bounces-7683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AF917225
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 576C91C26317
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241BE17DE02;
	Tue, 25 Jun 2024 20:03:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DC717D36B;
	Tue, 25 Jun 2024 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345819; cv=none; b=X8nPiiDPPpqP+/xK13s+N7V9KTnstH7Gq+aviJ8Q9ekFmDtRI6jtL7mVVB7PMwTkYNslxDJzky36VylyGLvRVzlvLLSDaJDX80AnW9k3A6jyPrk6ieQIKcaPcF2NQMiYsB3EF7RSkJiGipBzbLsbPNuTIx3r7kfInleu2fO8BEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345819; c=relaxed/simple;
	bh=aWT94ex/zXwt0FgX4IXzVUR1qQ5Kf0OhrKcsoCtg+kA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s08fWSWGfeUluI2K8CSySpYarEFPZoOLGg4Fl+bRWeVVYW8Uae6DYbdn7AszSszIJnOoaTrLPx9H1cv0KsEpx7arkLLxa2jwKOi4DaLZGZ46JvY9iy8HyHThhFk4ONKtHiGdyscSaHSN08edH5ZL336WTrrU8iA4KbmqcDH3Q+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="209263959"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 05:03:36 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 09789400C4E6;
	Wed, 26 Jun 2024 05:03:31 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] pinctrl: renesas: rzg2l: Clarify OEN read/write support
Date: Tue, 25 Jun 2024 21:03:08 +0100
Message-Id: <20240625200316.4282-2-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We currently support OEN read/write for the RZ/G3S SoC but not the
RZ/G2L SoC family (consisting of RZ/G2L, RZ/G2LC, RZ/G2UL, RZ/V2L &
RZ/Five). The appropriate functions are renamed to clarify this and to
match the callback names.

We should also only set the oen_read and oen_write function pointers for
the devices which support these operations. This requires us to check
that these function pointers are valid before calling them.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag & Geert's Reviewed-by tag.
  * Renamed rzg3s oen functions to match the callback names.
Changes v1->v2:
  * New patch to clarify function names.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 32945d4c8dc0..a2a395fd34c1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -994,7 +994,7 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
-static bool rzg2l_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
+static bool rzg3s_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
 {
 	if (!(caps & PIN_CFG_OEN))
 		return false;
@@ -1005,7 +1005,7 @@ static bool rzg2l_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
 	return true;
 }
 
-static u8 rzg2l_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
+static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
 {
 	if (pin)
 		pin *= 2;
@@ -1016,31 +1016,31 @@ static u8 rzg2l_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
 	return pin;
 }
 
-static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
 {
 	u8 max_port = pctrl->data->hwcfg->oen_max_port;
 	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
 	u8 bit;
 
-	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
+	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
 		return 0;
 
-	bit = rzg2l_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
 
-static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
 {
 	u8 max_port = pctrl->data->hwcfg->oen_max_port;
 	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
 	unsigned long flags;
 	u8 val, bit;
 
-	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
+	if (!rzg3s_oen_is_supported(caps, pin, max_pin))
 		return -EINVAL;
 
-	bit = rzg2l_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg3s_pin_to_oen_bit(offset, pin, max_port);
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + ETH_MODE);
@@ -1215,6 +1215,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (!pctrl->data->oen_read)
+			return -EOPNOTSUPP;
 		arg = pctrl->data->oen_read(pctrl, cfg, _pin, bit);
 		if (!arg)
 			return -EINVAL;
@@ -1354,6 +1356,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = pinconf_to_config_argument(_configs[i]);
+			if (!pctrl->data->oen_write)
+				return -EOPNOTSUPP;
 			ret = pctrl->data->oen_write(pctrl, cfg, _pin, bit, !!arg);
 			if (ret)
 				return ret;
@@ -3065,8 +3069,6 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3082,8 +3084,6 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
@@ -3098,8 +3098,8 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.hwcfg = &rzg3s_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-	.oen_read = &rzg2l_read_oen,
-	.oen_write = &rzg2l_write_oen,
+	.oen_read = &rzg3s_oen_read,
+	.oen_write = &rzg3s_oen_write,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
-- 
2.39.2


