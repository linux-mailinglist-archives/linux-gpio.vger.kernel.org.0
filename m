Return-Path: <linux-gpio+bounces-13287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 110189D9C59
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE384165EF2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0F51DC18B;
	Tue, 26 Nov 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHGkFGN6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1141DB372;
	Tue, 26 Nov 2024 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641776; cv=none; b=PK0o576M9LjYej7F1JaAqiolAk4k+SkWqJdR8usyq3mj3EH9rRa621NPb8CYUw+lxyHDhTCyQhJTwWlhSqr5RtPjdbTdwSGc8Hsbuw2OVN7yfi+D1bcFQU9m0yIJ4y/ZklKzP667xYRtv5BSm9EQ9SSGRCoLC6eeoX8eTDID+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641776; c=relaxed/simple;
	bh=i117w8uZGFYdMCSbxxg+kJmTCdyDb6R1v2/wBjyYfZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nZzlYLrVyRj/+tnQcO0yPoHciCxLoFEdmsEwNultmdXp63bcUQT5ZzJaaiKM3aI0JjwEpZ1EUPuhOz865rkYUH2ET65/fm2ZlKIx0NcbufaKC5xKmMSShADm2dTG2rLu4caUi9iKwY4zlW4HLbxhLrxCujmiXFnYZ1/MytDOyUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHGkFGN6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641775; x=1764177775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i117w8uZGFYdMCSbxxg+kJmTCdyDb6R1v2/wBjyYfZs=;
  b=SHGkFGN6KMWY2MtLnWUoAK8JUD6Bwi6kQTiXeCJzgri/n7B6ofC6wPi/
   43/A8lRi1nmVFyix+ClCNOkilfgXFxZkTiYEER3dxhxoWg+QwY+vakOpv
   iRtwcYIr5EDUOUkWJtTc13eOuUMQ7nQp0QTsv0XpAzJ8sbbQk1z3IW6ts
   F/ibjpVCiK/wiD/nmo6QmFE+FC0ceFc2rzzUKJVZtrSOaznJRvEPo0cAb
   BAtMFA7LyjX2D5LXfbnMh6oykp3NDtgM35YJ7Kv8Qn2CED0IkOB2UkR5V
   NE9KQca/Gk87vEM1TYpETjvr0JXWVsxWEyBy89qTkjNxpOp9nhcN+472n
   g==;
X-CSE-ConnectionGUID: rDHMXYceTyOzjB9mM2oW+g==
X-CSE-MsgGUID: rf4ZGomaQSywvftBs24MXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312943"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:53 -0800
X-CSE-ConnectionGUID: 3DmKYpg/Rr6kDvcyRJpoRg==
X-CSE-MsgGUID: /E0wnmucR3e5XOG60yWriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730557"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:49 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 388C31CACD;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 34ACB160011B; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
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
Subject: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Date: Tue, 26 Nov 2024 22:52:34 +0530
Message-Id: <20241126172240.6044-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a more robust and cleaner devm_kmemdup_array()
helper and uses it across drivers.

v2: Use size_mul() for multiplication (Dmitry)
    Update commit message (Dmitry)

Raag Jadav (6):
  devres: Introduce devm_kmemdup_array()
  pinctrl: intel: copy communities using devm_kmemdup_array()
  pinctrl: tangier: use devm_kmemdup_array()
  pinctrl: pxa2xx: use devm_kmemdup_array()
  input: sparse-keymap: use devm_kmemdup_array()
  ASoC: Intel: avs: use devm_kmemdup_array()

 drivers/input/sparse-keymap.c           | 3 +--
 drivers/pinctrl/intel/pinctrl-intel.c   | 6 ++----
 drivers/pinctrl/intel/pinctrl-tangier.c | 5 ++---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c    | 8 ++++----
 include/linux/device.h                  | 5 +++++
 sound/soc/intel/avs/boards/da7219.c     | 3 ++-
 sound/soc/intel/avs/boards/es8336.c     | 3 ++-
 sound/soc/intel/avs/boards/nau8825.c    | 3 ++-
 sound/soc/intel/avs/boards/rt274.c      | 3 ++-
 sound/soc/intel/avs/boards/rt286.c      | 3 ++-
 sound/soc/intel/avs/boards/rt298.c      | 3 ++-
 sound/soc/intel/avs/boards/rt5663.c     | 3 ++-
 sound/soc/intel/avs/boards/rt5682.c     | 2 +-
 13 files changed, 29 insertions(+), 21 deletions(-)

-- 
2.35.3


