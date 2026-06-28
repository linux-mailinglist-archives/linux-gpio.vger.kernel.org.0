Return-Path: <linux-gpio+bounces-39081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fJx3EVeoQWq2tAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 01:03:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9A6D539B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 01:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IMWgbM9D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39081-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39081-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52A2D301CA64
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 23:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190F3374195;
	Sun, 28 Jun 2026 23:02:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAD3559F8
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2026 23:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687727; cv=none; b=SrUL2FkhrhgR/72rcISpB7vJocK9f98B4Feh4KgbgNZE/6U9jsI5G80fYG8ao6lnFHkQyWgK+8ZDuYZMgsiGoI9akFUZA2fzopHsGsxynle0MRnsG8UfYxNPwvpfaHi6FREjt+pd7yPsHRcBTaSqsWwke/1Ugj3x8MdHBAWYGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687727; c=relaxed/simple;
	bh=CNHUAK/S24oDKcBpryQESBqdNmm6Qn/xKxs0WrC9iSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qev23YF8DdKJ/irTVyjDNN3OhXgYhdbc2scf+T3ROdI6rBdouDU13INOjvpanjz0Eq3QTVk7W5X/lwsSB+wWKdDhsLfcO7APjMiRsYyvxTylaxT2R0SB0QfMUEtJSMUhIUrOJ+vf87A9tM8OwAvzYzsKgmzlqryazpGNKpjUO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMWgbM9D; arc=none smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13809223fd4so3218409c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2026 16:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687724; x=1783292524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMZ10IYFKNLnYKr+gx1rVCyYcTm3FWyqJhOk5IPgR8w=;
        b=IMWgbM9D92XEq7+Dx6g4tATkmly/LJiEElhHkb4X1CERuG+1Gs7V48pKBtWmtzaCRs
         UYIo7HuuiqnSR3MnG8SLqUxzN7ruon7+qMmLGmPHkSdZFdjqw73ton4VswwMdnGApeOp
         vAQUDcjYLM2FyePggCZ7yj76CMTjh77iz/KQnWx10zDAXwVHoWFmFrusZV7uxIxUqRbB
         9Zmw02wIhdzuBBKSMcqY7VrHwyjzV9wP5Br6pxEJf/BtrkDO00q3JDmWV622ZiRZ6WqI
         9efHmhxloaE0BTIqZg975XLUjsrHaNnMa+x2DvKHfQMglaah8xSD7fJ4gh4+ry4TeCz8
         BBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687724; x=1783292524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMZ10IYFKNLnYKr+gx1rVCyYcTm3FWyqJhOk5IPgR8w=;
        b=K2ObhmhSoL+InlRq3j0ijWfvOD9QmNpO3E1j5aaBCeQXv395QnP+H8U9hDI3w/MCeA
         1QMbm1XCeaoGtBzp/sSFR0PI4xZC46QbiFJSmyIE/n4r1pk+iUCX72qhxaB4AHQzb8VD
         GNLYR2rWn2m8pn1TYl/O6yZvKSMofTpEqwWfk065TDDvN2nHUZONkJF3SvqtE+f81pFh
         1RGBHMqr3h47DJAbEjVL1jOSnxAM0VtXIRss8zJyqXqQPsKm0VIb5demWEezfXplYgSO
         giVrFjewPQzndH8sMh1ihYsAKDk5gJKj8TM5AH76uWf9N3TlsI2qI77J4Dk55Gb70252
         2kFg==
X-Gm-Message-State: AOJu0Yylz2nCXyGxgsJOFr7KYxAYCkPAKSS72vTG78CsmuAbXg3ISqqQ
	sEgooqEEvxB/vsS/wZ9Iy7rLFy39WEnfMZbLGX4HBibSfjZxwMsm2a/vkRYaUA==
