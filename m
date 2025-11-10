Return-Path: <linux-gpio+bounces-28279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2DC4503B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 06:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7037A4E7B28
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 05:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A77B2E8DE3;
	Mon, 10 Nov 2025 05:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT0qTdxP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902C11CAF;
	Mon, 10 Nov 2025 05:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762752498; cv=none; b=bzpXx9wtFHj6OyKNDDf1IFDQEZVfQdYGifu2UVV47gRzXIOhdzy/yJMW2i5dsimzfkbPNa1eIv+zOv14ZTaubjDBeW3hrZSpUwTwlEaGlGCuQGvJOxkoLu2mDmACbF6wS3lq578Ymq+n39KWTsyORF0ssxlqQWhJCqTDFmqBEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762752498; c=relaxed/simple;
	bh=5GlQ2RD8Es6ybAmN+inqFqJieIz9so3nxskK/NZ1PLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTdZzFzvUYiETRbyb6Qe7Woq3mgN6aS20wxn+zkwWvMRPhOwJAmXdxeQWcWUd3F1s85t5POMjq63jpD1pvEoZbmtYzbAb7dD4bXy9xQRZ/w+YDKDvO9kIL0yJnDp/TSpHMaocU3r0AiRc+buZb83v4mh201RGlb3YLrzfZ/qRLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT0qTdxP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762752496; x=1794288496;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5GlQ2RD8Es6ybAmN+inqFqJieIz9so3nxskK/NZ1PLw=;
  b=TT0qTdxPNRPMSsEKFLa9Cfox+9qCzxymCmunx60LxCOK2HPdwi9VD+/I
   xDQWy3NntmguJ022Y4kyR/MJmch/bkmZvd1oMUSJBiZPibz6tT7XeRNbw
   wVCi84xE3+51dXGTVrWS6Oy5vC7CpRvz0IMsDmfeemsHb5iaUUUnp998q
   g+GfShGpFILbqKqfBCGCwYtjGWEqn3tvW5ThyDihcH/xTIILY8dczv/s4
   z2T/FBJ2Rez6XaGb3SmJ0lMuztVwlT1B5bWAATCAQd8Ei5OifWOlH4BlN
   ExMWoCIhnKopE+Q9fY192wZbviNnQrPYuvuW6sLfIE6mSgvQb5VwieU/K
   A==;
X-CSE-ConnectionGUID: g828SGDXT2i4OkFoXXWdnw==
X-CSE-MsgGUID: QgccLiSRScSsNqInba+ryQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="67405750"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="67405750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:28:16 -0800
X-CSE-ConnectionGUID: RxEuLfN5QwOKtP/ua+v7oA==
X-CSE-MsgGUID: nXCTuBdnT5yWDrpbPLCEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192691670"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 21:28:13 -0800
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
Subject: [PATCH v2 0/2] Introduce Intel Elkhart Lake PSE I/O
Date: Mon, 10 Nov 2025 10:56:39 +0530
Message-ID: <20251110052728.383339-1-raag.jadav@intel.com>
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

Raag Jadav (2):
  platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
  gpio: elkhartlake: Convert to auxiliary driver

 MAINTAINERS                             |   7 ++
 drivers/gpio/Kconfig                    |   2 +-
 drivers/gpio/gpio-elkhartlake.c         |  34 ++++----
 drivers/platform/x86/intel/Kconfig      |  13 +++
 drivers/platform/x86/intel/Makefile     |   1 +
 drivers/platform/x86/intel/ehl_pse_io.c | 107 ++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          |  30 +++++++
 7 files changed, 175 insertions(+), 19 deletions(-)
 create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
 create mode 100644 include/linux/ehl_pse_io_aux.h

-- 
2.43.0


