Return-Path: <linux-gpio+bounces-28361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7196C4F8DA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA2B24F64A6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3C62E7BAD;
	Tue, 11 Nov 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlfzoAKW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139882E6CB8;
	Tue, 11 Nov 2025 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888340; cv=none; b=L9M3d7DdRc3UCtAqxmlTqdRmOsGbb2afX0bfedcJsMVbahUMwIv5isO05GrkSlQtwn7aF27zTWr2gSQIKhiV3IjlxCnW8Nm5ZptHcViNOU+WyLcm/L38s+jlNWzxVViSD0K7FyE7AVp1WDnUMcxavOHWNAboEs/uCMLPkvYuTM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888340; c=relaxed/simple;
	bh=rUn95kg0Rjcm+pnxOLKCXLw6yrQhq1X86z5Q2wNpk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2jn6zExQcz6CCdfKYB9TGV8+MfbBIqifrFebNGdgIhpumKlQ67g0EWPk/607lyREQvDyOg7v7BsaxJd/BLHISMMydOBdeZSuLPLbWE61iAAeqZXDO6wAkTobzog+5/v9Pp1rtu8tc1yciIyvgXqs2BerzNS1HtgkYMXSPXJIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlfzoAKW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888338; x=1794424338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rUn95kg0Rjcm+pnxOLKCXLw6yrQhq1X86z5Q2wNpk6c=;
  b=DlfzoAKWF58tCypNFJNZr2YNdoV+l9n8AFohLo2tQ/lQp/NwmWAYyHBK
   YOra9PoHqFgs5okiHcp2FznzrxWRzwHGlvdCLP4akbkrejaWhAL0F0BCu
   tma82VMFDVj4/mc7Und0yL4dit7CJ2YFc8AI7E1NjN1U96DNJMaAzejWs
   aeYQJlcMeeHaLPNNyqlw+VdxWDosMmhMmx2EQi+r7RcnrcFpq8tENAOhq
   H0oztuZzXoKCH/ixutfS/vEoC7M529giagtZxHVU7a8NqOuaxRfoeJ1op
   IK5DPiPYhWt1LlR2uLaLRYuTdlLHSbvsWvR/n+hJTBnAPmEJfdnADGIuY
   A==;
X-CSE-ConnectionGUID: RGOOguckTFCBxRt+TPlxOA==
X-CSE-MsgGUID: eymxeRZPQPSpwdFYJMED0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90425952"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="90425952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:17 -0800
X-CSE-ConnectionGUID: k6VO+V3ORmSOB7cpOy1Dbw==
X-CSE-MsgGUID: 17VPtxuFT4CGNhVzf5VG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188334538"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 11:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0198695; Tue, 11 Nov 2025 20:12:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/5] pinctrl: intel: Convert the rest to use INTEL_GPP()
Date: Tue, 11 Nov 2025 20:10:24 +0100
Message-ID: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few drivers use the more customised versions of INTEL_GPP().
Convert them to use INTEL_GPP() directly.

Andy Shevchenko (5):
  pinctrl: cedarfork: Switch to INTEL_GPP() macro
  pinctrl: denverton: Switch to INTEL_GPP() macro
  pinctrl: emmitsburg: Switch to INTEL_GPP() macro
  pinctrl: cherryview: Switch to INTEL_GPP() macro
  pinctrl: elkhartlake: Switch to INTEL_GPP() macro

 drivers/pinctrl/intel/pinctrl-cedarfork.c   | 37 +++++++----------
 drivers/pinctrl/intel/pinctrl-cherryview.c  | 46 +++++++++------------
 drivers/pinctrl/intel/pinctrl-denverton.c   | 21 ++++------
 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 43 ++++++++-----------
 drivers/pinctrl/intel/pinctrl-emmitsburg.c  | 33 ++++++---------
 5 files changed, 73 insertions(+), 107 deletions(-)

-- 
2.50.1


