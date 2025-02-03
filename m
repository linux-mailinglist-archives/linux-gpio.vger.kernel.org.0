Return-Path: <linux-gpio+bounces-15256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F9A25935
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434C71612E1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CF4204F9B;
	Mon,  3 Feb 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l78clTPJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F6204C04;
	Mon,  3 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585134; cv=none; b=pFyVDXrHWt5GFZ0JUeyHheLg8fbrzMNZdMF6gNHTNSUm5XCRhMuj04VPEexnFvIkUojBNZ/f2WCCRQRmcmxzlPwhvNbngcSP8A4q6fgfEnS+dSbrWFQd9OPjyMihSCE0BXtpw8Xxoqn7rGgM52vQcTM/5B2ftyuCNlhzrXZ6Ti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585134; c=relaxed/simple;
	bh=AKEZmIwmmi49xx20Ic0IkNg47TcPP9PP5Xf66m4RXVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFD2ADqPTrqjHev3kfPkbymRpUeUiVWzrB4mjpmvYyjBoPGPqW7fbPbvTtL+KqmSunli6dxxISk5StBPxAiGr20R07FUizyF6nKxf1tj1yDniPuMMF098CRTF93/WqyS1CfiP6+dM5HpVaKXB7x2lwpV2QR38ByaJfB1chybAXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l78clTPJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585133; x=1770121133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AKEZmIwmmi49xx20Ic0IkNg47TcPP9PP5Xf66m4RXVA=;
  b=l78clTPJR31VNxeBYfebQE+IwRSIGwsxEeDh2l5GByp2Sa0pgfNOprwG
   9DTWhFPojXxM2QTWffyFMbLu4QodQ/B1jS3YSEz/nGqTmGhD/CjERhmes
   qG7ICSpIIZ1XOfVO96w4m+llYAdJRX399HYqZt7lpncr5haaZjRfr+d0H
   stoEJQcCBk5RwPIW/f7tdFb9Z7ndCcjantyhcCBHN5hUSfXvAMAFS7RCi
   zgWKAiYlqAyHik4ju55S0UqbmcBli+sy+0q9zWIOzPY31XGX6WfQloDR1
   vy4oNkWc3XHfslwnvhmklTW5HKNjaJb9sdobESOF5IxGVb55myoexl6Tc
   Q==;
X-CSE-ConnectionGUID: Tup2glKFSmGD7sK5aSaZJQ==
X-CSE-MsgGUID: ozcYa+fOR+WeatdP1Z0y2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42731528"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42731528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:51 -0800
X-CSE-ConnectionGUID: im5GMaOTTzqjuSNCDD8+kg==
X-CSE-MsgGUID: ijJD+OJ6R9ikHhe+Vsf9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141138411"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 04:18:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 899593B1; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
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
Subject: [PATCH v1 6/7] gpio: 74x164: Switch to use dev_err_probe()
Date: Mon,  3 Feb 2025 14:17:22 +0200
Message-ID: <20250203121843.3183991-7-andriy.shevchenko@linux.intel.com>
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

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 920d3b9c1087..2cf77c0a5615 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -125,10 +125,8 @@ static int gen_74x164_probe(struct spi_device *spi)
 		return ret;
 
 	ret = device_property_read_u32(&spi->dev, "registers-number", &nregs);
-	if (ret) {
-		dev_err(&spi->dev, "Missing 'registers-number' property.\n");
-		return -EINVAL;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Missing 'registers-number' property.\n");
 
 	chip = devm_kzalloc(dev, struct_size(chip, buffer, nregs), GFP_KERNEL);
 	if (!chip)
-- 
2.43.0.rc1.1336.g36b5255a03ac


