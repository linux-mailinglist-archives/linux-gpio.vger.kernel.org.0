Return-Path: <linux-gpio+bounces-36272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPQOEp4K+2mbVQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:32:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC414D8A54
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0641330376A3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7C03E5579;
	Wed,  6 May 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjGFkPW/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B403E1D01
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059780; cv=none; b=Q5SjFws5ahTXmuskKQ8jwqWpQRffmCZNY4P1v7bKjSRUdEBrsVOh6LNGAxtmGp14+EwnQzWt5m3fdEE8lEEWlvVkdu7C5ggN/0K3CknQPPbGpHgSayhOzAfp1SahN7KtKTSweCH12zrwKdtxfC5t3KlHqk/Vkr4/bGeQRGjcx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059780; c=relaxed/simple;
	bh=b6KDebbwB9y2ayWmTDcDF7ZXzrnROwC7atimGy8vf0g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=jgdChDsX0Efa0K47SnjtXB5PYr/xzQd8KuM8+hqUlnwGRDzYa04HDiNQ/+3m/LDIiUtpRCA2eluOUA2qJ74DZw0r4qGvMzJwS3a4qtuEGb/7FYQb6rjKVlsyio3OQVWOvuWuEhGzD4erWTPi0QvSvPak+fpQZWViWdxyD298dRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjGFkPW/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so49739945e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778059778; x=1778664578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/I8gmtTJP4V7dsNote1TQ7GwmlIxPNJ693ojN9z7bA=;
        b=BjGFkPW/6bSGbXo3NSVroU6XqXBQIXXcmCw+xNmUY3StCPVICQornGq/IpS7rY29ej
         hvseDjPgmP9O9TTpsoFB7uQ8rLgsLKsylGyg2MzPBPdOc7ZoEfmFu/CGLF8YcoUzRP5V
         meJauL5a2/a0bc0vwlrce915K4tgqG3gU5qeQEXE6svMBvKibSPKpFdUSFjtcVYZzrg1
         AJW4Pihm6bTj94XL691TOLRAXv25NPV9Y5SMvvhTqP5rmPtNwZfR6fQ5ShGxwoio1AZS
         E+9rJNb7SF+MlSuhr0SxpyZZRFm1yaorVkga1MeBExBnEeU5zrXJsfeOZ7ziHV6NcBiL
         omaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059778; x=1778664578;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/I8gmtTJP4V7dsNote1TQ7GwmlIxPNJ693ojN9z7bA=;
        b=TLGT9Ot+hY0Qllsc9mhjvaJvrwwnJRv6lk9oLSLQwV7BapMmPRVOsguWrrpXsJ8v99
         56F8+o0EH/XWN5uneXS5r61U+E/OBmwms8GqNInn/4Jz8cdzEvR+aWt9ZrJEHUuLClXM
         I4mkvogOKc+5B3+Dfvz6KIJ8AMMO/G2mbJzAm9Mvz4pV3+8vjbsACYfCm7xrBNVoHUQ0
         MlrVDC0xkzW4k/QDRxFZysxwfe1Uz48Ytn37ns+S7FxJHQ5ZNkvli06XzMYH9y5/Etmy
         KnVTFV8FYJHynMqXa9L35X9/P5die+7vx3asz/QNyLvPJ+xVFB8YfPuoYoC5v519c6bq
         3qMA==
X-Gm-Message-State: AOJu0Yx4VM0pT3mcJcEgOQTN2fgOI+wL3/MnNwGBp7IgsK3XOjUp4qLW
	otg90AB+PXGiN7HivwwTqXmdRTLPres0lNzL20mfDKXYH5AgBEMj6FgJB4PCUkhHrT+JWmwC
