Return-Path: <linux-gpio+bounces-37027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJJLIlfGCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2937F5683F7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 329D4301E751
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D3C3E276C;
	Mon, 18 May 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw5DVKb4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA23E0C68
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090865; cv=none; b=jNIwuoRQc/XEDHte6ttOvaX1SZQ7vzpvS8nfVQnpeM6m7wOFgRkzEIL3Ai0awfz0QfQUhiKaJA7SzIRFKavZikywMG0LSwJ3E0w8N7T93O9Z1CfFS17/St+Ho/E4YALVD0Tts1Jk6Ah+ALIy92nS82JFXfoLQ8UtIvexFb2ZCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090865; c=relaxed/simple;
	bh=7VBmQ0QxJnGExiUhZKQxvKL2TL1+qN9rL/V2s5flKv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4FjvTYl8Jyc/YLwUfBuQLRSNPzdnzwWqyQTWcDEOP4CC0pmZpQ25/ekgnCY9Vz+7dXthy5aynymokjXHv/TyMl2+9X1hCOf6j666LomD1xn8KdcYvaCCzbblApFgN5P6fgnxqDhYUEnvKzNDx7afzVf2y7iMW372Oz70h4DQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw5DVKb4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so13581005e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090853; x=1779695653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0KmdNrJVMFxKN/kI/cbQSQ7h8U+WxFfpCT2ri4hO5g=;
        b=Zw5DVKb4+txjkFU/tlwjr4UrSFVvdElZXQqBKvoTXLQifQweWhsJZFNCW2nnojKBHa
         RT+vXKwYUmU1qQ12aKHbCCatF5qytjK6EeZBkQ6HK/fGZweYuNLchJpty/NHDiOLDiZJ
         t5ZO7ptH/vwSLSxS2TRvv0SC8bOIv6NFMAaOBxXx7dq2R5y9sqTQk9jYJT/PbOFZ2MbN
         W9UZjsgYhHsj0QOS0p1f15f6Exp0c8UdKidX1xp0TeUXkp7F6NbNlG+f345W/hPrL1O+
         b/3VWKOCwB8A9g/7pSef8SQLh7ylHA8ka/AdwGQsTWIqHIfUw7la5dyC70crrxcQodJx
         6bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090853; x=1779695653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0KmdNrJVMFxKN/kI/cbQSQ7h8U+WxFfpCT2ri4hO5g=;
        b=rcxpupzMhxXCjmDOPwuxaUOWiVJbxp7gHvsS1h00T0TGIPqH0CGUJ4kzBCF8Mk7n+C
         24Mt58jM51jx4IQklt4Gd2S4bqr2A9KyGfif1XukMZIZFYwP6OJxPy/iqg+oYB6jov5n
         SdDNL20T8hCAuepegMjzHmY6iVhUQTTbYSjsW0OlqgMWPAvw9o5xbOkQ0+IyeJTrnov3
         /L4c5Kbwl2RLT0aErjqp7WlFb8YcsV2WpLig0O9FEpT+0S8eu8gd6IFknH91DZs19JWN
         b+IU0Z5P3hjtDqWcJHoYDP1Lwxlp6RCIhgbOHoEJVlOaFJkkeODZD7KEY4pzktRU4dTf
         OyxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+o8pjUgJQfTqX9TtCYgbVeeMXKQISuDxy2unrM1cDuqvrvaJGXj/W3163PeLFZFbsOMfbcW4g2Ev1f@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0NQvPiWCjbcnA/cSmVKBysc+PcTFFswGDJIS/Rs5MevbLcr7
	vlB/xHqXfzy7UC2y3/PKbcsZGwEDPzS19cxlpx73wfHT+Lot0aZH8shv
X-Gm-Gg: Acq92OGuMOAQjpVbRHHQctpfZUcy5cY2FguG3KKdaUDypWa5NRfSkxAKwxzwBNcSP2C
	ezQsn9S0+LwS8aU8kwuuHyYeyYkQa7G+hMGGqkNAJKlggryUlIn+XGUvr1Qin7TjEVn3oxfBn2H
	I33+ht18GGtgv/rIRM/MrdlrNSVDvclgXqrY9yEO+fowaikuNRzz8O5WPHTY8UM+yNQkzRVhf7A
	b4rd2G0tpRBc8W5N+PTMw8EYlcrTNOBMZHdkVOAcsbG1vauI2e/m7FXHZIBD2JHm+TYzbTFyfgc
	pPqCPLS5iS+vpqQ47JpYnEHDf2Srn0vZv9UCsGVNX87ABsy4diLIJ6fSBn1k5CKls+DNXbRCj0S
	fgQn/+PgV/1KWru4pyZvubyAjkecUtI7Hcocx5mUVZwLHBLsidYPdxvOohUr0cKV+q+wM57B9FS
	RMM7/o/q5JmyO01hk=
