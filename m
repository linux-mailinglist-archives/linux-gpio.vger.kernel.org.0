Return-Path: <linux-gpio+bounces-21661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765CADB1EE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 15:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B63161EBF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 13:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E532D9ED8;
	Mon, 16 Jun 2025 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJX4ursR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F32980B0;
	Mon, 16 Jun 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080478; cv=none; b=IYvGeUUFf1XSwG8/UkkaqeyidWs5jkYU/SFgZgknzhLLqe1ExSbOr4CCqPzY0coaRisusLTpZVtZNemOIiVy5y6DZdefx7fGAUwFE6e+0X0ExLpHqpfWLOi6G8lzaywQJoyv/xpvft6ptz+CMehyQY5KjBHrkFEneBgt1Aeilxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080478; c=relaxed/simple;
	bh=gOQ5iOFvknvIf0NqR8lprZaU7amJcBfVS53KLfZWKIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGqC/brjTEt/GWe2Um5vSYk1NW9csY/jrqOCoHSG7/htTI1Y3sDkbi7QWpajPuLPmVTaqjx1dAy4qrrIKd1Vid1q91LXD8RB2Zs+mvbNDFDODgLvf1mARGUxEtprRN6pEW4SE2oNa9bbMhal156yfzEb1XcP0Yzk0JkqXwcZLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJX4ursR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4530921461aso38060095e9.0;
        Mon, 16 Jun 2025 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750080474; x=1750685274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RfLkLdbUr3hRGaqHqxx+0GHMmYhwozHBPTBmczCVDo4=;
        b=EJX4ursR1bbz2Gn8tWFJvo0k0I6bqMyEsP+JIXHAddJ1WppTmRf2L62yFXRyS8gdOR
         jZP9mSwZT3T1Ugwkn7S3Z+/AYsd8el9F+GCtLiCiGfjWVSlDi07aCy2KtOo5TOA8uoVc
         x5vpIH1GbgxM28oG1rYvmCQYAgACK2DR1t3u2t2F8IrzRF8UJtJ3uBua1xIWnrB0bTYE
         7FdlxPv15LsEFL//EAfXKimaiR5I5vMGBLoAGyWAAABdelbCWhN4rqaHOY8XSyEjBOkc
         mmyKY1H+IvCiQy+CYYNjMJXJ0fzsuoBAWIMcrCmk5L45Zu+7iDnoPbCGQeLWrNjkUetW
         si2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080474; x=1750685274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfLkLdbUr3hRGaqHqxx+0GHMmYhwozHBPTBmczCVDo4=;
        b=dh5uDibNpKEAbidsIr9wDZ2uu85jhWs62GSpCtpgT3RU6/xtnHqUC2uVQijqlkqlFq
         8gTQPYeRF+oYIVzqHofFIEwaHwC7m9HwplA73Ia3rQJY2S5BkrRyV11TZLThYk20j8S3
         IILx83raQuFrGAuEbRYJG92Vgo3xpNf1Mh8GVvr3vJAcxPcYwsXf8R+7atD4a60mMuhh
         VVWasS/EdQvPasce+Z8dk7DkvFVAtXr6XT/3Ic2sGqTEGkL3ui9fgFUO9oHdW+2xHzsC
         fFIBRJ7aM9PWziZhmjTCU5ScuqPH/wV+TVTr+EOIg8daBQoYgzmoP1uoiB1hH/uhWgxB
         Ynyw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3ElsZra5Z4Z3tSf5+s83NzPhOEfbmNpFKtjbZDjGm5VNCnN8FayoeBrn+Vq7SedzBEErxWzM88ha@vger.kernel.org, AJvYcCX6z2kZ4LSTgKTn4tCTbhWQGy2RbSi9hLWrzzPi3Y7MHiwi7bs01t35J6xw+LJtGUd7WqNFxHgxu218gjTF@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqcaR00uiovibYkSOmiyXaKRJmQY1mNPLl5Y6/eeT60/JDJwE
	Wl7iuN2Zf2Ckqyw7jZz8VI53vTHzi8tr3LP15gOJo4AwVVCg12HEs/ef
