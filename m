Return-Path: <linux-gpio+bounces-37022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN0JJ0zICmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:05:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 247275685DD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD29530488D9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6D03E1204;
	Mon, 18 May 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0m7rbk9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812A2E975E
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090857; cv=none; b=q3D9xlZcd90BkaitIwjsZTl8s5kOOKdncbt/zdVsg7n85CqF0DlfDxB21dhZOWS+EPwiXE5mOW04E1Qhh/NX2sUbnN+G2sEixlGTfx3RxZf/N3gn/GnqqxFdbOfgyoiqmDHUf5rygw8xf+XkI/3nFHDKn/7c2qjlInHKKwsUXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090857; c=relaxed/simple;
	bh=MSoorrxg8uzper7S6y38HW3VXpbkdEo9+GwAwliU7VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSS6Wxtyn7Xi3PVd4e987Eswve7MeFLeaebCbDhwx0K4uhuKpNNa3mMFTOOKEiK1uJIoScrjwT+nf5nTSQU9rsLBHkMWbrAgsImOq2qPsB0M/4AzAsy8eQVvfzvYsXaLzVAGnneoeSEtiJRKV+zaoYyjCGIbNKaFJEQKl//QIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0m7rbk9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso22447975e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090849; x=1779695649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN7GTrvsqw+xYYoyO+iJ1HbUPl2cSRua7bHIZ6rl0Bw=;
        b=n0m7rbk9USHwhdkt4AyqCT7X0V8CpLwysC7v6bqFg9lqnMKusqUpqdZOfi7RHoYUxU
         sOmjb1/BGbANeFWSI7IhTltQ8n7NbYXPeIBzsfu+1YxCHXjI/y/g84BFCQeeuWx7EV/4
         5lfJ3cB6HYh6t0s0gRJTZep7+FYNouf3P/SeZ3XzEwFhAXehAdT8QJdilt8M9PO5dC/n
         s/8R5bIpbTua/w60Nj5ylw8Uz/pB4rn5LgvPJD2u8UI4MUHFXpPLL1ILeuPgbMfuPjxm
         sD5XD3iWI0Euo6fdICQDOzeYOaQm7DWYfyeRtbTdT+px6mnNcSKy1+YMy/K+oalY3HXs
         R52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090849; x=1779695649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QN7GTrvsqw+xYYoyO+iJ1HbUPl2cSRua7bHIZ6rl0Bw=;
        b=NdpmKswUdmX5MaGk1tLneT836aKnrkfuhvtE28gJ2E3rvzHC+sSiqzDYqUrq7uekiP
         vh/0IxSIj4FI8QnzSXxdP937jjjhu8ZpttN+d7BBtvhy3JMZLGLtJ//+x6KLW9KE5kjR
         zW4pDLV0g/Yy+4haT8fcU9BenjAlgAXYKLht06KaBhlJS6ECK3Ted90ZwPhJyAFla1Gt
         /+GOy80CYMqBszAnQqu9ULzcpyiURplquPvYOKvLEm2rAAMdO7BFm9tFHlLVlZuVtoyA
         aLsV9EPgqZJQRlfTPkpShBZpHPbZkpn7EAHnZjfXC6H9Y4VQACiGRODibjSLNpK0KocR
         ejaw==
X-Forwarded-Encrypted: i=1; AFNElJ/tdSgWu73tm6cFW2xoYo0PR/R4RPPV6h2i+xHA+vKwPg2wHTUmvqlgWepEKVtgOzIiNnuUXmnm95Pu@vger.kernel.org
X-Gm-Message-State: AOJu0Yybid+mFjR2HKGiwY/soK7QsRhMJRPHEF5fxbmwHQSd+057kmb4
	0mHTO6LUkjfWUDI9kvXIFvFpmO5bKUhN0XldZzm31RlhhmlHIY1Pck21
X-Gm-Gg: Acq92OGA/BXcb5o+OeEexA5Uy56Sbwa8rBX36FTTMFEeOPSbqNuZ/UYspcx7OtS+BNg
	1hEtOm87w4EzzwnrOysQbv+y5FZZL4fRV4NOpJMrR/2geH0FVRZsiDDRlJG715JSp8wY1hRQhBI
	C7U1WoBuAV3XoK+D9GojkaLxMRjhzEEhzZQtYpSDBufgx7XZZsuJgL/TqtCggmz9wSrKhs5VUP6
	5btZn+tbU6WrOjO/ZS6QRjUXNoD9E+86vQvK+FUev5B9DSP3FvEnQtI7Zm0qqw6YF5z+nBBaFA3
	N5mhGIBqts719BWYdMpO+50EqbXzgV4n9E66KrSZt6/9Hw2BZjA6fxswqXZ8XJNq2cV6Z1yu2y9
	mvUm9ojak8LSxsJkr/kuBMAX7MNZX5agO1JgTcKQ5UVRCYBzGaFVdQ0U58Yaf0ZMxYpbd8Zh70n
	917IA0AFRdkCLH9A4=
X-Received: by 2002:a05:600c:a09:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48fe539198fmr198503155e9.13.1779090848818;
        Mon, 18 May 2026 00:54:08 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:08 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 06/12] gpiolib: acpi: Expose core GPIO resource and OpRegion helpers
Date: Mon, 18 May 2026 09:53:51 +0200
Message-ID: <20260518075357.112584-7-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 247275685DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37022-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash

Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 12 ++++++------
 drivers/gpio/gpiolib-acpi.h      |  8 ++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 7217ec5c7fae..afd76301c41f 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -272,10 +272,10 @@ static void acpi_gpio_set_debounce_timeout(struct gpio_desc *desc,
 			   acpi_debounce, ret);
 }
 
-static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
-						struct acpi_resource_gpio *agpio,
-						unsigned int index,
-						const char *label)
+struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
+					 struct acpi_resource_gpio *agpio,
+					 unsigned int index,
+					 const char *label)
 {
 	int polarity = GPIO_ACTIVE_HIGH;
 	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
@@ -1169,7 +1169,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	return status;
 }
 
-static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
+void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
 {
 	struct gpio_chip *chip = achip->chip;
 	acpi_handle handle = ACPI_HANDLE(chip->parent);
@@ -1185,7 +1185,7 @@ static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
 			"Failed to install GPIO OpRegion handler\n");
 }
 
-static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
+void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 {
 	struct gpio_chip *chip = achip->chip;
 	acpi_handle handle = ACPI_HANDLE(chip->parent);
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index bd857ead9dcc..6729da5a6fb7 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -55,6 +55,14 @@ struct acpi_gpio_chip {
 	struct list_head deferred_req_irqs_list_entry;
 };
 
+struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
+					 struct acpi_resource_gpio *agpio,
+					 unsigned int index,
+					 const char *label);
+
+void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip);
+void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip);
+
 #ifdef CONFIG_ACPI
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
-- 
2.54.0


