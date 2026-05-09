Return-Path: <linux-gpio+bounces-36482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBoiJTaB/mnyrwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:35:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E68E94FD0FA
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81433010C0D
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 00:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62701DE8BF;
	Sat,  9 May 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSQ5Ahdh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B81CAA68
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286898; cv=none; b=Q0VxR//UMmFEkJiUlXx3pUSGE5dpTWtqW6OdJub0GEoZ3GegYDY6Q15RhOwJFPDfgMpu6+KbIGC3+wcKuXEVuNjRO0wR35MBOxq3iw3K5XpWRSCthGjUAK5mstHFWszAhz6JC35AnVYLBJFrY8c1DSzLtvN/IolQczJPGsoPpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286898; c=relaxed/simple;
	bh=ptcjVPEI8PMcugoxtvfq2tBFzpfpZITTxcsgKiNiIUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxQC9QjEvgfKdLX3Vufz7N1FcCt1gO2gL5at0ESLf7ZnJSMlVWWUe8+nfUvOPlT9Wzdo4k5VkHGS8t1FQwO0pRHN1ZLxvJXKDplg4p96Vtm/Uy/Cc5628N2hAcTrgow/N2Dd5VtchhbuUjBPKPaRfaP9x+ZONKWJ3XSXEaUzGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSQ5Ahdh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4583f0a1aso16746405ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 17:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286896; x=1778891696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcKVwdgCxNmEiNuNU9ws2Zlv9ka8LThv4VYDHowFaFg=;
        b=rSQ5AhdhMLhpgAiIoakRvOCivk/aEwE3zzpNBKokfej0IvrG//y/23u6u7E41yPvVr
         3fvfz/u2NEawihYIqJUX12K5kplrE1nAmrt3W2mdrjL6GDSDYyxJYd3GAjXWmn6MAbcr
         evgq4wYOLVeZNe9bWSH4NkMvx7v5fMqU2wmLTbUVYEU6fMJRKrHZw1I8dFPCG3OO0J68
         bnP8BX+rit8qwXx6NZ6WmR2tQPxOQwz7hAF5pHGIB/g5lGmcdLLHDLuN14+N1bCULBW7
         y3WsZjkkn0x65W4X/H68EsZPBuBE791wCjbN4cWMQLewONNpsdFKwCTaBB3he9/AYZdC
         CYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286896; x=1778891696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcKVwdgCxNmEiNuNU9ws2Zlv9ka8LThv4VYDHowFaFg=;
        b=bL9eiRI0+OPV437sZEH2caByngMHl6iwS8xI/6q+yqpLxtXVVZpbudEvT1aF9F37qI
         qziwmMwk34a8Ugf2nRh4dA8TlefJUqtdVvJB9rKYmrbOh2cLsia9338ChJDNm4Zyepbb
         /A3fflO/5BJSncXP0qnrMxi2j46jV3zFcMVoaV1AKuXRNxk1FGNNfzfVmLPC6m9tQQK/
         jiMgjpy5g/Rri98CCjIv/iSBmHR06Il3S8qzjWRhhhzRQAFribKGWl9WRRo+V7tx+/Ug
         NB6YZGJ27VmpoZv2pIjywRY05iQqj21WHIVCZW2DABHi6VjXO3DSRmvpFxUOpjp0g/Qt
         WEbw==
X-Gm-Message-State: AOJu0YyC0W18/D/n6yPS1d3C2XzXaZ6b2hrqIedf9uhzdZk63JFvLMsQ
	BnZiHiYOtjS2UMJ5rovB0BSqcdgCOEvxEa/pl+jIGfr+sM0W8kPVv/M0dqZs/nBd
X-Gm-Gg: Acq92OFsRczpBJL2HUR5B21TfryLAYsEMR/bIKbdU2bg9O7gkJpSC+9MeaHnyfs8Kma
	gKXJWTaYTPzd+J/dUGlJVzaY6RkeAAhnd3mlOdHjEakBUA2P/XM2DJnl1x5cysToGtgVv2LCcaK
	EGbUcrc2h/7jgArBEXqXO0I8Bj4DpwfFd+64fsjRce+y9JDV13AsJeeOCn1f6hK0mAt5+MIYEy0
	LRYi7bcmmyzI1E472+iactrKjiyMAxwnhTM60hlWTlPwmUKu6yVSdZ0XArENpCZVds+XlJDze3V
	kUJVf9Gc65r2qLkWKS9bApOn82RZGjcrjvyWt6P6johWyqgVy2+XrrEoxm4XBrAbNUbmVq/hECn
	qkDsYTsLYxhwE1TClGdYdk89LmsYCw2BBWa9QxopyAtI5pgNo/Y9ToJwuvuD1Jy8s6qdle7fd4E
	vhB6lfiiw7oj/RD/RrwfaTvN6gSfq4HSzr1XCJVSUeylf9T8t3tB5s4VJGJEqPR7BPVcSxV+xsG
	TIDDHq4HpPqi8t8yAEjQS/+QFqMBVUdwig=
X-Received: by 2002:a17:903:1b0c:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bc7aa1f5bcmr4395505ad.22.1778286896345;
        Fri, 08 May 2026 17:34:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm35086295ad.28.2026.05.08.17.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:34:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: zevio: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:34:38 -0700
Message-ID: <20260509003438.956051-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E68E94FD0FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-36482-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The ZEVIO GPIO driver uses generic platform, MMIO, and gpiolib interfaces.
Allow it to build with COMPILE_TEST so it gets coverage on non-ARM
platforms.

Drop the ARM-specific IOMEM() casts around the register pointer.  The
pointer is already __iomem, so readl() and writel() can use it directly.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-zevio.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-zevio.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 16c798446c46..f8e34b16fd99 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -859,7 +859,7 @@ config GPIO_XTENSA
 
 config GPIO_ZEVIO
 	bool "LSI ZEVIO SoC memory mapped GPIOs"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 29375bea2289..af0158522ac5 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -64,14 +64,14 @@ static inline u32 zevio_gpio_port_get(struct zevio_gpio *c, unsigned pin,
 					unsigned port_offset)
 {
 	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
-	return readl(IOMEM(c->regs + section_offset + port_offset));
+	return readl(c->regs + section_offset + port_offset);
 }
 
 static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
 					unsigned port_offset, u32 val)
 {
 	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
-	writel(val, IOMEM(c->regs + section_offset + port_offset));
+	writel(val, c->regs + section_offset + port_offset);
 }
 
 /* Functions for struct gpio_chip */
-- 
2.54.0


