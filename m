Return-Path: <linux-gpio+bounces-18841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C48A89B8C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B6327A2465
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E03A291150;
	Tue, 15 Apr 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCBs9+JL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6028E5EB;
	Tue, 15 Apr 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715492; cv=none; b=i8j06kq9rETqUXxLo9ljrbe7dKVwg7ijkwTrZ0sjQlz4D0eIR8hqgFPPi+GmK43XaH4S/GIhaj+ahZU/Dd2KchWSan5xr8vNhcH8pNLLzCc4s4KcjX97M1cjWCkxxbCyUTRdizgQftiKuNj2BOcMX3tSJXxi1hc/gupIKCCZ4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715492; c=relaxed/simple;
	bh=dRTFeXnK1flXP68uc9vpPt3hrXmipSrqts3J0uikqe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYG+LcRaWwfGevtO7Zve5nuXphxO4EvNkJEnMbj950SgwvYhV5s+DtciCWNS+mpUfkFjl2L8xVPT5K+oN++tcNm6mRZLuGGUXBSnp/vp47mUNsS46Ozh7O7bfUeZ6W//bXWNBbJmsknulL57xH8PwJtk/a6NWaRR5+4+0qsZrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCBs9+JL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744715491; x=1776251491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dRTFeXnK1flXP68uc9vpPt3hrXmipSrqts3J0uikqe0=;
  b=FCBs9+JL6bjA2mbqXHR+m8wD12ciQ0FWuH8JW+6O2/KwEr7wmVz7D6l1
   KKUHZnICRnCkJAuwcmQ9mCzPru1wR4qWfeQWS/5tFzBnFbh/SPCyNJQc4
   BXs/rjf8DWAnmTUl41HnbWsoBimof4QY/w2A66+rbxy34sTXcJAOCiYH0
   uTKBoCrnh4jAKmaczx3Wxl+ntd/aZvQTTj2SNXvxxEvZ4Nx2bzLrm91DC
   f3kmCv8RBLSr8gmtBUelaMAMxHNZgGyVeGWtn9QdGjHAg6bpQGpXnqa2L
   vJhCkPk5sP2iwa29Cc4/ex+ZnMWX+Q4Hlvzz2KfWg7YWE3TF2e8JM0Np6
   A==;
X-CSE-ConnectionGUID: UqJz0LSjSseIp+W5nDVPDA==
X-CSE-MsgGUID: /pqEOjAKT1KDuZhuSDH3Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46382939"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46382939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:11:28 -0700
X-CSE-ConnectionGUID: fRXVd+ziQoiphJDTlXRixA==
X-CSE-MsgGUID: /KsJopiNTT+kc1y+/VyBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135072302"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 04:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 991178D1; Tue, 15 Apr 2025 14:11:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/7] gpiolib: Some cleanups
Date: Tue, 15 Apr 2025 14:09:59 +0300
Message-ID: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a three groups of cleanups (some of them may be dependent to the previous
ones, but I am only aware about couple of patches, i.e. 3 & 4).

Andy Shevchenko (7):
  gpiolib: Print actual error when descriptor contains an error pointer
  gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
  gpiolib: Move validate_desc() and Co upper in the code
  gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
  gpiolib: Make taking gpio_lookup_lock consistent
  gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
  gpiolib: Remove redundant assignment of return variable

 drivers/gpio/gpiolib.c | 123 ++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 70 deletions(-)

-- 
2.47.2


