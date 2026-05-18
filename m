Return-Path: <linux-gpio+bounces-37023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA6LCB7GCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:56:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5132568371
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61A9C300E038
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398A93E0C56;
	Mon, 18 May 2026 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEwQimiI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2393DEADE
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090858; cv=none; b=SQx6iF4CWe0tVoBRr+96BDQS4t0+fR6QG0qtVZ0n8YHAHBcWe4Wh8cs0UVLx58t/nu0WNYf9hriG15wFD1n32JZZR1xxzZJHHytOsX785LQJNhVpeLz3J1l/KVPpB3EwIRMq7MnteO9GXHEHNAk1hB3dxGNGeMicttL4t+t2uIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090858; c=relaxed/simple;
	bh=uhZ27U3v2eIZ0NhfXUZbpGVdOwqMl7qp6vCvulhWUwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3aG3yslai28kLKI2yvKmQrEqVqFhS/qElAkr8SMfXi/H8iyzUEnUKH7vlR5/JKLWL7BFLRHRC10UJGVfGJ97XKy3HvU/BUFWV4zE1sMilEjhUa5sSzPq3N7dDMF5Ym/LuHC3zbqt9Z3jK6wbnR8bcKAnjUJ6uqBT0mOznJePOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEwQimiI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so13579795e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090847; x=1779695647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lodDQ5HjiyAy7FWFWZrwQQYQkHD0GGXCtZQuFp7Bmbw=;
        b=rEwQimiIiCUgiyyeBngjdrFRMgkWn9NbMbMGSHM5IoaKiVqIDLGQvBLuoI6WCVXVuJ
         JLZ6CLtuCjbQulNbrEZ1Kus7CBEKTIfTBEix3PNw7PCNY0MR5j5Af5F7T8q9skDsJkjq
         K9dq0XRY9XTYyHii2XwSbH6u1RYemiP6dutwVpFImhCia0e2FKf5FHGTjuPJ1/3np/NM
         2M8ao1dBcnWczgaxwLFL+dPowv+C1XaY91UrlGoSLwTSvpooC+T4vZOwgq5P3qKhocIr
         sl3VcjnHhdmtY1XqzHOwiH9KzLXpUOo8DII+C1it2vK9ANm4bXuotESZyycJVC/8lYtW
         4rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090847; x=1779695647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lodDQ5HjiyAy7FWFWZrwQQYQkHD0GGXCtZQuFp7Bmbw=;
        b=ZogvTWuMG+usDpKEQcfhOADmiP7fHbMakR50EB9Kpv1ETWWXv7erSKdOd7OHjLqmnB
         5ttxUp5uFM4LDitmqLZMesE6VgpEhX4FsgzyElTVYzR+AMcLhf9Pvyd+gWCqutNQK0ek
         u7ohhvZOyx87ZIaHiSDFjviySFz9dVKpXqAYLTClAlnaD4XM1A2bVDmD3Du2G5H9f16d
         /CMHAYDVFxa0roIzLzxtMu8YxIpEtBoQ/6BE7MsvV7XTlfIoGKl24QoOp53Lhowv75lN
         gKz96wYPHSkARwrwfTEokeJH1yQM1LJO/6LEgGh94PX5lpO4ivWlL89R7l+3G1iCov27
         W9Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+8tgizrlv56a7DbbqpLTer3jCrREywf2Pp1sAUXj36VjaFHYoK8dNFwkAGKL6BSs07nrJSnQOpfVju@vger.kernel.org
X-Gm-Message-State: AOJu0YycSeRaStLSaM4NvhehK6G8POAwHUVwG6P+eDq2VYQolmjfvHPQ
	OKSVBDwNuCadLWSTJ59ngDzoiXWZaxDMSvL4HEwldHVa0sOSHWbjEOkr
X-Gm-Gg: Acq92OHmPj1evLP43HEzbhAEEWyaTPLvuHd4H4G6X3B9RndEPZefV3wfp5stfaGnHR/
	yUcKbhKiQ3VONQUkFve5oJAQfODxeYO7MddKqWDCR5/MEwShkSml5cTdqevlyDs9ZNjZ/b4XmS2
	qmGaCBHQ9LtRTBJ/X74M0uDr3NjjBHqCnmZwhrcksHfgZnrckt6ipHGr5dKiGdW4Xtm56uCk8ZV
	qS7aXr8nm/7m6Etwu9hIhZEVn9rnhKeBeHiLKJXM40RanEn9uHvbB7tLos+DQJffrpdZDSfd2+z
	bBxhO8jcp5CD0JS3bTu84XOfFRvd/j83tCiNMgYp4a+YtOdM4nrCJprXLksw09xxue4E1rhlMxI
	4RnrFNX5QDTWa0mXAl/x0AW51Ol+zftE2ehCtwav2FjTFDBdTa2O6rac8gu7rghnyr1lFfDf1hG
	mtENFV3TJG2VQMlVwoGFuy8jsUiA==
