Return-Path: <linux-gpio+bounces-15252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C8A2592F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2F4161829
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED46204C06;
	Mon,  3 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4ypDP4d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB168204692;
	Mon,  3 Feb 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585132; cv=none; b=LWjv4UB3fc7D1qDIrLbbCtwoxa6D6wFQrneTkU9V0aBXU7+iRtLgg+G8g1tOda3d6gBbDdUgHeRhaosq1Ar8LdgxoQMHVySq870RMhWezyHF3YlkCKSVYMsD07D2Bpw2i1he6KEUyiSxsirv5CmeyAYh6zqmo+DETj5OeJLUMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585132; c=relaxed/simple;
	bh=ENGCXMU4WTWaSHW6BE0m953OZ1GFz2d8DBXIDnt7ISw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmVYxjE+O9W6hSBEFh1kALJNdj4JeCTpop+DaQnkNRXlrwCDxpKymkq3kQHRJ9UGUNIM33y3WtLxu3MiE9chJ/BkHiYuCmBboac363qkIAM24uTqcNaMtrhttBYC2qdfRASKyM96Lbhd+HfF1Q453rLLpSmP8hV8EdZLlTW4oLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4ypDP4d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585131; x=1770121131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ENGCXMU4WTWaSHW6BE0m953OZ1GFz2d8DBXIDnt7ISw=;
  b=L4ypDP4d9rQaaq0vIRZfFJCUCCcoO6a+SHUhPMgDPBPwdFT0BSfHR9Bn
   +aq8GuFTirAJWhQSCBH8Zd0mgLrzVPzlQAdnbC/jmndbvtH1LYYbo09F4
   r2207g3M3Dz4P/8C1j2ayuOoGZ7IoHtm+qloiYRR1s+Q0i/lGNmeXEf8r
   74Zf7XN73YbHiluUoFT0foQV2S62w+w7xtqJt041v8MTjeXqWCGF4/9e4
   AINExDjKHc/s6Zo561eFVnY0rGDUAgonpZ4LXe+z+vtt9JL2JYXGp3ptq
   XZlFElXNWPl9YvQmm8YhdS5GIwB8YI8IVkoJ0TEyMoHQu0D+fH9lamGE1
   A==;
X-CSE-ConnectionGUID: D144BmzCRwqESdPBjdXo2w==
X-CSE-MsgGUID: SXK7muM6TZao/4XHV1T7XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42731512"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42731512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:48 -0800
X-CSE-ConnectionGUID: E/ma+mbVQyOSoMnxIoiwRA==
X-CSE-MsgGUID: gjnylqHBSYOYd/gIvaymng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141138406"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 04:18:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6835A353; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/7] gpio: 74x164: Make use of the macros from bits.h
Date: Mon,  3 Feb 2025 14:17:20 +0200
Message-ID: <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of BIT() and GENMASK() where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 7844f8a58834..0f720d539fa7 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -47,7 +47,7 @@ static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 
 	guard(mutex)(&chip->lock);
 
-	return (chip->buffer[bank] >> pin) & 0x1;
+	return !!(chip->buffer[bank] & BIT(pin));
 }
 
 static void gen_74x164_set_value(struct gpio_chip *gc,
@@ -60,9 +60,9 @@ static void gen_74x164_set_value(struct gpio_chip *gc,
 	guard(mutex)(&chip->lock);
 
 	if (val)
-		chip->buffer[bank] |= (1 << pin);
+		chip->buffer[bank] |= BIT(pin);
 	else
-		chip->buffer[bank] &= ~(1 << pin);
+		chip->buffer[bank] &= ~BIT(pin);
 
 	__gen_74x164_write_config(chip);
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac


