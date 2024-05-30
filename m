Return-Path: <linux-gpio+bounces-6984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BD8D5225
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 21:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DED1F219AE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614DC768E7;
	Thu, 30 May 2024 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvsPxgf3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1E7581D;
	Thu, 30 May 2024 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096466; cv=none; b=DLag8l9/w7mV8XsVSCeJ8+Xy1i8GpxzBdqUNXh2W+0xdfjEUSKcFOlxkJHERsz4hy+449k3qsQyFgJ9PVvssFJGpdtWchqHi8IYyPsFRuYIuj5hDgLJRZaFQA4ccucFTsgTYuvJi6rIV/eCpQxohTST+urnT4U+E+yDSQcXYBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096466; c=relaxed/simple;
	bh=7ks52cu97HF3ZwSWzL6+SV9D+EkX6wp45bOJTJPx1MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhEOt7whGNrzYtyhBP9QlemEdi33ZemRtDmOAbF+OSmz8t6G2Z9UlDva1c/WVLBaDpL0bthwwZvsmgMkgvrDtjjCnnNQhVa7ino70w8uF3bxiC/WfqSdaLorJYIf2mpSt2irOvNOC1tAwnFq7jJZKcwqES+7eehyLgdVrhclTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvsPxgf3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096465; x=1748632465;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ks52cu97HF3ZwSWzL6+SV9D+EkX6wp45bOJTJPx1MY=;
  b=cvsPxgf3HcZgbdNqr3pFZdANRncc4ubJkCvm29yRWP1FosfsG2KDoA0Q
   PC/QgkAPfqwhkk5A89tLZsTwsF8bSFVn/LQ2MBihfKGoo+sd9QFM6uPaC
   kB9NCPxPwBseGVF+tVqrTIuLQbRzx/Mld3dyYRK5rjtHHmVe7reDrbSsZ
   wdGC7jEH+QqLYcuAYLbERx0LhcygpXRbah5XIscDW+kUeG7ZCS3pCR2xe
   o3D70TrxmGVdglkLz0y/riscnH5s/UMPs1k6raLvQXspMmH9arHtJpoeO
   V3bVSEgNiOiJWTGuKfZWimqx5JCUklzdZNS3Y0PRIqapttBQNTbej5EFr
   g==;
X-CSE-ConnectionGUID: 5asaoB0nQWurSP4Q6MIjvw==
X-CSE-MsgGUID: Z+i7yrnrTWe6lA8ZZ6F8EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13779058"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13779058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:14:23 -0700
X-CSE-ConnectionGUID: BCOldhEOTvu6vlVYnxXAKA==
X-CSE-MsgGUID: KQsCxVCjTpWYZjtA3frELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40978619"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2024 12:14:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 999EC1A3; Thu, 30 May 2024 22:14:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/2] gpiolib: Show IRQ line in debugfs
Date: Thu, 30 May 2024 22:12:28 +0300
Message-ID: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Couple of patches to show IRQ only (when it's not requested as GPIO)
lines in the debugfs.

In v2:
- joined two separate patches
- rebased on top of latest GPIO for-next (Bart)

Andy Shevchenko (2):
  gpiolib: Return label, if set, for IRQ only line
  gpiolib: Show more info for interrupt only lines in debugfs

 drivers/gpio/gpiolib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


