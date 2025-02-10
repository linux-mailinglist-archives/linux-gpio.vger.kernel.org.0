Return-Path: <linux-gpio+bounces-15666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8FA2F98D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 20:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A5481696D4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 19:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A73224C68B;
	Mon, 10 Feb 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3ixRV8K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CC24E4D9;
	Mon, 10 Feb 2025 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217160; cv=none; b=TYDKVeoagkEWdmtYPz949hr8cTCd5lvpL9XqulZvuj1trjmL6z3WXloCuyct22jcEnFU5tuHVU1p12lYeeSZZjz01nYHOxuAjDeUbSFUDrc3duhNyB3WSL00cWm5cjPrw1e42PZtGJfOhGavmv4QBtkf7hyXhcNdsbSEhsHiq0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217160; c=relaxed/simple;
	bh=YKyCyz2ARHxjUjk7uzAEj6oAAwn39/A/3L0yak7dy9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRi6NxyobgTnVDgHWo0LouT/n+EJDXvGx+yHGhkTbczKY23WxGYPdqnaXMr41TNDED/s35ONo9/Dxqwv6y/lAmn3+7NJruiBLmOC2FShUerR5Q9xY2lR2AtKiglvkitY9J1QO0FTzqs8f0m1cXDlWANIjbMhskCtGqSh5n0Rr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3ixRV8K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739217158; x=1770753158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YKyCyz2ARHxjUjk7uzAEj6oAAwn39/A/3L0yak7dy9c=;
  b=C3ixRV8K9H6oqYu3Zu26IqBcG4l3xGgeUQUuSpDiHrfGVgKdV3W/G/gW
   AoieGisNNo3se4qi14bhTy3rbeHcYW52nmMmkGhd5AqoEHtV88TINmLRo
   0oDSrnT89/7Aa+OxNvlGuayMsFizfxHWzOBoMcBV7asXetI/zeFPzYif8
   J8zzsDLdaTM4nrhmKJbvKPpdNXDgSFpYd52fARNNYxlHfHEd2wDbBqLqE
   gzTNpBRO4heov7NyXNGPjEAusOly2IMVKfZOrPUTua7d8L5yL35fFs1fh
   rEE0TV8Ug2LlnQ6Rasotvb2Kj0q19/uliKGF5v8Rf4KZ5R8KThltAcl4G
   g==;
X-CSE-ConnectionGUID: DJzB1PLWSUCcA3/ApyJ5IQ==
X-CSE-MsgGUID: DbtIjN7gSfGLmnpvHeDz1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40085024"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="40085024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 11:52:36 -0800
X-CSE-ConnectionGUID: Y8pPCPD5TcG5ULBuAwdcFQ==
X-CSE-MsgGUID: rwU+klMkRi+6lMUC1uuI4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143148722"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 11:52:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B7E492F2; Mon, 10 Feb 2025 21:52:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexis GUILLEMET <alexis.guillemet@dunasys.com>
Subject: [PATCH v1 0/2] pinctrl: intel: Fix PWM initialisation
Date: Mon, 10 Feb 2025 21:44:49 +0200
Message-ID: <20250210195230.490904-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears that PWM instantiated from pinctrl-intel is configured
to a wrong flow. This mini-series to fix the issue. Note, patch 1
is comprehensive documentation paragraph to explain what the difference
in the programming flow and what the SoCs are affected.

The issue had been reported privately, hence no Closes tag.
I haven't added the Tested-by, so to make sure that it (still) works
I ask Alexis to give the formal Tag here in a response to the series.

The idea is to route this via pin control tree as there are already two patches
against PWM handling in pinctrl-intel. There is no need to backport that, it's
optional, because it wasn't worked from day 1, and hence no Cc: stable@.

Cc: Alexis GUILLEMET<alexis.guillemet@dunasys.com>

Andy Shevchenko (2):
  pwm: lpss: Clarify the bypass member semantics in struct
    pwm_lpss_boardinfo
  pinctrl: intel: Fix wrong bypass assignment in
    intel_pinctrl_probe_pwm()

 drivers/pinctrl/intel/pinctrl-intel.c      |  1 -
 include/linux/platform_data/x86/pwm-lpss.h | 33 ++++++++++++++++++++--
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.45.1.3035.g276e886db78b


