Return-Path: <linux-gpio+bounces-16946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098EA4C278
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971B91893CCC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE87211A28;
	Mon,  3 Mar 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwvSz5ah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA1212B17;
	Mon,  3 Mar 2025 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010144; cv=none; b=pwVjAiEKyrxiK1Q5kwY2NSYGOqaCVo48QxaZxsWQSIE59K61vwxP877Azs5n/VOHMpviMUCgVNt0NHI6JfDD+/l1xuQdkRQbGfymQuQBKAySkHwVUpL7Ar+jD4PHhJIlafDjXG5HzMlgJ7BSzmXsnOtWBvsqEATAXHJitgSdMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010144; c=relaxed/simple;
	bh=lI83kloiRwcLh/qfy6iNKWWJMzJTUKVMVgNCNtSOK1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ROS/xgxN8Pa9rL6oBpPaHA2uuIdfURsTe24t2QiQ9Wqne/+xonS4U4Fi6FLixY3fyqQJQt4lJ931f8DxvS30RfLvpngyOL/D+Pv3T/6PG5rAUtryblZlyx5a4xkRU9nVHByZNphR0koqmmVMGTOOJiaoxEJKqe0jEKYHEu7I70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwvSz5ah; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741010142; x=1772546142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lI83kloiRwcLh/qfy6iNKWWJMzJTUKVMVgNCNtSOK1c=;
  b=CwvSz5ahOpRAbLjQzJ9q6myn74/SuZTFMyqXrjnq6gyGTOBRLOHOsr37
   h9Q7JcPdJoSHvvL1p18r9nPKrvMGjIYzNKep/4xEIU3cdb57XB2xrI+mL
   yNhnQ1aYBI/647Sd+JV1nfC7gq2hbXlkZG/TFd6tISwgsRCMF8ZgLC6UC
   S3FMVYcjmH/cUG7+XN7Qx+xur2XT1teVrp5hynBpUVlWAvyCCMtENzxSC
   ecPeJByUqMa2npivEWAkrjQCs7J58kdvzBqkRpebVsoqVlzfn1ofbKRlf
   AN/mTbSJepRgLMVTedJgO1vl6Yd5VV6Aqc/tXDN92oT4H+TVp/zD0OF5/
   Q==;
X-CSE-ConnectionGUID: vJL3Pd6vTZ+ArDBYRLXdWg==
X-CSE-MsgGUID: 34mZydZ0QgCq1HcyROMASQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41773573"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41773573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:55:40 -0800
X-CSE-ConnectionGUID: Fq+NY1VpQjiQctwidUjyIQ==
X-CSE-MsgGUID: opNgHDLrTMSbhRtpG7C44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123154252"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2025 05:55:38 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] pinctrl: intel: drop repeated config dependency
Date: Mon,  3 Mar 2025 19:25:06 +0530
Message-Id: <20250303135506.323533-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We already have ACPI dependency for Intel pinctrl menu. No need to
repeat it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/intel/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 14c26c023590..248c2e558ff3 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -39,7 +39,6 @@ config PINCTRL_INTEL
 
 config PINCTRL_INTEL_PLATFORM
 	tristate "Intel pinctrl and GPIO platform driver"
-	depends on ACPI
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
@@ -141,7 +140,6 @@ config PINCTRL_METEORLAKE
 
 config PINCTRL_METEORPOINT
 	tristate "Intel Meteor Point pinctrl and GPIO driver"
-	depends on ACPI
 	select PINCTRL_INTEL
 	help
 	  Meteor Point is the PCH of Intel Meteor Lake. This pinctrl driver
-- 
2.34.1


