Return-Path: <linux-gpio+bounces-23025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D8AFEEA1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD59F188803C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E752E9EDC;
	Wed,  9 Jul 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsoYIvWG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023A82E5B0E;
	Wed,  9 Jul 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077318; cv=none; b=SAytKvrZOeP1wO7f+eZHd//cXj4ytkBLv93EnWTTahyWcWMM3/199ct/vEHmgABdGyTiZVA66ciBbVnIIJ48sJ/cMPbgElOseifZoh6vVgHU+UIsUZQozpQBwY3CLkqLCDTzazZuZBOJr/J8vbpz6pP3Mo7a7NhmycWK6sYpkSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077318; c=relaxed/simple;
	bh=eyzMrV4oXkoY0Xog7pWNxsaUDeTlHVhYnqbpICNTXzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpSHlXHEIH+ch/zGeWLE8DmJUutV6eofg1d8CjoaClYov9GWoLauMhDiIvrgSEWiec0UG0oDR5pzR4AGXxF5hKOqlZwz0Ddsxq4Z/Yjn2bo3I05bfg3Vi1vu/fb9kd+lCzcC3Ls7sX6lgQvEJHW3FyRit2X53gJBSqLj+fWdTPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsoYIvWG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b45edf2303so109563f8f.2;
        Wed, 09 Jul 2025 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077315; x=1752682115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbEQbP0gHmoeU8ky70blwCNCDEnSUfgldHxfZOgWw5I=;
        b=ZsoYIvWG1MjTGfsqarWX3GUVeqRnIrCwhBuWnVFe+cmPr0ufTdH32IMGcn8bHa0Efe
         U5Eq0jpCsTIbyXqaZLGNg01vbk9JSQqDBPiwwDqw9j48Mz9Y5DJGpbRzjwqk23/9q7qM
         0/OxrizS9qwgMhqnNEHF/YA/iQFGd8Kgv+rwTiSIRlo7TXOYpnVDf49qEXNaLYSmz1nt
         6fAjH7j4vIpTlxve/M7122PHnYeUKvVrGEGRWQn8CuRDBdT9yrtWvAVx+Fc2UxccR2XD
         m3Sgxdpa/LivEJpv6XL3VnYuTLe9Mt4+78RKZUxUdV1xIYON0tkZ2K11higN5HoQuTpd
         kxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077315; x=1752682115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbEQbP0gHmoeU8ky70blwCNCDEnSUfgldHxfZOgWw5I=;
        b=A3HBxapCs0L6yEXt7+8+Qu2ZOoPjnqnoZzkRorOl5IrY7VTLxP0lgRgcAAyECKshI3
         5FbSTeZNdC9vK8RE47OcvaBSZw700nKBCx0fph3/exGSFnVaStye1BfTG3fcxa79Xoia
         WId9K/WB6N2rA98fk8GiDRKLp/X7nZovIrgZchcLtHZzXA2f9+twVaPuguAaqD3EwUuH
         2ttZPNJqvbt0TXsXClmhxL2TrpYZeIo2zi8vrPttuE5PXCCT90CmVXGU77V5evGOm+dF
         Yo01HPB3NsslPaVGzXgu9KiQhba7B8O5KFo4qoRW6KlrLIcjR+mpSJzjR5q6F16fyz9b
         UlFg==
X-Forwarded-Encrypted: i=1; AJvYcCU6UCiNV6XQTnf04Ko1ce/aDlzvsPzie0XRo7yLV5Kb9N+v/rcBauLK37r55VKBGYdcG+bcov91ICZuGL2+@vger.kernel.org, AJvYcCUZfBHEnkOzZpqXyeTrY7wQ+JvZh6l4vfVdlUseDtz5+003km0l97VTABfggxjv16OzjCneo5UNKXAl@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPAZCvLhn7dtWZxEFlrB4O5Sj1pNWpqLbAVAP4/8/xQ+Akg31
	oodWeHpGkzW2IK9D1KiOvfX1QhR4G7cXeCI13mt/AVnA2oiFzE4PFhv7
