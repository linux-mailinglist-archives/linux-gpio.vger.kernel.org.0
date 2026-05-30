Return-Path: <linux-gpio+bounces-37711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOc5K5WwGmoH7ggAu9opvQ
	(envelope-from <linux-gpio+bounces-37711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:40:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E460BE7D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42DAF3038101
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 09:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9074339A81E;
	Sat, 30 May 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TDODwVjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7E338936;
	Sat, 30 May 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134032; cv=none; b=US9cr2/5tNq/8Ojxk39JD8syLxqOAKeYvP+PAuiUMg1ZtF8iFIB4K0Dcx8ttgpzqxuKF/CdhAMquxPrf4QhRFB3t9Mtnd8lhGzTLwAGP81XsG0ofAVUxo09W28EljcuTpPNGM7ohdykTrqpP2lQXcLfdl0cZvAYdt0wYLz4/zM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134032; c=relaxed/simple;
	bh=4MyNFzwVBkzYv0wK7cKWN8TARHvuJ67SzMv4GgTV35I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSE6BPJ24WJqom0DXH32IGZOjRFZrLNZfhTzK1G6ESq+fTBSKInlZsXdnx4bAtUq1Yso+C0axkJZ/AgK2/CspYwVOTCru0lY/fXRnOYEnMmzA9DacVGz2tl0KPXkS73iEC99UCErIsfwGFk4KEbXlYFMyrvqshLl9Bs+fss6kzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TDODwVjj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C770427AC9;
	Sat, 30 May 2026 11:40:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aizgd9R0hPVT; Sat, 30 May 2026 11:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780134027; bh=4MyNFzwVBkzYv0wK7cKWN8TARHvuJ67SzMv4GgTV35I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TDODwVjjCl02yaHbgYO4Ry7uxzW/t1IqTb5qhImjJbGyQiTDUOKhEKK8mdMWAhFi/
	 rFbvr5IlBQbpXAX0QxuDqVQByCudOOSLw1AAaymXw95T7cy3oT+TfgxgyEeBFo5A4E
	 CJWn9kKsmb54LZ6XSz/+y3lch4T2NV0qA7diMD1wdDZExwB54CiuVk6rXUHErgmPWq
	 76B/xpdLvqjtdtEwssodTh9vpJmlq9k1yY2G8dYOsQe+5QOfEg0Q76F/+skYHdbU12
	 ubaJBVBXYk7Robx5ZXUNRfwDtrw8aWNRmtuPuz6UxNbhuyDLTr8/9xk7k3ZkxUiNbZ
	 AO4+l0kHaBTOA==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 1/2] gpiolib: acpi: prevent address truncation in OperationRegion handler
Date: Sat, 30 May 2026 11:40:11 +0200
Message-ID: <20260530094012.184276-2-scardracs@disroot.org>
In-Reply-To: <20260530094012.184276-1-scardracs@disroot.org>
References: <20260530094012.184276-1-scardracs@disroot.org>
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
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37711-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: 724E460BE7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ACPI address space handler for GPIO OperationRegions receives the
pin offset as a 64-bit acpi_physical_address. However, the handler
truncates this address to a u16 pin_index before validating it.

If an ACPI table attempts to access a pin offset greater than 65535,
the truncation wraps the index around. This may result in accesses to
unintended GPIO pins.

Fix this by adding an explicit check to verify that the 64-bit address
is less than agpio->pin_table_length before assigning it to the u16
pin_index, returning AE_BAD_PARAMETER if it is out of bounds.
Additionally, make the length calculation overflow-safe and change the
types of length and loop counter to unsigned.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..049e4cbc14ed 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1087,10 +1087,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1110,7 +1110,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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


