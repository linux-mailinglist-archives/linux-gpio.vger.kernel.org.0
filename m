Return-Path: <linux-gpio+bounces-15548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED2A2C6B6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CB0516BAAB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFF423ED7D;
	Fri,  7 Feb 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkrfcEFL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83C1EB1A2;
	Fri,  7 Feb 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941514; cv=none; b=nPmcitNSFX1yM6fLo8WX2zlduYGUTEpmh2GlMsUnepzQVWQq5XSVMVEerXxMlD8t+N/hu2ebH3Mavuj8hpe5QgKBpU++8wVFw+/wea1YTYulQHmY75B6C8dWywI76M0pIUkWi7CbQHIMe5khvPTdZkceTCCMfZXxDPtT7oUp8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941514; c=relaxed/simple;
	bh=26dwUP/V8uN5xsZwNQvoZJ1H86oZuP5cbB4CjDRjYVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVU+iL447vmjRm+ZVjGsl+HZK4BTi1d9joQZJ+VR1jxibrgts1lILwsr0UqhXne3CkdwYsxS0IT3OGuZ4vj+TOSNv82Yg56QF1FQ31hyxGh0JvTLdyFcJarICQqGLrA/LyHD254UdSruZUBcGXvD1Xz5rnQi3Aos62hMv3aKE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkrfcEFL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941513; x=1770477513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=26dwUP/V8uN5xsZwNQvoZJ1H86oZuP5cbB4CjDRjYVg=;
  b=AkrfcEFLyJ/A9jPA/Fms81jEUKiPJhGRLTSefqWf+z1hIUpA6kfQ7Uha
   /wj/PK76rKbS2/8/KBE5xEYzcSLIlx86CwEbqEvvLr+2h85wd8GxToPfz
   dCDmNVUESSe9Ok6/JwNyTJ2RTf0I+qZipivRUIs4mS4+TjUgU1Wx7eD9s
   pW+IPNUGg3Qs4z338SbFpzeuFD3Q/ZIb6CkYW5ikbQu8qHJFNPE8YKqVb
   hJHl6pqD7dgl/tdSZ6Lf8O/1oh+1Og2uHVeDh9A2Ctze8t0b6MPey6Rqe
   QjyGwRaeOrWed1Aj8ZQWE2gwkle9S5YDxTxdYE7sQf2xEWU6EXEY0OdYW
   Q==;
X-CSE-ConnectionGUID: qqPFBi1qSmWPDkxWy5tqxw==
X-CSE-MsgGUID: SmnlMipfSgaQdW65lfcXeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="64941723"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="64941723"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:33 -0800
X-CSE-ConnectionGUID: +N051xMoTT6/FgVfiANSyA==
X-CSE-MsgGUID: 2YGEshMWSQqWw1jy1NxKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112179900"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2025 07:18:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D2A6D4B0; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 7/7] gpio: 74x164: Utilise temporary variable for struct device
Date: Fri,  7 Feb 2025 17:17:14 +0200
Message-ID: <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep a pointer to struct device.
Utilise it where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index bbeef03e3797..db41abcd73e1 100644
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


