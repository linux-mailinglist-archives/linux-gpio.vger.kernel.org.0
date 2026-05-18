Return-Path: <linux-gpio+bounces-37029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IRtFXjGCmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05255568424
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6748B3021BDF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1136C3E2AC8;
	Mon, 18 May 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpjGekCJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A983E1713
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090868; cv=none; b=ufCARkAvM0cM8OFmun6lxSKOOk9cQdeo9CLLw3qb9667ClZpFWROLg3vIQTuCbDPoD9Sk4jnCYZg8ty6hrKF7H/DMmyjrdVXKt+QlZxRXmV7Pjh6p2eFrwMejse4PCtc6A2eMfD2PEGs6ufreOgIQfc34f4mZndiCc50uGIZhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090868; c=relaxed/simple;
	bh=rWUS7nTXrVlK5crZ0DjajElGR3QIsEMB1YpNIqFMkRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kS912I5NNBw5N/bWslDMbUeLiFWMbCYpWQqY+L7vyv1q/Q4TJyxzT2HmPuV0ic9Nz/VnAG6ELk0fy5SZHLkHiB3gGX+4oMGZ/HwQGIugpHBXpzMVrdN6qSIWMXt/m2Ll1ODEvAucadWtJADgdpNqj1d8sxV8TYJB9SOQp5oGAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpjGekCJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso12306785e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090858; x=1779695658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjJqGoIGjYsGu2tQdH7B+cO6snJCjh0eC3SCgTOpXs0=;
        b=DpjGekCJX/y6FtC1BMif9q9RdhiJglm7spfZD0JgCwbcQH6g4886kXSM0XrMJ+G/aF
         Fm3zI/P1yAQcv+eei1QY8ranTH2cV9JDfpdvtZx96ULPVEDmcQRaxME2vxlG9a462ox/
         ChkR6QBHVVSPYFapksCQyq0Ue8yaI+tNa/ov0Go7C6HcYD9hjWhLl5KAiB6l2EDRUapE
         oKGKoA4XB/0Ir2oQugxfEfr/0GDplX/SgGPWwnnE9ttmJh4dMXhOAoWV0iCeLjXa+eCw
         6YZp2y61Qn0FbmH4oUX8AS3Rpv4zniY/Y3K80Am63t0+u29uUiC+ddIOpdUwDQdeGz25
         LozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090858; x=1779695658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjJqGoIGjYsGu2tQdH7B+cO6snJCjh0eC3SCgTOpXs0=;
        b=ZsF7NmfGAZDTChjdNhiahBXknE4VauNvbaRsf0ZjRj9LzZoB1IIan67RskeZum2geO
         8FF36TzJEIXbvC9QXryVtp9bbqkESxflIXr6XcLXH2vr0Qpp7+NygRORY2tFY4jb0/Do
         JufGdcBZVN9AzvwK4FiM/JwTrZ6veSPbL20uNdKqQJGUwDPbPUtYZjutx+9+vxluk6p+
         zvlhX+iMkch2JPGRnAoxbrq826/RSNMbHEElayOX1MdcfyU5BVo9takc6s7gqRrIiyiS
         CDQ1nghTkTf/l1/oeoi0+eFx5mUsPSFW7xueRNUABm7R2pO65heulswr+PxhUAo+aAFc
         hCog==
X-Forwarded-Encrypted: i=1; AFNElJ9WXdRGmQvWzZtJeUW+7aAi6Y0qri33kt37riJC1ze3Tfm80w5hBfk58w5tb64aij6DMqeP85+6Vvoh@vger.kernel.org
X-Gm-Message-State: AOJu0YzoWmWTKOuReoVNwgVr7TpPTwlfTk8BwzyX+EAoznz0s5OcBlT3
	jLeOvSovkGEgKWeeLXa14hUZuNUy8Jf8/Abms3Yt104NQOsbkDJTzHn4
