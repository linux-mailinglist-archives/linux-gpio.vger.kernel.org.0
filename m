Return-Path: <linux-gpio+bounces-28659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEDC69678
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1158E4E4953
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5713168F1;
	Tue, 18 Nov 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVa2d/Zp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E213777E;
	Tue, 18 Nov 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469291; cv=none; b=kMoBHwhXPTr+1hVdy1Giarj0/AR34+TOsnt1T2W0V0K1ZziJ+P+tk3590efayo5DjM3psZpjv9DDpu8Z8UpUb1WuW8k42xM6CA+XP8KPo5gNL9526vEKekOcnqi60MfcYf5GFygaXdJqqLapIWqU+Rpphu7+FtbSeot6dlPAvqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469291; c=relaxed/simple;
	bh=mOuLJaDSrIuKR6+50Wmdnj8mNaZLn2wnpkOfYHsjtdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngMToKvyoM/vRi5MS7nsj1YcOmG20HWghAmrnfWoL+FhJrOXlrcq04W4ZI+swoK0cQOeemH8tJtqHDN5UnBGY/kA9nQFifMLRc7fZgqQEpMpy1TLJ89utyzabmnxc0m00poDFS9CXycaXpCBQvEtveZVuC92Toh2XwWs4a4c7dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVa2d/Zp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763469290; x=1795005290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mOuLJaDSrIuKR6+50Wmdnj8mNaZLn2wnpkOfYHsjtdI=;
  b=AVa2d/ZppMp+wB/+9f9BnEwBqJ4XtR0h12xoSLkRa3AdSncUO8hmrw6h
   cUDZQEvmFNU5powP3xWkQcY2VlASUT7tpzUznf8W8Jr1sMpu4c8316p71
   HMV1R/8TA3dRKWFtsaqmIMhHYVtTFub32DOZXmDdQ2xK52akZGa362X2o
   SoMrJ3RAcWZgiGSU5LiTtuwXu98bgedlQBqhCDNxSqptCRMhV9jPIEby1
   hmQtN6lDeJ5R/Xp8fyYnYOBhEPi15tgkmdlG1RmkRcJ7gBFlf58mLtehP
   iEI5/mwzCI3xeqMO2aVSjlczmxLmJCGLRTnYJ5vXqD6YXcwfafSNeZMFN
   w==;
X-CSE-ConnectionGUID: CmLBEGl4Tdiiv7VMMEbyXg==
X-CSE-MsgGUID: zb2QXggTRFSL/QQWnpVgRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65193277"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65193277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:34:49 -0800
X-CSE-ConnectionGUID: vFgMfJPSS/KYgHAHnw8cQQ==
X-CSE-MsgGUID: orxpcAHBQJSLuZQC6MPSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190032764"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 04:34:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 07BAB98; Tue, 18 Nov 2025 13:34:46 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] pinctrl: intel: Export intel_gpio_add_pin_ranges() and use it
Date: Tue, 18 Nov 2025 13:34:00 +0100
Message-ID: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deduplicate more code with help of being exported intel_gpio_add_pin_ranges().

Changelog v2:
- dropped the patch that we have a strong disagreement on style of (Mika)
- added kernel-doc (Mika)
- collected tags (Mika)

v1: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>

Andy Shevchenko (2):
  pinctrl: intel: Export intel_gpio_add_pin_ranges()
  pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()

 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +-------------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 12 +++++++++++-
 drivers/pinctrl/intel/pinctrl-intel.h      |  2 ++
 3 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.50.1