X-Received: by 2002:a05:600c:a406:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-48fe6514865mr169798555e9.24.1779090847293;
        Mon, 18 May 2026 00:54:07 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:06 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 05/12] gpiolib: acpi: Declare shared structures in gpiolib-acpi.h
Date: Mon, 18 May 2026 09:53:50 +0200
Message-ID: <20260518075357.112584-6-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518075357.112584-1-mscardovi95@gmail.com>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B5132568371
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37023-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 43 --------------------------------
 drivers/gpio/gpiolib-acpi.h      | 39 +++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 4c8cd2038aa1..7217ec5c7fae 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -23,50 +23,7 @@
 #include "gpiolib.h"
 #include "gpiolib-acpi.h"
 
-/**
- * struct acpi_gpio_event - ACPI GPIO event handler data
- *
- * @node:	  list-entry of the events list of the struct acpi_gpio_chip
- * @handle:	  handle of ACPI method to execute when the IRQ triggers
- * @handler:	  handler function to pass to request_irq() when requesting the IRQ
- * @pin:	  GPIO pin number on the struct gpio_chip
- * @irq:	  Linux IRQ number for the event, for request_irq() / free_irq()
- * @irqflags:	  flags to pass to request_irq() when requesting the IRQ
- * @irq_is_wake:  If the ACPI flags indicate the IRQ is a wakeup source
- * @irq_requested:True if request_irq() has been done
- * @desc:	  struct gpio_desc for the GPIO pin for this event
- */
-struct acpi_gpio_event {
-	struct list_head node;
-	acpi_handle handle;
-	irq_handler_t handler;
-	unsigned int pin;
-	unsigned int irq;
-	unsigned long irqflags;
-	bool irq_is_wake;
-	bool irq_requested;
-	struct gpio_desc *desc;
-};
 
-struct acpi_gpio_connection {
-	struct list_head node;
-	unsigned int pin;
-	struct gpio_desc *desc;
-};
-
-struct acpi_gpio_chip {
-	/*
-	 * ACPICA requires that the first field of the context parameter
-	 * passed to acpi_install_address_space_handler() is large enough
-	 * to hold struct acpi_connection_info.
-	 */
-	struct acpi_connection_info conn_info;
-	struct list_head conns;
-	struct mutex conn_lock;
-	struct gpio_chip *chip;
-	struct list_head events;
-	struct list_head deferred_req_irqs_list_entry;
-};
 
 /**
  * struct acpi_gpio_info - ACPI GPIO specific information
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index a90267470a4e..bd857ead9dcc 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -8,10 +8,13 @@
 #ifndef GPIOLIB_ACPI_H
 #define GPIOLIB_ACPI_H
 
+#include <linux/acpi.h>
 #include <linux/err.h>
-#include <linux/types.h>
-
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
 
 struct device;
 struct fwnode_handle;
@@ -20,6 +23,38 @@ struct gpio_chip;
 struct gpio_desc;
 struct gpio_device;
 
+struct acpi_gpio_event {
+	struct list_head node;
+	acpi_handle handle;
+	irq_handler_t handler;
+	unsigned int pin;
+	unsigned int irq;
+	unsigned long irqflags;
+	bool irq_is_wake;
+	bool irq_requested;
+	struct gpio_desc *desc;
+};
+
+struct acpi_gpio_connection {
+	struct list_head node;
+	unsigned int pin;
+	struct gpio_desc *desc;
+};
+
+struct acpi_gpio_chip {
+	/*
+	 * ACPICA requires that the first field of the context parameter
+	 * passed to acpi_install_address_space_handler() is large enough
+	 * to hold struct acpi_connection_info.
+	 */
+	struct acpi_connection_info conn_info;
+	struct list_head conns;
+	struct mutex conn_lock;
+	struct gpio_chip *chip;
+	struct list_head events;
+	struct list_head deferred_req_irqs_list_entry;
+};
+
 #ifdef CONFIG_ACPI
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
-- 
2.54.0


