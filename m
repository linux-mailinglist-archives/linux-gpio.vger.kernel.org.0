Return-Path: <linux-gpio+bounces-28024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA09C31B85
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AA0A4FDA8F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598B9332EA3;
	Tue,  4 Nov 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ffk1itAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB3330332;
	Tue,  4 Nov 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268301; cv=none; b=eYH67DQHpxdkgkPNPQF0ZZ+iU/fBSVoimGByR4sUqN0To2ZmitUGqts+v178qF2njUAlfZSiF2MrlGLja9kGgYv1uTUK9YVPk5J569BV6EBQsbUOSvJw8WTehnFWGyt6k/42WNuGB4aFOwJqNGzJk/DVH4govQygrytq2FDkk90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268301; c=relaxed/simple;
	bh=p53eId+BN/aUzsQv7ht3j+ycqdzonncv6gakbzg1kow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7TUcfngQ9gFMnH+1Knt8n1uLgaZXtSFEZ+fHb1tWmEufpTU/ro989oZ9i601XJaVZYUJgq2RXKj7K4238vpJu/4eGe/rryHiqVvMGVEoFC/VWC+iJw4NLXEWuZhHooh+ET4Za+JxEkGVSJB2n4MCBNAhQqve47lXSEuuCP6VQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ffk1itAW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268299; x=1793804299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p53eId+BN/aUzsQv7ht3j+ycqdzonncv6gakbzg1kow=;
  b=Ffk1itAW/Z6w0YrqJl10R0dk8j3KRsOUoZmuvy6EoqbjH7qEW1QAOwdL
   6iyF/hs5/DAGEO3CJO/gGWGKsErchU1AWdqSz3wh6eQmWwRkasIYhXSxG
   nk0Bdu+JxyKeOtyF3sCfCA6O8EpW/veVpqHjMc/bgb3YBBT69TAqRWdjI
   wMvmJ4nMmvOSVN2zzFEjxzoK7F2Tl9VXQ4STC43rLtkmS1DyLl9Y+kLI2
   wWr5LTJD5KUjjG0utGJiZcz+91Z3EYBjebh4OQ9J+5PmtH9e0Di+F+RyM
   xzEocs5CK037SyI7F8z8AIc4h/DQ95G9z/FDCmJN2qb5NE3WAFmaozAAU
   w==;
X-CSE-ConnectionGUID: sy+TCKrnTRKvfYppU8zQvw==
X-CSE-MsgGUID: /3rl/qJoSTmDpv9hinq1ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51933789"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="51933789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:19 -0800
X-CSE-ConnectionGUID: 8rRcZZCyT/OijzXbSA4Yng==
X-CSE-MsgGUID: +5yp4Od2QLGG19l7tZNJtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186863935"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 06:58:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C993E95; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 00/10] pinctrl: intel: Consolidate struct intel_padgroup initialisers
Date: Tue,  4 Nov 2025 15:56:34 +0100
Message-ID: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have plenty of repetitive *_GPP() macros across the drivers.
Consolidate them under a newly introduced INTEL_GPP().

Andy Shevchenko (10):
  pinctrl: intel: Introduce INTEL_GPP() macro
  pinctrl: alderlake: Switch to INTEL_GPP() macro
  pinctrl: cannonlake: Switch to INTEL_GPP() macro
  pinctrl: icelake: Switch to INTEL_GPP() macro
  pinctrl: jasperlake: Switch to INTEL_GPP() macro
  pinctrl: lakefield: Switch to INTEL_GPP() macro
  pinctrl: meteorlake: Switch to INTEL_GPP() macro
  pinctrl: meteorpoint: Switch to INTEL_GPP() macro
  pinctrl: tigerlake: Switch to INTEL_GPP() macro
  pinctrl: sunrisepoint: Switch to INTEL_GPP() macro

 drivers/pinctrl/intel/pinctrl-alderlake.c    | 68 +++++++++----------
 drivers/pinctrl/intel/pinctrl-cannonlake.c   | 68 +++++++++----------
 drivers/pinctrl/intel/pinctrl-icelake.c      | 60 ++++++++---------
 drivers/pinctrl/intel/pinctrl-intel.h        |  9 +++
 drivers/pinctrl/intel/pinctrl-jasperlake.c   | 34 ++++------
 drivers/pinctrl/intel/pinctrl-lakefield.c    | 26 +++-----
 drivers/pinctrl/intel/pinctrl-meteorlake.c   | 54 +++++++--------
 drivers/pinctrl/intel/pinctrl-meteorpoint.c  | 46 ++++++-------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 26 +++-----
 drivers/pinctrl/intel/pinctrl-tigerlake.c    | 70 +++++++++-----------
 10 files changed, 199 insertions(+), 262 deletions(-)

-- 
2.50.1


