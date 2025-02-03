Return-Path: <linux-gpio+bounces-15255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0850A25933
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9226D161660
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3CB204F7F;
	Mon,  3 Feb 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3uqBp1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCF2046AF;
	Mon,  3 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585133; cv=none; b=HDo06jMTxKFH2Hwan5XUnuM2vNmx9Qkt/rbZTMYhr1Mzt2/ZeVhTjmoJKsFWfOb3xiud9Vmc+ABacSqehT2GV6jxIztOqHox5BvWIYtFwgjlIMdWKWegvyvCeEIMDzPpbkc+ZfrIRix7q7BMGsRkSMT82JJHHfFcQN5CW1yCFRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585133; c=relaxed/simple;
	bh=stulSNPBGDyFHMLPU2+q/n4F3bwCtUrcyZnXL/C3jVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXbAryOQ2dK81pFEplVxGoTIp1gxefh617Ad1a0eybDOPwnQsZJJFPiVJa1nZwnOx1XeCN0axlggVBjcRdhMgAoRDjO2ArrtQ2r3517cMCsQbBgrV0/gRsxbjgDtLyG1lhq2jCd7qgBUgxjp9ZMQYVaYu4/Yw9abjv2pvb0V1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3uqBp1v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585132; x=1770121132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=stulSNPBGDyFHMLPU2+q/n4F3bwCtUrcyZnXL/C3jVE=;
  b=D3uqBp1vhWSCLOS1wa5beDrIwztSmjUwmEuPYf1xd16ftsDZkVNV4rXa
   kpOYVAzbRUmTparbkYly27dlBnU7lqcbQVRM0vd/BFupGMbJ+xg6IJ+42
   suqiJkBwmHlgNOQIsf6KWPCRLyX/385dLkRRtBsvNN0PSxPr13vVFPvSo
   XBFSK1tSLqSVClR1eRDxO+CN4Na9Fi+0S89XekkuORad/0fDZD457z5RC
   86DuuX7Jr88f5ZcRLW90S8uZa3sP8VB9pLWK/ve7POZxzvtvKiO3tDcQT
   RNM+HjIddLuK1HyxSijQHp5InD2tIkNils+ajkLriq8MW6L2iciVQQFiL
   g==;
X-CSE-ConnectionGUID: qJRcFpkqQWa2BgHz36YkzQ==
X-CSE-MsgGUID: zMYq1JnDRhKDQg+pDACKuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42731516"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42731516"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:48 -0800
X-CSE-ConnectionGUID: DBE59/10SAq94wDO5qzo0w==
X-CSE-MsgGUID: +zea3aJ2RQmkN5REGD2hCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141138403"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 04:18:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3FE03214; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
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
Subject: [PATCH v1 1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
Date: Mon,  3 Feb 2025 14:17:17 +0200
Message-ID: <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com>
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

Remove unneeded dependency to OF_GPIO which driver does not use.

Fixes: 3c7469514dbe ("gpio: 74x164: Make use of device properties")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673..56c1f30ac195 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1790,7 +1790,6 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on OF_GPIO
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
-- 
2.43.0.rc1.1336.g36b5255a03ac


