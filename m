Return-Path: <linux-gpio+bounces-15369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F73A28697
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B271611F7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8B22A7E0;
	Wed,  5 Feb 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpTE4J1O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53521A458;
	Wed,  5 Feb 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747928; cv=none; b=ItpRzO20lMLZtKCyXHoIrKixUX2yTsgNCQfKDPlTz1YPskVcoLsaPyx5Eiia3sTdVZd3h6NRox6PS8DmukWr3KS9TUehMfit6gsGouDEEkcaM247XpbXqAdnJqXGG/+5l9clqqA+ibJZ26Jj59kvfdfEEuKCpEuVk+g6uGrdrpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747928; c=relaxed/simple;
	bh=H9qoS6pbPgmsbWofG3X9JMy/xr3CQqscYBQeQNivmfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORL20K8i/3hqx2J/CKPAcA25Qc7LSpY3xHZsc5uQ3PDni335o+ZkGcHidBK0SQGfS23TyCN9B6nvvGGH9wXeWJkpiCSC+qyrjSYeXCAiO5g+YMLtXvyFu+fnaKYSoXDzhH95OdgqsTdkK9NNV5shxpVQNZHAP27SkEegog9LTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpTE4J1O; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747926; x=1770283926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H9qoS6pbPgmsbWofG3X9JMy/xr3CQqscYBQeQNivmfM=;
  b=PpTE4J1ONUMVdPWTGSVTigVraDMsSPN8X1H5WF8nPOqR7VcdCsOIBf2w
   ci70NrwwLpzf5eVcip9t19PkjfguAHGFLBETII9SbV41h6MkSAjTJAX2o
   /Z/MdQ9zqoxMpDwivA/Dz7iVSTjHowCudkARc+Uo4DC1rl4bcCKzoO6p1
   wRDziYWntOPakXqTT0tUvJBSkm6Z7F3RmtGzRMWTo7VgwSNH3QrwMss7D
   V8QwfvNGDarUNuTkXh0/ZLAMwLvEHScFSNZZQJBmgVpAd4jvG4BzRRYVv
   Cf6R3zJU4pWjyauA/a5lsPILDrJXZjJnndxTGXnXbLruwEXnIKCOXmGfV
   A==;
X-CSE-ConnectionGUID: NR1bOrLDTWer/SCE7g1dqw==
X-CSE-MsgGUID: Z14vWVOmSrypErFpC9+sBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39462101"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39462101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:32:05 -0800
X-CSE-ConnectionGUID: jqQmarEpTNuZiWdYFuUtEw==
X-CSE-MsgGUID: ANd1pfs2QLKunK+Y8TIv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111728224"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 01:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 14534353; Wed, 05 Feb 2025 11:32:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Wed,  5 Feb 2025 11:31:09 +0200
Message-ID: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relatively recently bitmap APIs gain a few new calls which may help
to convert the GPIO Xilinx driver to use them and become shorter and
nicer. This mini-series does exactly that.

Changelog v2:
- fixed a regression in patch 2

Andy Shevchenko (2):
  gpio: xilinx: Use better bitmap APIs where appropriate
  gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

 drivers/gpio/gpio-xilinx.c | 102 ++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 65 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


