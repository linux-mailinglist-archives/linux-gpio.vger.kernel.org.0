Return-Path: <linux-gpio+bounces-37179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB3vGchnDWquwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:50:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED60589297
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F09F302AE17
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1449E396D19;
	Wed, 20 May 2026 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fidlUptY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016333955ED
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263405; cv=none; b=TCR7qel4oWE4wfvkX9Z8G8PcBAyj7eID6zo70SVyHcykZNAS3A/i6r9KPLTnUdf/SRvknFJ1gY+BWLCUh7NvbhpmutJnKg/UpKjaKSCmLwkcxuNxVZdDKCkoeSho6VyHvgb43+IjPUN/+ICP7eDtbepPdu7lRW66pkXxBWTWUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263405; c=relaxed/simple;
	bh=JpwGT7jPG6Jpd6iciTDyHBYp8cTWxrIHabsT4vt79w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bwv6hmRneWROP3qYvXFp/MdlaHf8y+iaxLJPEcNv1GO1LKqRZk6qso9j9FqX04ZiYqJyyla9+gcTRK0h4MPu+JZkMO2KXMvUaJPXxDQWC56bqLp8dhXjOux+DLEV0LPXUnKStHSI8JZjPyP+XwJd7w3fOAayC6up8C0FKSTrS2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fidlUptY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso44676905e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263402; x=1779868202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KB4yfPsy6uJwPClVU4IsavfoLMQM3N7e3v0jOtaKpeg=;
        b=fidlUptYPdikL6Z94f+SdSyKPifx3vVnj/IIWFrqNXiWmUXxAWXLVX3AhRCwvRezoG
         BxcmaQ4DWAvjotM6VJENxqwz38CwsDhrwG1bNawSC9nufkg/9OpcvmNYYgwlToT55g+4
         EezXzqsqiayPx0kuTWhXROQgApTJOdi7DORksF1dy/grNJxx/gli+hTYMpB8nMZq7RQK
         rqxhcxlGlx6xaj5iPpmoDyEu/3SXRQASE8z2LqWXWdNgbnN1r02AODVfsRmRsUV6sezP
         4Xec89dB0idQxri9rQ5G0uXPgg/DmIKvKwsELmADJQY/1JJfQQpusMBZO/3b4tXkEzEc
         Di8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263402; x=1779868202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KB4yfPsy6uJwPClVU4IsavfoLMQM3N7e3v0jOtaKpeg=;
        b=pUkIWbuYqsAtYRf5SNyl6h0plWfnpfq89R+nYpJsJJIRajueoB9/qSkkr+t/1kQJbK
         W5l31wBdGF84XPZ13viUaKFqOZVlaDsmJSpn56g6iQYKYL2HutTk4CLi3UsenUfg0r4w
         8tverjxZQuH902dbmrD4V4hnNo7oN95QXPiNKm2Qrbn+opwMYc3MYqhcynuNSliBe3fZ
         D07HUMdMW0iyizVzC1j5ybZWCa624G2Jc14T0JpqITAsmqodKRN3rip1wv6aznBMV5eG
         r7HJaRZQwMaNywq0QL8OAvX0MqEqYRyFuJ1qhCMWY7jG9+5R1bMJFLU6pxOpmy5AFGvp
         oSpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UhSVa7W1pRrDe9x45gMzo1NGkMlqi7IVhR0LZeuWDSkxPbErXBSqUcOYSmum4RXAG3PTh4pbpQWa3@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4kEfOKy7a25ocRJZVi53QknyHhjXS1XKLkucDGseYeb2/BaH
	hW7NDDV4FSynwkmTBN/IxiMTmUVR/m+hCDBexG+DNRpN2jEKGvJYub7P
