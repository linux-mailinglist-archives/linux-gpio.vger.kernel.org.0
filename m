Return-Path: <linux-gpio+bounces-37114-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPhKNh8MDGo5UQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37114-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:07:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB89578A44
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C61430D6623
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36113B3895;
	Tue, 19 May 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZACryWA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B63B2FD6
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174049; cv=none; b=gC9G89hPnNcFRjFVRV5Uz3gf9V8fwfzxLTD541jNCMrnUCxDLeN/Bqj8LY6ffx5thpx1RzDAx6pgi4UTFRwSVdfvjC3Kdej7qGE8i/ueg2OuwBwYRo6FkEk4/d8Y1jBU6nUTZddtKB5BgE2j8IK/GQVbPD9nHtZy0m4j4Hb7iso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174049; c=relaxed/simple;
	bh=ZSp/z1Tj1Jrmgu4eL15wfq9HJ2Umx5HE6Vy5deEwP90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9tlhV2DamLBXrE7dRI43v+Cd7+4AD5bkArEuL7+Vb4mqcxNPgbUW5eebADFqyBj4U8USoWb1ve2wthvif9LdK/cFm945Yjn9+S6Bu21cU5mrKIqNt+wSK4HKtl6UhFaZckYuqA4v/YjCgbRJG+7KGkXL07d4OmVUQX7+CMetfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZACryWA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so22865705e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174046; x=1779778846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jiHQAOvHLYgdNNqQrTT3RCJkY+Y4TVhMjJVagFdqfs=;
        b=QZACryWAEj13f+h5914xQ/BU5TFOZzht+7a9UIk0Fu/m51/KPbipQlUqNPm9c9xo5Z
         oa7RUwgsJuIAqjqX6cZPBCSrQb6GFDfX5XbgY9oUc3V6e1qP2ZYrKpTzxtKj/6DfNy6R
         M9cKdCXsL/BJ5GWj9u6u0tMF1B3vFtoTOyrj04jhLjmrt+ok2Ek+1TK/xHKjnxBRYbt8
         4sMEymqH0FE+Eo4wsWZKubwIGZ31IGj54w5KG2XLm6+LsmFIaabhcc4X9bVUbe0P4qKU
         KeBhASqhX3BsBcz730Dl7o4hmrwM/BNXBNAALvLoCng3ruL7cxtwcqqVareF2yNv6RdA
         zpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174046; x=1779778846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jiHQAOvHLYgdNNqQrTT3RCJkY+Y4TVhMjJVagFdqfs=;
        b=aESu50vKDNJc4LO14+nS/A427KoFT/KBiGnruX5yllVFZQaUtM3xfp/qIocDX4ERd1
         /sM+MYbvb7yK+y/yFN/ZgvGRG2kPkKApVEDe141sPDEF2yfdzlgC2Y5+2FTICD7Njpko
         SQzaW7VTXtCTgd42sBvOtdk5h/p+Kbr+p0o7R0ihx2u5T7wil65khSoSzHMeh8Qdfdub
         eLQU9jMUys2TWRb9Sxj2c+hSE3I3E8ZmocEnP5rdZk0A0SyUsl6bl56iwVZemSvPhWgk
         D6il6Bte/4SF2OqhimqKNyWILHzipS84oDUJR95TA1TT/UuhcbJnHzAuJKXAoMkHrzyT
         yDDw==
X-Forwarded-Encrypted: i=1; AFNElJ8qfuljWgFyi62FgtXIbrPTkKINbXvYPzEQEFZPBhv3eSIPMl/fPHtFfMSccD0pddOu6mM0BhLtORAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKXuB6RWdppt5rhtPEiVPm3VIPx73X7w6OUVCEnGVKsXBAO9I
	KcxMqIbGqkm/Sd43Tu77C2Be9gyBSWHVfR/Tjz/JFqud5eTgii3Naqc+FhqKqzaY+4I=
X-Gm-Gg: Acq92OEAixG128MHD3Fg0tsYSPHMLInR+vozRm44wC1cmrDRgvMPsYf/nt6QjDgIUsP
	trdAB0872LzUeLXpscTDcCXQy47e+Bdz1GiSGwUo0CcFk2WJAiZLg0QIy3pymq9FExghM5jSPFE
	+USryZF1kypcLM8ZGpUoLkOWvTJz52M7oJGGDB/hWhL6xMby4M6IOgYYqKBns8gz8yTNIsl8EnJ
	e/X6YqdEB/RmlMLjVdPGv0E3OkyrAmnVbX2Fv01kLXbytMOGYmwe3Akoj1kiPctlVMUknHBS/b4
	ZnwgUD4qT0qkcRZ66+oG4bw12Yun/ZkYU0sXTQlWRYlzITczbAAHR1UQ7HvBI/BIB9dEfjuxHkT
	t3U/vui2esGaWTIUxF0BDkIc4Ab29yDvoMmTlB8U8fCG5nEjxRuXrLbU/JqrMla18eKi5XKDn+N
	bYq2KNGGvvjx5xdOv68KuKOaOTl2nphQ==
X-Received: by 2002:a05:600c:4692:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-48fe63253e0mr289793925e9.20.1779174045400;
        Tue, 19 May 2026 00:00:45 -0700 (PDT)
Received: from G614PR ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm149177055e9.4.2026.05.19.00.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:00:44 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mscardovi95@gmail.com,
	westeri@kernel.org
Subject: [PATCH 1/2] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Tue, 19 May 2026 09:00:30 +0200
Message-ID: <20260519070039.9280-2-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519070039.9280-1-mscardovi95@gmail.com>
References: <20260518103302.GO84797@black.igk.intel.com>
 <20260519070039.9280-1-mscardovi95@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37114-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3BB89578A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that the GPIO pin resource arrays are safely bounded before
accessing indices. Add bounds checking in acpi_request_own_gpiod(),
acpi_gpio_irq_is_wake(), acpi_gpiochip_alloc_event(), and
acpi_gpio_adr_space_handler() to prevent out-of-bounds array reads if
the ACPI namespace provides malformed or empty pin tables.

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..d381631ba6f0 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -322,9 +322,14 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
 {
 	int polarity = GPIO_ACTIVE_HIGH;
 	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
-	unsigned int pin = agpio->pin_table[index];
+	unsigned int pin;
 	struct gpio_desc *desc;
 
+	if (index >= agpio->pin_table_length)
+		return ERR_PTR(-EINVAL);
+
+	pin = agpio->pin_table[index];
+
 	desc = gpiochip_request_own_desc(chip, pin, label, polarity, flags);
 	if (IS_ERR(desc))
 		return desc;
@@ -337,7 +342,12 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
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
@@ -367,6 +377,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!acpi_gpio_get_irq_resource(ares, &agpio))
 		return AE_OK;
 
+	if (agpio->pin_table_length == 0)
+		return AE_OK;
+
 	handle = ACPI_HANDLE(chip->parent);
 	pin = agpio->pin_table[0];
 
@@ -1110,6 +1123,11 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
+	if (pin_index >= agpio->pin_table_length) {
+		ACPI_FREE(ares);
+		return AE_BAD_PARAMETER;
+	}
+
 	length = min(agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		unsigned int pin = agpio->pin_table[i];
-- 
2.54.0


