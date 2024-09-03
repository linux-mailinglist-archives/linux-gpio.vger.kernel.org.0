Return-Path: <linux-gpio+bounces-9692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E167096A504
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9947E2819F9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F93318C902;
	Tue,  3 Sep 2024 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJ0edGhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E050188912;
	Tue,  3 Sep 2024 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383280; cv=none; b=SDl2KshUPeA0FwokLTJWW4fUjtReq59qakUGVbzJLkQKVEEvUTn4Od290UXbuXs/FldtIvgiyH+9LbWcUyeYdytdBn//ZuZNl56KMpNAR6qQ5iY22otK2k/Ezw7Ts1++SOL/O3shlo2jx5x9rr4hobt2oO6LahYqZRh+hxIdHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383280; c=relaxed/simple;
	bh=jn+ZGZj9OTTyN9aeM7XsY04s8XZr+/xkqeb5ywpI5oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaWZsDtmTavCQwxYVrFuNz1APq7T97THSSmigXjbF+jtF54S1SOQKt5cW8gmfWPRCuswOCIiKaXR+kBA54YtL2ZtOxdjscbnkpGuSOvDhV0JY5S9fmvWkDnJH5yuD00g8Kmyh4paB8taLep8cL/2YP8giuPNL1JpH0cymyz2qbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJ0edGhN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725383279; x=1756919279;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jn+ZGZj9OTTyN9aeM7XsY04s8XZr+/xkqeb5ywpI5oo=;
  b=nJ0edGhNp6mt5zkhLFyE15PPvBV3AWuKsWEe3F4Jf+ckV9+6TkhIrN/o
   rLaL/k1ZF3CkX9HP5FSVKJgJxT4vrtz1da62lJY1BVzdL9WQJ1MDk3/qU
   WhGxW3tmilh5NPlEHg/MkhCw1WScPrpNoGIWttddxLrnzPCUxjCJWhYdM
   plAU7M+90iwkAkE+YIaTZ0LifZTnhOgAW/xydftOSKiildsNKgcZ4Jg4n
   7sJVmQ4KHRKxKkTxqsCNvwCyDyczb0SBO0pTmzuIcJGaNbuvQ3g/eSe7h
   /ynVfNuWR+Ldwmd74F0bYwDS77AzsSpt417Sc0NKYpV1ulsQHraswp1yx
   A==;
X-CSE-ConnectionGUID: yCpFqHoOSfK1aT6jSuCHaA==
X-CSE-MsgGUID: pi2eDj6pSWy85+NZl4J8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34661655"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34661655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:07:58 -0700
X-CSE-ConnectionGUID: I8SWgXe/TwCDQhZl7rj6kQ==
X-CSE-MsgGUID: ITAQYvMQSiKZ6j50aH0+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69837932"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 10:07:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 752673C1; Tue, 03 Sep 2024 20:07:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/3] pinctrl: intel: Get rid of ifdeffery leftovers
Date: Tue,  3 Sep 2024 20:04:48 +0300
Message-ID: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two benefits of this series:
1) no more ugly ifdeffery in the code;
2) the PM callbacks are all being synchronised via using the same macro,
i.e. pm_sleep_ptr() everywhere.

Andy Shevchenko (3):
  pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro
  pinctrl: baytrail: Replace ifdeffery by pm_sleep_ptr() macro
  pinctrl: cherryview: Replace ifdeffery by pm_sleep_ptr() macro

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 21 ++++++++++++++-------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++++++-------
 drivers/pinctrl/intel/pinctrl-intel.c      |  5 +----
 3 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