X-Gm-Gg: Acq92OHGeAuVm7+bNfb4TgOAq1Z6Q5b068UhA/3hMcswMYGOBvEzZ0oFTuJrasUNR+N
	sHokk1VK1YR6AYAldldLtSx6j0ThsVkxMQ7tZxVOXf95rqhTArQS6yR7+gmzMwdfJdlMfC46tV7
	I76bVWBpiHFm7taaLkn1GeFEmJnFoKsW/tX4G1ihMr3Hpz1H7V4D9Fv+QKlGrBxroutr//W77+L
	0U3Uwh+vlAtcgh307fXVF1CGihVG1WOH98xarngrY5kNSernAtFlBmoy6tgZMVVqhh3aLLDPuaw
	v0bV6yYs6QgutvcPzoLy0BSFuLCVUq8fe66xKwGmhD4wTdIF2GT+Pq/DiyhrV+B7GU2h06fG7BV
	7aEx8iCiowZiiBj+3rV/1c44PKeuGQm5lc0bbRYlZcErWXOxNn22Y9S4kYZswIR0gqRvV4Ogbyq
	1lDNjr4wnjSmUzS5fLrvM=
X-Received: by 2002:a05:600c:c087:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48fe60de6a7mr280665505e9.3.1779263402181;
        Wed, 20 May 2026 00:50:02 -0700 (PDT)
Received: from G614PR ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm496536215e9.9.2026.05.20.00.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:50:01 -0700 (PDT)
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
Subject: [PATCH v3 2/2] Fixes: gpiolib: acpi: resource leak in OpRegion
Date: Wed, 20 May 2026 09:45:47 +0200
Message-ID: <20260520074955.55443-3-mscardovi95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37179-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8ED60589297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If acpi_remove_address_space_handler() fails, the cleanup function
acpi_gpiochip_free_regions() previously returned early. This leaks
the connections list and all requested GPIO descriptors.

Similarly, if acpi_gpio_adr_space_handler() fails to allocate a connection
or request a GPIO descriptor during a multi-pin transaction, it exits
without freeing the descriptors and connections that were already allocated
in the same call.

To avoid leaks, introduce a localized new_conns list inside the handler to
track the new connections requested during the current transaction. On
error, roll back only the connections in the new_conns list (avoiding
deadlock on the non-recursive conn_lock and preventing over-cleanup of
historic connections). On success, splice the new_conns list into the
global achip->conns list under the conn_lock.

Additionally, rename the global connection cleanup function to
acpi_gpiochip_free_all_connections() and call it in the GPIO chip teardown
path.

Fixes: 473ed7be0da0 ("gpio / ACPI: Add support for ACPI GPIO operation regions")
Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 133 ++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index a6d78dad299e..f891451ef0ba 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1094,6 +1094,46 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
 }
 EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
 
+static void acpi_gpiochip_free_connection_list(struct list_head *list)
+{
+	struct acpi_gpio_connection *conn;
+	struct acpi_gpio_connection *tmp;
+
+	list_for_each_entry_safe_reverse(conn, tmp, list, node) {
+		gpiochip_free_own_desc(conn->desc);
+		list_del(&conn->node);
+		kfree(conn);
+	}
+}
+
+static void acpi_gpiochip_free_all_connections(struct acpi_gpio_chip *achip)
+{
+	guard(mutex)(&achip->conn_lock);
+
+	acpi_gpiochip_free_connection_list(&achip->conns);
+}
+
+static struct acpi_gpio_connection *
+acpi_gpiochip_find_conn(struct acpi_gpio_chip *achip,
+			struct list_head *new_conns, unsigned int pin)
+{
+	struct acpi_gpio_connection *conn;
+
+	list_for_each_entry(conn, &achip->conns, node) {
+		if (conn->pin == pin)
+			return conn;
+	}
+
+	if (new_conns) {
+		list_for_each_entry(conn, new_conns, node) {
+			if (conn->pin == pin)
+				return conn;
+		}
+	}
+
+	return NULL;
+}
+
 static acpi_status
 acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			    u32 bits, u64 *value, void *handler_context,
