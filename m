Return-Path: <linux-gpio+bounces-19063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF373A93EBC
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 22:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51CD57A43CB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 20:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901D72222D5;
	Fri, 18 Apr 2025 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3jQvM6b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8ED2A1C9;
	Fri, 18 Apr 2025 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745007450; cv=none; b=Jp2H85Ir9xgkE4uCbbnkGzDj8e+0blZA+Ml4wstMAiS2WaEi4uLLwEYTkikZEghrGtvhxOVUY7SK3oH9zsIcL7xCytVEB9/15BtBuRrBHf7begxZyawf9a0tTzFsE1vLYvpwmzs4hkIEp75XTiWLzte+dQ6WiXMDPmfwDrsB7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745007450; c=relaxed/simple;
	bh=BdURm55BBBuG9p5CztnmdkGeWDKrLKxOH4hwmr1P1oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hgwROnX+JHZOkb4yKV5zG6D/OMWGH0H6vm9t4F+ekh77AtBd9gY2PcFA+IB5Bln0YoFa+G8QnKcAYhkl39r+nOXMC6zHeTrQgkkXt+yJx2xbXgQEZq0d3NliIILSyQrRsAf6t/UTDnHku7LJFHtEtqgcQBWyV++LTMsWikeVjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3jQvM6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54600C4CEE2;
	Fri, 18 Apr 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745007449;
	bh=BdURm55BBBuG9p5CztnmdkGeWDKrLKxOH4hwmr1P1oY=;
	h=From:Date:Subject:To:Cc:From;
	b=L3jQvM6bIy/+JGaYmIzhi3iO8TFIQVbvkTd88NOOScers45oRIdcihBPgRScNtZ2V
	 EQYD2EBdIbpzNeMcz6E+QiWjI0fAQQdMyl6VfpTie9ocPvwGX4nz9Dla6ZxAt7Cth/
	 7Zv7mBU4uxd5hQovDN0Ajr52PT7Kjv1s9MrGxCn2SvrJCByKGWqMOeFbWSTW8HeP3i
	 T2c45siQmXEfcO87ufDps2Aznlj/LsHosD7PA4ZiGOQax7C06LsNbLqFf1yCJkUujP
	 z+S1jQWMaYfGzS8/Q8nTeJiwh7oKxfCgm+mN8pHdlqwksBHF9S9U+6HwtPtqBFnrA0
	 aTSXadOpUf7yw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 18 Apr 2025 16:17:20 -0400
Subject: [PATCH] gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-gpio-ich-fix-build-without-ioport-v1-1-83fc753438ec@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE+zAmgC/x2NwQqDMBAFf0X23AUjpkp/pfSQ6NY8KG5IYiuI/
 27ocWCYOShLgmR6NAcl+SJD1wrm1tAU3LoIY65MXdvZtjcjLxHKmAK/sbPf8Jn5hxJ0KwyNmgo
 PdjR37wbfW0e1E5NU9/94vs7zAj1qjhBzAAAA
X-Change-ID: 20250418-gpio-ich-fix-build-without-ioport-75816ba7b45a
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BdURm55BBBuG9p5CztnmdkGeWDKrLKxOH4hwmr1P1oY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlMm8P19Tssz7xxmb+N5/Yl8YjjggIxlVu2O7sEbvX14
 t50jeNwRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIxBZGhrWL92gkaSpZOtoX
 LTWc3bXOTyW0vu/4yfjE+V/kfs6bZcXIcGZJ923P6r+bs+dcrL0WWPE78PgcbX5lvcuz97Mu1e7
 7zQcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building gpio-ich.c for a platform that does not have IO port
access like s390, there are several errors due to the use of inl() and
outl() throughout the driver:

  drivers/gpio/gpio-ich.c: In function 'ichx_read_bit':
  include/asm-generic/io.h:578:14: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT

Only allow compile testing when the targeted platform selects HAS_IOPORT
so that there are no compile time errors.

Fixes: f3592d252f77 ("gpio: ich: enable building with COMPILE_TEST=y")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504171941.g1yXja0j-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bbbb550cac93..13b7319162c8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -380,7 +380,7 @@ config GPIO_HLWD
 
 config GPIO_ICH
 	tristate "Intel ICH GPIO"
-	depends on (X86 && LPC_ICH) || COMPILE_TEST
+	depends on (X86 && LPC_ICH) || (COMPILE_TEST && HAS_IOPORT)
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8

---
base-commit: 550300b9a295a591e0721a31f8c964a4bc08d51c
change-id: 20250418-gpio-ich-fix-build-without-ioport-75816ba7b45a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


