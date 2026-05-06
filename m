Return-Path: <linux-gpio+bounces-36284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Car9D/w1+2nTXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBA4DA49E
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F6F4300D762
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A613453495;
	Wed,  6 May 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="engmf561"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6044CF39
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071024; cv=none; b=Hy9FTumJFuogjVVqrRe7rVeDrVs65OxgIyu2pc3JODYzIf8V7AmSBV4LHfJXAGJpgpQLFWYplaxM9U7LyLULxifZ5cStJPzIruoUbHPxcUdOElDcMqQYMeVr1xu2OK+6tdRKh/I4IKFSG44JzvdMuM+X31gFLFhJqxWyxZl1IWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071024; c=relaxed/simple;
	bh=v/NK4ob2BdQrRgRECswCj/ZvHO8mcxQCL6EyTUOg2XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxBJ03ZXsTEAWX641NIOWroiX8Je0v/r4KyGfN9yUT84jNcY4enfxf7X3gVoPOXq47hoDVkMA32OSBOJpzbJd25qe4Z8KUio6clLaDJc6y2VLNrL62s3tHGah+IrZQtgaHuVsRMVN0WgR06GtJ55lODaQ6XPClOfJ/xA0m5b7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=engmf561; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso48000855e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071018; x=1778675818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmPjvjob3FbjNKESIZvrg3JwdYT3+owCLHCZhOf9FAE=;
        b=engmf561V+xtEFyjJdib7qGpkxbU57rxXX16u2gOE+u29xoDh9xDQ6jzwdnwm6rkVZ
         TzJOPlclWgrgJbYybU/Rs1qx7OIfAs0vmwvmGVQ/CRhU5oBMqSN1yhw4k4Z3KN8nj+ow
         86Pt3k54mdILmIF3XDXxv3yRxzw0/8Bk+TdhfjUbFMZz/vxqrfv/8ost32XP0VK7WTOm
         wJsko8LF9x35YUidrhUAMVL5IvIzloWm71bfcjVLD+Z6baRYc5i36DJjtzhe0BvO8uSJ
         QAAvxMrn2dFHHERs1nE1PKaSROGXX/YaABE0+nwxiCyekkVd/lPmW2pxaCczcuuxZbPG
         fdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071018; x=1778675818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZmPjvjob3FbjNKESIZvrg3JwdYT3+owCLHCZhOf9FAE=;
        b=G7u5QftiRUCyOwti2T2w6/xPoiLvalRydIbmDwRxF6pSzCy+MjGe0IkpufYu9e8FTX
         MfL8y73SvuUkurL5weI5EVdAPW1jAd9kuL/lcdK0Oxp6J2oE1U+D+RtcEwW1+9ACvmo+
         QjDjumvn5hJFxJ86CNRkFR5Aivl/Dq4fi6l78pOQVDY1o1XvPUyrIPzpuqkp2ep9OBBP
         bOxSdjdajQVgIZk266pJxKfcJfrvjhU6posu2giHhZ73+bJdZNuzj8F7VTUDTtSh2NjU
         IY2Cx//wFxywhrNUAfv1E2vfkjoos93KPnKCdCMXCEmtMLe8kpxSjaxIW/CgQvR1JZ2A
         9lVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8invGHFYoVbHUhzK+KngZkXZHxzptHE3P+f+VSTphzcrpkVFGfCfOB+YPPn6IYEpRpo70zkXpzWC1/@vger.kernel.org
X-Gm-Message-State: AOJu0YxWX9L1gy8DjGyob0edWb3Gitx3LqDnja06OYjvCCZfrVNpWuxg
	D0tB4XM0zQ084QNLfsHqjKpD35wnpGDCMUBHfsp1g+mCwzszTS8IhBNG
