Return-Path: <linux-gpio+bounces-37028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLnnMl3GCmqg8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C45683FE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3061D300CB0E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527223E2759;
	Mon, 18 May 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOaeFW0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817AF3E1211
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090866; cv=none; b=LfJKdVO8j9CbO4vcqWGmEwodcLh7vRYrf8Grm3Fy6t+sM7YWpRoP9WY/MGG2vqzhr4e2lb5q1lEUcRv0esHSDYg7qIh93WesTg4UzFfDnc3clAuGJDGt0mzULQLxDS5to9Jzh42iF9f9wjuqczf7Xqc/r3EPs3XvAdLeogyVHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090866; c=relaxed/simple;
	bh=0Ql4zhqEbzWhChTeZAt2EIiNi5Xy/ATG7jBTZ+u2HiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm2QNinBdotlantWE0mx+YviR4XijVfMOBENv0vAnHFtDz6wKD3pBTKw8/WrMnvGcV/ayvFmoIAfg9DVG2yQWz5fu+NovkKstuboiqfH29LGt2zI7XGxpF3PMRvkmbZ303jkAcn6QXMVxnFhy2FGy6Eh/H2pDdd0obz92aifUbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOaeFW0i; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891b0786beso13645245e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090857; x=1779695657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfcbstpMvRSx72dJXMaVqWlJDHj2JQ/oVsq/+KO1blw=;
        b=KOaeFW0iCzkX1Dqof4VEtHBjs+eRFQD/PZTTNStzpbl9mjm2fHZW2siSJAHJ87z2c4
         /T1lof9asA1wY+BBbFZ+CokaNNDLY4jA/wuYg/6PYUJluHn18DQzsUtX/dkF+r8/BUFd
         oX94IZp92B7V81VFQy2v337d5dZ0qRTROUDyhPkApxxL+PbqRUQnq+5y2xJFLwXP3Wee
         cT6zZxbb3YtKU9TdRnyqigUcs6XtkiqgfBG1G65rXe3YFFVz8RV/4+R9YgBeISvVSjf+
         WBypruy1pnmqVGOYdnmJd63P0/pWPJYhR4XLUnw8s8XeavfuPEmUHMS2oBtgRYeFMEJr
         VH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090857; x=1779695657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfcbstpMvRSx72dJXMaVqWlJDHj2JQ/oVsq/+KO1blw=;
        b=gKeBqTr5SxposV5W7T9+GlG55EbPLbQiIyk5kz9rY/TkJiK+4lPY6PuKKRxOJbZ1IE
         kaeqNrP5ZziZzfW2oUXNLRs9oH5FdEd9xQ1/hkZ26WgmqQDF4b1KAumJuXMR9cI7ra2s
         RT3uFwLb2KaswgLnlX5LX8yhAbpgZdsSFgMgDFBGOOlBmNueBSKKO/dSPEGeRVzJpKfs
         /aXLFjJD++MkA8rh6+0E9Y8YIXRUyzPk8yeBy9hdMiH/5CKZEMCbztGmmXKckIU5ylFk
         G3V5Wj60lSb6lP0j4HGiI39qMxai9XxDJQKEohzTNRzYoYao4JZBfer68JQFrqV7eoTh
         xoBw==
X-Forwarded-Encrypted: i=1; AFNElJ/WAOl+yc1JI1ZBsbgr2syn3nFXaZ1WbwFr+084s9pa7/7opos7Y6SlrdPExhkQ2qJNPCHUsuW63EPb@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvqZeLw7/QeYm2lcKzu68uOZQaAJi8PKlkRj32si7Pa1g57wc
	r60s+xqffdCjBEATyGyFjIYwwL0UnvCmGlJk6S8/xq+P60Bb5h7v31Zm
