Return-Path: <linux-gpio+bounces-18938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63EA8B62B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C36E444BDB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3485A23D2BD;
	Wed, 16 Apr 2025 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/tMp6Lr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68047238C2E;
	Wed, 16 Apr 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797414; cv=none; b=HkKjWWDCDH8OcZqR/zx0uwBS0iO0peu/qIuUfZeuS8rlMReHDg2IqqZ/pvdnRcnK0dp2+Ac6Lk4GqctXwk3N/YZx4JnkoUNozL7yvIDP6hFfkTf9ZATebx0NSh99HdfSwVQkQ9ZiXgFEiVIIE3a12JJ+F8amq7WDll7G/i3egYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797414; c=relaxed/simple;
	bh=5/Q7/EMTC9GVHsrsldbVrebqQeYH42cWDQYOYcPqTSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR9PTrjGyeaF2seFIpkZOAK3wDLJM3DVpbBLLntdFcwm4r4bb6qbw9RT5Nkk/PHCn3jLz4IKq/rdJuT/mYLu59nJ3drBdUpt6RA+vswo2A3fekHF1Rk75ToZyUpqOIIR6aArbZasaUlNFKUB+LJRU7CK03nuWlpeo7YNmcT3CFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/tMp6Lr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797413; x=1776333413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/Q7/EMTC9GVHsrsldbVrebqQeYH42cWDQYOYcPqTSA=;
  b=L/tMp6LrGw16IZj530vRP+b7pnCYAor3dR3r0X+ZJthHyT/rOH9A2FNK
   kP3WMqQxwz8BA4JpONR34dc2Ed33kpZMSdLTSTMq2GpVxZr6lMvWK4rOj
   9qIuqkvNTYanJELEctQ3qc5j/p4z3OMqVTvT5moJ0VV6Mqp/wLyMToKwL
   cNrswxhsDnljf4Xlf87KazfEU7kXW+wMhJmvtE0uY8tC4qexYWJmDBz8m
   z4J6ZwjL3cTNWB18nE1N48hnaZwKUHLkpQzv3NN/bjcFBLLnht8fJyYtI
   GZu4lAYqBqdFDqVUYrpfCFzuPbzYd+IKIBWyNldVR+JlmPCXw9qlG8RSY
   Q==;
X-CSE-ConnectionGUID: 6VJx/agVS+uXItUqVXS+og==
X-CSE-MsgGUID: rNkFwbznRzyp/Y5vyQ3H+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63743642"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63743642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:56:52 -0700
X-CSE-ConnectionGUID: nC0BNLZjRcy5EEfj4KqCrg==
X-CSE-MsgGUID: BphVdeQpS5aBfcTkuXPMvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131323323"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2025 02:56:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 32B4B76C; Wed, 16 Apr 2025 12:56:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 7/8] gpiolib: Reuse return variable in gpiod_to_irq()
Date: Wed, 16 Apr 2025 12:55:15 +0300
Message-ID: <20250416095645.2027695-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two variables for the same used in the gpiod_to_irq().
Replace the second by reusing the function top-level one.
While at it, refactor the branch to have less lines of code.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3f3371e427fd..7a669218e42c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3994,13 +3994,12 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 
 	offset = gpio_chip_hwgpio(desc);
 	if (gc->to_irq) {
-		int retirq = gc->to_irq(gc, offset);
+		ret = gc->to_irq(gc, offset);
+		if (ret)
+			return ret;
 
 		/* Zero means NO_IRQ */
-		if (!retirq)
-			return -ENXIO;
-
-		return retirq;
+		return -ENXIO;
 	}
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 	if (gc->irq.chip) {
-- 
2.47.2