X-Gm-Gg: Acq92OFB3UOygQgnk1S4kyl7eA56L0xwzbVuuLwOtjV/sOo2s82sxP3Yvo8f/+uVQm9
	tJ1IKjHaHYv6ZRnoCKdptP6US8FCng/KfuMX7IdzLLtrmVetTtj8P6RFzs55JqSG8r9QxlIIEry
	GD8qYWa4ss33gGK9NjYdgJVE4AUYy4Kbfvv6iF+Bg0xf2rV2ylgeXoky8c0utHLZaFI2sISmsx7
	LqXQJpqM1VaEyqZXtcn2Rwos4IPbLe+cBJ22EIKAnap4EA/8HAVrbQ+wk5eDl5NE2anULLADc9f
	yTCAMZY3PqKmD/ocSUkJ/St0KJRe87HAbYZCR/N3FOjN7aeUwsFK1gFJxSSG81/+WkCxuaHfLNl
	2qazsueRI1K+u/Gh4cZ00hUDQPnIkGwhuR2KzB1yy9P4YiwAt0bll+URxkN5eDrRPZvlMUgTeA8
	HMnLTWETZLjBV4ARNSu8bHSSpn5EZkFXXTUjz7
X-Received: by 2002:a05:600c:828d:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-48fe61eb313mr203218885e9.15.1779090858347;
        Mon, 18 May 2026 00:54:18 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:17 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 12/12] gpiolib: acpi: Decouple Event and Interrupt handling from core
Date: Mon, 18 May 2026 09:53:57 +0200
Message-ID: <20260518075357.112584-13-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 05255568424
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
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37029-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 285 +------------------------------
 1 file changed, 1 insertion(+), 284 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index b8976a0c798e..99b7b0409810 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -106,25 +106,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	return gpio_device_get_desc(gdev, pin);
 }
 
-static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
-{
-	struct acpi_gpio_event *event = data;
-
-	acpi_evaluate_object(event->handle, NULL, NULL, NULL);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t acpi_gpio_irq_handler_evt(int irq, void *data)
-{
-	struct acpi_gpio_event *event = data;
-
-	acpi_execute_simple_method(event->handle, NULL, event->pin);
-
-	return IRQ_HANDLED;
-}
-
-static void acpi_gpio_chip_dh(acpi_handle handle, void *data)
+void acpi_gpio_chip_dh(acpi_handle handle, void *data)
 {
 	/* The address of this function is used as a key. */
 }
@@ -172,52 +154,7 @@ bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
 }
 EXPORT_SYMBOL_GPL(acpi_gpio_get_io_resource);
 
-static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
-				      struct acpi_gpio_event *event)
-{
-	struct device *parent = acpi_gpio->chip->parent;
-	int ret, value;
-
-	ret = request_threaded_irq(event->irq, NULL, event->handler,
-				   event->irqflags | IRQF_ONESHOT, "ACPI:Event", event);
-	if (ret) {
-		dev_err(parent, "Failed to setup interrupt handler for %d\n", event->irq);
-		return;
-	}
-
-	if (event->irq_is_wake)
-		enable_irq_wake(event->irq);
 
-	event->irq_requested = true;
-
-	/*
-	 * Make sure we trigger the initial state of ActiveBoth IRQs.
-	 *
-	 * According to the Microsoft GPIO documentation, triggering GPIO
-	 * interrupts marked as ActiveBoth during initialization is correct
-	 * as long as the associated GPIO line is already "asserted"
-	 * (logic level low). We should not trigger edge-based GPIO
-	 * interrupts not marked as ActiveBoth.
-	 *
-	 * See: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
-	 * Section: "GPIO controllers and ActiveBoth interrupts"
-	 */
-	if (acpi_gpio_need_run_edge_events_on_boot() &&
-	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
-	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
-		value = gpiod_get_raw_value_cansleep(event->desc);
-		if (value == 0)
-			event->handler(event->irq, event);
-	}
-}
-
-static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
-{
-	struct acpi_gpio_event *event;
-
-	list_for_each_entry(event, &acpi_gpio->events, node)
-		acpi_gpiochip_request_irq(acpi_gpio, event);
-}
 
 static enum gpiod_flags
 acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