X-Gm-Gg: AeBDiescFqF+A/ko63RyLvmvDDfmj4ux3DSi6q0DVZHo5oDZNV369Q91ZdQVaJWXefl
	n5OqWRp7I+dMroZsn6iQgPOg4HrFu1j9qXyZTiNNksQ/6T3GywDBOtCsUhd+I7Vng94ZLYAl21d
	/MEpC8Wy80Ccv17/Odi+/KjobxGHVE6zLeJX03GMAksD0xiOj2CWcjYVTZsYep9uPz0uMMx04E6
	oCQB40vxu40CdUHt89Hy8bQ5Z9HTmp5u/X4XZUGmIDZVM8Hjx5xsEFbETWkuquQI8O+5XU0SZj5
	oFcy8VatZdzOOzJbgahzOB1kucKegkdBrYdHWTlvlBgg3Tg83LV8dsw3jlay8ECyBCYqR/65VaV
	yGvd2pdmBPJB+HuSPANd96TUliIOz+rL/p3+i4S4vPT/taYdSD3aTpxYGAds3PvTsWg32HRK5RN
	eBcmF0hGebpIdqqHjbUBmG6TPhZZ23sb1CgKnjfrkB69TbgQeiOSqp4x4fSmolp7U2OYK1LB2ZT
	0o3PF8=
X-Received: by 2002:a05:600c:34ca:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-48e521e6085mr44681375e9.16.1778059777373;
        Wed, 06 May 2026 02:29:37 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:68b1:8d59:e348:c16e? ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm38017295e9.5.2026.05.06.02.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:29:36 -0700 (PDT)
Message-ID: <59174ed2-dc3a-4891-929f-bf513deecdc2@gmail.com>
Date: Wed, 6 May 2026 11:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: mika.westerberg@linux.intel.com, mathias.nyman@linux.intel.com
From: Marco Scardovi <mscardovi95@gmail.com>
Subject: [PATCH] gpio: acpi: modernize resource management using cleanup.h
Cc: linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9EC414D8A54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-36272-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]

Hi everyone,

I was looking for ways to switch to modern cleanup guards and auto-freeing
pointers to simplify error paths and synchronization in gpiolib-acpi-core.c
so I came up with the patch you can find below.

Here you can see the main points I've worked on:
- Use DEFINE_FREE() for gpio_desc and ACPI resources.
- Use guard(mutex)() within the OpRegion handler loop for automatic locking.
- Use __free() for automatic descriptor and memory cleanup.
- Fix off-by-one error in GPIO pin bounds check.
- Return AE_OK on out-of-range pins to allow processing other resources
   even if one is misconfigured in firmware.
- Use break instead of goto in OpRegion handler for cleaner control flow
   leveraging auto-cleanup.

I've tested it (both build and functionality) against linux-next-20260430.

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
  drivers/gpio/gpiolib-acpi-core.c | 94 
+++++++++++++++++++---------------------
  1 file changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c 
b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..19a18222b7b2 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -7,6 +7,9 @@
   *          Mika Westerberg <mika.westerberg@linux.intel.com>
   */

+#include <linux/cleanup.h>
+#include <linux/slab.h>
+
  #include <linux/acpi.h>
  #include <linux/dmi.h>
  #include <linux/errno.h>
@@ -23,6 +26,16 @@
  #include "gpiolib.h"
  #include "gpiolib-acpi.h"

