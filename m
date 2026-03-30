Return-Path: <linux-gpio+bounces-34436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB94MVWjymmx+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81735EB3B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DCAC30266D6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF7D37757D;
	Mon, 30 Mar 2026 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xdbv6kfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC937700F
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887561; cv=none; b=bEuN1LTfCaXthSAgHPXQacoxI53BmfwRiG3xScr6A4tGUcZI8+cMiXU2F3/sLuUGWBLNG2Oi5auIcioBRTPxsyav5G2cTqerJGYEZ+EPyY8CGi88x5Qevi+nE+wR/RR3/x9oKxRwcsMM0TDJEbwYDT6VwySPQa0q36z46GnjEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887561; c=relaxed/simple;
	bh=hgGtkNEYd3/BeM5nsJ4Pr/kLRh68Go04WXIspuv2d8I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=knMQfFQcTefP/lncsRX3suIBgj1CfbZp2XFT9Vk88kN1OUaQ7c6gll48HlVtvzIsBpldhxaS1C+AMafpxOd8NfWvweirztN6Ca5RvGrpXmsfEBFhnivixCbwgl/2lNlLz05rX2pmmKya3uq/Evb7uiJJ4uBbhPwPD011XThNYk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xdbv6kfx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48704db565eso61006355e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774887557; x=1775492357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnXB79ddlwVURKopTJx6RicWp8izklkVPC7b2pc7tFY=;
        b=Xdbv6kfxaZYqSHLvuRFdwClaQfqYyudJ07/I18oN3EDvp/pVHDUq30pMhLCbOk9Qwf
         J1VEPJyN+JiYZhFlCKyrsJl/DvlPwye2MoRrLXuoyZbEXfQ8+H4ylcAUZ/vs3LZv5XHD
         EqBQReLmxsn3bL1KwiQLIv1Aj7miJz+k+R3CoPemelPDYzr//CjVp3DcH4itD/G9LqL6
         eyouF44Z3iMBfMfGHrFkM2qNvYvWi9a4BrbYsog5kESTS2+o5y95gSvZcsvvKwshqGt8
         jVjA5+ZOGeynPaxFYecKd1pOh4xw0GIqUe4xlEtjiq54e7O38NChPWLyy0PsoZI59kKk
         7ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887557; x=1775492357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnXB79ddlwVURKopTJx6RicWp8izklkVPC7b2pc7tFY=;
        b=WT2f72bi+/3gG+D/fPW5egyMVIsHE9pRLBbTsjBGe6K0wPv04zzIy0vL7lNaJkzklO
         j5wqca6Ov5w8tdaxUFnTCwf6n4h0zaY/z9Qb/k5kPYutIgDht2+XuFK1Sg5uxd5hOfsR
         fMvcZzI+1LObfwoyxvIc/P88Npa45VjsfXAw7vfm7yZX3i/MWDTG0GYFUHbKHMZ9AOIh
         od/RBd0Ygj8Tw9nE09qB2QidV9/Uen1QbE8TAyuEoW1mvNb5xatUL3fkF37rz7AQCeDb
         JUFNDgf4s0m6M9vDsEutCNQCPLXx2zC9vyzBYNGwi9UjXomPnKyT6R4GA8Id3K/TQH9Z
         RKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXFa7w/4gNgsKEB2UMUKWHnXBJZD80Yj+5ev3N5CSySZMbpgygO1OPXGLj4+4UNNxHZW8kZK7yB39Qo@vger.kernel.org
X-Gm-Message-State: AOJu0YyNA43NBE+/5s2P7LH7lpJ5erZ0iu1dIXBvJhYxFyOP5KQZTI1U
	nfn37uIYhsCx3a8mjia6rYswFZvbL5QSfAGovEZrkRLnHWVOEAE0yW5hDrOyIoLWhv8=
X-Gm-Gg: ATEYQzxZheZgGL2YYhwc9sq5wKay6iyopehOgucbnc1Fy9jEJ9XpCyPXN0tMbH5zqwX
	rQps/aE7YN0aIjl3iDPZHmq37o6M+dG6s64uqfcIEQpQ3VPuqpW1F/lYNa2OuWjC+Zax9rrX5vb
	LhAuNTjAQ+YuYfp3VFDBJmmpQIEemX6Vg1wSdKWCUyLhVJ9f3gLajGEELkdHr3jfQ1V2bh3btlg
	Gsg4KkO7/iYJFhTYOvHIhhd9zyk76zTVgQQ6sN7nvCex5eIrW+666YYLRo/nfgq1sUYCkjYFKN6
	LLLIp89qG7cBtlTYiQDZ1m424FQ/GN8BVyWSt+pVTVvwY6vPk4s455z1SNeb6+CBxLNhZ4VQmJQ
	+qk6T8AZV3zgVfG+f3sh2V3ER8u+ipBj0f4K/g4vZHAsOGvEXSmFW1FbTUFTTfh8H6gN46L7ywq
	+MAjo3XLi60OgSMMNyMeV2/bgiWm01f6qSsApm7lTBO34AIR3Y
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr229735095e9.14.1774887556714;
        Mon, 30 Mar 2026 09:19:16 -0700 (PDT)
