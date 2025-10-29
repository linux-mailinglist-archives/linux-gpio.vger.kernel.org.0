Return-Path: <linux-gpio+bounces-27778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48105C186F8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 07:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE6F33A4EFB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 06:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A21302779;
	Wed, 29 Oct 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC0wbfCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038812E2DD4;
	Wed, 29 Oct 2025 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761718914; cv=none; b=hcVocdvg/aq+0bJbqujD41GKeWbozkamEWi/8/mgT+DNar20MGimhvqsvSVuUuc7wLO9lD8D+WaQqEfI7L8mPdr2HS1GskgJW/8kZs6T2CSoFQcGrLDIhXcwTmCox2i23dt4izHOERFOogNGCIw/ptGL4ITJoEw7pHC8cLDehDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761718914; c=relaxed/simple;
	bh=OAF9chqVI/ExFVA4c+U/+XKU8ecrmHEIjqni0wf3qgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jRNpH8//l2c7uQwq8kiaiwt/DvVZPOYWygUeSuj1dy8mSEgvpNo64icnCPp1hrZGXQSWyVn4Jj2OBgviBPw+v3WqePRuYSMhB9zOw7P9ipYhup9Oqjpb7cMqRlguDnjCW0VXjAGU/kGABJwacfqcImFzPkZv7D5PnW9J4ceZmo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC0wbfCU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761718913; x=1793254913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OAF9chqVI/ExFVA4c+U/+XKU8ecrmHEIjqni0wf3qgM=;
  b=RC0wbfCU10FmhPUguCYQGkf2ncVr2t6sXKkOngVf8AJk3vNlwUQbaX/7
   P8FOApDlvWXmK6uJq0axbvx6SuvErOp/y7iFrIa1tIV4Y3q5dfd5LmjXB
   9uVt4QgpC1OHlu0xLCJ3uLgF265Zh9m5ocWW7cuXfDwN2XoQgcOW0oc1H
   3whkGNPmUC2Kr6cbNZeESZF3zhnq9INp5PjCQACQBSUxOCX+rsicRqvMR
   AxrKfgzi8FyL61iR4ssX3l8kQv3uFBW9TRqwOIWccm70C0GUdG0Zz1ifU
   EUorrYugvhSMJso4uIsHJzMSdw5B/Jy06Ii5jw9I6hE8FJJbBaI4Vrwx6
   A==;
X-CSE-ConnectionGUID: HOIDWUlUSk6Y67m994rnqw==
X-CSE-MsgGUID: iiHC5OrARw2UGDU5YPr7bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66446269"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="66446269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:21:52 -0700
X-CSE-ConnectionGUID: rzws3n1bTta1Fiwq/DMGvw==
X-CSE-MsgGUID: 0WuFWV5LRuGbJ5UtQJBmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185201098"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 23:21:49 -0700
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
Subject: [PATCH v1 0/2] Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 29 Oct 2025 11:50:48 +0530
Message-Id: <20251029062050.4160517-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Raag Jadav (2):
  platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
  gpio: elkhartlake: Convert to auxiliary driver

 MAINTAINERS                             |   7 ++
 drivers/gpio/Kconfig                    |   2 +-
 drivers/gpio/gpio-elkhartlake.c         |  34 +++----
 drivers/platform/x86/intel/Kconfig      |  13 +++
 drivers/platform/x86/intel/Makefile     |   1 +
 drivers/platform/x86/intel/ehl_pse_io.c | 128 ++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          |  30 ++++++
 7 files changed, 196 insertions(+), 19 deletions(-)
 create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
 create mode 100644 include/linux/ehl_pse_io_aux.h

-- 
2.34.1


