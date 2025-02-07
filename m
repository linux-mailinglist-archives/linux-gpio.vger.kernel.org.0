Return-Path: <linux-gpio+bounces-15543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE8A2C69E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3F691887E29
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBEE1EB1BF;
	Fri,  7 Feb 2025 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4kGhV6r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC841EB196;
	Fri,  7 Feb 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941117; cv=none; b=uTXTb1arTYNB8vIkX2Jaz9V7NpOu5P7LHT4qhpWNR1CaUuLZVx896jFLKBVvOPVqhzGe0Z/OXsvbXs2xKGRNRws42H13x0lh0kfRC7GaXKxlu88oMlMkUoIGm6/jvgJBWUpXvNQdgr027mXv2zC8ACJXyje/gYk6SxUrGVHyOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941117; c=relaxed/simple;
	bh=FLMxQ7hvYXOxZ42o6lJ3hH7EZsiSH4vg5wyKHpAWml4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1R0SV0yjd2IQ3nyApZNCnOk5/lGF4yvu6zu9xdoBaVQsy5r5ZU3RbRAmz4FQoPfCvCVtsTijJAQiXKBXrzGfUJKv4ah6MkB7L5FUqlC6WtEVQQHDsN2sY4npmgx8PGqx0VJfBp/R2L9a5FUZwGeMm2t2FyB0MW67aqeiaAjerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4kGhV6r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941116; x=1770477116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FLMxQ7hvYXOxZ42o6lJ3hH7EZsiSH4vg5wyKHpAWml4=;
  b=O4kGhV6rDSXT7xv1h8hSimCawoWikiEJ2xapd9/WqzthT/d4LF1J8xpL
   TmxGZx00ZbUnbamQeberOAJZz+N5hmAn+geqrIotpBw7nS+FFoCunOIzz
   Pr1+LhamPmjRZA3NVjlkfjifE4PhlU1uxR4QA1M7T57T12mBb19Q8ZVR0
   nrt92Md2o3ajm7EBQmFzsRAoY4vzN6uz7daEiQFdju3cM0CuIPLVALKmV
   MD4D3KGCvVDwsR+08Qg3r2qOdeTYPKZIib1s3XIMnHsuoLi7yg9HDqHe6
   tfncr6/ySwcrJtBG1ce5twKZfYJJZtZUutOoQd0JrqQ2pjAU/oq2oyCwG
   A==;
X-CSE-ConnectionGUID: ZUB68WwlQUShsE5PtiMphA==
X-CSE-MsgGUID: Tdypv9e/S/aHmKOEU/upgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57120806"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57120806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:11:53 -0800
X-CSE-ConnectionGUID: 4SyhR01jSSSP6e0ERzJEOg==
X-CSE-MsgGUID: wHozCGOvRP2SEkQtCAghUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111511666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 07:11:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 22FAB125; Fri, 07 Feb 2025 17:11:50 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/3] gpiolib: refactor for_each_hwgpio()
Date: Fri,  7 Feb 2025 17:07:33 +0200
Message-ID: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the for_each_*() macros use the very similar piece of code
that may be deduplicated (by introducing a new helper macro in patch 1).
On top of that the implementation of the low-level for_each_hwgpio_in_range()
looks too verbose. Try to simplify it (patches 2 and 3).

Changelog v2:
- added kernel-doc for a new helper (Bart)
- added two more patches

Andy Shevchenko (3):
  gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
  gpiolib: Simplify implementation of for_each_hwgpio_in_range()
  gpiolib: Switch to use for_each_if() helper

 include/linux/gpio/driver.h | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


