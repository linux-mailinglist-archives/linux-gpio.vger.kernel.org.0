Return-Path: <linux-gpio+bounces-9586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A529688E3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7536286166
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204E21019E;
	Mon,  2 Sep 2024 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/H7/y/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173C10A0E;
	Mon,  2 Sep 2024 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283925; cv=none; b=FXY199DsjhaGhJpKvTBJCUxpqTIdkppjNCuR/+qc8WCjWZ2mFTQaC6du55l6QVKn5uZn4DP2S3TTNIAwICiXCvdmvSkF4LuQF6U6guU2eIcp/jBAKPT5InxsctqoYlssUrh5tMx1PGjQ/EB7qEt9c1ilBWe5emUzTqGVu9sbIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283925; c=relaxed/simple;
	bh=7XH+G1Xb/vD8vf0GcakPf1WizXUz/rhT3tCc+q7JEcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pm54PrQdhwQpqHmDHCpu9F9FUaSVevEZpjXzJcTWBLUEaSg0mQW6/0ck6TarYG+8ofpvF5oUtALb33lgrIy/P0P/AqbGpzNBMnx4SktP/ekR413tuY7Vo260qRvx6DsfjejS8Gs48r3u4gmqGJ7Dbwm4ofYRGD7LezgyHlNqK7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/H7/y/Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283924; x=1756819924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7XH+G1Xb/vD8vf0GcakPf1WizXUz/rhT3tCc+q7JEcU=;
  b=A/H7/y/QFKs1vsAregCl8043HcAKJl5kPmodn8rpgGayQAguZU8orS16
   xtpMDGFM8ut9lYsx9bkx1kzwklQlwQ0VFe2oZ0kjhlkms1+YpPPGJ/6rs
   0qOmsMlCUhuMZqdNs1TQbLb6w9XNWZOXGGXGCjx2kY0ReFeTsfL/oXSkt
   h6MO7az8K7IfDqvN7Dk8XZ5jcLVGpseLLVAbAcPAiPsfLvDzV0lx068tm
   F/Cs14PhAbOAHLQq1ArFOuAUHFm6dMBdtaMEQtQ0bPCI6yLdX4sa1UqCZ
   rn5kC+vmO+peQYV36aZkyVGvVRIyPmksZ+1LvZbfaik+zRagwKXK+M8XT
   w==;
X-CSE-ConnectionGUID: Ex+AJo10RFmkBlaBmkX6Lg==
X-CSE-MsgGUID: b+dDmg+7Sx65wwt+FeS02g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022573"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35022573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: M+jjVR5wQYCMPQ+GdDN7Yw==
X-CSE-MsgGUID: fmyiHwNASM6OuAbg2JE87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65114779"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 48B883BA; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 2/5] gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
Date: Mon,  2 Sep 2024 16:30:41 +0300
Message-ID: <20240902133148.2569486-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no evidence that the 'dev' member of struct stmpe_gpio
is used, drop it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 4e171f9075bf..99f1482b2ab3 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -31,7 +31,6 @@ enum { LSB, CSB, MSB };
 struct stmpe_gpio {
 	struct gpio_chip chip;
 	struct stmpe *stmpe;
-	struct device *dev;
 	struct mutex irq_lock;
 	u32 norequest_mask;
 	/* Caches of interrupt control registers for bus_lock */
@@ -481,7 +480,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 
 	mutex_init(&stmpe_gpio->irq_lock);
 
-	stmpe_gpio->dev = &pdev->dev;
 	stmpe_gpio->stmpe = stmpe;
 	stmpe_gpio->chip = template_chip;
 	stmpe_gpio->chip.ngpio = stmpe->num_gpios;
-- 
2.43.0.rc1.1336.g36b5255a03ac


