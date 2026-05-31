Return-Path: <linux-gpio+bounces-37734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJMzAOwkHGr9KAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:09:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B3615F9D
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 14:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7210C30173BB
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B312038837C;
	Sun, 31 May 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ij2bWptI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BC388363;
	Sun, 31 May 2026 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780229336; cv=none; b=PphpUCxK7SU9J5eGB8OvloqMdqaETUP/iObIqGAmRRWQW1XC7Mng9j4gjQTYeukcpNV1V61dtJhj8ndazR9v8RnrQswIwJT8tAWYOa/rLdkwTOqxaBAfPtCf0bugzKfRuzaHzV8VlWfTEHa0p6n4BWGniENpgc5UvplnLRYHiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780229336; c=relaxed/simple;
	bh=f+QFGKw57t7OAFxTEhRep7ZHukaojLVALJidlwEkm9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvhHx8SyYyejgWFZnjbIvryhxc8HtjUsr2qds65VU2aiVug/05O0E2qcyVigCTQn+thwkxXzg70+F9V2LsC0M3YO5BlHuGdySH1O763/8oT6rFMOT7AJlc+wkry2StahIUkhyrEP4JnZJOww5ao92Bx4vbwhzssdKVzerUOEIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ij2bWptI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0E4A32691C;
	Sun, 31 May 2026 14:08:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs7vuvj2FXem; Sun, 31 May 2026 14:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780229325; bh=f+QFGKw57t7OAFxTEhRep7ZHukaojLVALJidlwEkm9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ij2bWptIS8HBdbWSGC7+I3CeDV3zmRO8RhVfONMX/uKJgBhw0qaNpi+N9RgAFIIgP
	 UxciY0d/7yORkgy3xKfBQNynbKVVn3vVcm2gMndfdMAUE8xYItYsOPzTM+Q6h0dG6T
	 V+FkfdwW8nzFxynRPioknBbPY0acHvpqF2hnbPQh9s4DpoMu+NpbBe8ilCmmSf14+K
	 y5I+7vsyWiwZETIPh1Pb4vk7fqmEhu+gUcIfBINkdX0J6tmp0lIez9iefZGmurkChD
	 gRscBBi7iisD66ndSlfLLvuv4HYzPpN3MoZ4XXmi4W0nCZPMcD0TBbNvLqcLSLu71L
	 uzJY0BELN+0Gw==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] gpiolib: acpi: fix out-of-bounds pointer arithmetic in acpi_gpio_package_count
Date: Sun, 31 May 2026 14:03:11 +0200
Message-ID: <20260531120816.17255-5-scardracs@disroot.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37734-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9E6B3615F9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When counting GPIOs in an ACPI package, encountering a reference or
string causes the element pointer to be advanced by 3 (element += 3)
and then by 1 (element++).

If a malformed ACPI package contains fewer than 4 remaining elements
when a reference or string is processed, this pointer arithmetic
advances the element pointer past the end of the package elements
array. This results in undefined behavior and can cause out-of-bounds
reads.

Fix this by ensuring at least 4 elements remain in the package before
advancing the element pointer, returning -EPROTO if the package
structure is invalid.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index d12dab42a096..b19fd02b64d0 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1407,6 +1407,8 @@ static int acpi_gpio_package_count(const union acpi_object *obj)
 		switch (element->type) {
 		case ACPI_TYPE_LOCAL_REFERENCE:
 		case ACPI_TYPE_STRING:
+			if (end - element < 4)
+				return -EPROTO;
 			element += 3;
 			fallthrough;
 		case ACPI_TYPE_INTEGER:
-- 
2.54.0


