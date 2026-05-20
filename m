Return-Path: <linux-gpio+bounces-37178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNDzEHJpDWquwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:57:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AF589428
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E37030E82FC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60501396D2E;
	Wed, 20 May 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM/YiFnH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1C38F945
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263404; cv=none; b=dKSAzAjzvS1bhIxo5Ax32I9AbQa/RqVZ3X/9P+3zxJyD4igtWIJAx+m26nv3QwfCtggH9AOzYP2VD70FR9cT2GPDhhz2bBncZTYWuwkCnHgsjsKtUjSgSeemr9v0zGyi6HeYtgkn9vTGKj0L1IZSZu6ZJbITkeTMexZ6A35Yc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263404; c=relaxed/simple;
	bh=v8QO5wIg8fMTR7uQ8ckLfU5/0hxPkOwG5s8qbIzOad8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1i9MGmxaBhjq8F9lLvnyp+L0pEXAdbB4g/KNIPDZMRqrqFP8oX3/BxYITNYWteglMafWJF/y27L2c9Q5w9Rz0B/u14/+AMa4Efy/gCTdC21zeyiGq+6yRl87C2sH/ibeb8miCguAo5XIoYM9I2kV8mLgl9WLS7GPPB+9eAy6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM/YiFnH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso44676055e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263401; x=1779868201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thg0qkEsY0JjFZeY1AfIvrImoT1KU/tjOzYFDJJSqYU=;
        b=MM/YiFnHIBWAfXqauOYaU6lKNLzl7ah3KqyUBCiksDawFWQoIpv5anAvXv6w/RIZzk
         MGqxLq4ITMXP4dVbc3bO9Pim/NLPkFoFXP5Ei7C4L5wJWYfvJeAlyNeyk8gA845yIq6u
         OehCc0WzW0okoCl25J1LDgIr956hEipd7GhUlR3ektEcJUsrCfgoIPAqbanfEkVSdMfv
         P94GJNwaDuGDW3eg6LqYAnXHpUu+guAmxvf7rha40QeG6zdy9s7V04oOCsxbgdG7hX6j
         xxGB5w8kcle50Qk6g//NO6tb97KokLfH+6Vn7+CQfG3+hXdSOkqEyb6Lg8jelQMWYohM
         jUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263401; x=1779868201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Thg0qkEsY0JjFZeY1AfIvrImoT1KU/tjOzYFDJJSqYU=;
        b=b1SD/xcpB8TCbjFlGo6yCIFlL7quurwtrVe1byTWxdskjbWkjhrD729vCBWI8rJkqQ
         7xGnOzlBB5NeJND8ZL9QFXfYtQJcrVPspSxoPkDB6Pf0zmcWyO2F0regpW023SujSppi
         COaTVjNDR9oKy5bnPk/bV1KKX9iR9Q21fsjs+gLhhrXT2IN3GJ45m29fYAMPBbPtIatv
         MonVro1KqaYW6GfD894oWu9g2i3yhZmExd+P8CMn9NniaZxJcIYuxxgCMLugpXv0laJY
         FZVQPQ3f5N16m3hndFAWulUrn6D+aE/3XSnCWJ9kKnFWYfdsViuw9YAJOKe8OT+o+8vz
         ecbg==
X-Forwarded-Encrypted: i=1; AFNElJ/BZQZ13qG/9+qjyTNONjISqOaake15ayCYeP4DKF6ghf9vJnxQy12DEwkVgtHKVv9uy1VflyXTiyH8@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhvJNcy73jgqjA61Rokx2QJE6JfItkdAkSZwTt5RZzl6t+qwq
	Kb+GWW0t8t/5R5rRJUlOSOCWVNad4zGL5kPmqVO9IWW89piNRNy19N+UPnPzrlGX74w=
X-Gm-Gg: Acq92OEMCAKoK/7okBhb8RbwrN79sSWUPeIkf2I4spye6gq7tEQDmMawhB7cd5mu4ER
	ZazSWqQv4cVVymLgwTYpWqQeT2FvWiNqzsenTh55dXtTo0UmtfDbCXqkfjThqdaSO+bJzN17oV7
	mRZNKOejgFVeqy8q0w1fRpyIKYYhThkQBqUXu9hRDwQlqNXPpzjyjIZzalRaQjl/t6h8mqiDJ5U
	uVzpPd9kM1n9I6//WmENXzhKoEIAWrA9vYVHkVcHXIu5j8MeQstnPg3WRjToKXm0/9FAhO8htHe
	677Nu6vmhiMyEdGUGZ0XaW8p8npZoHmHJtQD57J/SgrBnvVdy8VEwMyAKNyTkssGRQagOc8AAjD
	iNIbWdQMOzXc7y+m6D7Avx4eIeaMAOnHc2HOiWVVyi0SjPrlSigxSU359z/LMf4f19HCxhztkgZ
	LxeJ+89XYaClBqu5utABtuXKJCBoqFIA==
X-Received: by 2002:a05:600c:2ad3:b0:490:f32:3a07 with SMTP id 5b1f17b1804b1-4900f323a11mr124130385e9.30.1779263400772;
        Wed, 20 May 2026 00:50:00 -0700 (PDT)
Received: from G614PR ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm496536215e9.9.2026.05.20.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:50:00 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	mscardovi95@gmail.com,
	westeri@kernel.org
Subject: [PATCH v3 1/2] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Wed, 20 May 2026 09:45:46 +0200
Message-ID: <20260520074955.55443-2-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520074955.55443-1-mscardovi95@gmail.com>
References: <agwfEMtEctXYC1oc@ashevche-desk.local>
 <20260520074955.55443-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37178-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9C2AF589428
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that the GPIO pin resource arrays are safely bounded before
accessing indices. Add bounds checking in acpi_request_own_gpiod(),
acpi_gpio_irq_is_wake(), and acpi_gpiochip_alloc_event() to prevent
out-of-bounds array reads if the ACPI namespace provides malformed or
empty pin tables.

Assisted-by: Antigravity:gemini-3-flash
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


