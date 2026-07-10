Return-Path: <linux-gpio+bounces-39793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n0UqOCGaUGo62QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:07:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D8737F01
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:07:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SJxbpesy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39793-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39793-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2CF9300E2A7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 07:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AFC3C09F5;
	Fri, 10 Jul 2026 07:07:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A518CC13
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 07:07:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667230; cv=none; b=sCpQO7z8KkxI6MA8eK6FA6xLfo8rQ/sBGUnAQH5QOxk7r7JqeMa4PzF1ycGWD86p1qmKGnnkkPOQySb2tLaeBJt7XqAWBtRwpyyJwwUYC9GNN2qW3VJdyeVY2qgMudTIr+pEuF+bNN6LIcS643KKKs4gEn9hqUop4MHWaCuo4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667230; c=relaxed/simple;
	bh=856VlPdlo0R5H6XFteDS96sDESf4W2Df33LF9O+bv2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6Y1E+A6Y5jQ981qhVoVOmwv4BsHR4kxxf8NkDZJVHj9dPZ9AdDt4KxhSGrN56HFIVV9cJxK7yBzov6jqUOFmuKR6tgjbkSAnexJ2YK1G5D+xT45fYFidDMfeRQ1tCHVVqWgn3I3V3Ix/FSZZX8zpgFqtj7CEO6ZH30sAQD+nTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJxbpesy; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caced6038eso7296945ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783667228; x=1784272028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m6CClmukwbl8vhEJkbOCeJ5A8VCM33r5xa4dNvLfks=;
        b=SJxbpesyOP3v6zcLhxZUUs137N5T5giREHBT8uINGKmtjtpcyfqYzSw8FiwqZMdGJo
         twsYHU8d5s6OobIzyPyA5psogpzE11ZFUrnf8hdhnD+QKCcqYAgxx4t6RhIIXAJIXALQ
         TfwLRh4qddO6xzPBb76QqUnyHTrfN8cApKd43v44ojHUU0zTqqnLWtg2Y1uq3sfq29os
         PzbsBgJyAnRmagkHmp69QbiVhIk3Br+okqt3Sn8dEWiuaRTWfN9WRUDItIUghM6joZG2
         xLmUYyYSGyz9ktPodEthIrGlwGAl3sCB+4VaVB0FsiKPGirICsu8AQyH0yQwoVopt9sr
         KLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783667228; x=1784272028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m6CClmukwbl8vhEJkbOCeJ5A8VCM33r5xa4dNvLfks=;
        b=FSIV/2Mx6vpY4miRGYE/ZcrGWPookJu81cKBp0EDkNMKCFs7kIuer0mcANhtN6dqaH
         cyuLHHIyEoQ55tqzERcVMPZRCcgEt0iBhll7LdmHpxYMD5+mHgngJtoNZzOG7ySAq9Lg
         1hp4qYTYAWiX/mTdeLBYyXdzR4cZokIA2Wm1Wd6XD/ZEXIc8NJ0tpPhxghw6xJpLe4r5
         fb2aLhBLs8AggirlmG5ZD8KJOlpIJYdNRFr6vTGn8liHAB5QoSD5xFXeBDhTI7H4SzJO
         2gZwYrhEycEzyZAo56Deq6caBiXB21+81oCeTUIdfZ1sDYxDaQ9wBLrnn7hHJaVbmRUK
         PhBA==
X-Gm-Message-State: AOJu0YwzUTkH2J8C6ozqEu7Yr1ydFxkR1Xwc3hGkVKHQ1qZ2TMI0R2oG
	D4bcsxbhg0KMiybsK+scPzsKEKZs4AWIKby8+ce5kqD4whPWo+d098sI7C+eLg==
X-Gm-Gg: AfdE7ckheI1IF1Cw/qu78FtcNuwkhHwsHAy08Tr5oyF12EX0OSLRRm9Cm8Vfj7tfR+S
	PDbuJTT1HI0467yw2Rr0yTTQsvfOziasHaKP3IPg76a8OzZ9+CRXy6tTIJgqT2rmDr/HbPQfJiq
	7+NmTdb3zpoFQOBhOeda2Sx+e9gHBkMW+8LQnyfvE1CRAhULdNsfG2gDYATULHLPt3PyFJwCzaF
	lvSdziUlPLXjwofPjJVeHK0D1TTEohthns8+teZrBoClkF7tTpyHepJUktYX/i15GXubBuVSE6S
	vkXIGngFF2TNDLBc9Z3MEjiup0gwEDDHrozpigVx8AzoWNf77PykTiIRJMTICeXLZomfjsOu16I
	QkKaV9k3+RQqfIewOkNx4tboWwtudbrs04QXIh9HCsc9deeCoySHN/0fCYYa+EOLjYI2T6tJazj
	lNJVFo54QZzp6ObWnXn7wBuOAge8CtWN8R3d4P+/oNXLeCxKqkcgBtl41BO2EwsQMUsI4/ouXQq
	Dc09Dvr7eCzf91rLXKmFeTE5xEIulQfT7aP0h7qIMBgbRRvmv694t+ClVXukM9N6w==
X-Received: by 2002:a17:903:ac8:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2ce8285a7fdmr23112945ad.4.1783667227695;
        Fri, 10 Jul 2026 00:07:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm55169695ad.31.2026.07.10.00.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:07:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent interrupt storm on resume
Date: Fri, 10 Jul 2026 00:07:04 -0700
Message-ID: <20260710070704.60680-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39793-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 642D8737F01

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
 v2: add __maybe_unused to fix compilation
 drivers/gpio/gpio-mvebu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 7094ab34020c..bd31acf779e6 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 	},
 };
 
-static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
+static __maybe_unused int mvebu_gpio_suspend(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	int i;
 
 	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1031,9 +1031,9 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int mvebu_gpio_resume(struct platform_device *pdev)
+static __maybe_unused int mvebu_gpio_resume(struct device *dev)
 {
-	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct mvebu_gpio_chip *mvchip = dev_get_drvdata(dev);
 	int i;
 
 	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1339,13 +1339,16 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
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


