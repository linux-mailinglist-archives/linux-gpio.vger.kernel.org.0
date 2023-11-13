Return-Path: <linux-gpio+bounces-53-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E77E9C22
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE157280CB2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3285D1A58C;
	Mon, 13 Nov 2023 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSxGI0QZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E4200AC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 12:31:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D308D55;
	Mon, 13 Nov 2023 04:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699878713; x=1731414713;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u5/3Xq+2UoTAILGRcKKzhKvlbjxtJPTVZqEB0uJ39eU=;
  b=MSxGI0QZlaPf1trH97iVFUeND/8cBXECe325KN22hUiS1x9ZYPl02lBy
   f1Ky4R9FJlZCGXeZFNQEt6xbbrFRblNQ85f3hR2tw8R5Llas1U8Twfz++
   M0EUPML4zpL1K4NxfNlt9i+7WyMu5AjYTSqOGpUHDrqoR8rJhXf3mMcgn
   gqnX8JgtXMFImHLic16DqX3b0eHkW0uX+T01MjXUG9Exi/Z5arBcz24f2
   X7pB99WEK0K5gLH0t3esv4DUh9d5kZ8PGviydV8qYZOyE673TMUnLRXmb
   D57tLbhekuBORrPViYvFsnXka2TBx8B+z/DavlONaJIb6wi02QAr5yLU/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421522830"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421522830"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 04:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="887912967"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887912967"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 13 Nov 2023 04:31:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3298F64A; Mon, 13 Nov 2023 14:31:49 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] pinctrl: intel: Add generic platform driver
Date: Mon, 13 Nov 2023 14:28:46 +0200
Message-ID: <20231113123147.4075203-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Intel platforms one-by-one will be switching to use generic
approach for the pin control description in ACPI, hence this driver.

It depends on the series
https://lore.kernel.org/r/20231030120734.2831419-1-andriy.shevchenko@linux.intel.com,
which is pending for v6.8-rc1 (will be soon in Linux Next).

In v2:
- squashed ID patch into the driver one (Mika)
- added the list of platforms/SoCs that requires this driver (Mika)
- added a comment about single community per device (Mika)
- miscellaneous fixes (Mika)

Andy Shevchenko (2):
  pinctrl: intel: Revert "Unexport intel_pinctrl_probe()"
  pinctrl: intel: Add a generic Intel pin control platform driver

 drivers/pinctrl/intel/Kconfig                 |  10 +
 drivers/pinctrl/intel/Makefile                |   1 +
 .../pinctrl/intel/pinctrl-intel-platform.c    | 225 ++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c         |   5 +-
 drivers/pinctrl/intel/pinctrl-intel.h         |   3 +
 5 files changed, 242 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-intel-platform.c

-- 
2.43.0.rc1.1.gbec44491f096


