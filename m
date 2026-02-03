Return-Path: <linux-gpio+bounces-31413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MdkJq6Igmn/VwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 00:45:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C482ADFD1E
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 00:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76A5E30382AB
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 23:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BC8331A4C;
	Tue,  3 Feb 2026 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JM12ndgG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6433285C98;
	Tue,  3 Feb 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162339; cv=none; b=A/vcQzV3VZRCafN+MjJSYE/KCYYs6Etini7hQxmnhNIuAUV6MsRWwxN7xj1evO11ZJGtkhiin7uMJOl68eflUYrgKZ1TLnDhlXALtCVeXre0x/XM31cOfb/igh+IPu3iGLo0IcUh489TPU5ku9Zo6bJbjXUYa7+6FTPENpoRCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162339; c=relaxed/simple;
	bh=4pJwgmTHeNUob1x+5xH1sGimYjgMH7/OX3RVq6W/hfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dm73jDZGqwdVjtf8zips5WBYctg3rXEomLxGfWXPKHLKecBEzW1tq80M9Z8xuBf0r2sP6u/SxlIp7mjZ120aQ9/Ih+obzNgytYkR7iB+XQ2hktZ14QKZg58kTvi/yu2DEPVSFWchCMFrHYoktfwEslUM75vAm5ob0xWQsLtcedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JM12ndgG; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 71D6EC004982;
	Tue,  3 Feb 2026 15:45:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 71D6EC004982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770162331;
	bh=4pJwgmTHeNUob1x+5xH1sGimYjgMH7/OX3RVq6W/hfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JM12ndgGexr+3M5aO51+dwWt0F7DNos9e8b5u0f2E7Ftiw+ELvxvjeo46s8wzXjC+
	 l6ye80szIoKm31ss3LuCQlDzJ7u0PduljHBuQrPSl1HPqCrjWQ+PjlzokPl2Srtg7l
	 Y9vgIV1/+mgyfFzmZy48xnuYjVGDw3XUu/Owiczk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1C6B917DFF;
	Tue,  3 Feb 2026 15:45:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v4 3/3] gpio: brcmstb: allow parent_irq to wake
Date: Tue,  3 Feb 2026 15:45:29 -0800
Message-ID: <20260203234529.1081148-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31413-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C482ADFD1E
X-Rspamd-Action: no action

From: Doug Berger <opendmb@gmail.com>

The classic parent_wake_irq can only occur after the system has
been placed into a hardware managed power management state. This
prevents its use for waking from software managed suspend states
like s2idle.

By allowing the parent_irq to be enabled for wake enabled GPIO
during suspend, these GPIO can now be used to wake from these
states. The 'suspended' boolean is introduced to support wake
event accounting.

Signed-off-by: Doug Berger <opendmb@gmail.com>
[florian: port changes after generic gpio chip conversion]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 85 +++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index fff8e4100295..d90e692b54a4 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -54,6 +54,7 @@ struct brcmstb_gpio_priv {
 	int parent_irq;
 	int num_gpios;
 	int parent_wake_irq;
+	bool suspended;
 };
 
 #define MAX_GPIO_PER_BANK       32