X-Gm-Gg: Acq92OHsfDe68Dz4wjaLl++kYwCT6o8ZwWnnyzy1yHEt5yzhAnxpTx1KioSMwy8aShd
	arrGRsXn/nCSl8UsEldj+9R4VmeMNfhmeA3VjakvyTkBugk/oZxIcEyBXNQGRGQXlKbkALCZNYB
	q7VMi1/bSbwePpJ+Ij7GNitv3fFj7iW2VME3Vo5C0ZVdW3Qn2+WEX9alarX2LdCbAjWjBd2CmJX
	MWQ4JCvoJzICCZLMdF1iVw38P3Di0Or41k2sUwfryqEFkzZ3dZ/ulGi5c22kRyF3g8QdMWcyKsC
	JMAEXc410u91jrG2im/qQGmhjhH93WaFcD87wODig9bVoskpi6B/55TnqMOODy1UZar7pnt276j
	h+1Eyfp6G2egI5LnfLQKz2aPHpwW+RpT2N2RgiQY9t1aSwTLwC/hZ+28B9ZtIUkbkEFgUVAZjSR
	pDEYNpuk99UEHUkf1y4MdQa6URAg==
X-Received: by 2002:a05:600c:628d:b0:490:1642:3d4d with SMTP id 5b1f17b1804b1-49016423dd1mr6494975e9.22.1779090856639;
        Mon, 18 May 2026 00:54:16 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:14 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 11/12] gpiolib: acpi: Add dedicated ACPI GPIO events module
Date: Mon, 18 May 2026 09:53:56 +0200
Message-ID: <20260518075357.112584-12-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 764C45683FE
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
	TAGGED_FROM(0.00)[bounces-37028-lists,linux-gpio=lfdr.de];
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
 drivers/gpio/Makefile              |   2 +-
 drivers/gpio/gpiolib-acpi-events.c | 309 +++++++++++++++++++++++++++++
 2 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpiolib-acpi-events.c

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1a416305465b..75b38577b328 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_CDEV)		+= gpiolib-cdev.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
-gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o gpiolib-acpi-opregion.o
+gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o gpiolib-acpi-opregion.o gpiolib-acpi-events.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
 obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
 
