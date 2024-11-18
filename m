Return-Path: <linux-gpio+bounces-13066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044669D0D20
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 10:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FCFAB213CC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1833D190468;
	Mon, 18 Nov 2024 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsJjyLA+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F017C98;
	Mon, 18 Nov 2024 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923648; cv=none; b=d6tOIXuv2XQt31kJ5ffSG3kLWocgOqLnVAuxw8sqcjsjeux/cn+iBH7bJN2pUWNhsXf7hdC5rgVwipVhkBvIdi47Ww/5RF2GVLC8MpsCtCZejXXVbfUqdulwbzxaNHREebkwIlXs0j8zW1spN9iGnxwWLIVhaN8CSnNFdaQ3GhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923648; c=relaxed/simple;
	bh=tI+FgdPRksEAbc4BZG9O0l0bupYSJsgZBQ0vTwrBazs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SefkZs0w6RfN+GeFE32QcdaHp8Cpbt936IU/7Pi4+eOl1OH6SPlw7iVuo3a5DLYLeQYSf/z160oCTzwcHVNK6FH+P1a+hDiLR+Cv/pPXUmXe9/tXXjbLqfMyy54T8PyzMNaEncF/NVI0Ii5Gd+nO6rozIqKLOMnSjkC4qKWaZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsJjyLA+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731923647; x=1763459647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tI+FgdPRksEAbc4BZG9O0l0bupYSJsgZBQ0vTwrBazs=;
  b=jsJjyLA+HkTQtoTkNxa2NYL+ogpH79dlsBVMA2cLPRe5PiXP89Kl3jEp
   ehRlU/f4hB5bxgp2M1wPSKDuPvehubN3ANEPNj8n2kfR18GJ2TaUaaqMD
   vJbrdn5/PDhYOJApINHII4sOrpfj5vK/bCbfIdz3Ymf1G0aEhIuSkhu7N
   MtzdLeoAs5OCaf4bBHx9WDvQlYafBmdXh36M4uRBOPgiVKp3B442Va43k
   XNxp+xzYU2TlcVG37qgqCj2yj3DBQj5hZgRkE5BETlB60Gw1IgxKqn3na
   qhZN7kusOVp0ScnKlBVgZFqvheXFpOPLbAYHtAdfnF8ZVdi4bkpeKOsWT
   w==;
X-CSE-ConnectionGUID: 9enKWM3zTTKAFiSzRrBq+w==
X-CSE-MsgGUID: 9/GsmDXaRauxEho76TkFoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42508321"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42508321"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:54:06 -0800
X-CSE-ConnectionGUID: fguY9azgTZO4+dracBBAZg==
X-CSE-MsgGUID: UtVD6OTHTRW84Zwd/mYtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89303783"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 01:54:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9DD43277; Mon, 18 Nov 2024 11:54:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/1] gpio: altera: Add missed base and label initialisations
Date: Mon, 18 Nov 2024 11:28:02 +0200
Message-ID: <20241118095402.516989-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During conversion driver to modern APIs the base field initial value
of the GPIO chip was moved from -1 to 0, which triggers a warning.
Add missed base initialisation as it was in the original code.

Initialise the GPIO chip label correctly as it was done by
of_mm_gpiochip_add_data() before the below mentioned change.

Fixes: 50dded8d9d62 ("gpio: altera: Drop legacy-of-mm-gpiochip.h header")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: explained why label should be initialised (Bart)
 drivers/gpio/gpio-altera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 039fef26546e..73e660c5e38a 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -261,6 +261,11 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->gc.set		= altera_gpio_set;
 	altera_gc->gc.owner		= THIS_MODULE;
 	altera_gc->gc.parent		= &pdev->dev;
+	altera_gc->gc.base		= -1;
+
+	altera_gc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!altera_gc->gc.label)
+		return -ENOMEM;
 
 	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(altera_gc->regs))
-- 
2.43.0.rc1.1336.g36b5255a03ac


