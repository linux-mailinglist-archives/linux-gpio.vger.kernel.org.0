Return-Path: <linux-gpio+bounces-13473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1C9E33C8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17401B22C58
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2EE189528;
	Wed,  4 Dec 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMMqoAhS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77678161320
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295863; cv=none; b=RW9uFqtKMOmAE9fIVsI8ki1gWMBrHQq5R/duXwhrBsWQU13/xG4hKKr05KEOtPN9HpAwU0lck7IhKPzuFOrp/8wF3NWQAiaF+1a6IQ2s3Bkj6dIYtJMVauRooxlAOfTcegStxUNomm/+0v7MxpK+Fz9jiHxK2z/6qf8mbOyFlI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295863; c=relaxed/simple;
	bh=nyDFVkb50Sf9nTAtDojrDAOvTiKJVXbM35C8sZBDG6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr7kfxaQsQ8aUI4lizrZ0WbPx/F1BxcsVyyo47N2KvbmCTBHdVfsnOINAVCXSikH2PAri73VABmAp7OUvr+yZ5sEOcObVEBZCEtH2drr/93jDrIt3Co9+dq3EoNQS9BqSXbDfrNF1KSwLFcEZ85j/HEdY036E2DPkgygpfgMc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMMqoAhS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295861; x=1764831861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nyDFVkb50Sf9nTAtDojrDAOvTiKJVXbM35C8sZBDG6Y=;
  b=WMMqoAhS59fCrYJw300oNLm6dHlGkxHA2QWqUuADmkRlFaJd5JSrtJWU
   mMq5m1DlrbzdwgLypgC9TM8fugzkffCyV4ePyNCG4tG2wNOoSA/hDxGLw
   QRSaMemgmEuJ7CNhHrA1nv9Kmw55rCxIAlr+Skkf+ci+fiKDY2+jtkdWk
   1aNH4RFf68TaK21WoTgWdLfIHPjS1NPNuWTK+b3d6h4dkb5fSE1yH7jDS
   Je1gBMwLPV9kQAEkeekn8Bp5qngBo8FlMoTQdyswXurXVr7PMbSYgaIbi
   VgAtQiMtp/OqaFqK1MHjP5nujTyV1uykDMVBWRqeN5HXfQtZTWLgbfUme
   w==;
X-CSE-ConnectionGUID: kTnva/gsSXShMO4kWIAqDg==
X-CSE-MsgGUID: U+wA8zGDSPedBvKG2qOWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44022831"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44022831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:21 -0800
X-CSE-ConnectionGUID: +5NV/POMT2O49tha6DorvQ==
X-CSE-MsgGUID: h4E3flldQ62806i2gPelxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94104181"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 23:04:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 33D54557; Wed, 04 Dec 2024 09:04:16 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/7] gpio: graniterapids: Fix vGPIO driver crash
Date: Wed,  4 Dec 2024 09:04:09 +0200
Message-ID: <20241204070415.1034449-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Move setting irq_chip.name from probe() function to the initialization
of "irq_chip" struct in order to fix vGPIO driver crash during bootup.

Crash was caused by unauthorized modification of irq_chip.name field
where irq_chip struct was initialized as const.

This behavior is a consequence of suboptimal implementation of
gpio_irq_chip_set_chip(), which should be changed to avoid
casting away const qualifier.

Crash log:
BUG: unable to handle page fault for address: ffffffffc0ba81c0
/#PF: supervisor write access in kernel mode
/#PF: error_code(0x0003) - permissions violation
CPU: 33 UID: 0 PID: 1075 Comm: systemd-udevd Not tainted 6.12.0-rc6-00077-g2e1b3cc9d7f7 #1
Hardware name: Intel Corporation Kaseyville RP/Kaseyville RP, BIOS KVLDCRB1.PGS.0026.D73.2410081258 10/08/2024
RIP: 0010:gnr_gpio_probe+0x171/0x220 [gpio_graniterapids]

Cc: stable@vger.kernel.org
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-graniterapids.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index f2e911a3d2ca..9da2999dc30f 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -234,6 +234,7 @@ static int gnr_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 }
 
 static const struct irq_chip gnr_gpio_irq_chip = {
+	.name		= "gpio-graniterapids",
 	.irq_ack	= gnr_gpio_irq_ack,
 	.irq_mask	= gnr_gpio_irq_mask,
 	.irq_unmask	= gnr_gpio_irq_unmask,
@@ -324,7 +325,6 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 
 	girq = &priv->gc.irq;
 	gpio_irq_chip_set_chip(girq, &gnr_gpio_irq_chip);
-	girq->chip->name	= dev_name(dev);
 	girq->parent_handler	= NULL;
 	girq->num_parents	= 0;
 	girq->parents		= NULL;
-- 
2.45.2


