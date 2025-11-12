Return-Path: <linux-gpio+bounces-28371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838DC506D3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 04:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA75318828D3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 03:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796F029E0E1;
	Wed, 12 Nov 2025 03:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCBwMn1H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BD186294;
	Wed, 12 Nov 2025 03:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762918895; cv=none; b=pVEPV4XfwQ+AhvI89faGo84TouKSUCIv2KT89b45MiUc13LhP20orz8cQ9ihjjdKezofj9L6hwcBo4jmriCnyDxKnQPqFzSEwAKZqMcjDDSH0OZ9SjGcpqjBpCrpPSmYtBd8WvvfQYwKqJoIh5pGy/6fVk5qnJKi8Dxi7vhAgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762918895; c=relaxed/simple;
	bh=T42eE12u3XVrKV71P8xxkrfCYFqv7/xEaRVP4p0b3RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KjFOxG5q9xJQ4/IKkxQnbY9s7EGiY65qwR3yo3B/ylm3PVKAmicDmEhl2BQjgJxmg4GbKerHlAc/NZEPPj08WsvBEQUzFS7213Tyb46G94XmRcqbfkNm9asyitG2I5rWdMS3cURJ0La0J8WZmcPry1FIY9FUmECUSL4tCKE/SAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCBwMn1H; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762918894; x=1794454894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T42eE12u3XVrKV71P8xxkrfCYFqv7/xEaRVP4p0b3RE=;
  b=DCBwMn1Hi1fwo9JMh7JuINAN1XW0HZyS9SIi/zUMvXHBJFpTOYEZZXd3
   TWk+Hyv5kMfCgmV6x+m1q1lDU13AC9lgl9cnacbzDW9luXyWroFnSbI2p
   nOos2eaGcLp91b0mGXZM7gBt50dq3I6LxDbdSmmk3y/5smo15tGJfcfMc
   iBup3aOe2QluVUDmlO0Gc06VnC8MiXO8q1IMA20FrYDCYu6BPZDPQvbXl
   zBPPA6Q5O/8RLeq0m8qmrMaSiwlfaFCXR69Fr/V+RpZHNF3Z32EEupOyv
   9GEcvmOwDlZPrBbImxXaSBLywQhbVbRGRyrnVHdPKa9l/h22J9yH5esZW
   w==;
X-CSE-ConnectionGUID: ddKYBrnIQJmEFfdbn/6Vqw==
X-CSE-MsgGUID: d+G7LL47QymRQNMR+cVe4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90450214"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="90450214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 19:41:33 -0800
X-CSE-ConnectionGUID: 8JSUtPyMSC+9lFOLoFpktg==
X-CSE-MsgGUID: 9fdCvmgtQkKr5HJMuNTBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188752285"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 19:41:30 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 12 Nov 2025 09:10:09 +0530
Message-ID: <20251112034040.457801-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Intel Elkhart Lake PSE I/O driver which enumerates the
PCI parent device and splits two child I/O devices (GPIO and Timed I/O
which are available as a single PCI function through shared MMIO) to their
respective I/O drivers.

In spirit, it is a continuation of PSE TIO series[1] which received
objection from Greg for abusing platform device and has now been reworked
to use auxiliary device instead.

Currently TIO driver[2] falls under PPS subsystem supporting generator
functionality and will be coming up in a separate follow-up series for
its independent design changes as per below roadmap.

=> Extend TIO driver[2] to support PPS client functionality.
=> Develop a PPS common driver which hooks to both generator and client
   counterparts.
=> Develop an auxiliary glue driver for PPS common driver.

[1] https://lore.kernel.org/r/20250307052231.551737-1-raag.jadav@intel.com
[2] https://lore.kernel.org/r/20250219040618.70962-1-subramanian.mohan@intel.com

v2:
- Consolidate OFFSET and SIZE macros (Andy)
- Make child device objects parent managed (Andy)
- Fix double free on error path (Andy)
- Shorten child device names to fit id string length (Andy)

v3:
- Use auxiliary_device_create() (Andy)

Raag Jadav (2):
  platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
  gpio: elkhartlake: Convert to auxiliary driver

 MAINTAINERS                             |  7 ++
 drivers/gpio/Kconfig                    |  2 +-
 drivers/gpio/gpio-elkhartlake.c         | 36 ++++++-----
 drivers/platform/x86/intel/Kconfig      | 13 ++++
 drivers/platform/x86/intel/Makefile     |  1 +
 drivers/platform/x86/intel/ehl_pse_io.c | 86 +++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          | 24 +++++++
 7 files changed, 151 insertions(+), 18 deletions(-)
 create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
 create mode 100644 include/linux/ehl_pse_io_aux.h

-- 
2.43.0


