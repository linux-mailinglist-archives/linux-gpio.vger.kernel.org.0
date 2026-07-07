Return-Path: <linux-gpio+bounces-39618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vF2SDDuNTWoV2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-39618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:35:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237077206D8
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:35:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="QKSa7x/A";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39618-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39618-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45C9C30093AE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1BD370D4C;
	Tue,  7 Jul 2026 23:35:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915AE329C6D
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:35:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467315; cv=none; b=XMKwPOMIN1o8NbleEZYdBqbg+UXtxv+Txay0Q5I/SBEggbE8xphPtZ1hbA87nNdxxTsWOPeWDXAOY6HSO60/rx5CVDnuCQbWIdk9wCoOh1rEWWbIzk0auM6a7zv8Ak3N+5D+USOOYDYhk6cK1KH4AdejhSVbyyodUqM/tmvelMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467315; c=relaxed/simple;
	bh=Pavdvw7DgiuC9KSoPBq66n2Kvvt2h8NeSxeTXW80F7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxrOE1ggiuddz28Bdy6nzTTUIQ8epoLhacc7BT+iKGMItEeka+Hxc5Flj2v+cUD/ypuIcqhvsIZC2nKOviHhNOkr1oJb+2pNsgjZoWpwJjObUVRJ8TLtYFRaiKi0lc+2+EILQDXmcq+Ecag8p7qYdfGfpzbWigvLT7jNa+Kao44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKSa7x/A; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso109511a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783467314; x=1784072114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDZiGedQHuyIuEIUNXbOlRDTK5YTjeexPuI8paFn5vA=;
        b=QKSa7x/A0T16sq6mYdWD2mnklyLJyFpcml8jDUXYQYL7Fm7hMJCid1Epn2bLmkjWI8
         ljLy3HRqjW+MFjVKotMHtD+dCOEFVG8ya21kgzT9Oc10Gh421G2q2TQ26Fp4oWtGXk8w
         PUCXbpnp+vL6KrcR7sTK4Fovt7gIPBD+JprXX3QSG5LsEU+8lHVM1boORmQs+ssEBWiv
         NvnhwqxRxOswBr6WQduE+K68u9PYO9URlZEMWc4u/9NP6qVHm52bAd6X/WYNeva58Vl7
         tYA/4u55c/eBzx/PfFsqVqblH/p3WEnCnkRQvctS5cwuUZUpkjpWjkU6j6qr8EHnZozu
         I23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467314; x=1784072114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDZiGedQHuyIuEIUNXbOlRDTK5YTjeexPuI8paFn5vA=;
        b=KZP6i13AL5o870IZ/2KMm5A1ieW1pF8wGAQUBj0KIjyI10K6NeD/Jp7SP98o2JXycP
         pRkaT0l2njdn5HhfEJrR34BFzZhDkW6P6520RNtTXnqXZK+xfwPGYzP+Q+ozLgj7w1Wz
         qRQkMqY+JfuhAlfpvc3JKBRUKjqGElu+ksat7ORobpNn4RoyUOviCKeJumaT9OashZxx
         8GskOXZWlM1QUrH8Zvz8H/uzVj3tmCnWiVtjnYF9sdRcZySHx8K5aB9ifANUbWZDt8+q
         v4oeDwGfbJZ2tTwaST7fEOCPgED02a6MgJ5YMXwC1+kwYUbFpa/upmyKcnC3HVSgPXxC
         l7/w==
X-Gm-Message-State: AOJu0YzK/L50CVkYvH33OBfY4Uw4xozvolWA+2osk9nzQW/6v5s5PvFW
	coVvsmovbPMxAGnE9wRI91XRl+8Vw46vnCbgS6evXkFEm4oshvCYwgsBWHxGrre2
X-Gm-Gg: AfdE7cmpu8dD32jEsyawJmzez9TNORmXzvZ5ldUYjaqFllDjawBBsWd+S1Z33IJ6CAu
	XUoJBYOWZCSk6FTWEutz+O8BKQrCoBFnYqbqbnCShV1Rsk5t9Hauiv09cYgpV39qBsUzaXX+t72
	JdnRyyRBsSoEuc0FT4CAKyaf3/SsXXf4epk/aM7irMIhRBsRS0mS83wEz6gTxNhLBk7t0kvS1hx
	bYbCzGxza03ZjvhMuwccLRBq3qrVSqz6Glw2HElMMS0Ze/YuKIK4j13MK8kAgZCgCXF7irmnUd7
	2VKmVUGE4RU2sHqanfnQ7wwbeobm4JAd/ZNgZXj3E21bLrp/HgxNScCsZI5ghV/cwNzsNylgBgk
	hD8vzl8LZG8gfywmObO4Ah3Hh9ZRsasbPVXCPKuVPrXD6LtmszWoKp8aqec8fy5DZAQ3HAUg014
	NWc05tEVhxzxno0o/st4KLl0OaaU4ZNaPrzVxy/k4qYrxTSxALUHFOE0PIyQqlTboHkBomKjYHU
	3QHHJ++eg==
X-Received: by 2002:a17:90b:54cd:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38941cc52b4mr15115a91.23.1783467313819;
        Tue, 07 Jul 2026 16:35:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm1854016a91.13.2026.07.07.16.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:35:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent interrupt storm on resume
Date: Tue,  7 Jul 2026 16:35:11 -0700
Message-ID: <20260707233511.1272686-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39618-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 237077206D8

The driver uses the legacy .suspend/.resume callbacks, but sets
IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
interrupts, and only then runs dpm_resume() which invokes the driver's
.resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
mask registers).

This ordering means interrupts are unmasked while the hardware is still
in its reset state, potentially with incorrect polarities, causing
spurious level-triggered interrupts before local IRQs are re-enabled.

Convert the driver from legacy .suspend/.resume callbacks to noirq
callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs()
on resume and after suspend_device_irqs() on suspend, ensuring GPIO
registers are restored before interrupts are unmasked.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a556fdb267a9..1df763e60726 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 	},
 };
 
-static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
+static int mvebu_gpio_suspend(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	int i;
 
 	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1031,9 +1031,9 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int mvebu_gpio_resume(struct platform_device *pdev)
+static int mvebu_gpio_resume(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	int i;
 
 	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1338,13 +1338,16 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops mvebu_gpio_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mvebu_gpio_suspend, mvebu_gpio_resume)
+};
+
 static struct platform_driver mvebu_gpio_driver = {
 	.driver		= {
 		.name		= "mvebu-gpio",
 		.of_match_table = mvebu_gpio_of_match,
+		.pm		= pm_sleep_ptr(&mvebu_gpio_pm_ops),
 	},
 	.probe		= mvebu_gpio_probe,
-	.suspend        = mvebu_gpio_suspend,
-	.resume         = mvebu_gpio_resume,
 };
 builtin_platform_driver(mvebu_gpio_driver);
-- 
2.55.0