@@ -1101,11 +1141,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 {
 	struct acpi_gpio_chip *achip = region_context;
 	struct gpio_chip *chip = achip->chip;
+	struct acpi_gpio_connection *other;
+	struct acpi_gpio_connection *conn;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_resource *ares;
 	u16 pin_index = address;
+	LIST_HEAD(new_conns);
 	acpi_status status;
 	int length;
+	u16 shift;
+	u16 word;
 	int i;
 
 	status = acpi_buffer_to_resource(achip->conn_info.connection,
@@ -1129,20 +1174,15 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	length = min(agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		unsigned int pin = agpio->pin_table[i];
-		struct acpi_gpio_connection *conn;
 		struct gpio_desc *desc;
-		u16 word, shift;
-		bool found;
+		bool found = false;
 
 		mutex_lock(&achip->conn_lock);
 
-		found = false;
-		list_for_each_entry(conn, &achip->conns, node) {
-			if (conn->pin == pin) {
-				found = true;
-				desc = conn->desc;
-				break;
-			}
+		conn = acpi_gpiochip_find_conn(achip, &new_conns, pin);
+		if (conn) {
+			desc = conn->desc;
+			found = true;
 		}
 
 		/*
@@ -1163,34 +1203,62 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			}
 		}
 
+		mutex_unlock(&achip->conn_lock);
+
 		if (!found) {
 			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
 			if (IS_ERR(desc)) {
-				mutex_unlock(&achip->conn_lock);
+				/*
+				 * In case of concurrent handler execution, if
+				 * another thread has already requested the same
+				 * GPIO pin, this call might fail with -EBUSY.
+				 * Acquire the lock and re-check both lists. If
+				 * the other thread has added it in the meantime,
+				 * we use that one.
+				 */
+				if (PTR_ERR(desc) == -EBUSY) {
+					mutex_lock(&achip->conn_lock);
+					conn = acpi_gpiochip_find_conn(achip, &new_conns, pin);
+					if (conn) {
+						desc = conn->desc;
+						found = true;
+					}
+					mutex_unlock(&achip->conn_lock);
+					if (found)
+						goto use_existing;
+				}
 				status = AE_ERROR;
-				goto out;
+				goto err_free_new_conns;
 			}
 
 			conn = kzalloc_obj(*conn);
 			if (!conn) {
 				gpiochip_free_own_desc(desc);
-				mutex_unlock(&achip->conn_lock);
 				status = AE_NO_MEMORY;
-				goto out;
+				goto err_free_new_conns;
 			}
 
 			conn->pin = pin;
 			conn->desc = desc;
-			list_add_tail(&conn->node, &achip->conns);
-		}
 
-		mutex_unlock(&achip->conn_lock);
+			mutex_lock(&achip->conn_lock);
+			/*
+			 * Re-check both lists again before adding to local
+			 * new_conns, as another thread could have completed
+			 * and spliced its list while conn_lock was released.
+			 */
+			other = acpi_gpiochip_find_conn(achip, &new_conns, pin);
+			if (other) {
+				gpiochip_free_own_desc(conn->desc);
+				kfree(conn);
+				desc = other->desc;
+			} else {
+				list_add_tail(&conn->node, &new_conns);
+			}
+			mutex_unlock(&achip->conn_lock);
+		}
 
-		/*
-		 * For the cases when OperationRegion() consists of more than
-		 * 64 bits calculate the word and bit shift to use that one to
-		 * access the value.
-		 */
+use_existing:
 		word = i / 64;
 		shift = i % 64;
 
@@ -1204,9 +1272,19 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 	}
 
+	mutex_lock(&achip->conn_lock);
+	list_splice_tail(&new_conns, &achip->conns);
+	mutex_unlock(&achip->conn_lock);
+
+	status = AE_OK;
+
 out:
 	ACPI_FREE(ares);
 	return status;
+
+err_free_new_conns:
+	acpi_gpiochip_free_connection_list(&new_conns);
+	goto out;
 }
 
 static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
@@ -1229,22 +1307,15 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 {
 	struct gpio_chip *chip = achip->chip;
 	acpi_handle handle = ACPI_HANDLE(chip->parent);
-	struct acpi_gpio_connection *conn, *tmp;
 	acpi_status status;
 
 	status = acpi_remove_address_space_handler(handle, ACPI_ADR_SPACE_GPIO,
 						   acpi_gpio_adr_space_handler);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		dev_err(chip->parent,
 			"Failed to remove GPIO OpRegion handler\n");
-		return;
-	}
 
-	list_for_each_entry_safe_reverse(conn, tmp, &achip->conns, node) {
-		gpiochip_free_own_desc(conn->desc);
-		list_del(&conn->node);
-		kfree(conn);
-	}
+	acpi_gpiochip_free_all_connections(achip);
 }
 
 void acpi_gpiochip_add(struct gpio_chip *chip)
-- 
2.54.0


