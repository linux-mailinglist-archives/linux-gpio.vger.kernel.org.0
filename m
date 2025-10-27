Return-Path: <linux-gpio+bounces-27642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCAC0D02B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEA2A4E2FF8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A002F12CE;
	Mon, 27 Oct 2025 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1rMB5vz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C37464
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761562137; cv=none; b=PhH5v80WQDIPn9j/Us21vBhi3JhTwC6R9yDAH6kSVPpHl8RreMlE3vgj1pTDItnbMcAsg4QR8aCeO+nhR8a8ZIYXHotm8JIExZT9PrbHVazyir6kFYeOuz983LF5zUCMSzCNmsJhGNmWur7ZM1GCBhQjOCpMdpOH42vz29yLZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761562137; c=relaxed/simple;
	bh=EIhTa266DKtgmotEipXcoJ2pNlQVu707lDOQMlu8pCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixnZj/6OwpiyCHsL45kRjaz3dB+CpcquaF1+LPxjfKOpQc7MNwuS6LyeuyPn+qXMDavuLu4TW2+1+jHZi5uw4QTcrCakCMFBfcB5hhQ14AA5dHDUOQaYti/U713VfNe10Cyw8Op4MfXrqKpUPkyYbJKWDxGwE4c8hEwP4vBetBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1rMB5vz; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4e89ac45e61so44241191cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761562134; x=1762166934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxzI7NDwCRsXq1m+WzfDT7lhcGD9O88pOGkXVsZVyO8=;
        b=F1rMB5vzWU7/9M+A1XtVORfB/17jTlpHMr52gNbazjfxPH7KKcXfqs+F7grmSa9ZGG
         Jcz4uqMXahDbnewjEr1OmCq7OXejvcgwno7MiQh7SeFt34S+Z2FBQMprVki6kbO6aoa6
         jjl3+xx7xbC1rB1S6nqS6vw8TupvweMa8pnl4xU/XczrXearHtlpQ7AeKUtychlAxxls
         GRYgcYaMM2e+ayq9OwS7b4iZ9xjXiP1glSIhb4IGq/mbhVsrrD3w4ol11tGc7u/WhRap
         3yiVVTTJyQSQhVqAIO+PVOQVCUFI7zN6DrBuuOxPAormllgspq8xHXWj1GknEd9tCW6Y
         2XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761562134; x=1762166934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxzI7NDwCRsXq1m+WzfDT7lhcGD9O88pOGkXVsZVyO8=;
        b=k41D3BLNpbOX1nrqvZYvGU2wB6FFd8WTUkHJ709wpjdnpzOlg2lMXOFB/Dg8gNOu/n
         ED55QelG7fPAqGS4MkCj91EeUyxzwZMULlL8pAZHFZhOXawal5mHCPATtMc+Ehv67j7Q
         fUefAkJRbSTr4Ym7q80OfyiITQG7sSW+3uKlLBO12FoTGIITP3mYztwuPHzYQVgvGecj
         2G4vLsOXlh8HL3tLasDdwG+6XuklCal76XqPfj7I6STuOu88fBXd+P5Og4RwWuXiWfNj
         /B1FazOV22jB0DbTUFHDBNLiNA2cSM+e9BqTPuT4rwmoSaG7CD014HSDvyVWpqB7zZR2
         11cg==
X-Gm-Message-State: AOJu0YyRjWZJNDUjUgL+8e228lCS+WylIHSkkX+OIGW8+tWRkiXJrxXM
	Xw+XVMsNQD6nqEg5XAW0NUAewx7M/45IhVAEe/RlzuOw7rMVrxxpg1DutUlOrAkF
X-Gm-Gg: ASbGnct75HS/QYEZmSNuf7jgiAPb3cIxYyQEQUzznZEfTzz9DSZEFA8uKF8+swlKsnd
	EgNE6CXO6wSAg6QRf5iPZwV0+XFpvWEKAs8H6DvmdZY3rLFhCNmUHdaVhoIjbewmu4Ce5qEBp3Z
	pyYthX1YQj/yXdlo8apxZTPrUAiOp/YTsXXEbhXuOdCsSfLLpj7CJXJygUUzoBB1DtsxyG9EpMN
	9BZxziWm1n5dqjGD0+9zit1NvV/IpTa9woyZHZ+sadjWPc8niq/pLQm7uJv/fUAq0nXjSnGjF06
	yR6gh2pg94nMs0y11ufWdl5bR6SXEZLCgsyDEhKtzFly6hDjT7uG0j0Di6AUhp66hh2dmwK3g/F
	hfpfQzoEutt8UmFKYqsI9xR5Y2Pq2uYDNvfqimDKx+QmZdBlU8XHOA0/y1A+FFVAZtgFtRfN/2C
	Q4FwfAYSujcvT14rxnkQTwls5anH620FslTGR0+pf7jFAzrw==
X-Google-Smtp-Source: AGHT+IFaf8biHm1k9C9IbLJBFVhgyzdTCX16gPQL7GVUpD1HWkBNtLCfKnLaOxvFByRY+UJbU/RjdA==
X-Received: by 2002:ac8:7e88:0:b0:4ec:f285:4256 with SMTP id d75a77b69052e-4ecf2854e7amr45615501cf.25.1761562133703;
        Mon, 27 Oct 2025 03:48:53 -0700 (PDT)
