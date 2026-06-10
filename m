Return-Path: <linux-gpio+bounces-38274-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iMFtDVmIKWpkYwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38274-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:52:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF566B0DC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=i73Y9Co7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38274-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38274-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 281893152592
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956ED47F2CB;
	Wed, 10 Jun 2026 15:42:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BF4183DE;
	Wed, 10 Jun 2026 15:42:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106147; cv=none; b=ArZoF5f5SVRxS5CzaoAQB919s5CBZa0WOAk3pkqMGf5mfzutpQ3eBxDoQBoUIHvJR01A/5w7OHS4MAIS3XuPZGgRUw1SZnzz9nzy8r7cFq5967qYp5g8B5agenApOnKD1mZbOz+k8QRXFlrR0r5OzhSXeA9LxkVugdoEmKjf1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106147; c=relaxed/simple;
	bh=Q43iKv+bRAYvDzMXpVYT3u65R0lwEyJOxcTRepBWI3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bG0OIN5rgNQLvc8y+62kBchJYA162+bXp54nCC5beo50a9JH9yY/+Zh7o+laqR//4gH7u/5w7oZElnR/GDdHPxumVStecfN/FUNVtum1vh4nrjsafnfoo4nLZZ29g9TKu3tsnd33QLjz133ZvQsuctKJD1+QPi5zwynRbxhTa2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=i73Y9Co7; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D63B926597;
	Wed, 10 Jun 2026 17:42:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_sjUvGvzZ9a; Wed, 10 Jun 2026 17:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781106144; bh=Q43iKv+bRAYvDzMXpVYT3u65R0lwEyJOxcTRepBWI3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i73Y9Co7gndhSOPpeVLPio+u0mCjjagnLqlV3VBIH4/7pRya+f/gQ/aIIMRZ6yh5X
	 MbKGyQLa6WTUK1jAZG0Po1rKdf/pIMjitCj5XpfWe1DZ91duJntrE2Nqm58W9kwo8L
	 B1ldmaGQqzMFPyAvr/GCe0bkoDYchuBenkA6FAqnZwhLNF/8f4bWnY8+ZxkCKEDjEt
	 m40eC/aT8GrUPXh5YrsGIkJuqLIH3HDR3l566c4xcMsI2RQtRwUGe0EKDveSBvxUTt
	 5CJyxOD1PX6RFn9nQG7RKObqPYFZE7+Ul62LUXtt1kuvRh9Hy55yEOYvhY6qSIBNmq
	 p1eO82Sc/ke/A==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Wed, 10 Jun 2026 17:42:03 +0200
Message-ID: <20260610154204.110379-2-scardracs@disroot.org>
In-Reply-To: <20260610154204.110379-1-scardracs@disroot.org>
References: <20260610154204.110379-1-scardracs@disroot.org>
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
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38274-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,disroot.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBBF566B0DC

Ensure that GPIO pin resource arrays are safely bounded before accessing
indices. Add explicit bounds checking in acpi_request_own_gpiod(),
acpi_gpio_irq_is_wake(), and acpi_gpiochip_alloc_event() to prevent
out-of-bounds array reads if the ACPI namespace provides malformed or empty
pin tables.

This change addresses potential safety issues arising from
inconsistent or invalid ACPI pin tables. It does not alter functional
behavior in well-formed tables.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 1a762a2988b7..b09f89832890 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -316,10 +316,17 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 						unsigned int index,
 						const char *label)
 {
-	int polarity = GPIO_ACTIVE_HIGH;
-	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
-	unsigned int pin = agpio->pin_table[index];
+	enum gpiod_flags flags;
 	struct gpio_desc *desc;
+	unsigned int pin;
+	int polarity;
+
+	if (index >= agpio->pin_table_length)
+		return ERR_PTR(-EINVAL);
+
+	pin = agpio->pin_table[index];
+	polarity = GPIO_ACTIVE_HIGH;
+	flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
 
 	desc = gpiochip_request_own_desc(chip, pin, label, polarity, flags);
 	if (IS_ERR(desc))
@@ -333,7 +340,12 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 static bool acpi_gpio_irq_is_wake(struct device *parent,
 				  const struct acpi_resource_gpio *agpio)
 {
-	unsigned int pin = agpio->pin_table[0];
+	unsigned int pin;
+
+	if (agpio->pin_table_length == 0)
+		return false;
+
+	pin = agpio->pin_table[0];
 
 	if (agpio->wake_capable != ACPI_WAKE_CAPABLE)
 		return false;
@@ -363,6 +375,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!acpi_gpio_get_irq_resource(ares, &agpio))
 		return AE_OK;
 
+	if (agpio->pin_table_length == 0)
+		return AE_OK;
+
 	handle = ACPI_HANDLE(chip->parent);
 	pin = agpio->pin_table[0];
 
-- 
2.54.0


