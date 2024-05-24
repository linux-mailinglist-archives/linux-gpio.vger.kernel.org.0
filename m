Return-Path: <linux-gpio+bounces-6598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039418CE3C4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2617F1C21861
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697048563E;
	Fri, 24 May 2024 09:47:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9EC85627;
	Fri, 24 May 2024 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544023; cv=none; b=Y7+2brz2i78kud0o0ykCZ7kKCjNmR2NeYchbGJ2Q6xP+s4uEY+HYcxSeDrGE8IEhYZUswHYr0SCb80EmpcgEkLDyg2e/RFNrAk+3QQxhntmZveChygW3cAMGg8QJOH6ATeLm4cqgaYKopE02qs9hzfn9DzvPg0vQWQdj7hXfIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544023; c=relaxed/simple;
	bh=mm89D1Hnkhrz3syZ7uvJyBIfoNEZfpDInQ4FBoPr/yc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dqy5JQZraFAhKc3Ld3wx/e2xbojfpWiLOc154JMev7rxXMFrh3hbEa0xm3KDP356zxTNR39N3U1Bi5JSs72JFwkaQ9VDZxmQ6boW7oKtS8WCMHrMt2hxZwFzenKbHjYmjTexWo9lBAU1BEVQNxmYEk0nwV5Ls7jvLZUagFmnzXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="209538235"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 May 2024 18:46:53 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7690E4006CD0;
	Fri, 24 May 2024 18:46:49 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] pinctrl: renesas: rzg2l: Refactor pin to OEN bit translation
Date: Fri, 24 May 2024 10:45:56 +0100
Message-Id: <20240524094603.988-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We currently support setting OEN (Output ENable) bits only for the
RZ/G3S SoC and so the functions rzg2l_oen_is_supported() and
rzg2l_pin_to_oen_bit() are hardcoded for the RZ/G3S. To prepare for
supporting OEN on SoCs in the RZ/G2L family, we need to make this code
more flexible.

So, the rzg2l_oen_is_supported() and rzg2l_pin_to_oen_bit() functions
are replaced with a single translation function which is called via a
pin_to_oen_bit function pointer and returns an error code if OEN is not
supported for the given pin.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 +++++++++++--------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 724308cd5a37..08c68b95e67f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -256,6 +256,8 @@ struct rzg2l_pinctrl_data {
 	const struct rzg2l_hwcfg *hwcfg;
 	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
+	int (*pin_to_oen_bit)(const struct rzg2l_hwcfg *hwcfg,
+			      u32 caps, u32 offset, u8 pin);
 };
 
 /**
@@ -1014,22 +1016,14 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinctrl *pctrl, u32 caps,
 	return false;
 }
 
-static bool rzg2l_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
-{
-	if (!(caps & PIN_CFG_OEN))
-		return false;
-
-	if (pin > max_pin)
-		return false;
-
-	return true;
-}
-
-static u8 rzg2l_pin_to_oen_bit(u32 port, u8 pin, u8 max_port)
+static int rzg3s_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 caps, u32 port, u8 pin)
 {
 	u8 bit = pin * 2;
 
-	if (port == max_port)
+	if (!(caps & PIN_CFG_OEN) || pin > hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	if (port == hwcfg->oen_max_port)
 		bit += 1;
 
 	return bit;
@@ -1037,29 +1031,30 @@ static u8 rzg2l_pin_to_oen_bit(u32 port, u8 pin, u8 max_port)
 
 static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 port, u8 pin)
 {
-	u8 max_port = pctrl->data->hwcfg->oen_max_port;
-	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
-	u8 bit;
+	int bit;
 
-	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
+	if (!pctrl->data->pin_to_oen_bit)
 		return 0;
 
-	bit = rzg2l_pin_to_oen_bit(port, pin, max_port);
+	bit = pctrl->data->pin_to_oen_bit(pctrl->data->hwcfg, caps, port, pin);
+	if (bit < 0)
+		return 0;
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
 
 static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 port, u8 pin, u8 oen)
 {
-	u8 max_port = pctrl->data->hwcfg->oen_max_port;
-	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
 	unsigned long flags;
-	u8 val, bit;
+	int bit;
+	u8 val;
 
-	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
-		return -EINVAL;
+	if (!pctrl->data->pin_to_oen_bit)
+		return -EOPNOTSUPP;
 
-	bit = rzg2l_pin_to_oen_bit(port, pin, max_port);
+	bit = pctrl->data->pin_to_oen_bit(pctrl->data->hwcfg, caps, port, pin);
+	if (bit < 0)
+		return bit;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + ETH_MODE);
@@ -2705,6 +2700,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.n_port_pins = ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
 	.hwcfg = &rzg3s_hwcfg,
+	.pin_to_oen_bit = rzg3s_pin_to_oen_bit,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.39.2