@@ -240,6 +241,9 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 {
 	int ret = 0;
 
+	if (priv->parent_wake_irq == priv->parent_irq)
+		return ret;
+
 	if (enable)
 		ret = enable_irq_wake(priv->parent_wake_irq);
 	else
@@ -290,6 +294,11 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
 		unsigned int offset;
 
+		if (priv->suspended && bank->wake_active & status) {
+			priv->suspended = false;
+			pm_wakeup_event(&priv->pdev->dev, 0);
+		}
+
 		for_each_set_bit(offset, &status, 32) {
 			if (offset >= bank->width)
 				dev_warn(&priv->pdev->dev,
@@ -463,18 +472,18 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	}
 
 	if (of_property_read_bool(np, "wakeup-source")) {
+		/*
+		 * Set wakeup capability so we can process boot-time
+		 * "wakeups" (e.g., from S5 cold boot).
+		 */
+		device_set_wakeup_capable(dev, true);
+		device_wakeup_enable(dev);
 		priv->parent_wake_irq = platform_get_irq(pdev, 1);
 		if (priv->parent_wake_irq < 0) {
-			priv->parent_wake_irq = 0;
+			priv->parent_wake_irq = priv->parent_irq;
 			dev_warn(dev,
 				"Couldn't get wake IRQ - GPIOs will not be able to wake from sleep");
 		} else {
-			/*
-			 * Set wakeup capability so we can process boot-time
-			 * "wakeups" (e.g., from S5 cold boot)
-			 */
-			device_set_wakeup_capable(dev, true);
-			device_wakeup_enable(dev);
 			err = devm_request_irq(dev, priv->parent_wake_irq,
 					       brcmstb_gpio_wake_irq_handler,
 					       IRQF_SHARED,
@@ -485,6 +494,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 				goto out_free_domain;
 			}
 		}
+		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
 	}
 
 	priv->irq_chip.name = dev_name(dev);
@@ -495,9 +505,6 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
 
-	if (priv->parent_wake_irq)
-		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
-
 	irq_set_chained_handler_and_data(priv->parent_irq,
 					 brcmstb_gpio_irq_handler, priv);
 	irq_set_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
@@ -520,16 +527,11 @@ static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
 					priv->reg_base + GIO_BANK_OFF(bank->id, i));
 }
 
-static void brcmstb_gpio_quiesce(struct device *dev, bool save)
+static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool save)
 {
-	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
 	u32 imask;
 
-	/* disable non-wake interrupt */
-	if (priv->parent_irq >= 0)
-		disable_irq(priv->parent_irq);
-
 	list_for_each_entry(bank, &priv->bank_list, node) {
 		if (save)
 			brcmstb_gpio_bank_save(priv, bank);
@@ -547,8 +549,13 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 
 static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 {
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	if (priv->parent_irq > 0)
+		disable_irq(priv->parent_irq);
+
 	/* Enable GPIO for S5 cold boot */
-	brcmstb_gpio_quiesce(&pdev->dev, false);
+	brcmstb_gpio_quiesce(priv, false);
 }
 
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
@@ -564,7 +571,30 @@ static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 
 static int brcmstb_gpio_suspend(struct device *dev)
 {
-	brcmstb_gpio_quiesce(dev, true);
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->parent_irq > 0)
+		priv->suspended = true;
+
+	return 0;
+}
+
+static int brcmstb_gpio_suspend_noirq(struct device *dev)
+{
+	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
+
+	/* Catch any wakeup sources occurring between suspend and noirq */
+	if (!priv->suspended)
+		return -EBUSY;
+
+	if (priv->parent_irq > 0)
+		disable_irq(priv->parent_irq);
+
+	brcmstb_gpio_quiesce(priv, true);
+
+	if (priv->parent_wake_irq)
+		enable_irq(priv->parent_irq);
+
 	return 0;
 }
 
@@ -572,25 +602,24 @@ static int brcmstb_gpio_resume(struct device *dev)
 {
 	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
-	bool need_wakeup_event = false;
 
-	list_for_each_entry(bank, &priv->bank_list, node) {
-		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
-		brcmstb_gpio_bank_restore(priv, bank);
-	}
+	if (priv->parent_wake_irq)
+		disable_irq(priv->parent_irq);
 
-	if (priv->parent_wake_irq && need_wakeup_event)
-		pm_wakeup_event(dev, 0);
+	priv->suspended = false;
+
+	list_for_each_entry(bank, &priv->bank_list, node)
+		brcmstb_gpio_bank_restore(priv, bank);
 
-	/* enable non-wake interrupt */
-	if (priv->parent_irq >= 0)
+	if (priv->parent_irq > 0)
 		enable_irq(priv->parent_irq);
 
 	return 0;
 }
 
 static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
-	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.suspend = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
 	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
 };
 
-- 
2.43.0