+DEFINE_FREE(free_gpio_desc, struct gpio_desc *, {
+    if (_T)
+        gpiochip_free_own_desc(_T);
+})
+
+DEFINE_FREE(acpi_free, void *, {
+    if (_T)
+        ACPI_FREE(_T);
+})
+
  /**
   * struct acpi_gpio_event - ACPI GPIO event handler data
   *
@@ -361,6 +374,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct 
acpi_resource *ares,
      struct acpi_gpio_event *event;
      irq_handler_t handler = NULL;
      struct gpio_desc *desc;
+    struct gpio_desc *desc_guard __free(free_gpio_desc) = NULL;
      unsigned int pin;
      int ret, irq;

@@ -370,6 +384,11 @@ static acpi_status acpi_gpiochip_alloc_event(struct 
acpi_resource *ares,
      handle = ACPI_HANDLE(chip->parent);
      pin = agpio->pin_table[0];

+    if (pin >= chip->ngpio) {
+        dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, 
out of range\n", pin);
+        return AE_OK;
+    }
+
      if (pin <= 255) {
          char ev_name[8];
          sprintf(ev_name, "_%c%02X",
@@ -392,31 +411,26 @@ static acpi_status 
acpi_gpiochip_alloc_event(struct acpi_resource *ares,

      desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
      if (IS_ERR(desc)) {
-        dev_err(chip->parent,
-            "Failed to request GPIO for pin 0x%04X, err %pe\n",
-            pin, desc);
+        dev_err(chip->parent, "Failed to request GPIO for pin 0x%04X, 
err %pe\n", pin, desc);
          return AE_OK;
      }
+    desc_guard = desc;

      ret = gpiochip_lock_as_irq(chip, pin);
      if (ret) {
-        dev_err(chip->parent,
-            "Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
-            pin, ret);
-        goto fail_free_desc;
+        dev_err(chip->parent, "Failed to lock GPIO pin 0x%04X as 
interrupt, err %d\n", pin, ret);
+        return AE_OK;
      }

      irq = gpiod_to_irq(desc);
      if (irq < 0) {
-        dev_err(chip->parent,
-            "Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
-            pin, irq);
-        goto fail_unlock_irq;
+        dev_err(chip->parent, "Failed to translate GPIO pin 0x%04X to 
IRQ, err %d\n", pin, irq);
+        goto err_unlock;
      }

      event = kzalloc_obj(*event);
      if (!event)
-        goto fail_unlock_irq;
+        goto err_unlock;

      event->irqflags = IRQF_ONESHOT;
      if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
@@ -444,17 +458,15 @@ static acpi_status 
acpi_gpiochip_alloc_event(struct acpi_resource *ares,
      event->irq = irq;
      event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
      event->pin = pin;
-    event->desc = desc;
+    /* Transfer ownership to event, prevent auto-free */
+    event->desc = no_free_ptr(desc_guard);

      list_add_tail(&event->node, &acpi_gpio->events);

      return AE_OK;

-fail_unlock_irq:
+err_unlock:
      gpiochip_unlock_as_irq(chip, pin);
-fail_free_desc:
-    gpiochip_free_own_desc(desc);
-
      return AE_OK;
  }

@@ -1086,7 +1098,7 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
      struct acpi_gpio_chip *achip = region_context;
      struct gpio_chip *chip = achip->chip;
      struct acpi_resource_gpio *agpio;
-    struct acpi_resource *ares;
+    struct acpi_resource *ares __free(acpi_free) = NULL;
      u16 pin_index = address;
      acpi_status status;
      int length;
@@ -1097,20 +1109,17 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
      if (ACPI_FAILURE(status))
          return status;

-    if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO)) {
-        ACPI_FREE(ares);
+    if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO))
          return AE_BAD_PARAMETER;
-    }

      agpio = &ares->data.gpio;

      if (WARN_ON(agpio->io_restriction == ACPI_IO_RESTRICT_INPUT &&
-        function == ACPI_WRITE)) {
-        ACPI_FREE(ares);
+        function == ACPI_WRITE))
          return AE_BAD_PARAMETER;
-    }

      length = min(agpio->pin_table_length, pin_index + bits);
+    status = AE_OK;
      for (i = pin_index; i < length; ++i) {
          unsigned int pin = agpio->pin_table[i];
          struct acpi_gpio_connection *conn;
@@ -1118,7 +1127,7 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
          u16 word, shift;
          bool found;

-        mutex_lock(&achip->conn_lock);
+        guard(mutex)(&achip->conn_lock);

          found = false;
          list_for_each_entry(conn, &achip->conns, node) {
@@ -1150,17 +1159,15 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
          if (!found) {
              desc = acpi_request_own_gpiod(chip, agpio, i, 
"ACPI:OpRegion");
              if (IS_ERR(desc)) {
-                mutex_unlock(&achip->conn_lock);
                  status = AE_ERROR;
-                goto out;
+                break;
              }

              conn = kzalloc_obj(*conn);
              if (!conn) {
                  gpiochip_free_own_desc(desc);
-                mutex_unlock(&achip->conn_lock);
                  status = AE_NO_MEMORY;
-                goto out;
+                break;
              }

              conn->pin = pin;
@@ -1168,8 +1175,6 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
              list_add_tail(&conn->node, &achip->conns);
          }

-        mutex_unlock(&achip->conn_lock);
-
          /*
           * For the cases when OperationRegion() consists of more than
           * 64 bits calculate the word and bit shift to use that one to
@@ -1188,8 +1193,6 @@ acpi_gpio_adr_space_handler(u32 function, 
acpi_physical_address address,
          }
      }

-out:
-    ACPI_FREE(ares);
      return status;
  }