diff --git a/drivers/gpio/gpiolib-acpi-events.c b/drivers/gpio/gpiolib-acpi-events.c
new file mode 100644
index 000000000000..317528a25c92
--- /dev/null
+++ b/drivers/gpio/gpiolib-acpi-events.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ACPI Event and Interrupt helper for GPIO API
+ *
+ * Copyright (C) 2026, Intel Corporation
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+
+#include "gpiolib.h"
+#include "gpiolib-acpi.h"
+
+static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
+{
+	struct acpi_gpio_event *event = data;
+
+	acpi_evaluate_object(event->handle, NULL, NULL, NULL);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t acpi_gpio_irq_handler_evt(int irq, void *data)
+{
+	struct acpi_gpio_event *event = data;
+
+	acpi_execute_simple_method(event->handle, NULL, event->pin);
+
+	return IRQ_HANDLED;
+}
+
+static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
+				      struct acpi_gpio_event *event)
+{
+	struct device *parent = acpi_gpio->chip->parent;
+	int ret, value;
+
+	ret = request_threaded_irq(event->irq, NULL, event->handler,
+				   event->irqflags | IRQF_ONESHOT, "ACPI:Event", event);
+	if (ret) {
+		dev_err(parent, "Failed to setup interrupt handler for %d\n", event->irq);
+		return;
+	}
+
+	if (event->irq_is_wake)
+		enable_irq_wake(event->irq);
+
+	event->irq_requested = true;
+
+	/*
+	 * Make sure we trigger the initial state of ActiveBoth IRQs.
+	 *
+	 * According to the Microsoft GPIO documentation, triggering GPIO
+	 * interrupts marked as ActiveBoth during initialization is correct
+	 * as long as the associated GPIO line is already "asserted"
+	 * (logic level low). We should not trigger edge-based GPIO
+	 * interrupts not marked as ActiveBoth.
+	 *
+	 * See: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
+	 * Section: "GPIO controllers and ActiveBoth interrupts"
+	 */
+	if (acpi_gpio_need_run_edge_events_on_boot() &&
+	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
+	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
+		value = gpiod_get_raw_value_cansleep(event->desc);
+		if (value == 0)
+			event->handler(event->irq, event);
+	}
+}
+
+static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
+{
+	struct acpi_gpio_event *event;
+
+	list_for_each_entry(event, &acpi_gpio->events, node)
+		acpi_gpiochip_request_irq(acpi_gpio, event);
+}
+
+bool acpi_gpio_irq_is_wake(struct device *parent,
+			   const struct acpi_resource_gpio *agpio)
+{
+	unsigned int pin;
+
+	if (agpio->pin_table_length == 0)
+		return false;
+
+	pin = agpio->pin_table[0];
+
+	if (agpio->wake_capable != ACPI_WAKE_CAPABLE)
+		return false;
+
+	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_WAKE, dev_name(parent), pin)) {
+		dev_info(parent, "Ignoring wakeup on pin %u\n", pin);
+		return false;
+	}
+
+	return true;
+}
+
+/* Always returns AE_OK so that we keep looping over the resources */
+static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
+					     void *context)
+{
+	struct acpi_gpio_chip *acpi_gpio = context;
+	struct gpio_chip *chip = acpi_gpio->chip;
+	struct acpi_resource_gpio *agpio;
+	acpi_handle handle, evt_handle;
+	struct acpi_gpio_event *event;
+	irq_handler_t handler = NULL;
+	struct gpio_desc *desc;
+	unsigned int pin;
+	int ret, irq;
+
+	if (!acpi_gpio_get_irq_resource(ares, &agpio))
+		return AE_OK;
+
+	if (agpio->pin_table_length == 0)
+		return AE_OK;
+
+	handle = ACPI_HANDLE(chip->parent);
+	pin = agpio->pin_table[0];
+
+	if (pin <= 255) {
+		char ev_name[8];
+
+		snprintf(ev_name, sizeof(ev_name), "_%c%02X",
+			 agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
+			 pin);
+		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
+			handler = acpi_gpio_irq_handler;
+	}
+	if (!handler) {
+		if (ACPI_SUCCESS(acpi_get_handle(handle, "_EVT", &evt_handle)))
+			handler = acpi_gpio_irq_handler_evt;
+	}
+	if (!handler)
+		return AE_OK;
+
+	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_INTERRUPT, dev_name(chip->parent), pin)) {
+		dev_info(chip->parent, "Ignoring interrupt on pin %u\n", pin);
+		return AE_OK;
+	}
+
+	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
+	if (IS_ERR(desc)) {
+		dev_err(chip->parent,
+			"Failed to request GPIO for pin 0x%04X, err %pe\n",
+			pin, desc);
+		return AE_OK;
+	}
+
+	ret = gpiochip_lock_as_irq(chip, pin);
+	if (ret) {
+		dev_err(chip->parent,
+			"Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
+			pin, ret);
+		goto fail_free_desc;
+	}
+
+	irq = gpiod_to_irq(desc);
+	if (irq < 0) {
+		dev_err(chip->parent,
+			"Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
+			pin, irq);
+		goto fail_unlock_irq;
+	}
+
+	event = kzalloc_obj(*event);
+	if (!event)
+		goto fail_unlock_irq;
+
+	event->irqflags = IRQF_ONESHOT;
+	if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
+		if (agpio->polarity == ACPI_ACTIVE_HIGH)
+			event->irqflags |= IRQF_TRIGGER_HIGH;
+		else
+			event->irqflags |= IRQF_TRIGGER_LOW;
+	} else {
+		switch (agpio->polarity) {
+		case ACPI_ACTIVE_HIGH:
+			event->irqflags |= IRQF_TRIGGER_RISING;
+			break;
+		case ACPI_ACTIVE_LOW:
+			event->irqflags |= IRQF_TRIGGER_FALLING;
+			break;
+		default:
+			event->irqflags |= IRQF_TRIGGER_RISING |
+					   IRQF_TRIGGER_FALLING;
+			break;
+		}
+	}
+
+	event->handle = evt_handle;
+	event->handler = handler;
+	event->irq = irq;
+	event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
+	event->pin = pin;
+	event->desc = desc;
+
+	list_add_tail(&event->node, &acpi_gpio->events);
+
+	return AE_OK;
+
+fail_unlock_irq:
+	gpiochip_unlock_as_irq(chip, pin);
+fail_free_desc:
+	gpiochip_free_own_desc(desc);
+
+	return AE_OK;
+}
+
+/**
+ * acpi_gpiochip_request_interrupts() - Register isr for gpio chip ACPI events
+ * @chip:      GPIO chip
+ *
+ * ACPI5 platforms can use GPIO signaled ACPI events. These GPIO interrupts are
+ * handled by ACPI event methods which need to be called from the GPIO
+ * chip's interrupt handler. acpi_gpiochip_request_interrupts() finds out which
+ * GPIO pins have ACPI event methods and assigns interrupt handlers that calls
+ * the ACPI event methods for those pins.
+ */
+void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
+{
+	struct acpi_gpio_chip *acpi_gpio;
+	acpi_handle handle;
+	acpi_status status;
+
+	if (!chip->parent || !chip->to_irq)
+		return;
+
+	handle = ACPI_HANDLE(chip->parent);
+	if (!handle)
+		return;
+
+	status = acpi_get_data(handle, acpi_gpio_chip_dh, (void **)&acpi_gpio);
+	if (ACPI_FAILURE(status))
+		return;
+
+	if (acpi_quirk_skip_gpio_event_handlers())
+		return;
+
+	acpi_walk_resources(handle, METHOD_NAME__AEI,
+			    acpi_gpiochip_alloc_event, acpi_gpio);
+
+	if (acpi_gpio_add_to_deferred_list(&acpi_gpio->deferred_req_irqs_list_entry))
+		return;
+
+	acpi_gpiochip_request_irqs(acpi_gpio);
+}
+EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
+
+/**
+ * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
+ * @chip:      GPIO chip
+ *
+ * Free interrupts associated with GPIO ACPI event method for the given
+ * GPIO chip.
+ */
+void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
+{
+	struct acpi_gpio_chip *acpi_gpio;
+	struct acpi_gpio_event *event, *ep;
+	acpi_handle handle;
+	acpi_status status;
+
+	if (!chip->parent || !chip->to_irq)
+		return;
+
+	handle = ACPI_HANDLE(chip->parent);
+	if (!handle)
+		return;
+
+	status = acpi_get_data(handle, acpi_gpio_chip_dh, (void **)&acpi_gpio);
+	if (ACPI_FAILURE(status))
+		return;
+
+	acpi_gpio_remove_from_deferred_list(&acpi_gpio->deferred_req_irqs_list_entry);
+
+	list_for_each_entry_safe_reverse(event, ep, &acpi_gpio->events, node) {
+		if (event->irq_requested) {
+			if (event->irq_is_wake)
+				disable_irq_wake(event->irq);
+
+			free_irq(event->irq, event);
+		}
+
+		gpiochip_unlock_as_irq(chip, event->pin);
+		gpiochip_free_own_desc(event->desc);
+		list_del(&event->node);
+		kfree(event);
+	}
+}
+EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
+
+void __init acpi_gpio_process_deferred_list(struct list_head *list)
+{
+	struct acpi_gpio_chip *acpi_gpio, *tmp;
+
+	list_for_each_entry_safe(acpi_gpio, tmp, list, deferred_req_irqs_list_entry)
+		acpi_gpiochip_request_irqs(acpi_gpio);
+}
-- 
2.54.0


