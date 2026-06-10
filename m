Return-Path: <linux-gpio+bounces-38273-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+9TF6KJKWrUYwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38273-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:58:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8666B195
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=kEpSL967;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38273-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38273-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6DB830AAFCD
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5730944105C;
	Wed, 10 Jun 2026 15:42:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DFC40F8CC;
	Wed, 10 Jun 2026 15:42:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106147; cv=none; b=TO9e0lWpXN18penMn08OlDVwfZkL27eiyloOyaTQcPhQ+0UZwfitTKHwCZ6KE9lmYEMthXgcvr7fNuFntVn3kmcExp+rIiyTQVEqT01AANgoQhGeKSa3nNrmVLlfgAzRqApe3O0fmudVLZIiVdN2yEEh8IlZYSZtwKautr509JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106147; c=relaxed/simple;
	bh=02qHKq/wpjrU3Zpo+QXsFmqiJeihLt2qusX03B77E08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d80XgkX+qxTtP6c5AmruheyLifDVGWkGcg0rX19Up8hUBqtYj/Npvk1Vn1f0ijJOqksVo8HrhRiL/kylD/Zi68ji1Y0VVT3+95kJ92ILYW83YhB9OGNBfg7QlMuBIFFRT8sro26/ToboQYKGoV8Juyr2UxTBmzriTp4w3XakM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kEpSL967; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 82ED126FC5;
	Wed, 10 Jun 2026 17:42:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zq8J03xMRTJR; Wed, 10 Jun 2026 17:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781106143; bh=02qHKq/wpjrU3Zpo+QXsFmqiJeihLt2qusX03B77E08=;
	h=From:To:Cc:Subject:Date;
	b=kEpSL9675VQ0x9ALIGY7PCDomcC3pCHP/JMyV1426y6hEcB0A//AUCcWPGJo+sJ41
	 HbKF8YGXL0ZRl5QNpgeGG1m7PJ3TJEBZ+qh84jBzkrG1XtrTV8ZaHzYmugobQ02pdF
	 d/+kvDYNMtmtl0k0YAQCDgBWxUzisIORF7bWodpL2NqXhqGYBfCdqEGrSAAI+viNYb
	 E4b/qDD4zHkZ8cyS50Jwt7J7rtXqTrqHMWZojXUv5Q6tNQ0JKpEiU2ONcCt7NUcPzD
	 rQlBcs6axdy7QzbZubIVFpy1I9dDERqar7GfddCpjziA9hMYuYvo5a3aUBYYhAgmPH
	 5/xw22LozPpmA==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and safe address handling
Date: Wed, 10 Jun 2026 17:42:02 +0200
Message-ID: <20260610154204.110379-1-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38273-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:mid,disroot.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66A8666B195

Hi all,

The series adds explicit bounds checking for GPIO pin accesses and
ensures safe handling of ACPI addresses in OperationRegion handlers,
without referring to truncation or wrap-around behavior, which does
not apply.

Changes in v6:
- Rebased onto next-20260609.
- Corrected commit messages to describe bounds checking and
  safe ACPI GPIO address handling.
- Removed references to truncation or wrap-around behavior.
- No code changes compared to v5.

Changes in v5:
- Changed the types of length and loop counter 'i' to unsigned int in
  acpi_gpio_adr_space_handler() to prevent signedness mismatches.
- Replaced the min() macro in the length calculation with an
  overflow-safe check (bits > agpio->pin_table_length - pin_index)
  to prevent integer overflow.
- See v5 series at:
  https://lore.kernel.org/linux-gpio/20260602113529.52570-1-scardracs@disroot.org/

Changes in v4:
- Dropped the connection resource leak fix to keep the series focused
  strictly on bounds-checking and address validation.
- See v4 series at:
  https://lore.kernel.org/linux-gpio/20260531120816.17255-1-scardracs@disroot.org/

Changes in v3:
- Fixed a global over-cleanup bug in the error path of the OpRegion
  handler.
- See v3 series at:
  https://lore.kernel.org/linux-gpio/20260520074955.55443-1-mscardovi95@gmail.com/

Changes in v2:
- Split the original single patch into two distinct patches: one for
  bounds checking in the event/wakeup path, and one for safe
  handling of ACPI addresses.
- See v2 series at:
  https://lore.kernel.org/linux-gpio/20260519070039.9280-1-mscardovi95@gmail.com/

Changes in v1:
- Initial submission of the refactored, hardened, and modularized
  ACPI GPIO core.
- See v1 series at:
  https://lore.kernel.org/linux-gpio/20260518075357.112584-1-mscardovi95@gmail.com/

Marco Scardovi (2):
  gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
  gpiolib: acpi: Prevent out-of-bounds pin access in OperationRegion
    handler

 drivers/gpio/gpiolib-acpi-core.c | 38 +++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.54.0


