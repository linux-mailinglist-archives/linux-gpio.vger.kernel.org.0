Return-Path: <linux-gpio+bounces-59-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639B7E9CDE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB29BB208B9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949CC1E524;
	Mon, 13 Nov 2023 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YobBFgFV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3151DFE4
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:16:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B721D6C;
	Mon, 13 Nov 2023 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881372; x=1731417372;
  h=from:to:cc:subject:date:message-id;
  bh=kq9n5m31IGPwjK9ijGxB7eVBkCuVsZqAuHDjOMKrLk8=;
  b=YobBFgFVyG/mYRx8Mj5uBTsHwVPopVsGvzxUEQnMWpfftM/EPDHMcLaA
   37xE52MIihDTLYyQ6bMIo+wjUEax/kHk2r0x8HLd1VouTRbBiWrOjtaYd
   YRaJQEo7+KTZYBxVRkJdHjOsrlNNNJgs8ZIBlNHs2HYlP84QxFQQesjvB
   KNdJvhdL5ge3DUzN/8EwWT5dfQ1JpVqnUlXSra6A6BfgK4WlI2G+HEwdd
   o1SHWgFmL2ImFitbuQfZMQDIwxpUuq9At9sbeIpwyQkznfljL0mckCJOS
   R0n91+a8YprYQ9d4ginZBR4cI20eOGfS7/g/XtUFC3PfH/lkXZe9QwzYy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454726892"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="454726892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5649365"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2023 05:16:09 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mallikarjunappa.sangannavar@intel.com,
	bala.senthil@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/3] Use the standard _PM_OPS() export macro in Intel Tangier GPIO driver
Date: Mon, 13 Nov 2023 18:45:57 +0530
Message-Id: <20231113131600.10828-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

This series exports pm_ops structure from Intel Tangier GPIO driver using
EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper and reuses it into its users.

Raag Jadav (3):
  gpio: tangier: use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper
  gpio: elkhartlake: reuse pm_ops from Intel Tangier driver
  gpio: tangier: unexport suspend/resume handles

 drivers/gpio/gpio-elkhartlake.c | 14 +-------------
 drivers/gpio/gpio-tangier.c     |  9 +++++----
 drivers/gpio/gpio-tangier.h     |  4 ++--
 3 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.17.1


