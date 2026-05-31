Return-Path: <linux-gpio+bounces-37733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFYhITAmHGr9KAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:14:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520061602C
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA123014114
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D5388E46;
	Sun, 31 May 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Q6o6G9yU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF33876B8;
	Sun, 31 May 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780229336; cv=none; b=UJ3vM035518zQUJ3wqFM9XrGr5kjmrMclUJTvuTqUCGAWgN8IXINnKGtYsFrFLVFKt3gaG7So5qHugUAahW09YR5f5FfivOmKAlRt6RDkVgpMiQdwhj69q200QQm/8Hc5JHW5huO3Ixb1aywsD7+x647mmktsxVT3OUxBwLvZ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780229336; c=relaxed/simple;
	bh=ao8E/HUJ95Uy8yFMTAXWVrLeFM6seDj/PETTG4aF4W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6QycJG9PqwBrjA8UDWMs2/0oJMy1eeVsFYB7QOIDRbFl+IkV2piTYOsmIghKA3ZNxAsUxRwKOlljYyk4on4cwFMvHk4imUUWSlCwIAZWOy+oKaQaPvM9raygiNAELdaBqzt4Wo0eXgm8KLYZsKUIxF6xSr8e1q7WfLJIl2Wlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Q6o6G9yU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6D31D26A37;
	Sun, 31 May 2026 14:08:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFjZHU4N0jkD; Sun, 31 May 2026 14:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780229323; bh=ao8E/HUJ95Uy8yFMTAXWVrLeFM6seDj/PETTG4aF4W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q6o6G9yU5OUMc6A+ylkAPQDy53az5494r1a1ae0NcWaOlX5LmSackaP3DeYdLgUWL
	 Czdt1gYh6VTztwyEJ/9Na+mtl/pOP/l1hngSfMsJzWsIBSMCmzV1/K75TKMggJs0h6
	 ziMkcf1AZ4ahDX5BTZwF9VVBc8eKTKQZfxIl8tCVpX7vk2NtO8mDeQLp2SSoWCg0yP
	 Yl6Jzuf9+POmrh6Cx1KOJqLIBsvRIDVKWZd4QvGOEtTt0Ft6ckkXpwi0HrSP3zfXlb
	 Y1rd24fGshD+hVshMYRGMaZ3Q5piICEN9Rku4z/T0NliZDzUqxWyzJrCKQ3Cs4+J2o
	 yTqXFISjRGuBg==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH v4 1/4] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Sun, 31 May 2026 14:03:08 +0200
Message-ID: <20260531120816.17255-2-scardracs@disroot.org>
In-Reply-To: <20260531120816.17255-1-scardracs@disroot.org>
References: <20260531120816.17255-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37733-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: 0520061602C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>

Ensure that the GPIO pin resource arrays are safely bounded before
accessing indices. Add bounds checking in acpi_request_own_gpiod(),
acpi_gpio_irq_is_wake(), and acpi_gpiochip_alloc_event() to prevent
out-of-bounds array reads if the ACPI namespace provides malformed or
empty pin tables.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..a6d78dad299e 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -320,10 +320,18 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 						unsigned int index,
 						const char *label)
 {
-	int polarity = GPIO_ACTIVE_HIGH;
-	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
-	unsigned int pin = agpio->pin_table[index];
 	struct gpio_desc *desc;
+	enum gpiod_flags flags;
+	unsigned int pin;
+	int polarity;
+
+	polarity = GPIO_ACTIVE_HIGH;
+	flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
+
+	if (index >= agpio->pin_table_length)
+		return ERR_PTR(-EINVAL);
+
+	pin = agpio->pin_table[index];
 
 	desc = gpiochip_request_own_desc(chip, pin, label, polarity, flags);
 	if (IS_ERR(desc))
@@ -337,11 +345,16 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 static bool acpi_gpio_irq_is_wake(struct device *parent,
 				  const struct acpi_resource_gpio *agpio)
 {
-	unsigned int pin = agpio->pin_table[0];
+	unsigned int pin;
 
 	if (agpio->wake_capable != ACPI_WAKE_CAPABLE)
 		return false;
 
+	if (agpio->pin_table_length == 0)
+		return false;
+
+	pin = agpio->pin_table[0];
+
 	if (acpi_gpio_in_ignore_list(ACPI_GPIO_IGNORE_WAKE, dev_name(parent), pin)) {
 		dev_info(parent, "Ignoring wakeup on pin %u\n", pin);
 		return false;
@@ -368,6 +381,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 		return AE_OK;
 
 	handle = ACPI_HANDLE(chip->parent);
+	if (agpio->pin_table_length == 0)
+		return AE_OK;
+
 	pin = agpio->pin_table[0];
 
 	if (pin <= 255) {
-- 
2.54.0


