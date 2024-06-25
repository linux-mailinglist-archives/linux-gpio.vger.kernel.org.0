Return-Path: <linux-gpio+bounces-7677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28517916980
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 15:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9371C23387
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 13:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431E5163A9B;
	Tue, 25 Jun 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3lG/Qs1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC5161936;
	Tue, 25 Jun 2024 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719323643; cv=none; b=jpXaonDsch1lh6pO3XWjORt/MyXfzSmy2bXoXngE3INKqBYb0Mb8LwwmA7Sbuk8mW4emYS0HoLAfbCv3Gz2GPC0WIOvGQ44mVYrxrBqUBCyL/MNCwWLo9frvgRdx/sgtr9YCu3ikj1eYLMU1TbQUTpJY/kfHtCqTSXzjleTdFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719323643; c=relaxed/simple;
	bh=2kbTAXhRUmVmGDhPH6GBeh4zbZRFYCFfhlPRHIRhXns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNJP57JItVpa5+A4ScNZF1MZHVrFX76YQeN8vflR2zQ4BmKuvJ0DIoPtiJIKn5BCjbW3Tn9dyKsVg54I+qcrOxcQboIz2SAAiCCE5qwNaDWEXrxLduvjui9M6ODWD0BcpabuuGe6c4seEsBQbqSDbhr81nyPoKxbekVy0EE4vUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3lG/Qs1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719323642; x=1750859642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2kbTAXhRUmVmGDhPH6GBeh4zbZRFYCFfhlPRHIRhXns=;
  b=K3lG/Qs1+mlz5Ld4igsZKMrV8A176ojhzWygeVVURa4lPMC5Ok+pwhi6
   IxgTZ6SSOW5WLV2LM/LcVxGmBmBM+9GdN+ERZhrWkozeIwFbzweClC8Vh
   zd7RmHMPv/hlE4jHy9nrefIJsVFkSNogi7Z2omB7+wtHsjx2EOhE9QxiR
   b52I9ECfyaAhohoDXWC/ORgEnd8blMlC+gs/YqfKYatQI4oKOvO6hG6uR
   iroPGxFaV4M4k6UlCvRhlyAWuKJf3tv5w5oeG9CrPz+KQ8CZqVO1hL9dz
   MWAAcd9Nm7OJRN5RXXYunvH5bfOuZn0fGMimZVummimst9SsEzuPCiD8x
   g==;
X-CSE-ConnectionGUID: 9H9rgny8TZuU7M/NTaFHcg==
X-CSE-MsgGUID: IqFXQROgTMiY6YFzPeGEhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16486129"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16486129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:54:01 -0700
X-CSE-ConnectionGUID: +8dQsUuzRhGxUFtS2/ywkA==
X-CSE-MsgGUID: OR4bIOYhRlmhcz5qpBlbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="44364751"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.31])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:53:59 -0700
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: [PATCH] gpio: graniterapids: Add missing raw_spinlock_init()
Date: Tue, 25 Jun 2024 16:53:43 +0300
Message-ID: <20240625135343.673745-1-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing raw_spin_lock_init() call to gnr_gpio_probe().

Fixes: ecc4b1418e23 ("gpio: Add Intel Granite Rapids-D vGPIO driver")
Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index c693fe05d50f..f2e911a3d2ca 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -296,6 +296,8 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	raw_spin_lock_init(&priv->lock);
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
2.45.2


