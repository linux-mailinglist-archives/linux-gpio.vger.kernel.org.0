Return-Path: <linux-gpio+bounces-37020-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LxvLwTGCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37020-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4D56832C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35D76300ACB8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B70C3E169F;
	Mon, 18 May 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn8D4q2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58B3E0225
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090853; cv=none; b=bCfDipxbAFOMC6D106H50vF8S7BjOk1S6cNg65XLD98FGm2f8D6bHen4CMPu9OGmFqyUDiQx2+HAQa4ETNKEZBMN7iyET4T+saNC6boTW14Mup8fXQkfoawaF2TY9Ih4lkIUmO9WxSvJF5XwHcLsCOljSQfMJ7F7B1/F1FpKe0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090853; c=relaxed/simple;
	bh=dRrJpo/RFBlXKEJiWCWaT5Y8j+cfkW+t5EzYx2I3Jmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZvRtoEbTTtccNJgYaverqgUfcP/8Q8ut98gluL5uGLKkyIvgY6JYgKCJYzNdric5wphnW8mP+D2g70SLxsHof67JX5M01cfqMzFGOnLJC+kqEmfFym4gdY7maIk8ouL9SqynF1x3xNcL0NXn+FTApYfBskwe6DkeqWZzYCp/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn8D4q2j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488d2079582so17768705e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090844; x=1779695644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i+l+TnhrZLaF02FWG+gAPSZUlHwak2ucKtwF5XZOc0=;
        b=Tn8D4q2jqPgE4EZ5gygR+L6CaAbdXKFUcHGG/hysH0xJtyBuGu9t18KN0oPiRdjfal
         MIgR+fqyexVR9cEPwveWuhmvhdej/Owe8yl+iFoBxgTBZkVc83QbYvjBMuja0f+1pzcY
         VoMS+d24YKOd3By4eybhilnxofTcVdSXbv3FpsnY3ze+dbshVG5sDv3lc510SHmnSz9W
         cmi3bKvIVXI8inmmnNE6PpPansQUkOMgs9fELnS9oCXoBn2jdxq7JUGW9mCrqVundyWK
         znCe8nFQ0367Kzf98EX6m3v1kLU4lXZAbW5U89Mvi5qWZj43CbvjUR0bOQpJeEe9wmuZ
         8+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090844; x=1779695644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9i+l+TnhrZLaF02FWG+gAPSZUlHwak2ucKtwF5XZOc0=;
        b=Zvx8L8MeGaIXpDlrUpq87PRXkPOhRaKrfkDnAJWKJesxDCeDyidC2HP/buYOTSQOh6
         2A8/H1S1CWz2ULxShPEvOEXAyn/v6jAZLSq3b/aZm5kVkcaWCiaJc5tduoSxAPfOaVrL
         IXkVdhiwdPx+cBoJQO1ebn6WqKsWVWzMSg5TA7l+eowri99plx2thRzUcRM9z28Z5HT5
         Lj0+SfQ99QHidSDSMU2QzAGpUvfVhqBKrhz3eY74okUjAcfbRU4fjbfiyC4t9nZd7rj+
         RUfmA3QuBw/34yRgc/Qicr0mfVjVv5a9auEmZ2mk3yC7tyjsMijf1OmKpp6IMiKFVGfr
         +gvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/VtCGJXpJjacZaDwYM5AYVcahmoKg4f4idg0OtsVlLMghE25tUyK9UnK7gYi85pWSBOnBlqbirI3x@vger.kernel.org
X-Gm-Message-State: AOJu0YwglfsDbx9H8xRTLBcmBriNoaQBJSUivGaobxrargn1yMAyolFG
	YIK10qY86uw2Lm8zhL07TvaMvzKVqo/BSCc57+Rz39niXSU7smPTqf3k
X-Gm-Gg: Acq92OGCcjLjVHnYschot+hPrj0lUVWYWWEjrv8/95rKUjoe37lPNcmalrAw5smBU/q
	QKGjtnr8TCHgaNMnkJ3xuPdigLQZ7UO5WUd0D2ILLNLpXCX6RsXpo4fcfgyqyHy2bLGXb61dXLv
	Jmlu87iCN1+idAW89KrBTd+eUdtlHae28e0SgAFyVPbF5FbH90gEkHBW4eNcTLxKkI0JZyuYZ/d
	mO8zefPBTkHPd2ZTM9G00Qt539OL4VnLw/5CZz9bQpV+cGaBRh7D5jC2FNqdrRNMJ2qz1ATucb/
	dTnEGZTyHemHDaVqK55bhgc8iSAh8j1CDddeAqdpCCCyipr1eQxX9t7aC6qrNsly1F03GtqB1VA
	kePphA76XWw8R6PSj43GRqiI2jVBKmGyd59O7Td63az6dP9JrAIvqgLDySEEO9cbQYnddhUkSm8
	oo8otKglk07tlnZQw=
X-Received: by 2002:a05:600c:4692:b0:48f:d5e8:758c with SMTP id 5b1f17b1804b1-48fe6325792mr216525115e9.16.1779090844437;
        Mon, 18 May 2026 00:54:04 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:03 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 03/12] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
Date: Mon, 18 May 2026 09:53:48 +0200
Message-ID: <20260518075357.112584-4-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: ABE4D56832C
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
	TAGGED_FROM(0.00)[bounces-37020-lists,linux-gpio=lfdr.de];
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
 drivers/gpio/gpiolib-acpi-core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 64040b098e91..90bda2d7da57 100644
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
 
@@ -1111,6 +1124,11 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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


