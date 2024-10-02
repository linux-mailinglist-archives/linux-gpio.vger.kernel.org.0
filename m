Return-Path: <linux-gpio+bounces-10722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2998DE78
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698BEB28191
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142371D042F;
	Wed,  2 Oct 2024 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN+oW/wE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3410E9;
	Wed,  2 Oct 2024 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881245; cv=none; b=VCs+II8+t763pDS5DigFR/WFmZMtgrYmC4XoWxL7kwcnsEADULwTw3uiwQm7rTwI4aiactWouuhtJXoU926axzR3sZ0LTgBan2AygNixKeUmaV9eB3ShF8iITr3Z/m9IfIJc0e/zPdjOirv8mFytYIFFuGnUfGWX5xpBUGk8udI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881245; c=relaxed/simple;
	bh=yJlqmXRb6KQuMUGvmaKagc2NCddixuJh5/MzQBvjTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mujPMNuEd02Y6Z/AAdseCuSOJniXly/CrXhTYnY2IzpGICm7CdmbMevVgI3ZFK7v0n/UYybltQqelB+HFXNapyY97+wHt0s3kb8i+5/VHZpsy/rBgmrck9dKUyFr2TOKi0RE0F6Du5LBeK7S3YeVhF9CISzD+FOuHJ1rUQGvPsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN+oW/wE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727881244; x=1759417244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yJlqmXRb6KQuMUGvmaKagc2NCddixuJh5/MzQBvjTgA=;
  b=MN+oW/wEWxDbZTeoYgKaZWZHm6BEX8NefAubxNr7QBoPcxfW1KWSyo7L
   +a5DvDwRuUJhVGPyUsyW243dn5g592sj6wL8WQPdNmv3xnugGmsw8S55U
   mO+RSQcBTUuIg2fy7xz72bByj3kcV+1aqkaJd3ytiV3+nDwKsXILMlzWX
   pvZNrktm7xOyykzokfnBhwfqA8IZHgjxA+oNRdr7O3hO6EOtr/Aw24fms
   OAXwOlliYO8b4Iu0uAj5d3fuocwC00UI9j84IeRJmdx+Nlhg+l/rWQIt/
   /j0W6uwiIZeinCKJamyuOIDjeg/kkAHHcphxtIywr3O3p5ERZWAKxXAbc
   w==;
X-CSE-ConnectionGUID: 7TV+rSIcTW+LCipEVb/xRw==
X-CSE-MsgGUID: UMhqEEBWRyGlI7L7gHdUXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26510186"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26510186"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:00:44 -0700
X-CSE-ConnectionGUID: 10yTwRD7QiCDBkhhOW9rhA==
X-CSE-MsgGUID: PDuGFC6NRd2NTGXC7GaCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74268261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 08:00:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 94A8C18E; Wed, 02 Oct 2024 18:00:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: platform: Add Panther Lake to the list of supported
Date: Wed,  2 Oct 2024 18:00:36 +0300
Message-ID: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Panther Lake is supported by the generic platform driver,
so add it to the list of supported in Kconfig.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 2101d30bd66c..14c26c023590 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -46,6 +46,7 @@ config PINCTRL_INTEL_PLATFORM
 	  of Intel PCH pins and using them as GPIOs. Currently the following
 	  Intel SoCs / platforms require this to be functional:
 	  - Lunar Lake
+	  - Panther Lake
 
 config PINCTRL_ALDERLAKE
 	tristate "Intel Alder Lake pinctrl and GPIO driver"
-- 
2.43.0.rc1.1336.g36b5255a03ac


