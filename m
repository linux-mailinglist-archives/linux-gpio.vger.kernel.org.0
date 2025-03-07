Return-Path: <linux-gpio+bounces-17216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573FA55FDD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 06:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D0A3B2ECF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 05:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E901B18BC36;
	Fri,  7 Mar 2025 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiIZrWry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F552148FF9;
	Fri,  7 Mar 2025 05:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324974; cv=none; b=Ke4mvf6TZXWM1V/oiwdBMe7bWAWcd9+IrXOdKlG1ZB7rvRbS8LeyeLxsrTAy//gq9EpZFWsqodueUKAkjySUXFm4w0Qlgm6sY8+zCA1PXS/kmlXiPXC7GnXhXkHeXnHybASKwXXKU5e86E/rCdVAdzhtfa3afABT8CU2FpQdiH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324974; c=relaxed/simple;
	bh=mRWaVt6c6p7WjpVlr+GlTxo54QySYRHgYpdSwDozGmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uQJkgI1J3QCBFV7xmexpqL63GlU93uO21V91FPC/1Z1H1NtitNbvNoVFmG14y8Fd5FmxgPl6ALOaUs9ottGbbl570LDTHPRNfw+9rljs8yd3jzZ7OHXkI0kom9PoxICSxmUmr9aEisUJg/LDyat+2w32WJalOM35Sh8wQ9EIY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiIZrWry; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324972; x=1772860972;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mRWaVt6c6p7WjpVlr+GlTxo54QySYRHgYpdSwDozGmg=;
  b=kiIZrWryRFIFsKjmdAeokfDLRUdOJ8sdsohe1UoM4md1blQPBAWh0mHa
   IOGWnd6eIbGj/W/I+H1FNEDNmFDHCf0KIdT5c5xAY5APd12xuI51F+Oec
   sLgNf6LrvpTLe2aT+kZAmSlfEz003YuF7+7nBTAOU3Puh7luy/Ph4MdrF
   /jSqhPD13DOYbnZGFIXdjynPApp0XxLJe+dCWneOl+a66+0QnVhAanld8
   Nqgc2RNHSDJu0pU/LpsgKjsHHkCIECAKAJ/1KHo6RT8nvcw0Z3cQnofs7
   qG7sopwaLerBX9Abbd7/0Sm8AbsxdJ0keaWJk5oXoy8FASILlZjdsmumY
   g==;
X-CSE-ConnectionGUID: f+2/j1KBQviBnCfG68oW2g==
X-CSE-MsgGUID: CkOWL9Z3QLac5LRR0KMB5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46292938"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46292938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:22:51 -0800
X-CSE-ConnectionGUID: JhG7juWkSvKU/vA7vg+cBA==
X-CSE-MsgGUID: Nf6oIuSaSN26SxGs8/UDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119232126"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 21:22:49 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/5] Introduce Intel Elkhart Lake PSE TIO
Date: Fri,  7 Mar 2025 10:52:26 +0530
Message-Id: <20250307052231.551737-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
devices that expose two different capabilities of GPIO and Timed I/O
as a single PCI function through shared MMIO.

This series adds MFD driver for them and extends PPS generator driver
to support initial PSE TIO functionality.

v2: Use consistent naming with Intel drivers (Andy)
    Add MFD dependency for leaf drivers (Andy)
    Aesthetic adjustments (Andy)
    Update tags

v3: Use consistent naming in MAINTAINERS entry (Andy)
    Use COMPILE_TEST in a practical (all or nothing) way (Andy)

Raag Jadav (5):
  mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart Lake PSE GPIO and TIO
  gpio: elkhartlake: depend on MFD_INTEL_EHL_PSE_GPIO
  pps: generators: tio: split pps_gen_tio.h
  pps: generators: tio: move to match_data() model
  pps: generators: tio: Introduce Intel Elkhart Lake PSE TIO

 MAINTAINERS                          |   5 ++
 drivers/gpio/Kconfig                 |   2 +-
 drivers/mfd/Kconfig                  |  12 ++++
 drivers/mfd/Makefile                 |   1 +
 drivers/mfd/intel_ehl_pse_gpio.c     | 100 +++++++++++++++++++++++++++
 drivers/pps/generators/Kconfig       |   2 +-
 drivers/pps/generators/pps_gen_tio.c |  80 ++++++++++-----------
 drivers/pps/generators/pps_gen_tio.h |  67 ++++++++++++++++++
 8 files changed, 228 insertions(+), 41 deletions(-)
 create mode 100644 drivers/mfd/intel_ehl_pse_gpio.c
 create mode 100644 drivers/pps/generators/pps_gen_tio.h


base-commit: 264ff8415aed324584acc85740596f6e1df7b663
-- 
2.34.1


