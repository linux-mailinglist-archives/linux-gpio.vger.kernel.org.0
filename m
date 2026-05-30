Return-Path: <linux-gpio+bounces-37712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC7/GZmwGmoH7ggAu9opvQ
	(envelope-from <linux-gpio+bounces-37712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:40:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A160BE8B
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 11:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4121D3035153
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362D5357D13;
	Sat, 30 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fnO7y4Vs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1890345CAB;
	Sat, 30 May 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134033; cv=none; b=gHArLWUwZhAno6G9emGdGam18BiezqqtlLhsrpz83AgP8sWojKS+WHazJwogzB46UrLF999O0psB8V4OWSh6LoP4lAvZN6g9JpMmPMyB8uK7Mmy2cQEck305qhocHGDETMrm1Mza9zOyETs3CfhBTKVmLI4nIxTGiP1XueUQBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134033; c=relaxed/simple;
	bh=kUTwPGPqSZ5r2oSc2cjnVOl2CrgPD/WqeFzes/cUk7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfjUAkCgRqW3wv8SomQurS+q8rgwLEoqPYlRKx8q6V2S3oroqhjvX6bu9I/XtysgAufMTHe7TI1ll9xOZHddXQAEBrHqpJjeSD2LR3F9v7NSbR9QMlkFEX4NNZn7gaL+kUAsvCPX1EYIn14AvTqcx3wwMY1nrN/MowIfSJDBmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fnO7y4Vs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6135E27AC3;
	Sat, 30 May 2026 11:40:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xm7zx3vduy67; Sat, 30 May 2026 11:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780134027; bh=kUTwPGPqSZ5r2oSc2cjnVOl2CrgPD/WqeFzes/cUk7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fnO7y4VsJ958MHfrFplEeegx3qnvChDo4rIQ/UG8gE8VCqzGAOSXVvqgowAJg09WQ
	 ruZDy/X7ZOZIbAoV8aBF6eX5q7DQLO5xp2FYjpv8bG3gXJ4jgba5AGPqrpH7ETxYnG
	 e8kA+V8SXnlTv9knnUgqD4B8MGtA0vpj7045+tm/vXScZ6EapR0rV15FFtoTmVdmsN
	 UcprQ+wQtrczd1IIzNAKlpQnyigS5lGxMY6FLLT9efarXK5LXVkp9NUdgYo/ReCfcz
	 u7cu9vWQn0n+wrgrFbWQWXkSMk8eBAhWH7++eG8GxOqLk15hRB6lGZAx0Pd4rEQjZk
	 Z18LmbN9Brklw==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 2/2] gpiolib: acpi: fix out-of-bounds pointer arithmetic in acpi_gpio_package_count
Date: Sat, 30 May 2026 11:40:12 +0200
Message-ID: <20260530094012.184276-3-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37712-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:mid,disroot.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA3A160BE8B
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

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 049e4cbc14ed..494dcd166aef 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1310,6 +1310,8 @@ static int acpi_gpio_package_count(const union acpi_object *obj)
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


