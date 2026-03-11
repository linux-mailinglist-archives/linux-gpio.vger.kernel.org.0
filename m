Return-Path: <linux-gpio+bounces-33145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO85Bdt8sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:31:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF026565E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86426301981C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99141346A0C;
	Wed, 11 Mar 2026 14:31:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872A4A33;
	Wed, 11 Mar 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239510; cv=none; b=ie6BeHhbLnRePFLwoToQh9t8gyumiAYOrpgWYRbF9DdK+P1RomxGJ9Z6kMpkkISY02iCvY/ChH3YfyTKdMU8FIXVJdZ0JQJR2UHrbhQF8DlsfG+l36aB+W/k1uyXYg0t1PFKWGuaKWn056g4jkJ0mw2nVAoeMSXJmaUhLalrdb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239510; c=relaxed/simple;
	bh=IXCHHr0AVw+UM6yYDHyR16+zS9h0vhrU0De7rfhXb8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxyzsqu/hTavONjo3JjGkxsWPsy9lJCO0vNmyZMlxJxyts9Pablrx3QMr0qTr9FZnlBwXH6vq7LnKKqhToJYJNZ2ObX3VlpRf8lTjptOhEV2NUWXBc1eTzXfeml9Qa1F6xu4NFZJDyEhTLlWiqS/5+0r7YIqbmdyGT1KZAe0hM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0FBAC2003DA;
	Wed, 11 Mar 2026 15:31:38 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 2/4] gpio: kempld: Add support for PLD version >= 2.8
Date: Wed, 11 Mar 2026 15:31:18 +0100
Message-Id: <20260311143120.2179347-3-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33145-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dlh.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lht.dlh.de:mid]
X-Rspamd-Queue-Id: 9BBF026565E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting with version 2.8 there is a dedicated register to configure
the output level. Read the PLD version in the probe and select the
correct register to use for the set operations.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/gpio/gpio-kempld.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 532e4000879ab..2263de77d40e9 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -25,6 +25,7 @@
 struct kempld_gpio_data {
 	struct gpio_chip		chip;
 	struct kempld_device_data	*pld;
+	u8				out_lvl_reg;
 };
 
 /*
@@ -71,7 +72,7 @@ static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL, offset, value);
+	kempld_gpio_bitop(pld, gpio->out_lvl_reg, offset, value);
 	kempld_release_mutex(pld);
 
 	return 0;
@@ -96,7 +97,7 @@ static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	struct kempld_device_data *pld = gpio->pld;
 
 	kempld_get_mutex(pld);
-	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL, offset, value);
+	kempld_gpio_bitop(pld, gpio->out_lvl_reg, offset, value);
 	kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR, offset, 1);
 	kempld_release_mutex(pld);
 
@@ -153,6 +154,15 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	if (!gpio)
 		return -ENOMEM;
 
+	/* Starting with version 2.8 there is a dedicated register for the
+	 * output state, earlier versions share the register used to read
+	 * the line level.
+	 */
+	if (pld->info.spec_major > 2 || pld->info.spec_minor >= 8)
+		gpio->out_lvl_reg = KEMPLD_GPIO_OUT_LVL;
+	else
+		gpio->out_lvl_reg = KEMPLD_GPIO_LVL;
+
 	gpio->pld = pld;
 
 	platform_set_drvdata(pdev, gpio);
-- 
2.39.5


