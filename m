Return-Path: <linux-gpio+bounces-36391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDMEGv22/Gn9SwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:59:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943A4EBB68
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56636302FAE3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5165344D014;
	Thu,  7 May 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/McGVjT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D914534B2
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169421; cv=none; b=qdgvHziqUk4azTq6Zrxxi4IlGr9Zxs4ssHBV19Ozl/vciiQn0SES1x9C7XZJK4P6gTQTMY4x5d2SwVGso5glUEzmwHKJ0VTM1/DXpi7DUJlK2rd2IMEfVn2yCUpB+le3ZYpdXBDmw8BCZXoFIGHsMcnyeQeze1zXL53fMUGtOr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169421; c=relaxed/simple;
	bh=JV3zZJ8rkmi4RMT6hpnGeDnQ0pKc5O/jB6na/dhq70A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By6hYmSAB4prWJTNXTNJEz1p4bXTHiOmb1CmWcUZBqCOxDWJSvfoCJvD719Y59+nH3coPtQBnzwKxzoYhas1OXxx3wdnJi3naO5yeynPv4TknPvbgPSQIbKx+oYJzPtpb8ixm5wENyy5mVjzpt05nvRH4tWkkWfW7ALsvI5raXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/McGVjT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d7645adbdso655033f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169418; x=1778774218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuLklHkoZ90lipN8/stupsJdkmM0RVCMnCyoiMUX2OI=;
        b=o/McGVjTKIpSPlAJBkVFsQ5gQrlE76xrCJ1RIaGedoTmgBa+d9YGeL1ic4JZr+p+DQ
         lh/cC+LgOtxMXlhrDmSGh0gDRRNAFlU3l4i3DPrN5iplFslU/dzsmMTcJHJRIEg4KWu4
         nHiLZ7sj92teaAz8CI4Qs7hAc1Fsr/n1Ab82HhWi57H1RixY/fUsGf2boNnlHwovT9iq
         dWiiPOxINqpH0L3Kgu4g5BaZpvdFvWYCYZ11Hw3MwuzAj9alMtswTmjYpHSKA6GmdkBV
         FX4ozaDqTPT906g2l31ILF86vu5RPifs5n69IE45TfqOxT+Pl1uIpevf1Ykh1ZvRD+Vr
         NUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169418; x=1778774218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LuLklHkoZ90lipN8/stupsJdkmM0RVCMnCyoiMUX2OI=;
        b=tEXo0XkJamMjjOkJRgxDDCYuVUg5pfj5ng8btNVyrDfFzfY5OzK7XpgjJI2q8kA2W0
         ihqFq2n5fy2oCXJtoi8eZkwclKFJXoE1I4bkV+qe+9nUh4X1Hphw84nZx0L5Gd0n0pXI
         ALN7rWk/TZTqGQRww/bCCVMk9LHPxE0MLsZfoZmhxPB7DQ49FFsd4uGSggxFJK0IiXre
         Tn3SnVstnwKlq9g77TdxUZzzuMLKAjvvVE7MifM63GhqfBazc17gNyhPAXCkbD59ylLR
         NKfD1hILdTTYldEF62EOpRHfW2H73HfxFNoW/7JC6FQ+TB96Usm3qgvlExuickw9epAe
         ITvA==
X-Forwarded-Encrypted: i=1; AFNElJ+btBDaOeWrSEbyxpFr9PrjOKxUHNRrnNg4sxyfnniVPMuyb2/w7edMXwIuTR3p8A6K3bFXB+4eEzjX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6H7Y/r2yv0adI4Nt0xJOECv64dw6k0goDir4Rnkgkwu5Y6XI4
	hI8elSmxe+sT47N9H6sF5an4uY4gjVpnO9EE1eJTv6+QxVU/Ph9OcYdU
X-Gm-Gg: AeBDietS2jQj5CWPIlhXu0WTq3W9v1i5AdJlLyY+5evvbn5I4w2IhB24r/hKkUM0oH8
	ToD0Vsh2P8Kw2Zspq9vb9iHG4sgs0PptFMM/YzBnlAoWuVABHqnvZDVq236+ncwAZxuhgTifj0V
	ch5HGAI0Qp9RgDhbJ4YXcXGLSTX53QTCbHNxn7Jwf+uzOXbsVCkoIgJ+7RVQ3LlcwnSyj1y5sk8
	xwFHDOn83ewNShFJ5MXb0sXlMHdQM8eug8qBMFqMSeMCfO+J5BCtLvHLXMskGVJVFhLbypWJNZF
	XkAeQwPORzdY81OnRf0NEKxonwChS2u0aTbqtJmG6y/gdnpNZI5zGjWNqCGQeYYUnKdgqec99FW
	MbPFmJ/sp2HQLZYjWK/WM6b5Dq6LZjAIHu6rIIBylHqT68uJxwbA5v9gojfJe3rWCHaKogCKzgw
	6lnxskDwAC1rR25IKoWFHaYxOa4Q==
X-Received: by 2002:a05:6000:1acb:b0:44a:8c10:40d9 with SMTP id ffacd0b85a97d-4515cf126camr14427750f8f.23.1778169417791;
        Thu, 07 May 2026 08:56:57 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820463sm44581f8f.3.2026.05.07.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:56:57 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: mika.westerberg@intel.com
Cc: andriy.shevchenko@intel.com,
	mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v3 5/6] gpio: acpi: use cleanup.h for automated resource deallocation
Date: Thu,  7 May 2026 17:56:46 +0200
Message-ID: <20260507155647.403964-6-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507155647.403964-1-mscardovi95@gmail.com>
References: <20260506123421.1077421-1-mscardovi95@gmail.com>
 <20260507155647.403964-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8943A4EBB68
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
	TAGGED_FROM(0.00)[bounces-36391-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Action: no action

---
 drivers/gpio/gpiolib-acpi-core.c | 40 +++++++++++---------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 33d6c3b6cdf0..c9b12e24de14 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -397,31 +397,27 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
 	if (IS_ERR(desc)) {
-		dev_err(chip->parent,
-			"Failed to request GPIO for pin 0x%04X, err %pe\n",
-			pin, desc);
+		dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, err %pe\n", pin, desc);
 		return AE_OK;
 	}
 
+	struct gpio_desc *desc_guard __free(free_gpio_desc) = desc;
+
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
@@ -449,17 +445,15 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
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
 
@@ -1091,7 +1085,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct acpi_gpio_chip *achip = region_context;
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
-	struct acpi_resource *ares;
+	struct acpi_resource *ares __free(acpi_free) = NULL;
 	u16 pin_index = address;
 	acpi_status status;
 	int length;
@@ -1102,18 +1096,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
 	for (i = pin_index; i < length; ++i) {
@@ -1189,8 +1179,6 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 	}
 
-out:
-	ACPI_FREE(ares);
 	return status;
 }
 
-- 
2.54.0


