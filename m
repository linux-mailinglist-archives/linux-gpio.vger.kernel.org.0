Return-Path: <linux-gpio+bounces-30528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC08D1DD2D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECCEA3021942
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F58F38A73C;
	Wed, 14 Jan 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKvu/uR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4590738A716;
	Wed, 14 Jan 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385179; cv=none; b=iNmkYrgoNC+lkXyCTed50x74247PpX85ufY2ScgD0sw1YJeAMqqFoMOTO7x5YJKoNTOe1/hT5PKyqpPghn8KYbWmoc66kHbqz1pJkeeT7ZJmP4hdTdHba0N7R/06epUM3/KBu8nou5x84oFHXJ85g2C5zwuK0TbTyf+tIXIOauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385179; c=relaxed/simple;
	bh=YcAeYWHfFscLle3OO00E8RCrEqn+jccNkuGs5setBgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3Bc1+Ft71Cu4BJOk0iTX3gyKtujY7v7a2lIRsVp2eg0aa9KMCczLtawMNd0e6J+iOgtOHXM5EcQYZ9JPW2xkZysb4L6uq5FaLE7bCpQMfhXUFZZNMoNyen57kSPAnxyeA9Fbh0J1KfdXmCFrfnJWSh2AnolaVkWgyHMUiucoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKvu/uR9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385162; x=1799921162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YcAeYWHfFscLle3OO00E8RCrEqn+jccNkuGs5setBgw=;
  b=TKvu/uR9/jWVno5NC333BGqJ0hENaCalcj2DZIV2EDR4T1NS+RVCytS4
   rgINrcWqo3gAacsDgvvdCzKjoWPVGof8jRcJZPz0Ic1Fcy02LcDZoQD3/
   1b9Uh/OSyumMkrQEwF1dlXrYQlscgsbZcaXtbdE8KBOa7jJD/EQbPK5A3
   3ayBKkmdBBYNke7GcZe4wQrHQIZ3x5c1ViuHt+tA77ePv94MOIeCzSiEP
   lyEyCH2AwDBqC012kB2Obs26klX1bJAtHJndfmQj8UvbX+xwsv/XYFbTM
   3Z7Sl1VFKlhsifMVhtwGhwWOoAcj/v5yepGLfFh41RLzeTg5/rTB6zama
   A==;
X-CSE-ConnectionGUID: 3IR8VWjcT0+NQxRARtL5Jg==
X-CSE-MsgGUID: QHHCx4RaS4mGBFCyT5ca2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69589621"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69589621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:06:02 -0800
X-CSE-ConnectionGUID: HDfVmNXHSneEXp2BMXvUSw==
X-CSE-MsgGUID: 524Lvp/ZSQGWfGHt/LXn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205061717"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 02:06:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E3E7E98; Wed, 14 Jan 2026 11:05:58 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 1/1] pinctrl: intel: platform: Add Nova Lake to the list of supported
Date: Wed, 14 Jan 2026 11:05:55 +0100
Message-ID: <20260114100555.277960-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Nova Lake is supported by the generic platform driver,
so add it to the list of supported in Kconfig.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 248c2e558ff3..e4dc9ba899bd 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -45,6 +45,7 @@ config PINCTRL_INTEL_PLATFORM
 	  of Intel PCH pins and using them as GPIOs. Currently the following
 	  Intel SoCs / platforms require this to be functional:
 	  - Lunar Lake
+	  - Nova Lake
 	  - Panther Lake
 
 config PINCTRL_ALDERLAKE
-- 
2.50.1


