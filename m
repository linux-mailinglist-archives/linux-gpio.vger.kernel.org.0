Return-Path: <linux-gpio+bounces-20835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB3FAC9C9A
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 21:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB09517AD3B
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 19:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E501AC891;
	Sat, 31 May 2025 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkRWvZHz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD121A23BD;
	Sat, 31 May 2025 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748721492; cv=none; b=kSWY0fRp1OZ0zryOXXl0yOEcuu7rTpSXc46ns1ip0BTArWhpYs3ZKfhbc4Wxthum8xJY2Ojsih/ZbtHYsw448YNh717CWjhliC7nSsrCzAE+vqHirplT2LKZIasE6K/2FkWfWBD8Z2KdMuHIcV3hClgQQqOuE/oUrY+TGGYFP8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748721492; c=relaxed/simple;
	bh=bVFdcBN9C/OIv3jmeqAofX3ERR9ca8oz1R9L31oHoXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5ARw3ZRvxsUTXikQCJcOHrUKQoqBfJEggFiamNgtc/QIawF0v6ZpHqMQNPlaglTtzE4AoK8MQ5qhPJaK6aiISesn+VHDTFEVCCX7Us7wOm9pVNWXIA1VkoxJSAZxJVCOS5bqdKSNKCKN22s8CWHym1TIQxFxs7pwZcByZK4aYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkRWvZHz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748721490; x=1780257490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bVFdcBN9C/OIv3jmeqAofX3ERR9ca8oz1R9L31oHoXE=;
  b=XkRWvZHzJNryoqwW7NyQ5KFt+GPCs5PvxUTkuDTWrWWoeFzaDR5zPIOB
   xzYdJTMEi/m18caRwPwHcLVODll2FVHokFS/9ln+j9GPUBYngzp6+ZE04
   bCV1Dffhzx+WsTqeY4zVK9vXo9VOhJKY8g7+/G3x9HHjgcx958dL+TESD
   jHAoHbIA1u1RvqMuIPbiAzKjiRGq3qk9Fyojz8a8VNys0RhUZdeiFhAAo
   edRcXHWxp29j1EBclmBhh7eGfH97qy4Z2kgPc/edugKKpJtjARRyuz1Ij
   aj+sDUx+qk5G7Qjo97ZA2yemViNTfvwLN8dJ+szuQds0EMZwoCTW9CbEj
   w==;
X-CSE-ConnectionGUID: V1ZCyxgJTGqj+f4bF75EMg==
X-CSE-MsgGUID: 1cK/2dawSd6vextB13xxkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50886641"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50886641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:58:07 -0700
X-CSE-ConnectionGUID: Itpmf+I6QO2EZn3uk5ojqQ==
X-CSE-MsgGUID: /DSvb03nTOucpffMCl0llg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149455597"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 12:58:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DAA6614B; Sat, 31 May 2025 22:58:04 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/2] gpio: More cleanups to legacy header
Date: Sat, 31 May 2025 22:55:42 +0300
Message-ID: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If I'm not missing anything the 'struct gpio' is not used and
GPIO_DYNAMIC_* constants nowadays are private to gpiolib.c.
Hence this series.

Note, this seems already the case for the upcoming v6.16 cycle, hence
I would like to route these patches as fixes to it to prevent any possible
use of the mentioned definitions in a new code.

Andy Shevchenko (2):
  gpio: Remove unused 'struct gpio' definition
  gpiolib: Move GPIO_DYNAMIC_* constants to its only user

 drivers/gpio/gpiolib.c | 13 +++++++++++++
 include/linux/gpio.h   | 25 -------------------------
 2 files changed, 13 insertions(+), 25 deletions(-)

-- 
2.47.2


