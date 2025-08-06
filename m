Return-Path: <linux-gpio+bounces-24050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA0B1CCB4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E147B7B0464
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18542BE7B0;
	Wed,  6 Aug 2025 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu1UrXEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE72BE03F;
	Wed,  6 Aug 2025 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510168; cv=none; b=CbUgzfh9QSb2hlI/Qw0vShu6HYrEUfyGkzdQzk4SE22W+kK7lHPnWwPvDQ0oyNayyQqY4ym5TJ8K2NMQWKW3neqowSp2jJfipZzVkEGTcGJRYqaXebjUVAtwTU/D2ebEYDxdlGvMZIDlvj8+wsMDf6ZDQ+cFOC2RsOAIIFyPQg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510168; c=relaxed/simple;
	bh=Z7zInOBDYWBbWWIHozaxQqDsTvE3iQJiK50sLiOEShg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtSKdexs7k+/mf3o74FsUyoqELh3ehlFoI2wzsvV1bWn1xhiURJ0Gl3wgEdovIyVDRlVIW3mUwVKyroR3SAXox3T9NZEqTKMX+Q0+heN1/FETY7rWNgT6V9TJ1jDAgRpTlW7od5Xl+80D7QKusrQqZx0yUzrvqnh4Fuk6s9o5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu1UrXEC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so85209f8f.2;
        Wed, 06 Aug 2025 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510165; x=1755114965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRAu+Pd8cRmqZi1I+elUe9EzDTdxLO9tLS72ap33/18=;
        b=Eu1UrXECRp7TMGHeAWQL2hIBYHCjkai99EC+QiFkOOqDjBNUnZTp2sE+p+S0oc2QXX
         qVKC66Qojh8y05BHqYj3tsg7wcYUWYjl9Ea4fXjPAElljLk3sVgatgnmMuy82XZSQQ/J
         bT5sMKPTCUGvTV/OCLBm63Wyz0jJjQdhHLBV6zCTRAGvpaZEROCZ1JFnFMGeAtXeR2h+
         c8l7N2vY0qfngpyk/7/ffnK8ayyOMJaIjaPCQ1T/KZoy4iYY+BMTZbnvhBty8pAyXvM8
         OElFMfufg1Y3kcD6SmQwG6p+TmiiYbJw4yJMBe1VVcsB164Gm2Y71IIbhUDkQI4MoTEV
         Trmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510165; x=1755114965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRAu+Pd8cRmqZi1I+elUe9EzDTdxLO9tLS72ap33/18=;
        b=unqA8dRDFRnmO8tuVPJzRct7pux4wkp5uMJV+65awNYpGAB2wKeQoLNhGQ/4Clpvp8
         CFo/pJXAVwY78+1NLPyctaGgM3P88vq8VyLHmYQN4dYL0ZTk1LHdeK6PAaLq44N+sip4
         r/AWqNM0BmKwXpH41VhBDM4oCzKgGhuyXHinlim3EnWVpQ3mjxn3uqDarfh6BbrOSRNf
         qPSjpPsOBXktFcsxjxD0BFBXFpyvsWhgG3H6bphyBpUdhhBJ36tqv/FwZ/L18l7SaJxN
         3gU6gMljU7Bx2xN+f2cF/KgjfpSG3VP2KsS6F7H/AcUoeR1dztnb9xADMGSwKz7I84nu
         wQaA==
X-Forwarded-Encrypted: i=1; AJvYcCU9icDQH0SQg7vqGpBUr/JRyN+Q05CNKfI+G/Ri/hC8jiBfADXzDN5OZTYv4zPLhvNK3/fsTe1NaZiDeRrX@vger.kernel.org, AJvYcCUrtsCU57m4/MytTsibJLQrB9oTpu4rkjs/KhryAjJkXoE8B6YfnEbvwmGdjzUx9ciHnl9faVzuB3VF@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFlB8k3kmBr6Be3uNmJwX4j7aQ+TUde4Yw4ESafOa0R/6Wmfu
	6oNMeg6QaLXwLCNyGCWgSE9UI9I34p4Ml7oZXZKt62ozuV1CsiZ3wtIk
X-Gm-Gg: ASbGnctkDxFFmUG05s6F4ZgGA4cV1qbIQFYhRhxXYjMfqB3DN6Ly9NiZM9EZpnQI0nj
	jJvfAWSPAatfmH/BStqqj6p8nzNx04nsUgPn8xn/SESKt0jc4FFio/f2nigVXAqMc6gtLf9F2XR
	waCnY2benSkTlL4O57y/tiDG8PD8bGtMm8N+oAb91KZFAHf3enA+yoU4BLgWteo1AbILGCPAo2G
	zOZFEpBUjASWBAdK5VDK++Z+gn+RoKXFZf3GrjQzmxckikP+SLmLCWil+N3IrKxr8S+21pCSIg8
	j6kl8az8NOMgNXQxNhGeUaAwpVdCf2lcj4TIKF5EkUENqyObjVspO9pD8SvGLw9LUloMKxkyY2q
	+9D1madXklcMCqutUslDEJvTx2Nrv7M8N9tkKdEl4P3Fcplhp+Tnonqw1cajD+OgGh7PziQQ0bw
	==
X-Google-Smtp-Source: AGHT+IEJajZVuEA4cE0ZQc1vLzdGu8WlIO5cVlAeWwcH7a8FsavIJMhjBmmkw7FQGofDTW6vMx0xEw==
X-Received: by 2002:a05:6000:2312:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b8f4165fb2mr3256844f8f.17.1754510164897;
        Wed, 06 Aug 2025 12:56:04 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:04 -0700 (PDT)
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
Subject: [PATCH v3 3/7] pinctrl: renesas: rzg2l: Unify OEN access by making pin-to-bit mapping configurable
Date: Wed,  6 Aug 2025 20:55:51 +0100
Message-ID: <20250806195555.1372317-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Added blank line after if condition in rzg2l_read_oen() and rzg2l_write_oen()
- Added Reviewed-by tag from Geert.

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 54 +++++++------------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c45ae685fad3..cac7f2814376 100644
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
@@ -1070,7 +1071,10 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	int bit;
 
-	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (!pctrl->data->pin_to_oen_bit)
+		return 0;
+
+	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
 		return 0;
 
@@ -1084,9 +1088,12 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	int bit;
 	u8 val;
 
-	bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
+	if (!pctrl->data->pin_to_oen_bit)
+		return -EINVAL;
+
+	bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
-		return bit;
+		return -EINVAL;
 
 	spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + oen_offset);
@@ -1120,40 +1127,6 @@ static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
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
@@ -3312,6 +3285,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
@@ -3329,6 +3303,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg2l_pin_to_oen_bit,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
@@ -3345,8 +3320,9 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
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
2.50.1


