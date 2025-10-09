Return-Path: <linux-gpio+bounces-26943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EACBC94CB
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D33C3B516D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495832E8B69;
	Thu,  9 Oct 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbrsIOey"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39A2E88A2
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016586; cv=none; b=C7RTAIa5T1o0YFdcSL9eIRrEJ8z+BIcqlXsqggl/dn4YHIKP6rPIQ25SV9VwvpSZm9aMgQBFiL6funSoEc47kl62eBF7HcImDHCM39QuTLsNyiptlFJnuDICKrARx3L349S7MbOV3o9IIswezvq2WZzzulZIuJPiC+AVCHSEhFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016586; c=relaxed/simple;
	bh=E1h2IymeZxzN8DEA2ATr3BDwi+1E2Uj1VWWEwU62eVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NL1+10soSQq8eanb7XTN1iXVu+GhMsaEYXL8N8GsIUcfYc2xVHkR6hGjiEA1B5rI/XC17AMdZ9wWnpxb1pyyi41VcL3Tr0L5I2yC9Xy53fRhKixA8REeM8q+/cnjKI8YcB+6komaJ57Goa5cAI9qVMn4v0IdIkggzzyx2tIhpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbrsIOey; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so1170268e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760016582; x=1760621382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoD3OyvkVVLE8lgWVUBgOO0PRXTO7rnUz/rDybwGWOw=;
        b=hbrsIOeyE7lstuSc4qq2WI8N3OXwfrDdCDfz660iAd69eGF4Yw/NTBl2RmFXXt3JUA
         K5NI9xZhIxaOgh4sc/jkC4a3xElxpSCa5/jLHWO6DfOtQ+saYhzjSXakH50R/yRh7kZm
         /iFqPt6BfDKc3FflhS/yPzAL3oZ5TC3xQ+3bx59jP40jiwwHrXYns1lbDyBentOhkLyw
         incDVtmXw8dOQ4gaZYLC6kNuRb0p5LAjEpz1j/xOxvd+VnNKBd6aLAKbroYvfwCnvCR4
         P0UptJ5G8fmvvsZIN+n51DYlVQuboTnZq1D/EKjbG9vqT0eCGW7pA43+reXSx1H2j375
         vknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016582; x=1760621382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoD3OyvkVVLE8lgWVUBgOO0PRXTO7rnUz/rDybwGWOw=;
        b=AJEHNnjHkvy9XMAcpE/rdzN3uOUJ7zFksCbObZvBVW3RIAtbfFNvz2xD9zBLSOx5lA
         ScDuKQzto6bdfCcAakDpIUgWGrZvRWj9CakQq+4H925CPizJf4x70IKwCMV0YorZIGzo
         4sYhIuhc1Z8fFSZX3LizAjzr37vc05M8wwMCoUeMNl8AxHhMDuyEo1Q1S+0u9mEM/1xQ
         swEVddMbHSIFB06+WezyOtE1kQLKJqvmoLuSwWeAKfTVD4L1DeMlR8NW3q0Puix3PgN5
         8tgimh2DJlwE8yToe2xPLlgqA09JDul1lgGe4/W3XbKGeJMHYalfoQS8NML7cRFKV7k8
         9L/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB/afOnoz1Q6o799PM281MX6x8kXMQCaIIPQtKOpcd8SAkUj51dLhpYgDUArAHlB2eCe5Uks5ti7o4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70gLCOS0//s2P203ZYc6wnh65SluFIYozcE9RabLZKiP1vJIu
	axpAQ3tIvqwSfMriF/dSPlU+IbtG0mbOmdYbx6Ve+8Wb0Te1BDRZ/avn
X-Gm-Gg: ASbGncthdp16+usYZlnIEH0tj8JIE1XikVM6mPuAUit10Uc2vPMcZcHwOKlZyUAb0HL
	dACx9rRxkbdCxgrqK0UPZtXI6QuRMKx4KYyhiR9eGx3SittqjupKel7RrEAufLBplj8/GbYNt8T
	QwyDczAogmYCj/snoOyNoyeqzxygDddUR8EcCbV0rekd7hx/CHxW+mlZ8IG1K41ZK3yXGzDk19g
	nXwQBERXZA6uK2jyWkbcG/UOyGgvi5auAlcf6fAkGcfcPMjHxKNEa4bNc13UyJWQP9+IObdhLJf
	YfmNsKJFvp8zxiZT6t3uq+y+0x2rFJUzcGWJ002mwX8+WVZ2JwqZ/MhjrMYVP/kbZm06NYnMvuJ
	hMkAAE6d/iPT2QSb8djnrPH22XVsEFpqjxrElVRl6XqE4/ZmW94Hj2QRRWXeqAoUihTUqk7XX+g
	==
X-Google-Smtp-Source: AGHT+IH1VIKsG88C3aAeaqwYTWYVqCA6XHMJZDpaPDWK1Emc97Vc5AG1FPkm5MMZ+Hs0OjrfL5bbFw==
X-Received: by 2002:a05:6512:12d1:b0:58b:2b8:f8d0 with SMTP id 2adb3069b0e04-5906de90442mr1868002e87.55.1760016581986;
        Thu, 09 Oct 2025 06:29:41 -0700 (PDT)
Received: from wpc.lan (host-95-152-52-178.dsl.sura.ru. [95.152.52.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb28a9sm1042587e87.98.2025.10.09.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:29:41 -0700 (PDT)
From: bigunclemax@gmail.com
To: 
Cc: bigunclemax@gmail.com,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to avoid cache sync issues
Date: Thu,  9 Oct 2025 16:26:47 +0300
Message-ID: <20251009132651.649099-2-bigunclemax@gmail.com>
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

Therefore, remove reg_defaults entirely to eliminate the root cause
of these problems.

Also remove the force reset all pins to input at probe as it is no longer
required.

Link: https://lore.kernel.org/all/20251006074934.27180-1-bigunclemax@gmail.com/
Suggested-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 34 ------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 78ff7930649d2..0b329661b5978 100644
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
@@ -82,25 +71,12 @@ const struct regmap_config mcp23x08_regmap = {
 	.reg_stride = 1,
 	.volatile_table = &mcp23x08_volatile_table,
 	.precious_table = &mcp23x08_precious_table,
-	.reg_defaults = mcp23x08_defaults,
-	.num_reg_defaults = ARRAY_SIZE(mcp23x08_defaults),
 	.cache_type = REGCACHE_FLAT,
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
@@ -129,8 +105,6 @@ const struct regmap_config mcp23x17_regmap = {
 	.max_register = MCP_OLAT << 1,
 	.volatile_table = &mcp23x17_volatile_table,
 	.precious_table = &mcp23x17_precious_table,
-	.reg_defaults = mcp23x17_defaults,
-	.num_reg_defaults = ARRAY_SIZE(mcp23x17_defaults),
 	.cache_type = REGCACHE_FLAT,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 	.disable_locking = true, /* mcp->lock protects the regmap */
@@ -614,14 +588,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
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


