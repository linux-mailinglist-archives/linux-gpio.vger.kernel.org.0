Return-Path: <linux-gpio+bounces-37421-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAIQDWgnE2rR8QYAu9opvQ
	(envelope-from <linux-gpio+bounces-37421-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:29:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C955C3235
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A46B3019B8E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 16:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243693AEB2C;
	Sun, 24 May 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CSjD9M4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171013AE196;
	Sun, 24 May 2026 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640072; cv=none; b=bvs5NPg0HeYW4gtov1teY1w6KWdFm70u2oT7HuGgw/4TX6zGCKbwOlIaLynm8Smb6gIkm35gj5GC00Q5CeLkeNwNu4bB5t1AS6U34bug2OK+u/Hg03nb1anaWObj6nGant3kwhNy+8gIf/BDWV5JAsDkcaY5PMwrnkPKAEP1neQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640072; c=relaxed/simple;
	bh=v9uSFaqt6JGmmCo0t552KayYGFYQOyW+nHwKqaTwbMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGwaZz+R2IfT73ih3YMOBthaiynVPZ4yMJNQLssLXg4axz9RamYUhH6idXbJn5tN6C/cCfIohDFZy+vS5g2XFJ/FdixhAUV9YpKBv8LsDz/SgloDb/45Enavv2NVYA0yY0SKCgNtHtF96SSZhWnQIKsguU3I3B8c9Cn2puzYjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CSjD9M4N; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 03C0C26AAB;
	Sun, 24 May 2026 18:27:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmiF6tB3ZQ8g; Sun, 24 May 2026 18:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779640062; bh=v9uSFaqt6JGmmCo0t552KayYGFYQOyW+nHwKqaTwbMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CSjD9M4Nx4ODTRcIoExYMD4agZcTjIl4gbTPFgspBMAQcI1Cu9HfS4Z1DssMGmPZk
	 s3cfdfrtHb+Af9sIy/i99MVYEYdzRPhMd6DtaaJczSGPJVopvYKmnMDBAmr4KToJek
	 AriUYsnxcTkSGACIkoKwd9B62+oNu2r2uRtC7JOuj3He6b/x/9eAPKXGzMk+Wn57p8
	 F+HId2OXMHEBOQ/rt/JoK1UILtV+jQQB99DLIqYAEqwoyb604YvoRVoB1kFzTEg3wM
	 cmB4Nwmc37IgUTqU+hqrUDGaO6cKkzhS7Kg5IND40slDTObSM3f3DDu1b06HHTFLMH
	 p9264hmAekK/A==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 2/2] gpio: remove obsolete UAF FIXMEs from lookup paths
Date: Sun, 24 May 2026 18:27:08 +0200
Message-ID: <20260524162708.62949-3-scardracs@disroot.org>
In-Reply-To: <20260524162708.62949-1-scardracs@disroot.org>
References: <20260524162708.62949-1-scardracs@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37421-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: 86C955C3235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ACPI and swnode GPIO lookup backends both temporarily grab a reference
to the gpio_device, resolve the descriptor, and then drop the reference
before returning the descriptor to the caller. They carry FIXME comments
warning that the descriptor is being returned without its backing device
reference.

However, the gpiod_find_and_request() core functionally prevents any
use-after-free window by wrapping the entire lookup operation inside the
gpio_devices_srcu read lock. The lookup functions are correct to drop
their references since the caller (gpiod_request) will subsequently take
its own permanent module and device references safely.

Remove these obsolete FIXMEs to prevent misleading future subsystem
developers.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-core.c | 4 ----
 drivers/gpio/gpiolib-swnode.c    | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index eb8a40cfb7a9..1a762a2988b7 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -142,10 +142,6 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	if (!gdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	/*
-	 * FIXME: keep track of the reference to the GPIO device somehow
-	 * instead of putting it here.
-	 */
 	return gpio_device_get_desc(gdev, pin);
 }
 
diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 4374067f621e..8d9591aa9304 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -114,10 +114,6 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 	if (IS_ERR(gdev))
 		return ERR_CAST(gdev);
 
-	/*
-	 * FIXME: The GPIO device reference is put at return but the descriptor
-	 * is passed on. Find a proper solution.
-	 */
 	desc = gpio_device_get_desc(gdev, args.args[0]);
 	*flags = args.args[1]; /* We expect native GPIO flags */
 
-- 
2.54.0


