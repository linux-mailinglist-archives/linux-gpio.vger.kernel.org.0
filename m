Return-Path: <linux-gpio+bounces-6597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CE8CE3C0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ACC91C2182A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0159E85933;
	Fri, 24 May 2024 09:46:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8428563E;
	Fri, 24 May 2024 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544017; cv=none; b=FmoWY/LRiRC3N7oOpR3z7o1Gqn48cxbKzaIsZS/Qc6rjz114lAud0Os60vEJ1PlGPbzDTpFHr/BMNwPK4ZmK7O03Q42hQvOGrDqdhZQPM9b9Qm9G4GnWwezNcFRBUjTlwvxksqllNzv1wRZbWJZG2QgDwXVwnQ/anu8ZsMoyze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544017; c=relaxed/simple;
	bh=OoIyX+aLiTxpjL08VUR0DefxWGgHUUg4hu/XFNjmGJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QVVuVv39a2rzMZHsmLmgwg/63ANrjr9E45iijcNmIBM8BG7ngL/Vx9T+rChS+KwGUJcxSijzQ0p4TPLJ9WrOK+yNCf9KsSONWNGkg+ee7g4Ij+M5YpjL1Z/lWTSDwrI96TafvgfHkzgJ1JizFizWVlBJBT/r3WBAQiaFi3sKqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="205579809"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 May 2024 18:46:48 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E574D4006CD0;
	Fri, 24 May 2024 18:46:44 +0900 (JST)
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
Subject: [PATCH 1/9] pinctrl: renesas: rzg2l: Fix variable names in OEN functions
Date: Fri, 24 May 2024 10:45:55 +0100
Message-Id: <20240524094603.988-2-paul.barker.ct@bp.renesas.com>
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

The variable naming in the various OEN functions has been confusing. We
were passing the _pin variable from rzg2l_pinctrl_pinconf_get() and
rzg2l_pinctrl_pinconf_set() as the offset argument to rzg2l_read_oen()
and rzg2l_write_oen(), when this is not a register offset.

What we actually need here is the port index, so that we can compare
this to oen_max_port.

We can also clean up rzg2l_pin_to_oen_bit(), removing an unnecessary
branch and clarifying the variable naming.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c3256bfde502..724308cd5a37 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1025,18 +1025,17 @@ static bool rzg2l_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
 	return true;
 }
 
-static u8 rzg2l_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
+static u8 rzg2l_pin_to_oen_bit(u32 port, u8 pin, u8 max_port)
 {
-	if (pin)
-		pin *= 2;
+	u8 bit = pin * 2;
 
-	if (offset / RZG2L_PINS_PER_PORT == max_port)
-		pin += 1;
+	if (port == max_port)
+		bit += 1;
 
-	return pin;
+	return bit;
 }
 
-static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin)
+static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 port, u8 pin)
 {
 	u8 max_port = pctrl->data->hwcfg->oen_max_port;
 	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
@@ -1045,12 +1044,12 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8
 	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
 		return 0;
 
-	bit = rzg2l_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg2l_pin_to_oen_bit(port, pin, max_port);
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
 
-static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen)
+static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 port, u8 pin, u8 oen)
 {
 	u8 max_port = pctrl->data->hwcfg->oen_max_port;
 	u8 max_pin = pctrl->data->hwcfg->oen_max_pin;
@@ -1060,7 +1059,7 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8
 	if (!rzg2l_oen_is_supported(caps, pin, max_pin))
 		return -EINVAL;
 
-	bit = rzg2l_pin_to_oen_bit(offset, pin, max_port);
+	bit = rzg2l_pin_to_oen_bit(port, pin, max_port);
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + ETH_MODE);
@@ -1112,7 +1111,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		arg = rzg2l_read_oen(pctrl, cfg, _pin, bit);
+		arg = rzg2l_read_oen(pctrl, cfg, RZG2L_PIN_ID_TO_PORT(_pin), bit);
 		if (!arg)
 			return -EINVAL;
 		break;
@@ -1220,7 +1219,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = pinconf_to_config_argument(_configs[i]);
-			ret = rzg2l_write_oen(pctrl, cfg, _pin, bit, !!arg);
+			ret = rzg2l_write_oen(pctrl, cfg,
+					      RZG2L_PIN_ID_TO_PORT(_pin), bit, !!arg);
 			if (ret)
 				return ret;
 			break;
-- 
2.39.2


