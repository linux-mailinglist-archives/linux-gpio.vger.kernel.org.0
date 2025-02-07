Return-Path: <linux-gpio+bounces-15547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ECA2C6B4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76AF188ACD2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C591F6664;
	Fri,  7 Feb 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqMjOydc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0E1EB19C;
	Fri,  7 Feb 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941514; cv=none; b=BFA2DfQfFQDRiMRMvRrDLFr5wduqpTWIXu/hlC+VktbKTEol/ucW6sVVM7N4iqdQ8XrT+ZW/kTagIlmIMI5sOk8ZkqU78nQ0tcuwzfFG+OuST8LLhWqZ+3HAab0uiIByiyNJb6Kryc7/s2cTtOJG8mukLH96xmzocTej5AhC9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941514; c=relaxed/simple;
	bh=ENGCXMU4WTWaSHW6BE0m953OZ1GFz2d8DBXIDnt7ISw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNTeQjJ3kZkikLTdi/84oGsaB4JWVRhlrIl5IsL2Q1HkYqD3MBnEv+32Uu4x1+nAB32NsdzaPhbvk3B6OcjPQl8TVEh4CpTNwUiWlPVUXSeuvIj4TiIZsLzSYtupVvfPatwagrqhlnCfEE9JVl5Z6ckjpv4rAyn5JynE2wCqSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqMjOydc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941513; x=1770477513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ENGCXMU4WTWaSHW6BE0m953OZ1GFz2d8DBXIDnt7ISw=;
  b=kqMjOydcMjMQlCfi6pmPhU9yorYx8ZdHS5p5NFyiLpW5c+Q9QleNFMMS
   jYcln41GWEDXGq651UMJxzZUL//Q/rWVY3TflT06UkYGVDWn2QSzFsOii
   9HdkeXrAULW1U6eHrNtJaN0wsFQgAFB8cF5mao50s4GBXJ3/Jx8vmiNiu
   +HIne9WuRwfTBPwcwERYEGpbmnl3h6pD1qIqlF4Fr4mjA5dRuvmw6NqeR
   6RgQECA1yA3tMZ0m8LGTeWqA+fooAW2Q5VVJbqoWnYTEM4kPxGuDSNzhD
   qcfHeKUkffVONmgN9WXiL6eIKHEs2S5N9iZM+bwW/u/E88LsTinM9urao
   w==;
X-CSE-ConnectionGUID: fYf7hs+MQ3S8GlzqJVgwaA==
X-CSE-MsgGUID: j6CBdRIoQteIhTASPF5I7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815615"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:30 -0800
X-CSE-ConnectionGUID: vlwryk4wSr65t8RLyzDhIw==
X-CSE-MsgGUID: lGAcB5d9RHqi8L4OxamRHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599314"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A85AD322; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 4/7] gpio: 74x164: Make use of the macros from bits.h
Date: Fri,  7 Feb 2025 17:17:11 +0200
Message-ID: <20250207151825.2122419-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
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


