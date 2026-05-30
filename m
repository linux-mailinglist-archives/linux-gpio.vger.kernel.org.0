Return-Path: <linux-gpio+bounces-37710-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GgBGsuwGmoH7ggAu9opvQ
	(envelope-from <linux-gpio+bounces-37710-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:41:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02460BEA1
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC5D302BA4E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADD23630B2;
	Sat, 30 May 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dmGHJktd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3F2C3268;
	Sat, 30 May 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134031; cv=none; b=FnL1kRhm5wpwdoc/Sq3kXSIws0POv+fG48Uf8CGAkEOXwhKdf7mhOGRBWIWH55nPsbRPf0YLUHc0+5Q3nHRfh+nGNGY4IpDjN77TMLJ9cxbQwAoG8lLu8ZU2s89alLHmdp8j6tXaFE5O0EAsFRj6nQwOsOh8/lnKGmiCN+qTUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134031; c=relaxed/simple;
	bh=hbcu3T4OPsbIjWTBL8nVe9jRtvzIWg0hIdvGdWAlHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VySHJsyotn7o/mzG5uiw1nDQ+rzeO7jHNvIwjOPrh748SKJ6tLl4KE3+EWukBMyKaCgBhkAT3YkldfDntQd9K2NvVSgPQdzFJ9qpgm+Ke1BM5COF3pIHptHEHuiBV0wI0trm7cPfMEwFXIsXIHw53z/a36C1+nu6136WrGJR2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dmGHJktd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3C92A27A67;
	Sat, 30 May 2026 11:40:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1tfItejcOiy; Sat, 30 May 2026 11:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780134026; bh=hbcu3T4OPsbIjWTBL8nVe9jRtvzIWg0hIdvGdWAlHLI=;
	h=From:To:Cc:Subject:Date;
	b=dmGHJktdzFpxXaoVsWZD9YRcbdXS8JTIWvPaUf+3iMBrHedIMiYzIPhr/UhhCqCY8
	 gEg2rEeEAR+TIRImFCbgLtPcbSJc/LDDLetsf7JN6FEDp0WX6kEqGwa+Jnj3rLm+Gc
	 lfhQBieWDZRh6ji2zpbn5Z36nxeSd/SosoKsLOyGQS67U5qax1dIt9tdkx1h1Ujh0/
	 QhB5MOtjh8aCnaemo+DJQAeQsCuTK3woNzwMNdSLBGgM8o+N+ruojDbrO2oDQSIsvS
	 noP4iGcwBQhUx0Kjo93Z9nGdYnUUo7fN5+BHgfKNTCI7jt+5qb9DUvS0BNGJy7yM0+
	 eMDU9Zm/Vioww==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/2] gpiolib: acpi: fix bounds-checking bugs in GPIO ACPI core
Date: Sat, 30 May 2026 11:40:10 +0200
Message-ID: <20260530094012.184276-1-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37710-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:mid,disroot.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BE02460BEA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

While reviewing drivers/gpio/gpiolib-acpi-core.c in linux-next,
I noticed two bounds-checking issues in the ACPI GPIO handling paths.

The first issue is in acpi_gpio_adr_space_handler(), where the
64-bit ACPI OperationRegion address is truncated to u16 before
validation against pin_table_length. This can cause out-of-range
addresses to wrap around and access unintended GPIO entries.

Depending on platform firmware configuration, this could potentially
affect GPIO lines associated with sensitive hardware controls.

The second issue is in acpi_gpio_package_count(), where malformed
_DSD packages can cause pointer advancement past the package end
during element parsing, potentially resulting in out-of-bounds reads.

This series fixes both issues by:

- Validating the full address range before truncation
- Making the length calculation overflow-safe
- Validating remaining package elements before pointer advancement

The fixes are intentionally minimal and preserve the existing
behavior of capping ranges that extend past the end of the pin table.

Patch 1 also converts the related loop variables to unsigned types
for consistency with the updated arithmetic.

Thanks,
Marco

Marco Scardovi (2):
gpiolib: acpi: prevent address truncation in OperationRegion handler
gpiolib: acpi: fix out-of-bounds pointer arithmetic in
acpi_gpio_package_count

drivers/gpio/gpiolib-acpi-core.c | 19 +++++++++++++++----
1 file changed, 15 insertions(+), 4 deletions(-)

--
2.54.0