X-Gm-Gg: AeBDietPBAEhEVPecdnYwbGeHjwntOvV4oZzsgr2argYmqiXi/8G64liRfwOFmKAg2d
	gk4bL9olKoVsARcyPLnJ4AtuMu+OUO/lhKURGCRzMJwTHFF0V1ROkGhxSQyW2vEiwzIh/e13Y9J
	1RCv7On9Wj/Vwxn+z/qHWKz3kxzihhxT2t2kBNylTc9BgDQR65SUbTnOdPw2IwUgyrX8TXQEuz2
	7fCjOwRzGfBOOxX60/0T1YvDiniTV10jT8OxtMC7O7jGhycNX3muv204ltWc7ZfT2+TncSSP0aQ
	8nKrWu+9oFBC4EOMORskcujrO31H367IWtUU3fcpoVRkwFwQbUST13mRzDffDfrdAqUroyK0DjI
	BySQwEQBUW4KwkUYgDCrcO1dVhW8Nt8TN6DDtgg/1OC8qviq0FYbSllWfzlv0TL5H0fBrDTK0PP
	gKROWiZmOHwNQXeHF1Rgj6PRDpjw==
X-Received: by 2002:a05:600c:4f53:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e51f4456cmr56620385e9.20.1778071018538;
        Wed, 06 May 2026 05:36:58 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm31767485e9.1.2026.05.06.05.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:36:58 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: mathias.nyman@intel.com,
	andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v2 2/3] [PATCH 2/3] gpio: acpi: modernize resource management using cleanup.h
Date: Wed,  6 May 2026 14:35:35 +0200
Message-ID: <20260506123637.1077421-4-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506123637.1077421-1-mscardovi95@gmail.com>
References: <20260506113215.GK6785@://intel.com>
 <20260506123637.1077421-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78DBA4DA49E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36284-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

---
 drivers/gpio/gpiolib-acpi-core.c | 38 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 7c17bffcd4e7..b6accbaba04d 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -410,31 +410,26 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
 	if (IS_ERR(desc)) {
-		dev_err(chip->parent,
-			"Failed to request GPIO for pin 0x%04X, err %pe\n",
-			pin, desc);
+		dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, err %pe\n", pin, desc);
 		return AE_OK;
 	}
+	desc_guard = desc;
 
 	ret = gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
-		dev_err(chip->parent,
-			"Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
-			pin, ret);
-		goto fail_free_desc;
+		dev_err(chip->parent, "Failed to lock GPIO pin 0x%04X as interrupt, err %d\n", pin, ret);
+		return AE_OK;
 	}
 
 	irq = gpiod_to_irq(desc);
 	if (irq < 0) {
-		dev_err(chip->parent,
-			"Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
-			pin, irq);
-		goto fail_unlock_irq;
+		dev_err(chip->parent, "Failed to translate GPIO pin 0x%04X to IRQ, err %d\n", pin, irq);
+		goto err_unlock;
 	}
 
 	event = kzalloc_obj(*event);
 	if (!event)
-		goto fail_unlock_irq;
+		goto err_unlock;
 
 	event->irqflags = IRQF_ONESHOT;
 	if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
@@ -462,17 +457,15 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	event->irq = irq;
 	event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
 	event->pin = pin;
-	event->desc = desc;
+	/* Transfer ownership to event, prevent auto-free */
+	event->desc = no_free_ptr(desc_guard);
 
 	list_add_tail(&event->node, &acpi_gpio->events);
 
 	return AE_OK;
 
-fail_unlock_irq:
+err_unlock:
 	gpiochip_unlock_as_irq(chip, pin);
-fail_free_desc:
-	gpiochip_free_own_desc(desc);
-
 	return AE_OK;
 }
 
@@ -1104,7 +1097,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct acpi_gpio_chip *achip = region_context;
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
-	struct acpi_resource *ares;
+	struct acpi_resource *ares __free(acpi_free) = NULL;
 	u16 pin_index = address;
 	acpi_status status;
 	int length;
@@ -1115,20 +1108,17 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	if (ACPI_FAILURE(status))
 		return status;
 
-	if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO)) {
-		ACPI_FREE(ares);
+	if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO))
 		return AE_BAD_PARAMETER;
-	}
 
 	agpio = &ares->data.gpio;
 
 	if (WARN_ON(agpio->io_restriction == ACPI_IO_RESTRICT_INPUT &&
-	    function == ACPI_WRITE)) {
-		ACPI_FREE(ares);
+	    function == ACPI_WRITE))
 		return AE_BAD_PARAMETER;
-	}
 
 	length = min(agpio->pin_table_length, pin_index + bits);
+	status = AE_OK;
 	for (i = pin_index; i < length; ++i) {
 		unsigned int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.54.0


