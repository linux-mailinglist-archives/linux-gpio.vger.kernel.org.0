Return-Path: <linux-gpio+bounces-12317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2539B6B2D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77EB7282AA5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAAE1F706A;
	Wed, 30 Oct 2024 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnXQk/QT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241001BD9C5;
	Wed, 30 Oct 2024 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730310100; cv=none; b=aRtqT21j/aRLkpJJOWD2l3zKm027gxHRlEhKOryLzTT6V+NNoasKGVya+ORsxfmcEZ/D3kELGJKtu6RDD/GZo24vQRRojd9curqFd8+O8chBCnrQHhXPL680XnEL7CUp968K+J4j6M0xy76S4In2C7dOiXmGXxHScIUZ83o7lPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730310100; c=relaxed/simple;
	bh=nLR225g0wrPdHzArOrZRQx8huvOONNWySiwoMroh1qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pa+gCdzybrA1ZHsmK8Pf6xj3DggDzJqu6nZJPn/Og6K49vSg3JtuaPKDn2a1okiN8RZfOrQ9mf+h/2umCldSOiFuNQVfb/rwfc2XzKVyVVwYhFe6ofVkcAr0wpEVODvDb3F/v8ekVBTAhPmEBEAA5Smg369+kgk2BxfnbpBOYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnXQk/QT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730310098; x=1761846098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nLR225g0wrPdHzArOrZRQx8huvOONNWySiwoMroh1qQ=;
  b=EnXQk/QTeybPzI0DYQvFmgD3TgFVjLMIyihnJEfNR5At7G/3q9bBbipB
   PcH2tIhuwyVanGzFgnFacEsCtklBdvfaJc10HB2qN/HvJtKFOlgD0MH1/
   RpiJ25XutIhBZv97PG52g/ROhB0q+cmkR8ivs5BdNGMARchiVBt8gc8ps
   EZjVBaoYm16afahKvi9MeUDcbeugnqRPeJ3aXAIyznkX3y5YzY3IZvmGj
   VnKvDVMk9gkt8HCsbsUsuOjFKjszrhhomh5ifXZ0vZio9lait7QZP2ZYH
   12fWYapqeXOfZFSQ4w6uSNH6SEGGkgmDt0EdDBQ7hWpGq3KXpDQNu8lrd
   w==;
X-CSE-ConnectionGUID: aUzgW38nRzS26wdYYghUqQ==
X-CSE-MsgGUID: onhX/BjtSWqBBewEsOJ0yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29446056"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29446056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:41:37 -0700
X-CSE-ConnectionGUID: VDKIJOOCReKuvVr7gHOaBQ==
X-CSE-MsgGUID: xpXdpLsSQmeoTICcCKB3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119846378"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 10:41:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2F8F71CF; Wed, 30 Oct 2024 19:41:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] gpio: Check for error from devm_mutex_init()
Date: Wed, 30 Oct 2024 19:36:50 +0200
Message-ID: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ignoring error checking from devm calls is a bad practice in general.
While not critical today, it may become a problem tomorrow.
Fix this for devm_mutex_init().

In v2:
- fixed obvious typo (Mary)
- collected tags (Mary, Wolfram)

Andy Shevchenko (2):
  gpio: mpsse: Check for error code from devm_mutex_init() call
  gpio: sloppy-logic-analyzer: Check for error code from
    devm_mutex_init() call

 drivers/gpio/gpio-mpsse.c                 | 9 +++++++--
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


