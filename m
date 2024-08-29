Return-Path: <linux-gpio+bounces-9375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D796477B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6DE284B1F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441BC1AE845;
	Thu, 29 Aug 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q36y15/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924711AD3E4;
	Thu, 29 Aug 2024 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940254; cv=none; b=TfOUsVqXIQOaIjO+SKu7TSrWRDM4xpGDrrRuSMiEXE97mKOMwwgPQZwmnpyJwE3IOXV/9hXM3meqh1mwhGMAaF0UVNp1Whv4h/rRiDMMo7AqbnQwoQAy54pA8utK7nRZnWedNqrsEIw2hXO5zzOLK23ZbDmIPix4QYRGBpUdS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940254; c=relaxed/simple;
	bh=AfnylN2c9R4v7BYGG9PbCI6/6bKIL4wwb6lZA+FMoNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=haWy8whTLFzh/8gmPSxKneH5e0k3IMEt84r7IyaNh4QOZiUgrSjxY4ec0pFbIhw/GYNG35zPsmDQb2lc7RvhAN6b2jBMM3GgbcaFdtfTBGWshoJGqYBeZGIx9RuSnAIfknj9EC0gXXZgLnAS29AZZiTJ3MBscLI+2uooRwbkd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q36y15/f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940252; x=1756476252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AfnylN2c9R4v7BYGG9PbCI6/6bKIL4wwb6lZA+FMoNw=;
  b=Q36y15/fsXUOwRE/XJuHzt0e0IUB+XUla6+6TyaM+Ln0sR0HozKV7WbY
   co0r36rRCPe8HjkbdxG7k8ez3FSYcENIraPjUbB2YRhXdBAlPnlCLkOiM
   wS8qGWBSotBauzyeGBIvd2t1lxSlQKm0O8U9f1PalsPPzIUAo6j+cb1vQ
   4BjYHWRfzgmX8pu9Ri+gZUJwU8JCoGkqtzJ4AAqUYI0YQVrXykzGO223h
   ZgizAxaWxQGHATnhERz439A8W8DY6l7hQGrpDNqbtoh40GPMv3ftE0Vlw
   wTUoYQEF4TUEvXLHHaP5qFw4p6dNoygT/MLjePfSFJwB4IgNWP49ab1BQ
   A==;
X-CSE-ConnectionGUID: itSs7bTnT/GP9dAnbq7JXQ==
X-CSE-MsgGUID: sZIGlU+USjyp0KC4CQuJRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690585"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:10 -0700
X-CSE-ConnectionGUID: q/V46EpRTi6DLh9Z8aKLYw==
X-CSE-MsgGUID: Y0G/TXrcTWSzXu0JgYHsgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419832"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 37A5022B; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/6] pinctrl: intel: High impedance impl. and cleanups
Date: Thu, 29 Aug 2024 16:59:14 +0300
Message-ID: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We would need a high impedance implementation for a quirk, so here it
is. While doing this series I also noticed a couple of opportunities
to clean up, hence a few more patches (1st, 5th, and 6th).

Series has been tested on Intel Meteor Lake-P.

v2:
- fixed a bug in patch 1 when applying debounce value
- updated enum style (Mika)
- made intel_gpio_set_high_impedance return void (Mika)
- new patch to constify intel_get_community()
- resplit "absolutely grotesque" macro to four (Mika)
- ...and update more users, this shrinks binary a lot

Andy Shevchenko (6):
  pinctrl: intel: Move debounce validation out of the lock
  pinctrl: intel: Refactor __intel_gpio_set_direction() to be more
    useful
  pinctrl: intel: Add __intel_gpio_get_direction() helper
  pinctrl: intel: Implement high impedance support
  pinctrl: intel: Constify intel_get_community() returned object
  pinctrl: intel: Introduce for_each_intel_gpio_group() helper et al.

 drivers/pinctrl/intel/pinctrl-baytrail.c  |   3 +-
 drivers/pinctrl/intel/pinctrl-intel.c     | 280 +++++++++++++---------
 drivers/pinctrl/intel/pinctrl-intel.h     |   2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c |   2 +-
 4 files changed, 170 insertions(+), 117 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