X-Received: by 2002:a05:600c:4455:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fe60ea92dmr193027845e9.8.1779090852710;
        Mon, 18 May 2026 00:54:12 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:12 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 09/12] gpiolib: acpi: Remove unused static address space emulation from core
Date: Mon, 18 May 2026 09:53:54 +0200
Message-ID: <20260518075357.112584-10-mscardovi95@gmail.com>
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
X-Rspamd-Queue-Id: 2937F5683F7
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
	TAGGED_FROM(0.00)[bounces-37027-lists,linux-gpio=lfdr.de];
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
 drivers/gpio/gpiolib-acpi-core.c | 120 -------------------------------
 1 file changed, 120 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 4802d4948f89..b8976a0c798e 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1049,126 +1049,6 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
 }
 EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
 
-static acpi_status
-acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
-			    u32 bits, u64 *value, void *handler_context,
-			    void *region_context)
-{
-	struct acpi_gpio_chip *achip = region_context;
-	struct gpio_chip *chip = achip->chip;
-	struct acpi_resource_gpio *agpio;
-	struct acpi_resource *ares;
-	u16 pin_index = address;
-	acpi_status status;
-	int length;
-	int i;
-
-	status = acpi_buffer_to_resource(achip->conn_info.connection,
-					 achip->conn_info.length, &ares);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	if (WARN_ON(ares->type != ACPI_RESOURCE_TYPE_GPIO)) {
-		ACPI_FREE(ares);
-		return AE_BAD_PARAMETER;
-	}
-
-	agpio = &ares->data.gpio;
-
-	if (WARN_ON(agpio->io_restriction == ACPI_IO_RESTRICT_INPUT &&
-	    function == ACPI_WRITE)) {
-		ACPI_FREE(ares);
-		return AE_BAD_PARAMETER;
-	}
-
-	if (pin_index >= agpio->pin_table_length) {
-		ACPI_FREE(ares);
-		return AE_BAD_PARAMETER;
-	}
-
-	length = min(agpio->pin_table_length, pin_index + bits);
-	for (i = pin_index; i < length; ++i) {
-		unsigned int pin = agpio->pin_table[i];
-		struct acpi_gpio_connection *conn;
-		struct gpio_desc *desc;
-		u16 word, shift;
-		bool found;
-
-		mutex_lock(&achip->conn_lock);
-
-		found = false;
-		list_for_each_entry(conn, &achip->conns, node) {
-			if (conn->pin == pin) {
-				found = true;
-				desc = conn->desc;
-				break;
-			}
-		}
-
-		/*
-		 * The same GPIO can be shared between operation region and
-		 * event but only if the access here is ACPI_READ. In that
-		 * case we "borrow" the event GPIO instead.
-		 */
-		if (!found && agpio->shareable == ACPI_SHARED &&
-		     function == ACPI_READ) {
-			struct acpi_gpio_event *event;
-
-			list_for_each_entry(event, &achip->events, node) {
-				if (event->pin == pin) {
-					desc = event->desc;
-					found = true;
-					break;
-				}
-			}
-		}
-
-		if (!found) {
-			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
-			if (IS_ERR(desc)) {
-				mutex_unlock(&achip->conn_lock);
-				status = AE_ERROR;
-				goto out;
-			}
-
-			conn = kzalloc_obj(*conn);
-			if (!conn) {
-				gpiochip_free_own_desc(desc);
-				mutex_unlock(&achip->conn_lock);
-				status = AE_NO_MEMORY;
-				goto out;
-			}
-
-			conn->pin = pin;
-			conn->desc = desc;
-			list_add_tail(&conn->node, &achip->conns);
-		}
-
-		mutex_unlock(&achip->conn_lock);
-
-		/*
-		 * For the cases when OperationRegion() consists of more than
-		 * 64 bits calculate the word and bit shift to use that one to
-		 * access the value.
-		 */
-		word = i / 64;
-		shift = i % 64;
-
-		if (function == ACPI_WRITE) {
-			gpiod_set_raw_value_cansleep(desc, value[word] & BIT_ULL(shift));
-		} else {
-			if (gpiod_get_raw_value_cansleep(desc))
-				value[word] |= BIT_ULL(shift);
-			else
-				value[word] &= ~BIT_ULL(shift);
-		}
-	}
-
-out:
-	ACPI_FREE(ares);
-	return status;
-}
-
 
 void acpi_gpiochip_add(struct gpio_chip *chip)
 {
-- 
2.54.0


