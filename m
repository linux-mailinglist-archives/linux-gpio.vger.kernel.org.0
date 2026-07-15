Return-Path: <linux-gpio+bounces-40121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pY3lGT5/V2p3TQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:38:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5A75E3C5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:38:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DC0hei1N;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40121-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40121-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 191353051152
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EB6477E20;
	Wed, 15 Jul 2026 12:29:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399AB477999
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118588; cv=none; b=acs3qQXUqWqt5CjxEqVW/f06URdKkkl6BUzIauDbKn1n7sbIH703mlHnJ0TGlMsQj4UxBEeTmlVIGc+sfa2CHfDZHdMeB6K+tDdyLLiBmJhiIzPG3+bMEYo3PYEljuYvV3AalUkUQLkszFNnbFN6Bf312WfXn23qctOtcCgVsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118588; c=relaxed/simple;
	bh=RPnGMYwpuu4Q9PjKZXlMk8TL7x4tqKXbmEB39sWYnXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X8SN7oUaAcmK7dVSYGgoHNyvdRYkC5W0+XL/9S7FtwHrJMUetX/CNyc8U5dsx4hHCaG222+TI9g6P/fXzPjolvurJz8WaqCo0eQJwrcI+mZ8g91U3epO17f9iIFxLCvbboUt22Xiz0UjYcbdhXhJXfgSlNOtGzIIosvquCz1398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC0hei1N; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3448329f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118584; x=1784723384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xg6K9BOVyTm0sW/3T39sG2O2ploAdMhQq+0sGRnM+RE=;
        b=DC0hei1N/Q/5G1HVgokD5cVUaDDnRvyaWAyTOXbBAigTkQBbVuULiTog2pTH1twZgg
         6SR2IEo6g7GuwRsgSpwxEdCpTPdRkm7oQA5mKBUgmcgzocaouVNjuo53hAxyR4D7OHtP
         rTYrzgkwphABpml9yEWohY3+Q6wa6RsOCd35z70saxBxlnrL8OkrtDku65s9CxqvdPWC
         lWVub9j0mwA85rZ88SWbF2bWtSAGV8bSvxBZ7ireeKD2GGzsqADMEqy7+M5SfDyZYTqS
         jI8t+WSobzCRNRwBd/NxCQJTAoC9liimy//Th+oQvbEeba60lR8J56iqzZ9wXuy0wkQf
         7xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118584; x=1784723384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xg6K9BOVyTm0sW/3T39sG2O2ploAdMhQq+0sGRnM+RE=;
        b=FwoBZD/igWIhenRR9rkWpmsuaSnuRLrCzjxaxLFEqnybApmKKPhHx1O8RFWW/Toh2t
         HR2KcYVt5bjY8Dqb54QmuIzQGcWTYACAvVfi5qjOCpVB/jooQjMTLDuNk+UhqwaycSFx
         j/BLmJhsBGrRgO7tGCI1jhN8QngXu7NBXYhiHCXof/XJJemQ1dHbR04Rc7LDZzEQHRSM
         30WQ/WUKuaBW5hLtb3vH1V3UlrEx3m/z8GR3encuQ9K95twsfbBI9gAcYOZJgl1fuXON
         etj7Buz0aSPeK1YJNBfVjZWYrckhSakaM73p/Ke6ZWsoLNr9O+turtpcBBQg1kN4A5/Q
         G7Jg==
X-Forwarded-Encrypted: i=1; AHgh+RoFbqqZ1cIHZKNjEbhcGeckLxSyMb8AdfdFl77mIY/YoCpBusc8hup3iCW27MMOK22lC6E0dgGkgyZV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6lVP/RdpPOX9IhLn0NTKaddqjmlcOJWfSi1uWJTA/YGQ3d96
	c8Py8Pvx6DHURjdlXd5FqOsn5yK3RMm4vTNqe0i1H1rmX4jJe3rlMgiG
X-Gm-Gg: AfdE7cn+FCVia2rIggFxth6QMZo/TWBZLPJYBfSrJLXBibtpXVW8iKAlOKW75LaPhxC
	VPdmL36SqEvqAu9mmGrFwvNHqvgQuA5q4GfnXt/zFxUMMY4g4jqi2uoK4ZDZfn7489afURTDa1P
	EqDBjtUM3Ucff/dOYv4JYYG26Z9ZpHiaea8lIx7oK0WG0cq1mNC5Z7UNkFKv1migmFdyZuRXH/9
	S4OSvL4+Cazrga95RdgfFMOGIiWASvTGt1/xFG5l5r2roTjfFUUYXNyRzZBOHYIudkmchNMPUNM
	Md75oa6mQSxIiHtKNYMFj+JlQ0f0KBqFE63vSR0m1cCGkb2mm3/FfLMc0I+LCEOWn36EpedDP8Q
	+GeAxlW7to0FsC9ZdvZonozHwafG6JzP7DbEa4/gTAJGcpOIW0J+mdd5Bp7ByVw5XvhGSuh0GU0
	apl3OL1kZQpmWtD/qK/uBA3Tb8+zewESnUSA==
X-Received: by 2002:a05:600c:3487:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4953c144adamr29207275e9.4.1784118584084;
        Wed, 15 Jul 2026 05:29:44 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:43 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 6/8] pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
Date: Wed, 15 Jul 2026 15:29:21 +0300
Message-Id: <20260715122923.1938327-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40121-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4B5A75E3C5
X-Rspamd-Action: no action

npcmgpio_irq_startup() calls pinctrl_gpio_direction_input(), which may
sleep while taking the pinctrl core mutex. That makes IRQ startup trip
lockdep when CONFIG_PROVE_LOCKING is enabled.

Move the direction change into irq_request_resources() and keep startup
limited to the ack and unmask operations that are safe in atomic
context.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 29 ++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 1c95d7cbd..e21ccdb5d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -297,17 +297,33 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 
 static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = irqd_to_hwirq(d);
-
-	/* active-high, input, clear interrupt, enable interrupt */
-	npcmgpio_direction_input(gc, gpio);
 	npcmgpio_irq_ack(d);
 	npcmgpio_irq_unmask(d);
 
 	return 0;
 }
 
+static int npcmgpio_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = irqd_to_hwirq(d);
+	int ret;
+
+	ret = npcmgpio_direction_input(gc, gpio);
+	if (ret)
+		return ret;
+
+	return gpiochip_reqres_irq(gc, gpio);
+}
+
+static void npcmgpio_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = irqd_to_hwirq(d);
+
+	gpiochip_relres_irq(gc, gpio);
+}
+
 static struct irq_chip npcmgpio_irqchip = {
 	.name = "NPCM8XX-GPIO-IRQ",
 	.irq_ack = npcmgpio_irq_ack,
@@ -315,8 +331,9 @@ static struct irq_chip npcmgpio_irqchip = {
 	.irq_mask = npcmgpio_irq_mask,
 	.irq_set_type = npcmgpio_set_irq_type,
 	.irq_startup = npcmgpio_irq_startup,
+	.irq_request_resources = npcmgpio_irq_request_resources,
+	.irq_release_resources = npcmgpio_irq_release_resources,
 	.flags =  IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static const int gpi36_pins[] = { 36 };
-- 
2.34.1