@@ -296,229 +233,9 @@ struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 	return desc;
 }
 
-static bool acpi_gpio_irq_is_wake(struct device *parent,
-				  const struct acpi_resource_gpio *agpio)
-{
-	unsigned int pin;
-
-	if (agpio->pin_table_length == 0)
-		return false;
 
-	pin = agpio->pin_table[0];
 
-	if (agpio->wake_capable != ACPI_WAKE_CAPABLE)
-		return false;
-
-	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_WAKE, dev_name(parent), pin)) {
-		dev_info(parent, "Ignoring wakeup on pin %u\n", pin);
-		return false;
-	}
 
-	return true;
-}
-
-/* Always returns AE_OK so that we keep looping over the resources */
-static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
-					     void *context)
-{
-	struct acpi_gpio_chip *acpi_gpio = context;
-	struct gpio_chip *chip = acpi_gpio->chip;
-	struct acpi_resource_gpio *agpio;
-	acpi_handle handle, evt_handle;
-	struct acpi_gpio_event *event;
-	irq_handler_t handler = NULL;
-	struct gpio_desc *desc;
-	unsigned int pin;
-	int ret, irq;
-
-	if (!acpi_gpio_get_irq_resource(ares, &agpio))
-		return AE_OK;
-
-	if (agpio->pin_table_length == 0)
-		return AE_OK;
-
-	handle = ACPI_HANDLE(chip->parent);
-	pin = agpio->pin_table[0];
-
-	if (pin <= 255) {
-		char ev_name[8];
-
-		snprintf(ev_name, sizeof(ev_name), "_%c%02X",
-			 agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
-			 pin);
-		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
-			handler = acpi_gpio_irq_handler;
-	}
-	if (!handler) {
-		if (ACPI_SUCCESS(acpi_get_handle(handle, "_EVT", &evt_handle)))
-			handler = acpi_gpio_irq_handler_evt;
-	}
-	if (!handler)
-		return AE_OK;
-
-	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_INTERRUPT, dev_name(chip->parent), pin)) {
-		dev_info(chip->parent, "Ignoring interrupt on pin %u\n", pin);
-		return AE_OK;
-	}
-
-	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
-	if (IS_ERR(desc)) {
-		dev_err(chip->parent,
-			"Failed to request GPIO for pin 0x%04X, err %pe\n",
-			pin, desc);
-		return AE_OK;
-	}
-
-	ret = gpiochip_lock_as_irq(chip, pin);
-	if (ret) {
-		dev_err(chip->parent,
-			"Failed to lock GPIO pin 0x%04X as interrupt, err %d\n",
-			pin, ret);
-		goto fail_free_desc;
-	}
-
-	irq = gpiod_to_irq(desc);
-	if (irq < 0) {
-		dev_err(chip->parent,
-			"Failed to translate GPIO pin 0x%04X to IRQ, err %d\n",
-			pin, irq);
-		goto fail_unlock_irq;
-	}
-
-	event = kzalloc_obj(*event);
-	if (!event)
-		goto fail_unlock_irq;
-
-	event->irqflags = IRQF_ONESHOT;
-	if (agpio->triggering == ACPI_LEVEL_SENSITIVE) {
-		if (agpio->polarity == ACPI_ACTIVE_HIGH)
-			event->irqflags |= IRQF_TRIGGER_HIGH;
-		else
-			event->irqflags |= IRQF_TRIGGER_LOW;
-	} else {
-		switch (agpio->polarity) {
-		case ACPI_ACTIVE_HIGH:
-			event->irqflags |= IRQF_TRIGGER_RISING;
-			break;
-		case ACPI_ACTIVE_LOW:
-			event->irqflags |= IRQF_TRIGGER_FALLING;
-			break;
-		default:
-			event->irqflags |= IRQF_TRIGGER_RISING |
-					   IRQF_TRIGGER_FALLING;
-			break;
-		}
-	}
-
-	event->handle = evt_handle;
-	event->handler = handler;
-	event->irq = irq;
-	event->irq_is_wake = acpi_gpio_irq_is_wake(chip->parent, agpio);
-	event->pin = pin;
-	event->desc = desc;
-
-	list_add_tail(&event->node, &acpi_gpio->events);
-
-	return AE_OK;
-
-fail_unlock_irq:
-	gpiochip_unlock_as_irq(chip, pin);
-fail_free_desc:
-	gpiochip_free_own_desc(desc);
-
-	return AE_OK;
-}
-
-/**
- * acpi_gpiochip_request_interrupts() - Register isr for gpio chip ACPI events
- * @chip:      GPIO chip
- *
- * ACPI5 platforms can use GPIO signaled ACPI events. These GPIO interrupts are
- * handled by ACPI event methods which need to be called from the GPIO
- * chip's interrupt handler. acpi_gpiochip_request_interrupts() finds out which
- * GPIO pins have ACPI event methods and assigns interrupt handlers that calls
- * the ACPI event methods for those pins.
- */
-void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
-{
-	struct acpi_gpio_chip *acpi_gpio;
-	acpi_handle handle;
-	acpi_status status;
-
-	if (!chip->parent || !chip->to_irq)
-		return;
-
-	handle = ACPI_HANDLE(chip->parent);
-	if (!handle)
-		return;
-
-	status = acpi_get_data(handle, acpi_gpio_chip_dh, (void **)&acpi_gpio);
-	if (ACPI_FAILURE(status))
-		return;
-
-	if (acpi_quirk_skip_gpio_event_handlers())
-		return;
-
-	acpi_walk_resources(handle, METHOD_NAME__AEI,
-			    acpi_gpiochip_alloc_event, acpi_gpio);
-
-	if (acpi_gpio_add_to_deferred_list(&acpi_gpio->deferred_req_irqs_list_entry))
-		return;
-
-	acpi_gpiochip_request_irqs(acpi_gpio);
-}
-EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
-
-/**
- * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
- * @chip:      GPIO chip
- *
- * Free interrupts associated with GPIO ACPI event method for the given
- * GPIO chip.
- */
-void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
-{
-	struct acpi_gpio_chip *acpi_gpio;
-	struct acpi_gpio_event *event, *ep;
-	acpi_handle handle;
-	acpi_status status;
-
-	if (!chip->parent || !chip->to_irq)
-		return;
-
-	handle = ACPI_HANDLE(chip->parent);
-	if (!handle)
-		return;
-
-	status = acpi_get_data(handle, acpi_gpio_chip_dh, (void **)&acpi_gpio);
-	if (ACPI_FAILURE(status))
-		return;
-
-	acpi_gpio_remove_from_deferred_list(&acpi_gpio->deferred_req_irqs_list_entry);
-
-	list_for_each_entry_safe_reverse(event, ep, &acpi_gpio->events, node) {
-		if (event->irq_requested) {
-			if (event->irq_is_wake)
-				disable_irq_wake(event->irq);
-
-			free_irq(event->irq, event);
-		}
-
-		gpiochip_unlock_as_irq(chip, event->pin);
-		gpiochip_free_own_desc(event->desc);
-		list_del(&event->node);
-		kfree(event);
-	}
-}
-EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
-
-void __init acpi_gpio_process_deferred_list(struct list_head *list)
-{
-	struct acpi_gpio_chip *acpi_gpio, *tmp;
-
-	list_for_each_entry_safe(acpi_gpio, tmp, list, deferred_req_irqs_list_entry)
-		acpi_gpiochip_request_irqs(acpi_gpio);
-}
 
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
-- 
2.54.0


