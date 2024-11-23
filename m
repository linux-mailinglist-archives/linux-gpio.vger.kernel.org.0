Return-Path: <linux-gpio+bounces-13210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0709D6B5D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0285828211B
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B051A38E3;
	Sat, 23 Nov 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhoOLutI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE319CC02;
	Sat, 23 Nov 2024 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392370; cv=none; b=mk8iTx0qgm7sjIH5a4vVaJ+PIcpdlreS2jIxKkwF3wqR4bnal2V0JSjUlEoJJ01qKw4BbLlUMsO/OTZsGlpV9f8mgwMryEdm2n2UQ5b14KksmAyCtWofDIPnV8beZ0E8R15f1g/z9LYz+1PYcQ3+7/AEfTwj0DBXWVHZ+zCQrDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392370; c=relaxed/simple;
	bh=SDRSLzgqxuDd1Y5jRSnSWyP7peIE45CnOm8Zg3wyB6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=InvXXXueeh5MEgl++7sKPEzbwDEI3+85o8A4jg4VlkHtLm0Q2UrglsFpcA/b3tK42Jci4FbaHKq+QmFcLrMPHr51bcc7E4K1ehdxW0Uq/GuQvYi1/o7kZrIGX5LDwV0Qc0lPniCB+iuUAc6gEcF3YJnitNid5LURkJXeN0S6N4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhoOLutI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392370; x=1763928370;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SDRSLzgqxuDd1Y5jRSnSWyP7peIE45CnOm8Zg3wyB6o=;
  b=NhoOLutIkx45Cd6b5EVmfZtOrM52TSLJPIN3MWSSuEQUqCEu2DmdWMtY
   2/lpHBbztUWCJMFn8RA7Y8KGpg6VOb2/PIFK+2KVVyVYjZ6tTsG4UZXj4
   vYkEHi6uKd3zZZLgx6cqU0WGeG07PpDFyXFXmwVn3cPeC9iFdqadI1hBC
   VV7AEQ9bfQisUDMaMTQLojRrQ6fXNMwIlUhks9UJ6A/vVpyMSllOOq+jl
   iBKkGK8yVTEpRZ4AHuvQvFIpTWu8nW2/0exe7l5Jqm831VnuGhSPa394H
   +rEYQeti2nDsLygGy/RqsmKGVtLQo/zriDS3y2oiYTyn2nUOT+g6f2wMY
   A==;
X-CSE-ConnectionGUID: zmEQidfuS32fayeWoHixYA==
X-CSE-MsgGUID: An6ca+UvRjaPZA0i8SvtCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678542"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:07 -0800
X-CSE-ConnectionGUID: /fJGvNgxRFaOKdjcF20isA==
X-CSE-MsgGUID: PxgMXxkkQzOtnpw8vphbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121737992"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:04 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 006121CACF;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id EF9AD160010D; Sun, 24 Nov 2024 01:36:02 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/5] Introduce devm_kmemdup_array() helper
Date: Sun, 24 Nov 2024 01:35:22 +0530
Message-Id: <20241123200527.7830-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces devm_kmemdup_array() helper with multiplication
overflow check and uses it across drivers.

Raag Jadav (5):
  devres: Introduce devm_kmemdup_array()
  pinctrl: intel: copy communities using devm_kmemdup_array()
  pinctrl: pxa2xx: use devm_kmemdup_array()
  input: sparse-keymap: use devm_kmemdup_array()
  ASoC: Intel: avs: use devm_kmemdup_array()

 drivers/input/sparse-keymap.c         |  3 +--
 drivers/pinctrl/intel/pinctrl-intel.c |  6 ++----
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c  |  8 ++++----
 include/linux/device.h                | 10 ++++++++++
 sound/soc/intel/avs/boards/da7219.c   |  3 ++-
 sound/soc/intel/avs/boards/es8336.c   |  3 ++-
 sound/soc/intel/avs/boards/nau8825.c  |  3 ++-
 sound/soc/intel/avs/boards/rt274.c    |  3 ++-
 sound/soc/intel/avs/boards/rt286.c    |  3 ++-
 sound/soc/intel/avs/boards/rt298.c    |  3 ++-
 sound/soc/intel/avs/boards/rt5663.c   |  3 ++-
 sound/soc/intel/avs/boards/rt5682.c   |  2 +-
 12 files changed, 32 insertions(+), 18 deletions(-)

-- 
2.35.3


