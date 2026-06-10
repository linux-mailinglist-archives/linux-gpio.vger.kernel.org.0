Return-Path: <linux-gpio+bounces-38275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8obCI1qIKWplYwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:52:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACCF66B0E1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:52:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=C4zcVzSm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38275-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38275-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9ABD13036FA6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08857480336;
	Wed, 10 Jun 2026 15:42:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAD41931A;
	Wed, 10 Jun 2026 15:42:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106147; cv=none; b=oT7HX7HlT2cwM01PJ47YwYIkREpSMzkzFIa11CZLvqMHPIm5/Wo9rdAg2/TNzZ0SpLOnYTZChZ2sdLJeUy7xEX+mPcQky6KcXYMhL92LtZvEOpbkUr8QqBnu2xnw9+NjC/KmWxA9eLVT3PKpPT/ZEQrUl4WLDGSMqn5ugIkjhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106147; c=relaxed/simple;
	bh=/fN3ClSTe4U9KLVELdPxIwav4o3WqFFx4c5sUcoQUSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdm9iV6P7l2UxuVMQDg3Fu9kxIIU90kgAOGaZX2+VfGl76GXJTf2iyfkVrb6zXnIns3h69m0NXRYke2gZdW/brlcSfSdOEQ6AIN0eevSkJpvJGoPd5VVdL31c2uHdwHGas9lJ7jNCjTF977V5QikJcEdazYO0W2vsv2EK8Hfw44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=C4zcVzSm; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 64D6926E45;
	Wed, 10 Jun 2026 17:42:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkDPol2vP5IG; Wed, 10 Jun 2026 17:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781106144; bh=/fN3ClSTe4U9KLVELdPxIwav4o3WqFFx4c5sUcoQUSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C4zcVzSm73GCHsYbbSajVCvyhQMvtWCM1XNHo2TQFn2+Y6UUHvOMnS8Kow4YMY2Mk
	 7SBxcU5luSnbK3pXfkZVijKe8q6qYBC9IuSUiKn6yeQeB7ta6rXrl3qYckMbhQwg9v
	 9l0A4TBmhHHpV1fa2oR/GmLI+UH7Bamx7LHrHF9bIC9V6ulNsYUedkG5VjMlHP9bhs
	 XbII2++HdB5fStws2rWZvTCorRkq3XMVCMXMOV48S8jFei6FOBNcOq6xIb+/2XsJ46
	 p7Zn7LY3Ohvd8kdp9YR2GWd87qQJ2XMaBnDn2P4qghGxZg4rRY62riKEOL+ZJVlq6g
	 YYO7PWh9nfwdw==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] gpiolib: acpi: Prevent out-of-bounds pin access in OperationRegion handler
Date: Wed, 10 Jun 2026 17:42:04 +0200
Message-ID: <20260610154204.110379-3-scardracs@disroot.org>
In-Reply-To: <20260610154204.110379-1-scardracs@disroot.org>
References: <20260610154204.110379-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38275-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,disroot.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ACCF66B0E1

The ACPI GPIO OperationRegion handler receives pin offsets as a
64-bit address. Previously, this value could be assigned to a pin index
without validation, potentially causing out-of-bounds access if
the ACPI table provides an invalid offset.

This patch explicitly checks that the 64-bit address is less than
agpio->pin_table_length before using it, returning AE_BAD_PARAMETER
if the check fails. Additionally, it makes the length calculation
overflow-safe and ensures proper unsigned types for loop counters.

This corrects the commit message from v5 to accurately reflect the
underlying issue, removing references to truncation or wrap-around,
which do not occur in ACPICA.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index b09f89832890..220f0ac4204e 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1098,10 +1098,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
@@ -1121,7 +1121,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
-	length = min(agpio->pin_table_length, pin_index + bits);
+	/* address represents GPIO pin index in connection table */
+	if (address >= agpio->pin_table_length) {
+		ACPI_FREE(ares);
+		return AE_BAD_PARAMETER;
+	}
+
+	pin_index = address;
+	length = min_t(unsigned int, agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		unsigned int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.54.0


