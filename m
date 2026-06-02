Return-Path: <linux-gpio+bounces-37814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /LZWJpbCHmofUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:46:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFDF62DABF
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:46:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=Qk+2i97Q;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37814-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37814-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E12830B22D8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 11:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1083DA5A3;
	Tue,  2 Jun 2026 11:35:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0C3DB32F;
	Tue,  2 Jun 2026 11:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400156; cv=none; b=YDO6aFHZdhSuWGCU+VHttnlWFr5W5HaqPqeF3HJCRdqaCfbSteVbGUc0brt+1pJZafO3CtWDDrYKl8TMaE5oIo6urEjxUGjPeTo0AxSGuLu2/SwqDq9AxKM2va7aw6II+vP9+GgKavbVKHuFeTHy7hbZ15jQL7BW1xP1U/mHjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400156; c=relaxed/simple;
	bh=RzWl0GGqL6SOGJmG6kKCBBMErb1biX6t/VrEeJ1yUAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRRxtT/Pm/PDIWqXDEogGS4YsQ4d74io3JQyj7ytNceEjaXI74Ysn6JEg3D0KptiCAeTXwMN2klChq5x3B+f/mYUmCSMKqfL0XZkwM6HcCbNlZ0Dn/z+TC3Fl9Mw7+qkinut8YDQhHxxH/F2QhK5AE5LuDOhKOQNT5zVAUsnKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Qk+2i97Q; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 16E40276FC;
	Tue,  2 Jun 2026 13:35:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7h7FqZNqAss1; Tue,  2 Jun 2026 13:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780400143; bh=RzWl0GGqL6SOGJmG6kKCBBMErb1biX6t/VrEeJ1yUAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qk+2i97QJuAl9ZJYZkBQdhx5nyY6AxYLFzNb9d1Hzq3+goGRrWLw3dqELCm3oAc4g
	 SI4gjS78oMEMXqvslkpf/moF8zcI5h837jdH41iqx4JyrKOZI71yD7twzerFsnfqGh
	 inSK5u2jGAK4sgZZbmj6/BD/BS0LyzNYCMfO7QVTW1JMvMnfdNZ/P3XR9y9xuQudjv
	 Kq+b/RA9JN2mSseMj9pboRS2TRDe9k6Tpw3XTIyYRoo1kN8dV/TpCxUKMmvmESpsdw
	 UJQDZx3srXhoOqPmMswmhbVoReuWKnogU3Cr5SLeEcZ84TV9ciG2ch38zf99fLMe9M
	 Iu0KmvpaWXyGw==
From: Marco Scardovi <scardracs@disroot.org>
To: andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] gpiolib: acpi: prevent address truncation in OperationRegion handler
Date: Tue,  2 Jun 2026 13:32:20 +0200
Message-ID: <20260602113529.52570-3-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37814-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,disroot.org:mid,disroot.org:dkim,disroot.org:from_mime,disroot.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CFDF62DABF

The ACPI address space handler for GPIO OperationRegions receives the
pin offset as a 64-bit acpi_physical_address. However, the handler
truncates this address to a u16 pin_index before validating it.

If an ACPI table attempts to access a pin offset greater than 65535,
the truncation wraps the index around. This may result in accesses to
unintended GPIO pins.

Fix this by adding an explicit check to verify that the 64-bit address
is less than agpio->pin_table_length before assigning it to the u16
pin_index, returning AE_BAD_PARAMETER if it is out of bounds.
Additionally, make the length calculation overflow-safe and change the types
of length and loop counter to unsigned.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 1cb5f5884ff0..fc157ee9ac61 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1102,10 +1102,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_resource *ares;
-	u16 pin_index = address;
+	unsigned int length;
 	acpi_status status;
-	int length;
-	int i;
+	unsigned int i;
+	u16 pin_index;
 
 	status = acpi_buffer_to_resource(achip->conn_info.connection,
 					 achip->conn_info.length, &ares);
@@ -1125,7 +1125,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
-	length = min(agpio->pin_table_length, pin_index + bits);
+	if (address >= agpio->pin_table_length) {
+		ACPI_FREE(ares);
+		return AE_BAD_PARAMETER;
+	}
+
+	pin_index = address;
+	if (bits > agpio->pin_table_length - pin_index)
+		length = agpio->pin_table_length;
+	else
+		length = pin_index + bits;
 	for (i = pin_index; i < length; ++i) {
 		unsigned int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.54.0


