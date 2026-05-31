Return-Path: <linux-gpio+bounces-37735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJJkF0kmHGr9KAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:15:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1561604B
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4804309E3DD
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 12:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656893890EF;
	Sun, 31 May 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="N9TgIdVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516B387364;
	Sun, 31 May 2026 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780229337; cv=none; b=Rfzhb5HOIFFNfuyypmsacDXHBlzNR4tyW6I/Ok+jxLhI9n8Xc1hzAF8D+zBduLSrVwjWwn6fvhp2MarPq/0Vu4Q4OuCl4RL1CrUnEYP5K5E2HRAQl/xQjqLFtS/A0owuRBuQAB4uOMvlYw31Tuw20mF860j5T2a4DV63GvWI8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780229337; c=relaxed/simple;
	bh=Yb9n8lFcDW+MQasQQBR0L1bLDUzcSEP0Rh/ujJ55Wv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGD7fyFxIZIDqIrbaE6BcW2J+ldsVyEk3nPI/p6APybb6X9a3Iel9PChzofOsQnbJPwZXo6FLeNthGc6dJvyZ0pyobEljbCBOtxbPNImOAfj8L/yEKPfWmTq8QgBIF4EXjVO32IOppnPhzWo8oGwc+iRXwz1NtCE2rjkUGy4V/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=N9TgIdVU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5AE5A26E0B;
	Sun, 31 May 2026 14:08:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHmP-Z_jQxTi; Sun, 31 May 2026 14:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780229324; bh=Yb9n8lFcDW+MQasQQBR0L1bLDUzcSEP0Rh/ujJ55Wv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N9TgIdVUVCXj+SCZrIRu3+MtWEy/jSgHsGg5VhUdPGC4D02YA51g5y6ADblVa3R1P
	 8vdKofpJ0cYeTb/shTAaEiIkrB3e+Ohqm8l5YS7wXzTQBAGgYq9XFTLa8Bfu2mBxwU
	 SfLa8YUGYy8uhyoPeRzpaCJi/sqAoUNjFSVxQj1B5SYwyrVQVLLG2JRiib+S5fK5Ek
	 e0zHWN6M/85DdfUqLBJCKVY3/8czPG+0G99Auw+q/ov9uNh+BkcQnDP3chXCsgm2OI
	 5aM1p7zAPhKk2rrR/uvrcIaSKU2UAbEcLGPOB+irwbd+Dsk5o/Wf4ofVNrn/NraoYy
	 Rh/xcEcIyE44g==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH v4 2/4] gpiolib: acpi: fix resource leak in OpRegion
Date: Sun, 31 May 2026 14:03:09 +0200
Message-ID: <20260531120816.17255-3-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37735-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D6A1561604B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>

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
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 142 ++++++++++++++++++++++++-------
 1 file changed, 111 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index a6d78dad299e..e3bc4677b51d 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1094,6 +1094,51 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
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
+/*
+ * Find a connection in the global or local list.
+ * The caller must hold achip->conn_lock to protect the global list.
+ * The local list new_conns is private to the calling thread.
+ */
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
@@ -1101,11 +1146,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1129,20 +1179,15 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1163,34 +1208,66 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			}
 		}
 
+		mutex_unlock(&achip->conn_lock);
+
 		if (!found) {
 			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
 			if (IS_ERR(desc)) {
-				mutex_unlock(&achip->conn_lock);
+				/*
+				 * In case of concurrent handler execution, another
+				 * thread may have already requested the same GPIO,
+				 * causing acpi_request_own_gpiod() to fail with -EBUSY.
+				 * Re-check the visible connection lists and reuse an
+				 * existing connection if one is found.
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
+				struct gpio_desc *desc_to_free = conn->desc;
+				struct acpi_gpio_connection *c_to_free = conn;
 
-		/*
-		 * For the cases when OperationRegion() consists of more than
-		 * 64 bits calculate the word and bit shift to use that one to
-		 * access the value.
-		 */
+				desc = other->desc;
+				mutex_unlock(&achip->conn_lock);
+
+				gpiochip_free_own_desc(desc_to_free);
+				kfree(c_to_free);
+			} else {
+				list_add_tail(&conn->node, &new_conns);
+				mutex_unlock(&achip->conn_lock);
+			}
+		}
+
+use_existing:
 		word = i / 64;
 		shift = i % 64;
 
@@ -1204,9 +1281,19 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1229,22 +1316,15 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
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


