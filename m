Return-Path: <linux-gpio+bounces-13045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF99CDE43
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 13:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 468FD1F2279F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 12:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC671B6D04;
	Fri, 15 Nov 2024 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asciRo2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A5CA5B;
	Fri, 15 Nov 2024 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731673835; cv=none; b=Pkg+E9WepDWvMgQOyE4mjtJ9YiiVDBlhNeq8QPhyfVr4pPLYTcL0LqUatfUrIOKP19qVmh79L9xsIkSud3ZtmtDt7Eu27vfqr4MT1WEmH+k/6kQ3o7x5LORoaQU8b/mNBn6nolc1ajBk+jq4Y6zreQeqxgCO0bWtj34+cjt12pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731673835; c=relaxed/simple;
	bh=NaxNLBeCp7ye0quQ7CtXuUKXt6V/1rAQduCHa/H3SX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fd2lF7OeJAfQHp7eZn18RC3tLdI+5/42q/BPx52zLIryw9P+QpD7k0hJY1E/oxB9gz9SisDhWCHq43qWE9l/tqqcot0tF28vYfiey9o9rg+/jCXVm2wWbyXC9MqC6OBT4RTfXWOJsPXjzf8P5TU72sbUHKm2kKUF2uuWVAfwzls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asciRo2P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731673834; x=1763209834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NaxNLBeCp7ye0quQ7CtXuUKXt6V/1rAQduCHa/H3SX4=;
  b=asciRo2PTWyXwglXlDuzn8hoxubNaljUn2PJJ4qfIlsCR8uvPTAF5kAe
   i2mSM641s2q3kxB4/E3EIRt6TrjzAms955P74BBkzBh9vIK6egNBT0q+t
   NtFTRygGprO38U3jWjQc7l2e98aY5ezAFRFB/g6w7cg22cPXS69KAmkfs
   u3HtlxXFAQf/CCLaIBoIXX2kQ5IWy5E5Sx+H2hb0fFnK01mEsmBzw+rNQ
   X2S6fcJySJ4xhaecLsmiVuzSkQW9SKsDXS+rJ8iVjeDbMacmcGx42giGG
   0IrgqihF6YlsJh3LGONJ22a9JubmM0rvOaePpol0UYHr8ovNnYWzmDzTO
   g==;
X-CSE-ConnectionGUID: e3Ts+XT7Sx6ps1Tdpv5p7A==
X-CSE-MsgGUID: fnsMXwLRT7GXAfBuO00VNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="43077365"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="43077365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 04:30:33 -0800
X-CSE-ConnectionGUID: PJBs1wj9TQOp12NFmvbjlw==
X-CSE-MsgGUID: gA5j0lUrS9+Fnv97A0XQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="126090615"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2024 04:30:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3525F1AC; Fri, 15 Nov 2024 14:30:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: altera: Add missed base and label initialisations
Date: Fri, 15 Nov 2024 14:29:46 +0200
Message-ID: <20241115123028.3904126-1-andriy.shevchenko@linux.intel.com>
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

Also initialise the GPIO chip label correctly.

Fixes: 50dded8d9d62 ("gpio: altera: Drop legacy-of-mm-gpiochip.h header")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Can be folded into the mentioned change, up to you and sorry for missing
these in the first place.

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


