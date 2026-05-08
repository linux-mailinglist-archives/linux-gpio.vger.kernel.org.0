Return-Path: <linux-gpio+bounces-36435-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKI8AUSA/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36435-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E149C4F25F6
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C53B3014FF0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9974349AEA;
	Fri,  8 May 2026 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTMjZQta"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E07378824
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221094; cv=none; b=tMVGp621Ci3axKDvDiSvawA6P5hc33w2v23YgliT7nwBFNxHDw9Oz02gRdIV8Dw6zEcUFHxQfMAJYHklvFhDIy3QImDEZB8HFB1LSvWSra0LqUfTbZxotJc8TrvNAvzIZckjY9Xm2FJiQhUxpO+9yVpaPdMxa0jeC4oXEByTCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221094; c=relaxed/simple;
	bh=vXzQCDc9L1TnkgaJ2V/CUD7F8PnBdDZXe97ITMRJsds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRUUXgAaUusxXfUgUIm+NM8fst4ZOTQhm6wrvDQHPs9kvAgEpJk+nRmmYk0Mc/VacdQg2ST+qPW+b/5zpBfCvKhPh4s/CFKySgrVdqMjUSUdV+8zc+TAAz8X3qY8v8vGcicrgM59t289LoX8AVeEgBUIzyIxPl/BGw4JKab22EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTMjZQta; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1298809f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221076; x=1778825876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw5+LRl2yUPLo+LV3S+sRIQay0YVPQ+KYOpW/ni1u98=;
        b=JTMjZQtaWmRHnFRdBIIPiIGNhMsXF1muMTkOcRVwcGVaN1/8uzU6iGjXvKQ4ZzKHtp
         gZ+ni/WMUaNcQOE6nLe/yHurfpVTjb0m/jgcKz746mgZ9SAwK1Y15W6W8qChrFMaj4ju
         uHgUCQycedRwT9LrFAv83T5Q+sxkLPqIXft7reU3BArExS5T67o+E8mkzVr66SisAcTd
         RksP+4pYAjFS4IxafY/dSQXSxYdVGb7yrwfVrvaec9MSS+1Q5FBNYu8mC64wAOOCYpZ1
         FOft/Rgqz/RyXr4c1JCJqyA8iP3m481ImUO+eQrioLyz2/NVz3Rco3OyCwrdaT/aWHfW
         H4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221076; x=1778825876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bw5+LRl2yUPLo+LV3S+sRIQay0YVPQ+KYOpW/ni1u98=;
        b=eZU4LCLScEbArj9ZFwDtI+atXomBOmFgueqKutRzBudI3QQKUoLNw1BE/yFoGjCSwb
         si1NwifqoNH11eBPuIsHxTq7r4OhLUemDhOarPyQFQi0ozJIreN0GZvONwlVDRUrrX8U
         exTus9S30Ro0IGfWaS0n1jSRwjyw+PhAyyuknxj5jeM2Kx3InkdydzFI/AmVldcWWFjm
         4i+Br0rJITGOjIdd04qvAzN8d/4WAcG1Waz1Pm5a+pK6nx7cZyIleLNV6e2MGI4OoFgk
         SS4bAE8HUNfPUuRRvS4Ka2+LqruFcj0nNmgqCjIhGetgPWLCF4AIrZ1bUhTMsiw7UA8m
         zwKg==
X-Forwarded-Encrypted: i=1; AFNElJ/KrsV4iXTmUQkwhU8U2k1h4/mtcrRijdjXXi+YPmOhxxjW4pMtBpGiL1oklwvYLH0b0p1cZgRT4eF0@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCzYupbbQgpuN9slvnLm3huBeo1B0udttquB4m4IJiqrpqQqQ
	Mj7xKn45D26RGB2Bg20J2qYL37fFUQ9VnBTz+ecxKQxesHnQW7R4EvaM
X-Gm-Gg: AeBDiesV/Fs2I80+oj87p0Oy0HQmfZ6MP+aeQazNvDJ0hARQ92KDTYRKQh9kW5eQUAM
	GIySQHA3QaYNQ7GRYpE5nT8FhVTNuaQqqn6+wHEQLJ0o/d+6S1FdpOhyUpGSy2Wspxenc3jb9kO
	nemHuESBkdFxl0GWi613w+9n0Dg0mlECHmC9Nd2O0ERidLPDVFzmGMu8Qe+BGKkLHtlJ4n/PWBb
	/7OHSHBMUmk5l34/c39H88p6tcZG93Mtv17q8QZrTrjEj16FO/laQbFiUm46WX20c2d1wlEz3rp
	BrrZygKkEeWW6gx2YAt8GgmlXgOTIis55UPup4AkysYKuMuxMFd2UR+q5k7rWUfMgPZ2BSmszMy
	+mW70U/z8gsKwhm5+CBk7Apdrg/I7X5gfwzW17HiI/XQMJ89wUlpi+rJDJR466c2OdNPtC/IeI3
	wdVvMspvpUH+NTm2ilwZGpbDRjMQ==
X-Received: by 2002:a05:600c:3b17:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48e51e15c37mr163854705e9.8.1778221076095;
        Thu, 07 May 2026 23:17:56 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm11251175e9.14.2026.05.07.23.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:17:55 -0700 (PDT)
From: Marco Scardovi <mscardovi95@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@intel.com,
	mika.westerberg@intel.com,
	Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH v4 5/6] gpio: acpi: use cleanup.h for automated resource deallocation
Date: Fri,  8 May 2026 08:17:28 +0200
Message-ID: <20260508061729.9530-6-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508061729.9530-1-mscardovi95@gmail.com>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E149C4F25F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-36435-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Refactor acpi_gpiochip_alloc_event() and acpi_gpio_adr_space_handler()
to use the __free() macro for GPIO descriptors and ACPI resources.
This simplifies error handling by removing manual cleanup calls and
reducing the need for goto labels.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
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


