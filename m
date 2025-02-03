Return-Path: <linux-gpio+bounces-15254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BFA25937
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 788943A72BB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7168204F70;
	Mon,  3 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7fE9+T8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7782046A7;
	Mon,  3 Feb 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585133; cv=none; b=Tx2WEqLiY3b45p4CEr45zNrIb5vAdW26u06k+fzwXUqq9oNcPSgjOuLyVdoRHCfojtW9ucXIx79cm5dRfMyGjG9VIp1529zNDDYmhFLL0lXRene512OT9zvBmotEyZTS2bhV1nVRH/9spXQ4kOnRyA1qrXBk1UrL9p65b7DkYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585133; c=relaxed/simple;
	bh=3Xa6HMKAWIS6aboH1fJeVcudXNKu4nCD4u6LMxW++vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlDnVOzl/iB17BGyUwZYf9DYLWBJCSJN9W1PmujPiui1JwLQkmj26t/v4GmHhQRV7OAK6Igd5413q9lLrvAoca9ihUlVfNN80kBycb2MnToFhvw17yHVQb6TbRo0JCKQ0zBCebrijJ2n7pOZDwE8PRZlUwv+OXEKleIXLTYjEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7fE9+T8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585132; x=1770121132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Xa6HMKAWIS6aboH1fJeVcudXNKu4nCD4u6LMxW++vk=;
  b=d7fE9+T87yn130ah14ImL9JmIBkpJIlXcZEXUZKO6jJxjimgF4I5mshl
   v+bGIwvA+lUeIEmcMpq1aZ0U7fDNQSIA6YSQBb1WAslBEy7yxuI4Ovy17
   uH0mMsGHlzpCLfMcIXjMUoZuP2/kmF26dgq1RMheeSMA2FZ3BaoqeTyNi
   lJwkR5dI9r+P5jrx9LSzpVrcbvQCsfdsRfB4PZpGBPwrMuMYjuQUbbvYJ
   L2RvAwegebnxP6RmG5bXkBLFYMK0lgCXPfQN+PNa4x8yIOD0UAWZG/Moa
   j2EsBFO24CwopFpWmtZ7vxB9OEnCkjDqHgM/7xRSiVCr5lDqh/pPmLNjJ
   w==;
X-CSE-ConnectionGUID: ZMRcs8vIQ3+85h6yYt9eZg==
X-CSE-MsgGUID: XIlLF64DR2at5rxIBmWKZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56502997"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56502997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:52 -0800
X-CSE-ConnectionGUID: YfFmMB/6TySTviUT9zigyg==
X-CSE-MsgGUID: MB1rznVkSyiwlVxzHOPQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115279165"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 04:18:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9970657C; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
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
Subject: [PATCH v1 7/7] gpio: 74x164: Utilise temporary variable for struct device
Date: Mon,  3 Feb 2025 14:17:23 +0200
Message-ID: <20250203121843.3183991-8-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep a pointer to struct device.
Utilise it where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 2cf77c0a5615..4f7837515e7a 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -124,7 +124,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (ret < 0)
 		return ret;
 
-	ret = device_property_read_u32(&spi->dev, "registers-number", &nregs);
+	ret = device_property_read_u32(dev, "registers-number", &nregs);
 	if (ret)
 		return dev_err_probe(dev, ret, "Missing 'registers-number' property.\n");
 
@@ -134,8 +134,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 	chip->registers = nregs;
 
-	chip->gpiod_oe = devm_gpiod_get_optional(&spi->dev, "enable",
-						 GPIOD_OUT_LOW);
+	chip->gpiod_oe = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
 
@@ -147,7 +146,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.base = -1;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
 	chip->gpio_chip.can_sleep = true;
-	chip->gpio_chip.parent = &spi->dev;
+	chip->gpio_chip.parent = dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
 	ret = devm_mutex_init(&spi->dev, &chip->lock);
-- 
2.43.0.rc1.1336.g36b5255a03ac


