Return-Path: <linux-gpio+bounces-37731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNjcJB4mHGr9KAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:14:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4C616017
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF46D30923BA
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA218388863;
	Sun, 31 May 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="U1sMHIie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D99372060;
	Sun, 31 May 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780229335; cv=none; b=ngjSh2PqHdVK77/fDJ51l1SRN42Nb1gxe7vcta+7A6TBMlNNZm35beYMRR10K8bwy3u7RtPP6b3PI/0HR+rhUvmcZEncTPDavYJ7Zc5L/aVZ6nRQCU+ehbDqMZeLJFknEcJ33lQOGIR7ho9mZQWGsWr0jIhiqlcNs5qChBz74dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780229335; c=relaxed/simple;
	bh=u6D4zdE90Ve91CPs/6pwoaUfNtMmQRlM+yna60Mgjy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dq7RNMHYo5298epcke3MfBBQPLsB7y5Dr/B6RKOAWYOrQrDNFZVYKtI2ETRD+8haCEtBFmMksSB7D5530UX3hNKsuu9z6iItXlq7/iBFBB8nbi6SWYlFPOwCZnux0hAhfaSJDYhikWMrxXZqgix0gWj6KJBLDXicuCNxVDNAPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=U1sMHIie; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D8D7A263EA;
	Sun, 31 May 2026 14:08:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znppmHezfKLk; Sun, 31 May 2026 14:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780229323; bh=u6D4zdE90Ve91CPs/6pwoaUfNtMmQRlM+yna60Mgjy4=;
	h=From:To:Cc:Subject:Date;
	b=U1sMHIieHvIwF2Ni30wkS92flRE5nHxgHRCE/F0ZXkTrwo7fnzQ7AeEbzFDH/SCtz
	 48LSW76nDaw5oan72l510gOcH+SFA/S5MI2gPuZDJBGGb7cNSTuFAOSAetDg7w/7/+
	 Alb0tkqPt2NMq6CJ3wTPQevShdyeaR3TGjvfEQWN+FKQj0XGYOj6REBpM9fiPJj2EA
	 UVlTBTxQ5RuGncxmy70X2TsrukheCBpMqGV4ZrYdPgmbz2jwWpD9RUViNweofU22ZT
	 Hv1kkd8VspWQmRmENBCdkqXkiSBuJ6uyc2OLED/2NUJ9naCORbO4tY0Wpeixq/LjO3
	 EGu3HwyDM8T9A==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] gpiolib: acpi: Consolidated fixes and bounds checking
Date: Sun, 31 May 2026 14:03:07 +0200
Message-ID: <20260531120816.17255-1-scardracs@disroot.org>
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
	TAGGED_FROM(0.00)[bounces-37731-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: 42C4C616017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,
while reviewing my patches I ended up noticing these two were concurrent of
the same problem so I ended up merging them and opening a new thread to
avoid any confusion.

lore.kernel.org/linux-gpio/20260518075357.112584-1-mscardovi95@gmail.com/
lore.kernel.org/linux-gpio/20260524162708.62949-1-scardracs@disroot.org/

Please mind to check the 1st one before reviewing it as it contains some
of @Andy's comments on it.

This series consolidates various fixes and bounds-checking improvements
for gpiolib-acpi.

- Patch 1: Adds robust bounds checking for GPIO pin resource arrays.
- Patch 2: Fixes a resource leak and concurrent access race in the
  GPIO OperationRegion address space handler.
- Patch 3: Prevents physical address truncation from 64-bit to 16-bit
  in the OperationRegion handler.
- Patch 4: Prevents out-of-bounds pointer arithmetic in
  acpi_gpio_package_count when counting GPIOs.

Changes in v4:
- Merged the address truncation and package count pointer arithmetic
  bounds-checking fixes into this unified patch series.
- Cleaned up the OperationRegion handler modifications to avoid
  conflicts between the leak fix and truncation check.
- Added code documentation comments explaining locking requirements in
  acpi_gpiochip_find_conn().
- Reworded the commit subject line of Patch 2 to follow standard
  kernel conventions.
- Optimized the concurrent double-request rollback path in Patch 2 to
  free the descriptor outside the mutex (`conn_lock`) to prevent
  potential lockdep issues.
- Refined the `-EBUSY` recovery comment in Patch 2 to accurately
  characterize it as a best-effort recovery path.

Marco Scardovi (2):
  gpiolib: acpi: prevent address truncation in OperationRegion handler
  gpiolib: acpi: fix out-of-bounds pointer arithmetic in
    acpi_gpio_package_count

Marco Scardovi (scardracs) (2):
  gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
  gpiolib: acpi: fix resource leak in OpRegion

 drivers/gpio/gpiolib-acpi-core.c | 186 ++++++++++++++++++++++++-------
 1 file changed, 147 insertions(+), 39 deletions(-)

-- 
2.54.0


