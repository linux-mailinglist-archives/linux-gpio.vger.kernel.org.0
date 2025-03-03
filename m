Return-Path: <linux-gpio+bounces-16887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC4A4B734
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100291887835
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46821531C5;
	Mon,  3 Mar 2025 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb2kOerk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABC33FE;
	Mon,  3 Mar 2025 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977270; cv=none; b=paXTlh6bSQcQFjL5xljZKw9CQuVeQh71iklQWZh6RmitpBtqrn7/oJWg7rvvzN63/unaw6cqsRi94GhGbGjQBGO4K2idATSuculmbPEv2f0bI1nKCYQScKvlca7MNPLqt7Ju24EVlf+t1YGVxP9skS1qXw2UC4dxRKygvCpfiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977270; c=relaxed/simple;
	bh=2MYsXhuiWdC8V+rqVWctQMbUvLlvV20a9SArDkXEMsw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jq8RBgbwt3erO+iuOlmv1/P29hBmsCnzVHA726hBleYNUwkC/f84mWoCcmXn0CTrbJJQ5SE3NIxynJemCGCp41QXDfMtIt0PzELeb+EuJw87oGL5FYxlUHY2y7wEXOcC7wM3Cau+Ubbmr1Ut5y/qEfuGF5EDQaxcHmPyrD65Izo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb2kOerk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977268; x=1772513268;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2MYsXhuiWdC8V+rqVWctQMbUvLlvV20a9SArDkXEMsw=;
  b=eb2kOerkMr1TZrpH4dygOlELgisnMB9s8Zg9qvT3ytu6g7Pq4XCGyjWp
   bZ65W+DnqVdRG7i7ZndqyXfo2a+qdpoXWdbSYP3zTF9uowCRCDeyCvJ+t
   xjL+LpPeTQ5BnraJwNIm1EfjHKSZnvU4hlAsqad/x+0KC4FJfq3ozLyS4
   uQIeZDO3QRRS0JSJ+kZ7h56/W01nbJEws7oVgxCoB45sCZtf7D6d6us7L
   OXcEVPCJqh5E8PwjpCZpeHo302FSDSsXtlMbMe1HbnxfNc3RKSa6he5qd
   BN0aNY7V3b0bKY8EM6SACcHfH/ozprE9Ry65iiu8f5RqbkYCKmYkgv9nu
   w==;
X-CSE-ConnectionGUID: abVL8BUzQ8CTbZfIVfRajQ==
X-CSE-MsgGUID: SgDSZUaIS4qgnwEzGmG0WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382047"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:47:48 -0800
X-CSE-ConnectionGUID: Car9/PnMTU6MkEMKjigm6A==
X-CSE-MsgGUID: XAcgXAOeQXKFdQpAcRBRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123918"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:45 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/5] Introduce Intel Elkhart Lake PSE TIO
Date: Mon,  3 Mar 2025 10:17:40 +0530
Message-Id: <20250303044745.268964-1-raag.jadav@intel.com>
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
    Add MFD dependency for child drivers (Andy)
    Aesthetic adjustments (Andy)
    Update tags

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