X-Gm-Gg: ASbGnctL1Y3YAyKzBp8jHAv9sOPH4MtLjXAJ7enIu5oajk/dj4nVu/19uWfBMnisSoa
	RBJ3fnPC4lzBfVq1Z0FwV8LEaQYutAzrlwB9NyYaotD50Y5whPjHJdP6HeWajXANldUZtm8X0Bm
	F+FeOI4U9+Lt3cKSRQVT3wkpY5kU5DFly8A7sjqmE6LS8cmNuNCpyWBrJmJvKaxrQho1JEF6lti
	JXaCUDmKUsJjB+7HMpFcCrLE7PJPx3UyjJLinB+AvKk6mXIVbqdpAmaVwYyX1uFoJusIcpnLo6E
	tRfUdHXZVHdDOa0o7DlmOvfnuaKDWRZuvU2963gQOumMW8t3xoswY5uVNqIPakgzVOnvyuUqIan
	yeVfhyHAAUK8a1vsIP2vHkg==
X-Google-Smtp-Source: AGHT+IEZcEEvfIU/FjGFchPJNxOYfIPPGBA1O+qz1PV9gOHFHWQo3MX10WhWH6m/oCxo/TXjelyY+w==
X-Received: by 2002:a05:6000:4608:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3b5e45245e9mr2722850f8f.27.1752077315108;
        Wed, 09 Jul 2025 09:08:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:34 -0700 (PDT)
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
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/7] pinctrl: renesas: rzg2l: Unify OEN access by making pin-to-bit mapping configurable
Date: Wed,  9 Jul 2025 17:08:15 +0100
Message-ID: <20250709160819.306875-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the RZG2L pinctrl driver to support reuse of the common
rzg2l_read_oen() and rzg2l_write_oen() helpers across SoCs with
different output-enable (OEN) bit mappings.

Introduce a new `pin_to_oen_bit` callback in `struct rzg2l_pinctrl_data`
to allow SoCs to provide custom logic for mapping a pin to its OEN bit.
Update the generic OEN read/write paths to use this callback when present.

With this change, SoCs like RZ/G3S can reuse the common OEN handling
code by simply supplying their own `pin_to_oen_bit` implementation.
The previously duplicated `rzg3s_oen_read()` and `rzg3s_oen_write()`
functions are now removed.

This improves maintainability and prepares the driver for supporting
future SoCs with minimal duplication.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 52 +++++++------------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 75b5bd032659..345ee709363b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -296,6 +296,7 @@ struct rzg2l_pinctrl_data {
 #endif
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
+	int (*pin_to_oen_bit)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
 	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
 	int (*oen_write)(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen);
 	int (*hw_to_bias_param)(unsigned int val);
@@ -1070,7 +1071,9 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	int bit;
 
-	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (!pctrl->data->pin_to_oen_bit)
+		return 0;
+	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
 		return 0;
 
@@ -1084,9 +1087,11 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	int bit;
 	u8 val;
 
-	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (!pctrl->data->pin_to_oen_bit)
+		return -EINVAL;
+	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
-		return bit;
+		return -EINVAL;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + oen_offset);
@@ -1120,40 +1125,6 @@ static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	return bit;
 }
 
-static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
-{
-	int bit;
-
-	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
-	if (bit < 0)
-		return 0;
-
-	return !(readb(pctrl->base + pctrl->data->hwcfg->regs.oen) & BIT(bit));
-}
-
-static int rzg3s_oen_write(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen)
-{
-	u16 oen_offset = pctrl->data->hwcfg->regs.oen;
-	unsigned long flags;
-	int bit;
-	u8 val;
-
-	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
-	if (bit < 0)
-		return bit;
-
-	spin_lock_irqsave(&pctrl->lock, flags);
-	val = readb(pctrl->base + oen_offset);
-	if (oen)
-		val &= ~BIT(bit);
-	else
-		val |= BIT(bit);
-	writeb(val, pctrl->base + oen_offset);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
-
-	return 0;
-}
-
 static int rzg2l_hw_to_bias_param(unsigned int bias)
 {
 	switch (bias) {
@@ -3310,6 +3281,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
@@ -3327,6 +3299,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
@@ -3343,8 +3316,9 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.hwcfg = &rzg3s_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
-	.oen_read = &rzg3s_oen_read,
-	.oen_write = &rzg3s_oen_write,
+	.pin_to_oen_bit = &rzg3s_pin_to_oen_bit,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
-- 
2.49.0


