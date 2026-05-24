Return-Path: <linux-gpio+bounces-37419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPxdIw0nE2q78QYAu9opvQ
	(envelope-from <linux-gpio+bounces-37419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:27:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1C5C31FB
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 18:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3247300291E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 16:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEF33AC0EF;
	Sun, 24 May 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FbH9EaDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9373A9D8D;
	Sun, 24 May 2026 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640067; cv=none; b=U5ieFvr3IPywGNJGE2VRDvhKT19AO3wR77ORzKSSUF8/vR3dIAm/9+xvRXIQltmjNaS7ydcrg+hA/5frTT4aHb166MFgL2UBUPqe7xwhfLSQU4iGp9EpPPAe596kSpbYiCHgrK0oppiDJN76OYtO+KTtBSTWIb76xtpyKlzB7bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640067; c=relaxed/simple;
	bh=LSpXcoetCh+EOSLK7MuJETnM2JpwXe1NgD/gKCS8XqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6WWOV4dTPIqcO//wrPUnlD1NWFKE61QaFN0nNG+UJHBinv6cUGcoYWmgd86Z5g3UZzfGySmATQRVoSC2/1X0DbwQTjD/JUeWJFgDOyQeLvzzTGWzH9iKGggEF1U0PDUBfQ4L/dfT2BFilUbb872Mhx+XwDO6bm5zgr62xiIeZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FbH9EaDk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 44E4C271BF;
	Sun, 24 May 2026 18:27:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPoWx70mT-VQ; Sun, 24 May 2026 18:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779640061; bh=LSpXcoetCh+EOSLK7MuJETnM2JpwXe1NgD/gKCS8XqQ=;
	h=From:To:Cc:Subject:Date;
	b=FbH9EaDk/3b5G2wqPw24JYF+gJB/bXpqI0ZbT776yOP70RUVq61s2Id1MSnTiuNZ2
	 P+YgWX4Fnelx8XRrRJfZiQ/O1kPAzA2OnSzhkkvnxHdOJj9eRZyT9xH1TQDwR2ilxX
	 2N4756oCcDnJVwXshP/+vVqos0r4IFKq/e6iJ327izBi7eW/pd+Lg7yFFxcMnETWNZ
	 kNIAi8/xmfZc5nqd9Vayhiu7awSdEv1Q0ykNVc9EifZ4n4skrW3kfxAegeF4Ud+xfE
	 V03CsWQmo9kmmanBPrQ6DkfVUw+KLR8R/nLJmcfz8zxmb4RzPISdfIMzbc+HtVutv/
	 ItvpgC7FenPnQ==
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
Subject: [PATCH 0/2] gpio: core: fix const-correctness and remove UAF FIXMEs
Date: Sun, 24 May 2026 18:27:06 +0200
Message-ID: <20260524162708.62949-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	TAGGED_FROM(0.00)[bounces-37419-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 94B1C5C31FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses legacy "FIXME Cannot use gpio_chip_guard due to
const desc" comments and open-coded SRCU locks scattered throughout the
gpiolib core and backend lookup paths.

I am aware of the ongoing work to replace the gpio_chip_guard architecture
entirely (see the "revocable objects" patchset discussion at
https://lore.kernel.org/linux-gpio/20260513091043.6766-1-tzungbi@kernel.org/).
While that broader refactoring is being iterated upon, this patch series
provides a simple, completely type-safe fix utilizing the existing SRCU
guard infrastructure. It can be merged today to eliminate the FIXMEs
without conflicting conceptually with future revocable objects.

For clarity during review, the series relies on the following guarantees:

1. Deep Const-Correctness is Preserved:
Updating DEFINE_CLASS(gpio_chip_guard, ...) to accept a `const struct
gpio_desc *desc` does not drop const qualifiers. In C, const-propagation
does not implicitly const-qualify deep pointers. The `desc->gdev` evaluation
yields a mutable `struct gpio_device *`, making the internal guard
assignment perfectly legal and safe for fast-path read operations.

2. Identical SRCU Lifetime Scope:
The DEFINE_CLASS macro's GNU C compound statement `({ ... })` relies
on strict sequence points. Thus, `srcu_read_lock()` is fully acquired
prior to executing `srcu_dereference()`. The guard's lifetime remains
identically bound to the block scope, exactly mirroring the open-coded
`guard(srcu)(&gdev->srcu)` it replaces.

3. Lookup UAF FIXMEs are Architecturally Obsolete:
The FIXME comments removed in the ACPI and swnode backend lookup paths
(warning about dropping the device reference) are functionally obsolete.
By design, `gpiod_find_and_request()` wraps the entire backend lookup
operation inside the global `gpio_devices_srcu` read lock. The lookup
functions are entirely safe to drop their temporary references since the
caller subsequently takes its own permanent references without ever leaving
the SRCU read-side critical section.

Please note that while this patch provides a good solution to clean up the
existing codebase, I fully understand the necessity of deeper and more
radical modifications to robustly secure the subsystem's future.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>

Marco Scardovi (scardracs) (2):
  gpio: core: fix const-correctness of gpio_chip_guard
  gpio: remove obsolete UAF FIXMEs from lookup paths

 drivers/gpio/gpiolib-acpi-core.c |  4 ----
 drivers/gpio/gpiolib-swnode.c    |  4 ----
 drivers/gpio/gpiolib.c           | 28 ++++++++--------------------
 drivers/gpio/gpiolib.h           |  2 +-
 4 files changed, 9 insertions(+), 29 deletions(-)

-- 
2.54.0


