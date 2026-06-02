Return-Path: <linux-gpio+bounces-37812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nq9pJ4bCHmocUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:46:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39162DAB2
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=C16qCLnj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37812-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37812-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81201312F8B6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 11:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F593DC877;
	Tue,  2 Jun 2026 11:35:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BF43DCDAF;
	Tue,  2 Jun 2026 11:35:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400149; cv=none; b=KggtOpAlnO1XX+YNuXvUgMMJIMVhJW4LsIkmu14FJyExwshRIrYTEmMe5M1utVsznZR3wFLutGz36RQ8SavPlu/wE9EQwiR1Kb8WinJ4ecsBReuRIH6C4eiVpk0V2F7yU7i/tULSw/hZvKFB+sM/BKMHOtsVBfHIgpgwMPL0+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400149; c=relaxed/simple;
	bh=jMGpikZvigSMZHy2/FhknRaHo+GBSIlwPBVyjDFbtJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxkZguYWcg9tgKpMyN8qPwVv6ppBiLw9uzLmxY8vZhQ8aVcE+P18EOgfkhz7SrqpzULdtsvGfP8PzsmRQmZ9L9ZYm/ZSZohpPEwOk7MGM3onKQDuboQQLxdVp4G4rRcR89T+lY8NK1vCA5XECKrro3Wfrn2Gr+gCl9FEnLtlFrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=C16qCLnj; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8D5CB275FD;
	Tue,  2 Jun 2026 13:35:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qou_dh2eKBy3; Tue,  2 Jun 2026 13:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780400143; bh=jMGpikZvigSMZHy2/FhknRaHo+GBSIlwPBVyjDFbtJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C16qCLnj77YQUu/0XzZDO/frjxj6AirFnq4vU9EfpT3Jy4uMHnysX4zt3BA13ZGxg
	 dZE9luZuW9HEnZsVITkOeK+VQQqPA4oQRLGm/tAurn1/0lKVQfBuL3MtNe0/IXhiS4
	 I3xQ/YNS0l5gI3+Me42ic7bVOozOOKg+LYENG1BpE0SxEFiVHJdfzXt6YAvLSemY7e
	 iHeSmvpvRv+4kLE06ypjWFj+HyLJL79IATAudzHGc/UE0u4aOM824mwd4SZYzyu6W5
	 AgxfL3vWHyB+csYjw8UDBi9vPWOfX4JWMZglqh1JQL/siHWHM0YggC1ec5bLGmDrR3
	 //bDRttJC8b2g==
From: Marco Scardovi <scardracs@disroot.org>
To: andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Tue,  2 Jun 2026 13:32:19 +0200
Message-ID: <20260602113529.52570-2-scardracs@disroot.org>
In-Reply-To: <20260602113529.52570-1-scardracs@disroot.org>
References: <20260602113529.52570-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37812-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mika.westerberg@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,disroot.org:mid,disroot.org:dkim,disroot.org:from_mime,disroot.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F39162DAB2

Ensure that the GPIO pin resource arrays are safely bounded before
accessing indices. Add bounds checking in acpi_request_own_gpiod(),
acpi_gpio_irq_is_wake(), and acpi_gpiochip_alloc_event() to prevent
out-of-bounds array reads if the ACPI namespace provides malformed or
empty pin tables.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..1cb5f5884ff0 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -320,10 +320,17 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
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
@@ -337,7 +344,12 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
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
@@ -367,6 +379,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!acpi_gpio_get_irq_resource(ares, &agpio))
 		return AE_OK;
 
+	if (agpio->pin_table_length == 0)
+		return AE_OK;
+
 	handle = ACPI_HANDLE(chip->parent);
 	pin = agpio->pin_table[0];
 
-- 
2.54.0