Received: from wpc.yadro.com (host-95-152-62-139.dsl.sura.ru. [95.152.62.139])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3816faesm49455611cf.20.2025.10.27.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 03:48:52 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-gpio@vger.kernel.org
Cc: bigunclemax@gmail.com,
	akaessens@gmail.com,
	arturas.moskvinas@gmail.com,
	e.shatokhin@yadro.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	mastichi@gmail.com,
	mike.looijmans@topic.nl,
	radim.pavlik@tbs-biometrics.com,
	u.kleine-koenig@pengutronix.de,
	zou_wei@huawei.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v3] pinctrl: mcp23s08: init reg_defaults from HW at probe and switch cache type
Date: Mon, 27 Oct 2025 13:46:26 +0300
Message-ID: <20251027104746.282351-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maksim Kiselev <bigunclemax@gmail.com>

The probe function does not guarantee that chip registers are in their
default state. Thus using reg_defaults for regmap is incorrect.

For example, the chip may have already been configured by the bootloader
before the Linux driver loads, or the mcp might not have a reset at all
and not reset a state between reboots.

In such cases, using reg_defaults leads to the cache values diverging
from the actual registers values in the chip.

Previous attempts to fix consequences of this issue were made in
'commit 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at
probe")', but this is insufficient. The OLAT register reset is also
required. And there's still potential for new issues arising due to cache
desynchronization of other registers.

Therefore, remove reg_defaults and provide num_reg_defaults_raw. In that
case the cache defaults being initialized from hardware.

Also switch cache type to REGCACHE_MAPLE, which is aware of (in)valid
cache entries.

And remove the force reset all pins to input at probe as it is no longer
required.

Link: https://lore.kernel.org/all/20251009132651.649099-2-bigunclemax@gmail.com/
Suggested-by: Mike Looijmans <mike.looijmans@topic.nl>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Sander Vanheule <sander@svanheule.net>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 40 +++---------------------------
 1 file changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 78ff7930649d..edda2893945d 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -44,17 +44,6 @@
 #define MCP_GPIO	0x09
 #define MCP_OLAT	0x0a
 
-static const struct reg_default mcp23x08_defaults[] = {
-	{.reg = MCP_IODIR,		.def = 0xff},
-	{.reg = MCP_IPOL,		.def = 0x00},
-	{.reg = MCP_GPINTEN,		.def = 0x00},
-	{.reg = MCP_DEFVAL,		.def = 0x00},
-	{.reg = MCP_INTCON,		.def = 0x00},
-	{.reg = MCP_IOCON,		.def = 0x00},
-	{.reg = MCP_GPPU,		.def = 0x00},
-	{.reg = MCP_OLAT,		.def = 0x00},
-};
-
 static const struct regmap_range mcp23x08_volatile_range = {
 	.range_min = MCP_INTF,
 	.range_max = MCP_GPIO,
@@ -82,25 +71,13 @@ const struct regmap_config mcp23x08_regmap = {
 	.reg_stride = 1,
 	.volatile_table = &mcp23x08_volatile_table,
 	.precious_table = &mcp23x08_precious_table,
-	.reg_defaults = mcp23x08_defaults,
-	.num_reg_defaults = ARRAY_SIZE(mcp23x08_defaults),
-	.cache_type = REGCACHE_FLAT,
+	.num_reg_defaults_raw = MCP_OLAT + 1,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = MCP_OLAT,
 	.disable_locking = true, /* mcp->lock protects the regmap */
 };
 EXPORT_SYMBOL_GPL(mcp23x08_regmap);
 
-static const struct reg_default mcp23x17_defaults[] = {
-	{.reg = MCP_IODIR << 1,		.def = 0xffff},
-	{.reg = MCP_IPOL << 1,		.def = 0x0000},
-	{.reg = MCP_GPINTEN << 1,	.def = 0x0000},
-	{.reg = MCP_DEFVAL << 1,	.def = 0x0000},
-	{.reg = MCP_INTCON << 1,	.def = 0x0000},
-	{.reg = MCP_IOCON << 1,		.def = 0x0000},
-	{.reg = MCP_GPPU << 1,		.def = 0x0000},
-	{.reg = MCP_OLAT << 1,		.def = 0x0000},
-};
-
 static const struct regmap_range mcp23x17_volatile_range = {
 	.range_min = MCP_INTF << 1,
 	.range_max = MCP_GPIO << 1,
@@ -129,9 +106,8 @@ const struct regmap_config mcp23x17_regmap = {
 	.max_register = MCP_OLAT << 1,
 	.volatile_table = &mcp23x17_volatile_table,
 	.precious_table = &mcp23x17_precious_table,
-	.reg_defaults = mcp23x17_defaults,
-	.num_reg_defaults = ARRAY_SIZE(mcp23x17_defaults),
-	.cache_type = REGCACHE_FLAT,
+	.num_reg_defaults_raw = MCP_OLAT + 1,
+	.cache_type = REGCACHE_MAPLE,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 	.disable_locking = true, /* mcp->lock protects the regmap */
 };
@@ -614,14 +590,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 
-	/*
-	 * Reset the chip - we don't really know what state it's in, so reset
-	 * all pins to input first to prevent surprises.
-	 */
-	ret = mcp_write(mcp, MCP_IODIR, mcp->chip.ngpio == 16 ? 0xFFFF : 0xFF);
-	if (ret < 0)
-		return ret;
-
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
 	 */
-- 
2.48.1


