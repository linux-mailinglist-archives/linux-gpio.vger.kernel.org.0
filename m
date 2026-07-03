Return-Path: <linux-gpio+bounces-39382-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hkepEd9GR2raVAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39382-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 07:21:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862B6FEA7A
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 07:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kemnade.info header.s=20220719 header.b="f/c/x27a";
	dmarc=pass (policy=none) header.from=kemnade.info;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39382-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39382-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99CA3017264
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 05:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC7B3546F5;
	Fri,  3 Jul 2026 05:21:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493B329C6B;
	Fri,  3 Jul 2026 05:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056088; cv=none; b=G4K0yxIaMi/U4ZmycbD/LUMxn+1igdmZFZFF+b6KO8V11+XE9kNOvg9vUNVIV4xI3JbBp0O0wD1V0dtiz0+xtLohUjF9ctr/O/K9EnNLusOiMOWe1LMTqBZDqXf/sLGfnSo9Ln9GA4LFR4JKKfaX/mF4pkRHsyLJKUiop4yDYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056088; c=relaxed/simple;
	bh=s/1N+kpmK5axVCvpGkrT6GRdB9Pee1UkY42RPvDFwps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=izPkaLZgvIKFdEf5+E+YP85UPhG+C5zVG/d/psPa3FeCAAOqO0lYi6si3a1joq78wlomFweWmRG+ZUHCqP6M6H4f6NKMLCJ8XdtVCPBEKOxMB1uv0ADOBQokS+h2wfN3VCwOlPmjxPHd8Q/k5J9cpBIx+yCM7esiiG5mW2sjlPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=f/c/x27a; arc=none smtp.client-ip=178.238.236.174
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zpuaP5vY9FQFOXs73vk+7vxYfwfou5t1jHctHNaYXO4=; t=1783056084; x=1784265684; 
	b=f/c/x27adI4OdZBw9VNr6822Z5mtjLUZPX5aqmve60jBDN3fKrHC2LqLaeyBfkL/gqsKMI326BX
	d2JKWuAVnF+PInN1aWd9H/qXNRPxLIoRK8b2hppP10P9SmJjyI+yZScb+i/PXOSeZTJzzW6PktAw3
	8h9ZJ0U2PLsGxOEYrdurSF5kuWx+dSwKoeZXW29mSbBxxgNaJRh5R4Flk7/7BeK8mQA0adedz9zc7
	iuCvnO88KMULDIOPORcddzehkJ/N4GQRnmhHTBhA4D21cLI4YUrZHDxo2x0nZb1FSj7egGu7tj5Kd
	l2ELBbHKb7ifd2OhZuroZfoQJw6ZvRU/llwg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 03 Jul 2026 07:21:05 +0200
Subject: [PATCH] gpios: palmas: add get_direction op
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info>
X-B4-Tracking: v=1; b=H4sIAMBGR2oC/yWMQQqDMBAAvyJ7bmBjpFK/Ij0kZtUtbZSsLYL4d
 1d7HJiZDYQyk0BTbJDpx8JTUrC3ArrRp4EMR2Uosbxjjc7M/v3xYgZaImfqFvXNw1YUY+8wIIK
 Wc6ae1+vaPv8s3/BS+1zBvh9DNE5KdwAAAA==
X-Change-ID: 20260703-palmas-getdirection-914eddf30b00
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=s/1N+kpmK5axVCvpGkrT6GRdB9Pee1UkY42RPvDFwps=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFnubme2yR1qrOB8ba8yoaLrm72mnOhSH/63us9S43X3K
 0ovjZvcUcrCIMbFICumyPLLWsHtk8qz3OCpEfYwc1iZQIYwcHEKwER8VjP8L9CWPvf6yQMp8+gm
 l7cul/qm5ZTV/151LetP7+SdC/9FlDIyrHc5x725tzT5ZMgH9ePLbRR5ErbvfbCocsUyzSUJvst
 XsAEA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:andreas@kemnade.info,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andreas@kemnade.info,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39382-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kemnade.info:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8862B6FEA7A

Accessing debug/gpio is quite noisy without a get_direction()
implementation.  To calm that down add an implementation.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpio/gpio-palmas.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e377f6dd4ccf..e64ee0487718 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -116,6 +116,24 @@ static int palmas_gpio_input(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static int palmas_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct palmas_gpio *pg = gpiochip_get_data(gc);
+	struct palmas *palmas = pg->palmas;
+	unsigned int val;
+	unsigned int reg;
+	int ret;
+	int gpio16 = (offset/8);
+
+	offset %= 8;
+	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
+	ret = palmas_read(palmas, PALMAS_GPIO_BASE, reg, &val);
+	if (ret)
+		return ret;
+
+	return (val & BIT(offset)) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int palmas_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
@@ -165,6 +183,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.can_sleep = true;
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
+	palmas_gpio->gpio_chip.get_direction = palmas_gpio_get_direction;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
 	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260703-palmas-getdirection-914eddf30b00

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


