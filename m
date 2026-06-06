Return-Path: <linux-gpio+bounces-38031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9kHFtGCJGpP7gEAu9opvQ
	(envelope-from <linux-gpio+bounces-38031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 22:28:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578264E3C1
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Jun 2026 22:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=runbox.com header.s=selector1 header.b="JbInsy Y";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38031-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38031-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A3433010811
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 20:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED4E3C76AD;
	Sat,  6 Jun 2026 20:27:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E130C155;
	Sat,  6 Jun 2026 20:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777640; cv=none; b=VANwxK5EuZi4XQYCY0oyCAmEy6w8YcKNySCV0ChnPuvXYyiAw21EJxTEYATfU4Tfjdz1/cWOi/L2wh1DdWOFHkCkh7iSrDkYWofOxQypGfVBHV3qkqGcIsDguOeWN/V8ojI5oiyOgfB37LV9O3sbTrykVTvH+S67BtqXNS7xr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777640; c=relaxed/simple;
	bh=A0NgpOATKymoukHHH3+8FLdZqkQJ6onsWelYuJLP3do=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bqPw9O9Wl+N18B6K+fIt/BpbZQ6Rrjd3Mx94vvDuGr28CWlGuUfCMb7P/4mZblT/w1uOCKpp+LEDDwQIX8YZiZfLQOHWM9aeqfilyJObZwHEgiFhdKe9l5CLaQXwMOJRj4F0O0hIiY2fYfZawo2/Nhy0ssuw4vn8mUeNS/mwcdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=JbInsyYk; arc=none smtp.client-ip=185.226.149.38
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxbq-007cEv-2w; Sat, 06 Jun 2026 22:27:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=SawyyI2hbMh/2wpRXF1d4IAsNJm5CGVO6r3bflxzvJg=; b=JbInsy
	Yk7+1NPBwVn78XQ1iOh1JZbF7nSBVPqIICCEDJCt6L8DldhULeh+Gn3OC1qrGi1DkOlYfuwpjp7cJ
	cWdw93MTIR5qVUI3OHKdSs8sUt4Clbr+uhL6RFI6lEaRLCCxxBHrbS4LAQRTWoH1/UKtsGt8FQq6k
	vb3fmMIvGcnXhY4Oarw4/mchu6+UsNmqGxO9OPZYzwzDbCbw7mJrP8F0PrgCvwj6jKBXnotSf3qDJ
	f2WCPzAbU6w5O0z+K9on2A+m8J8gQD6oktvo0L72pxU6hyYqgovGNpkeIaPzLNX/VxdKR8+foy2Ip
	yh+L8K2cBAi/GinfYd2ZnPF3DmJw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxbp-0000sq-O7; Sat, 06 Jun 2026 22:27:09 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wVxba-006V18-E4;
	Sat, 06 Jun 2026 22:26:54 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] gpiolib: Replace strcpy() with memcpy()
Date: Sat,  6 Jun 2026 21:25:57 +0100
Message-Id: <20260606202633.5018-3-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38031-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:david.laight.linux@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[runbox.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,runbox.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4578264E3C1

From: David Laight <david.laight.linux@gmail.com>

The length of the string is calculated in order to allocate the correct
sized memory block, use the same length to copy the string.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..74d55978e2b4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -143,13 +143,15 @@ static void desc_free_label(struct rcu_head *rh)
 static int desc_set_label(struct gpio_desc *desc, const char *label)
 {
 	struct gpio_desc_label *new = NULL, *old;
+	size_t len;
 
 	if (label) {
-		new = kzalloc_flex(*new, str, strlen(label) + 1);
+		len = strlen(label);
+		new = kzalloc_flex(*new, str, len + 1);
 		if (!new)
 			return -ENOMEM;
 
-		strcpy(new->str, label);
+		memcpy(new->str, label, len);
 	}
 
 	old = rcu_replace_pointer(desc->label, new, 1);
-- 
2.39.5


