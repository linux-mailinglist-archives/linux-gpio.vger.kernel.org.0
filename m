Return-Path: <linux-gpio+bounces-15550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9FA2C6BA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 544B23A909A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2076D23FC51;
	Fri,  7 Feb 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjDaN8s8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B691EB1BD;
	Fri,  7 Feb 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941515; cv=none; b=nWa9zJdKWhE3iQ6PrALllq9it8WuDgYoIoqfsrtypEgAktu48RtZOuLp4TtTX+DQdQ6FgQBA9xbz79OayRUf77Mmyw1CfqAH11cS5pLsBZQNrl6tZXGhTUhObis+x/Po3bZiFUl/RoeY+HYtf/VBwx80RAFAn6/1KkIpJXUeQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941515; c=relaxed/simple;
	bh=xb+nwPJyddffTQeZ/9ZVscSmAF5CIVQ8h4wBVD/QKwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wm5KD53xs+0VDe12IIHMFTdqKn7KwPHMu/bTOPQDDmAxjw2QwMmr/77pPkzl2qIAGgeNCZVwFnRR/R9VNsXJZgWtohB4ZV48DV+wYY+TnA8+oOp7OUvTOG/YqmSeIv6O1G8rQ+1/BEbf7I7rMiGI/viWFTi34nX2KtriPCJZDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjDaN8s8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941514; x=1770477514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xb+nwPJyddffTQeZ/9ZVscSmAF5CIVQ8h4wBVD/QKwc=;
  b=VjDaN8s8Y3GwBTJXBGmnYQZeCMZSqWw7F5Yt7sGnpp4snukWiEYc9/7H
   d0wfMEnv4XhEYrdf3/XnllXhpoZW2YtWWeFP0/SVMwSt6w0OhOCjfCA9U
   UIfOlRos+U5ma9j8un5Qo2awY0gPzg36S9UXnUaoBpxAasH45AzAgsA+D
   biowu7+HcJbKGtBZGlvKs3E2nH3o92hKcoF31ReA5kW+z7mPfiL3tbA2t
   RZbQqhXFXvFSV6BgiHQlR94XUWpZO7r2oCWvts1hO3wKCfH+KH/zpUYyy
   XdVbr4T9+gngUwZJXRU3zlPXTSWewaEl/rJ6obPRSXhtOMBuzevJHJfhz
   A==;
X-CSE-ConnectionGUID: QGVFuh3fSAW6GMkVVYZaCQ==
X-CSE-MsgGUID: ustW/JEzTIijFAJxTvCdWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815621"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:30 -0800
X-CSE-ConnectionGUID: 2fgJ7cGTShqf+NuiSHDfSQ==
X-CSE-MsgGUID: FlJM2Y+KRXWjac2kmCi3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599313"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7FF15116; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
Date: Fri,  7 Feb 2025 17:17:08 +0200
Message-ID: <20250207151825.2122419-2-andriy.shevchenko@linux.intel.com>
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

Remove unneeded dependency to OF_GPIO which driver does not use.

Fixes: 3c7469514dbe ("gpio: 74x164: Make use of device properties")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 24c7dabe153b..4dbf2198a858 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1766,7 +1766,6 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on OF_GPIO
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
-- 
2.43.0.rc1.1336.g36b5255a03ac