X-Gm-Gg: AfdE7cnPYCTTMzbCyJheBJ8PotkdS7kP5+GdQ5T0dhbvMPs+Dl9dC9jjCqVsQI4OJ0+
	NtFtglLHwaxTH221mrKnwqrzJWKsPYXo/oOirYlZ6RBhjSkO/rCtvpLUv4Air/UIV1Dri7zigtf
	/kiMCwxMhyFKFW8cUq9m5YZ19dWgKhMbNzvRHFQt6yr7AAUaXNMswYP+sqY9eaCQwQHEZU4cweP
	47WaCjE4eGY+4DCd6cZuTQGFmGTfmeqSq7FO6sB8TeyIVhSwcKYzyTWJFp86ZoMG76vIKrDxh6w
	raQ4jBn4N7okYU+c585hzFXGjbxAQ8BxdFHRUJS+d5fOH/m6JcRNtptBa3P36ujc2feyDWGHnuI
	UVHLwr7MrfhQzt576YNyozJM8zaV+lZh4g7P34BFVtshcoyHPo4BsSTJ7TjOMM1RdDW+3Ep/70Q
	UB3L+XJcqqy3j9WN+W37m1cI4N2/0bY009SfMC/dywf4XvJKYlzYbjw+djsQKILlOUHsyUCSwQN
	1keakTkIg==
X-Received: by 2002:a05:7022:e0e:b0:139:c724:79e5 with SMTP id a92af1059eb24-139dbac7a8cmr11480937c88.35.1782687724240;
        Sun, 28 Jun 2026 16:02:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41365965c88.3.2026.06.28.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:02:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: add wake-up interrupt support
Date: Sun, 28 Jun 2026 16:02:02 -0700
Message-ID: <20260628230202.1209991-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39081-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96E9A6D539B

Implement wake IRQ support for the mvebu GPIO controller:

- Replace unused irqbase field with bank_irq[4] to store per-bank
  IRQ numbers for use in the wake-up callback.
- Add mvebu_gpio_set_wake_irq() that forwards enable_irq_wake /
  disable_irq_wake to the correct parent IRQ based on hwirq.
- Set IRQCHIP_SET_TYPE_MASKED and IRQCHIP_MASK_ON_SUSPEND flags
  on both level and edge chip types.
- Set IRQ_GC_INIT_NESTED_LOCK for the nested irq domain.
- Add missing <linux/interrupt.h> include.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 40 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c030d1f00abc..26092b223be5 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -37,6 +37,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
@@ -114,7 +115,7 @@ struct mvebu_gpio_chip {
 	struct regmap     *regs;
 	u32		   offset;
 	struct regmap     *percpu_regs;
-	int		   irqbase;
+	int		   bank_irq[4];
 	struct irq_domain *domain;
 	int		   soc_variant;
 
@@ -603,6 +604,34 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.val_bits = 32,
 };
 
+/*
+ * Forward wake-up configuration to the parent bank IRQ.
+ * @d:		interrupt data
+ * @enable:	enable as wake-up if non-zero
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int mvebu_gpio_set_wake_irq(struct irq_data *d, unsigned int enable)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct mvebu_gpio_chip *mvchip = gc->private;
+	int bank;
+	int irq;
+
+	bank = d->hwirq / 8;
+	if (bank >= ARRAY_SIZE(mvchip->bank_irq))
+		return -EINVAL;
+
+	irq = mvchip->bank_irq[bank];
+	if (irq <= 0)
+		return -EINVAL;
+
+	if (enable)
+		return enable_irq_wake(irq);
+
+	return disable_irq_wake(irq);
+}
+
 /*
  * Functions implementing the pwm_chip methods
  */
@@ -1249,7 +1278,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 
 	err = irq_alloc_domain_generic_chips(
 	    mvchip->domain, ngpios, 2, np->name, handle_level_irq,
-	    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, 0);
+	    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, IRQ_GC_INIT_NESTED_LOCK);
 	if (err) {
 		dev_err(&pdev->dev, "couldn't allocate irq chips %s (DT).\n",
 			mvchip->chip.label);
@@ -1267,6 +1296,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
 	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
+	ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
+	ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 	ct->chip.name = mvchip->chip.label;
 
 	ct = &gc->chip_types[1];
@@ -1275,6 +1306,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
 	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
+	ct->chip.irq_set_wake = mvebu_gpio_set_wake_irq;
+	ct->chip.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 	ct->handler = handle_edge_irq;
 	ct->chip.name = mvchip->chip.label;
 
@@ -1283,13 +1316,14 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	 * interrupt handlers, with each handler dealing with 8 GPIO
 	 * pins.
 	 */
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < ARRAY_SIZE(mvchip->bank_irq); i++) {
 		int irq = platform_get_irq_optional(pdev, i);
 
 		if (irq < 0)
 			continue;
 		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
 						 mvchip);
+		mvchip->bank_irq[i] = irq;
 	}
 
 	return 0;
-- 
2.54.0