X-Gm-Gg: ASbGncsAa+y8lfEiGmhzH4L5c3S+TFC3OKYn8+F07qj4S73SVP0/RTaxkCf35+Nl8oj
	LJteCAiC5+ExLzwrvsf9ZxCPgEd0ODkpT0lBsk0oL9NeDP2FAiUu4UOZyElCKx2ZWkz2R5rZs3H
	b9M3AFMFOYjEWejocB2us3yX5+SuTNBfFhQn3pE2GejnxvGydPN8+qt4zRk/J9NLskiPqc2VNFq
	Kmo4tSrArvC+SjCM1VfWYpdi0iItBHrCHM+W9QO7D9SWuKtFs/nB/HXhfY5nc8mK4Z7BYLHkPBs
	JLjFUgMqri68TeyYpP4FrqIzI3PFT+qF0rCsDhMNPJWYv8g9okHglkQ+Nn9SUObFbu40fNpsQJV
	tnXKNxWI1yTUrrdDanOA6CugBklfVJBU=
X-Google-Smtp-Source: AGHT+IEH/hG5OFXO4uIu5EX1I60NRv2+jYS1WKU3eep/fEAn9xod/u7kXmYD2crC8ANAVrLy1v1yFQ==
X-Received: by 2002:a05:600c:35ca:b0:442:e0f9:394d with SMTP id 5b1f17b1804b1-4533cab1298mr75941125e9.24.1750080473777;
        Mon, 16 Jun 2025 06:27:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:4135:3769:337c:8a0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14fc8bsm145024815e9.28.2025.06.16.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:27:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Validate pins before setting mux function
Date: Mon, 16 Jun 2025 14:27:50 +0100
Message-ID: <20250616132750.216368-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ensure only valid pins are configured by validating pin mappings before
setting the mux function.

Rename rzg2l_validate_gpio_pin() to rzg2l_validate_pin() to reflect its
broader purpose validating both GPIO pins and muxed pins. This helps
avoid invalid configurations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 45 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 59c32a0d87f1..2a10ae0bf5bd 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -493,6 +493,23 @@ static void rzv2h_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
 	writeb(pwpr & ~PWPR_REGWE_A, pctrl->base + regs->pwpr);
 }
 
+static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
+			      u64 cfg, u32 port, u8 bit)
+{
+	u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
+	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
+	u64 data;
+
+	if (!(pinmap & BIT(bit)) || port >= pctrl->data->n_port_pins)
+		return -EINVAL;
+
+	data = pctrl->data->port_pin_configs[port];
+	if (off != RZG2L_PIN_CFG_TO_PORT_OFFSET(data))
+		return -EINVAL;
+
+	return 0;
+}
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -536,6 +553,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;
+	int ret;
 
 	func = pinmux_generic_get_function(pctldev, func_selector);
 	if (!func)
@@ -552,6 +570,10 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
 
+		ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
+		if (ret)
+			return ret;
+
 		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
 			RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
 
@@ -806,23 +828,6 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
-static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
-				   u64 cfg, u32 port, u8 bit)
-{
-	u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
-	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
-	u64 data;
-
-	if (!(pinmap & BIT(bit)) || port >= pctrl->data->n_port_pins)
-		return -EINVAL;
-
-	data = pctrl->data->port_pin_configs[port];
-	if (off != RZG2L_PIN_CFG_TO_PORT_OFFSET(data))
-		return -EINVAL;
-
-	return 0;
-}
-
 static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 				 u8 bit, u32 mask)
 {
@@ -1287,7 +1292,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	} else {
 		bit = RZG2L_PIN_ID_TO_PIN(_pin);
 
-		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
+		if (rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
 			return -EINVAL;
 	}
 
@@ -1447,7 +1452,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	} else {
 		bit = RZG2L_PIN_ID_TO_PIN(_pin);
 
-		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
+		if (rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
 			return -EINVAL;
 	}
 
@@ -1687,7 +1692,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u8 reg8;
 	int ret;
 
-	ret = rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit);
+	ret = rzg2l_validate_pin(pctrl, *pin_data, port, bit);
 	if (ret)
 		return ret;
 
-- 
2.49.0