Received: from localhost (mob-176-247-30-22.net.vodafone.it. [176.247.30.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e29b1sm18796564f8f.8.2026.03.30.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:19:16 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during probe
Date: Mon, 30 Mar 2026 18:19:14 +0200
Message-Id: <20260330161914.1071118-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4436; i=flavra@baylibre.com; h=from:subject; bh=hgGtkNEYd3/BeM5nsJ4Pr/kLRh68Go04WXIspuv2d8I=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpyqJ6k+fhPfJ2tZeDtag7fp7JU0CzQvwwvHbQk OPfzSXzcXaJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCacqiegAKCRDt8TtzzpQ2 X3o6C/0fIDZXhIG0IXYz4VynyCvWA9w+4hUrLt2WOAd6jICfZFuO7mBkE95B7qAJj073SX3NFbi dulU/PbCisLROc3qq2myaRHisrc2hodJOyA5w0KeddwniOWg0ppBQRLSwHCPK1U+PpWfH5mgX5w 06+QgX8xP7bR8tCTlKYMk9DhO6nDKOgJGdiBzERnuhsOYfwDk1bw29jCp6tA+1M09iwynWvd8FM ZSZGJZVvwE2aSRsnJkxyMgkW1vl71lrKOJnBiF6aNd8Y6jpCfrdlrfn9lO4feJGo4Ix13gSrgkg JQR86hQqm0Q6WJcCADtNbuntVFg5DgMhBHsCJpmy/ChbA35a5NN3nVCK+7w6sArtrFHzhMkMWLA 3/zxTtP4SUbpZDqfLi0Rd8GUQEeqVdBIGFrqtZxeENeoSEiun0UczI80YAlRaZciZP3jjEJLXlJ z38n0KtDilNUo6bEjqXAoQVVbIK7ZfwGZYDa1JpNLEwneWXknAnoyqbmsLvdT2Yv1vd2E=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34436-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:email,baylibre.com:mid]
X-Rspamd-Queue-Id: 5A81735EB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A chip being probed may have the interrupt-on-change feature enabled on
some of its pins, for example after a reboot. This can cause the chip to
generate interrupts for pins that don't have a registered nested handler,
which leads to a kernel crash such as below:

[    7.928897] Unable to handle kernel read from unreadable memory at virtual address 00000000000000ac
[    7.932314] Mem abort info:
[    7.935081]   ESR = 0x0000000096000004
[    7.938808]   EC = 0x25: DABT (current EL), IL = 32 bits
[    7.944094]   SET = 0, FnV = 0
[    7.947127]   EA = 0, S1PTW = 0
[    7.950247]   FSC = 0x04: level 0 translation fault
[    7.955101] Data abort info:
[    7.957961]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    7.963421]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    7.968447]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    7.973734] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000089b7000
[    7.980148] [00000000000000ac] pgd=0000000000000000, p4d=0000000000000000
[    7.986913] Internal error: Oops: 0000000096000004 [#1]  SMP
[    7.992545] Modules linked in:
[    8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-0025 Not tainted 7.0.0-rc6-gd2b5a1f931c8-dirty #199
[    8.073689] Hardware name: Khadas VIM3 (DT)
[    8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.094639] pc : _raw_spin_lock_irq+0x40/0x80
[    8.098970] lr : handle_nested_irq+0x2c/0x168
[    8.098979] sp : ffff800082b2bd20
[    8.106599] x29: ffff800082b2bd20 x28: ffff800080107920 x27: ffff800080104d88
[    8.106611] x26: ffff000003298080 x25: 0000000000000001 x24: 000000000000ff00
[    8.113707] x23: 0000000000000001 x22: 0000000000000000 x21: 000000000000000e
[    8.120850] x20: 0000000000000000 x19: 00000000000000ac x18: 0000000000000000
[    8.135046] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    8.135062] x14: ffff800081567ea8 x13: ffffffffffffffff x12: 0000000000000000
[    8.135070] x11: 00000000000000c0 x10: 0000000000000b60 x9 : ffff800080109e0c
[    8.135078] x8 : 1fffe0000069dbc1 x7 : 0000000000000001 x6 : ffff0000034ede00
[    8.135086] x5 : 0000000000000000 x4 : ffff0000034ede08 x3 : 0000000000000001
[    8.163460] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000000ac
[    8.170560] Call trace:
[    8.180094]  _raw_spin_lock_irq+0x40/0x80 (P)
[    8.184443]  mcp23s08_irq+0x248/0x358
[    8.184462]  irq_thread_fn+0x34/0xb8
[    8.184470]  irq_thread+0x1a4/0x310
[    8.195093]  kthread+0x13c/0x150
[    8.198309]  ret_from_fork+0x10/0x20
[    8.201850] Code: d65f03c0 d2800002 52800023 f9800011 (885ffc01)
[    8.207931] ---[ end trace 0000000000000000 ]---

This issue has always been present, but has been latent until commit
"f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe and
switch cache type"), which correctly removed reg_defaults from the regmap
and as a side effect changed the behavior of the interrupt handler so that
the real value of the MCP_GPINTEN register is now being read from the chip
instead of using a bogus 0 default value; a non-zero value for this
register can trigger the invocation of a nested handler which may not exist
(yet).
Fix this issue by disabling all pin interrupts during initialization.

Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe and switch cache type")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 586f2f67c617..b89b3169e8be 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -664,6 +664,15 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (mcp->irq && mcp->irq_controller) {
 		struct gpio_irq_chip *girq = &mcp->chip.irq;
 
+		/*
+		 * Disable all pin interrupts, to prevent the interrupt handler from
+		 * calling nested handlers for any currently-enabled interrupts that
+		 * do not (yet) have an actual handler.
+		 */
+		ret = mcp_write(mcp, MCP_GPINTEN, 0);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "can't disable interrupts\n");
+
 		gpio_irq_chip_set_chip(girq, &mcp23s08_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
-- 
2.39.5


