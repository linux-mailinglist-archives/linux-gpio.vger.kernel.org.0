Return-Path: <linux-gpio+bounces-11645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A59A4054
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D861C24320
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B821FCF6A;
	Fri, 18 Oct 2024 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb1BPupq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F921F4262;
	Fri, 18 Oct 2024 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259164; cv=none; b=IT6NZc7JGaBuU2zOsXGjU9XvJD9l6sJDLcOPC08C13tlrNdoc6LYI41AgwqHyFdKedkjLC2BjFXSQs/s5nvsXx4CEl6CNVMPRsz97sNOf518UksVP98JpAQbNVTipWt19Hlkkk7Tuen4YViXnkipfQ5vV94xU0QtLu5fH9Dswb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259164; c=relaxed/simple;
	bh=DqOo2Nqfjf87YcuweyRKL0DbnsLGp9GXgI6Z2nqwyJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LD8GGQ1krsCkDJ12n8Z4QchleEovGHxe+DYiUL32XjDbd6MIKLL5puZivhLBVV5aKoEkQccCAn+gWIv+j47NxRlVSmreXeiNBSNgJhcRVMPdkYTaIo3qS5l6pmwlYtktOA40Ixs1e4VM51bSlfoxU/mMkfIoD2Sl7vJwatcphU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb1BPupq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729259162; x=1760795162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DqOo2Nqfjf87YcuweyRKL0DbnsLGp9GXgI6Z2nqwyJo=;
  b=Fb1BPupqwAkO15tu9hF2mD4Kh1Gocp/HGYTVGopkezC7ukaPGYCkN0tQ
   AdNOkueKiipex77KOAduGlJ+3+ChfQO+S9NbZdCAKp9G1NuvXRo77dt34
   8S6aUEkgoKsJABP6NP+Xl+Dy5F6p1vQ9YplDdaGXur+XfcSwI9ZHoNGll
   ARaMUcVr5Q0/UzyWZKSADgRtwcEhb8z+Shcq4dXMJzxtZHNKl3drjwlwE
   lw4y7Sod9ZBbARctIeC7VWnJQhI4xQSDCfkyDH7lLTSC3I/NwEypOU5Cc
   kotd7GSDdUQBiNrTqJDaQBEBqSDRDt/v6kZT3tA3KdF9hmmeYIWPzltkM
   A==;
X-CSE-ConnectionGUID: P4mAdKWNT5iMawLZ8z2qDw==
X-CSE-MsgGUID: gv0HBbUAQ6OZiSdLmXxIpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251824"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:45:57 -0700
X-CSE-ConnectionGUID: a6C7ihkiRyiyTKYM6q5nOA==
X-CSE-MsgGUID: dXAvx4mpSamaL5xrGOZwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="116330957"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A5986343; Fri, 18 Oct 2024 16:45:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/4] gpio: xgene-sb: Improve ACPI and property related code
Date: Fri, 18 Oct 2024 16:44:59 +0300
Message-ID: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve ACPI and property related code in the driver.

v2: reorder the patchs so we want be sure ACPI_PTR() is defined.

Andy Shevchenko (4):
  gpio: xgene-sb: Remove unneeded definitions for properties
  gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
  gpio: xgene-sb: Tidy up ACPI and OF ID tables
  gpio: xgene-sb: don't use "proxy" headers

 drivers/gpio/gpio-xgene-sb.c | 37 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


