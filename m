Return-Path: <linux-gpio+bounces-6665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEC8D014E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C311C239EE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D3315ECF2;
	Mon, 27 May 2024 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD9bC+wO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898613BAC2;
	Mon, 27 May 2024 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816238; cv=none; b=UenbFu7colf3KmdJMdAVjnBPSTXvn1SmvdRQEt0taSG5L2k1Rg0SN6vDrmvr6B73vuxNG9M39umQB0uMoQwxRYzBHMu2gnT3YkewyyXax0Dl1buqNDWYwoBc3wvoyW2ZE1WdRdzEQeFr1okiIfqAvQVCyV2g79hdDuyoBpDM2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816238; c=relaxed/simple;
	bh=m7ie1dyfFnb2OxuXU1La7yIKiGa6Do9hDeij+vyuSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WumfFMJNXoGgnllZJTFw2mEMQ/tqeInvPan7mFTrrPTZK3kAMfg/roOwScPoDrnkqvD55qOOqbhasflNO0C4MbYnOXKxgobcHA3TjYHJqVJE/Dq8R6F4NUpkFlHu6uCvDrYvK4JWro8BWcn1IUSF6FIIGVxDbnGGJBDDzNw0bW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD9bC+wO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716816238; x=1748352238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m7ie1dyfFnb2OxuXU1La7yIKiGa6Do9hDeij+vyuSqA=;
  b=BD9bC+wOd8ekRe7w7ZO+EvxlyoTFJf5aFnHmdl1D7tWTPl2A20GApDl7
   ZCDtUaUCAfglL+EcQ3YncBm9jFINYXG3qYgKsRvGgWuZ7rpQULtT8tWja
   Vy+TKyhW9ISHhh6Us0ibdwCKSv7H1Rw0ln90Bcdw8HQxNXnx8Vgvd2U9z
   Bp+6Ew3fRgGudZpo4j38WU4DwMzYESQ5sHo7GlHJyJO8aqb9uWZuCq7Bk
   bMXUyYoNWrBQQq2EIf18kRCotyd9Q2R+Z4xafs0C4N/7pRchCCqGhtjRC
   4C7E6xlUns273AeWgFrnTzrwpstI6IW+13hC2iEJ5wz9UCUvSCbP3og6M
   Q==;
X-CSE-ConnectionGUID: b45DK9YzRQq2QEehJ2H8Gw==
X-CSE-MsgGUID: hi5j7d2TTw+Tg3KiUyZNhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24551754"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="24551754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:23:57 -0700
X-CSE-ConnectionGUID: AsNqHjAxSw6r7/+Wclu44Q==
X-CSE-MsgGUID: X5N63FudRP2sClsQ7xI6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34735392"
Received: from unknown (HELO localhost) ([10.245.247.140])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:23:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to errnos
Date: Mon, 27 May 2024 16:23:44 +0300
Message-Id: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

amd_gpio_init() uses pci_read_config_dword() that returns PCIBIOS_*
codes. The return code is then returned as is but amd_gpio_init() is
a module init function that should return normal errnos.

Convert PCIBIOS_* returns code using pcibios_err_to_errno() into normal
errno before returning it from amd_gpio_init().

Fixes: f942a7de047d ("gpio: add a driver for GPIO pins found on AMD-8111 south bridge chips")
Cc: stable@vger.kernel.org
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpio/gpio-amd8111.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 6f3ded619c8b..3377667a28de 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
 
 found:
 	err = pci_read_config_dword(pdev, 0x58, &gp.pmbase);
-	if (err)
+	if (err) {
+		err = pcibios_err_to_errno(err);
 		goto out;
+	}
 	err = -EIO;
 	gp.pmbase &= 0x0000FF00;
 	if (gp.pmbase == 0)
-- 
2.39.2


