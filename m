Return-Path: <linux-gpio+bounces-28379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 582ADC5162D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992B1188BDC5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168952FD7D0;
	Wed, 12 Nov 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lS45aW9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6A2FDC20;
	Wed, 12 Nov 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940173; cv=none; b=jBPRpzlWzaD+8TP6xq2llOXSNVSwnWm2J3unCoUUXPWFb9/0/L5w87sWGEDYlHAxNJiGazrfDvJmPpYcRNOfdOTwMGkaLEJ6zFTyZWqj8ulkObi9GZa84Vz3CyCMiFGoaK1/fV4l1HmcXrqqZTQ3wIQ16zKVCA2bXz1jMTGaMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940173; c=relaxed/simple;
	bh=Gom/YJxiDrLnN7NOpDCmQ225IxHKE6wTgvcIS07BeLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fsu8kvqRZy8pWYjPcm0uWNEDiUhiOGvKpQumQK+1/qx1IMjzUbFhBBP+kYO6YByCrOXzIW/OVHetNZeO3bhURZOtdiPdhNuBGxsCkp+Q67H2JmtHUFf+QTfCMRbFWfkKGkjQ4TYfSEmUo+3AhWRktCI40ZsSGj3oFJeKDgYGfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lS45aW9p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762940172; x=1794476172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gom/YJxiDrLnN7NOpDCmQ225IxHKE6wTgvcIS07BeLI=;
  b=lS45aW9p16VtkqBoWP0k5wl38h9IXygkn8Z8j0I641aor+oMCVAUBcwH
   v3r59glIUNx5jyDEOM4IWPSpNopt6cpn++6HfPcDbZhEwJTXvFKCtfPmk
   h0Bnb6IUxuhPXOWfMIMAwlZxlPRR2MqVKiZfMkpSZWj8Gr6mMNayPjwX2
   3aXuBCShpS48GSgDwGor7Pg3yZyERWHOsvUrbKWpq2GWvErXxCgfbVvHJ
   dofRaRituvtUFsSqOSKuqCw3U1m0jBDaXSif0pBmYlCKRqmpb+mUJnmeY
   sdAEDNl1cBjeDn/chvjet/DKUrG33xEG6dFpFL7SsOU6nw93OdEKh3XJn
   w==;
X-CSE-ConnectionGUID: f77Xa2ooSvCpyGnzcB1oxA==
X-CSE-MsgGUID: EMROw3GjS0616BUUvR9BOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64202981"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="64202981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:36:11 -0800
X-CSE-ConnectionGUID: mIcXrUg+T7qjRmTjaoXqOA==
X-CSE-MsgGUID: XAqW6kgmT0qeYg7gTPnRrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="188811927"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2025 01:36:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D98B995; Wed, 12 Nov 2025 10:36:08 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/2] gpiolib: legacy: Allow *gpio_request_one() to die independently
Date: Wed, 12 Nov 2025 10:32:00 +0100
Message-ID: <20251112093608.1481030-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow *gpio_request_one() to die independently and make sure
the gpio_request_one() gone first (before gpio_request() removal).
Currently the devm_gpio_request_one() depends on gpio_request_one().
Open code the latter in the former to break the dependency. Also
convert the latter to use legacy APIs, so we can kill it first
as it's not only the logical move, but an easier task due to less
amount of the leftover users in the kernel.

Besides that, we gain a few LoCs with this small refactoring, which
I consider a positive change alone.

Andy Shevchenko (2):
  gpiolib: legacy: Make sure we kill gpio_request_one() first
  gpiolib: legacy: Allow to kill devm_gpio_request_one() independently

 drivers/gpio/gpiolib-legacy.c | 44 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

-- 
2.50.1


