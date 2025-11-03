Return-Path: <linux-gpio+bounces-27993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AEC2DF86
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 21:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B085F1896955
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 20:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBCB2BEC41;
	Mon,  3 Nov 2025 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oc1GcE2c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05B22D9F7;
	Mon,  3 Nov 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200164; cv=none; b=eoPLv7Mp9SvJbBb80KAvhlPyq4O8o3OTJzBDfTpwp3QZl+0aSFpNMNtwNoYXJO1QJCPXN66QE6e42IHC3y4ID3cf5NL3hZrokZoOCv9bXMV7oQ41Ny/9jUeNGd26dpNkgfD1D1U9KUbgQje804zQAFF5LK1eJe3mzXrpioeGjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200164; c=relaxed/simple;
	bh=gJQ7I89vGxLwBDto9z3kF7HhNLOsdvpVK5ilCIY+DyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOoChYW3lAYnSu3CrDg5rM1zHkQfwTVviRImoyxCws0uvn4CyKTVPO/C7izMg9KIxFMfgXgF0TJcsj1gHbzFFoc5qK4L61SQ9Cc3Ag7nqUtLhI1KZFp8siQrY4XO8spzAfo95G3EgvG/IJ1L/8H/IqjYY8+A081XSvFUH6xScRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oc1GcE2c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200163; x=1793736163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gJQ7I89vGxLwBDto9z3kF7HhNLOsdvpVK5ilCIY+DyA=;
  b=Oc1GcE2c6ofJ5gTwKZDUvq/bRo3Q9axl8TogRfHZo3aSpcUSjsENR+DW
   TkGsNp8Lmr7xj6qOsCvKaxTfYkfZ8mYdi4xxt+ocFzOPxDkqAaKqkswM7
   Lj1qmMUrRs5GqegDTXDO5QVg2MjIfdJSZPOxMiwS6QXZQZnXGFwWnZNAW
   3rFW0MsEFHXonn/qLEyZVfH3/fIrase8+lceEm4n0TCG62WY436wRbQyt
   xarUhOaeUXf5kM0YmpNaa0+Msn172/4rFFjQBJ/5SknLSJIRdgT2CMchG
   9yCFOnJG7jtBjGS7cPc3eO8pDH3talBHmQMtlGnAkgEIEUvTtHXQpuqTs
   Q==;
X-CSE-ConnectionGUID: H4ZUAxxOSHGvx3Vk/BYRKA==
X-CSE-MsgGUID: JLQKag+9RwitGKC2P+wFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75735747"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="75735747"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:02:41 -0800
X-CSE-ConnectionGUID: dKlktcfvTvG/fPyleQ+rIA==
X-CSE-MsgGUID: 1uMNJweMSp6crQ4eNbJwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="224206715"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 12:02:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7CB0498; Mon, 03 Nov 2025 21:02:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/4] pinctrl: intel: Unify messages with help of dev_err_probe()
Date: Mon,  3 Nov 2025 20:58:30 +0100
Message-ID: <20251103200235.712436-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
References: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index faa8ae8ef56a..8e067aaf3399 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1356,10 +1356,8 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
 					     grp->gpio_base, grp->base,
 					     grp->size);
-		if (ret) {
-			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(pctrl->dev, ret, "failed to add GPIO pin range\n");
 	}
 
 	return 0;
@@ -1401,10 +1399,8 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
 			       IRQF_SHARED | IRQF_NO_THREAD,
 			       dev_name(pctrl->dev), pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to request interrupt\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "failed to request interrupt\n");
 
 	/* Setup IRQ chip */
 	girq = &pctrl->chip.irq;
@@ -1417,10 +1413,8 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	girq->init_hw = intel_gpio_irq_init_hw;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to register gpiochip\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(pctrl->dev, ret, "failed to register gpiochip\n");
 
 	return 0;
 }
@@ -1676,10 +1670,8 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	pctrl->pctldesc.npins = pctrl->soc->npins;
 
 	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
-	if (IS_ERR(pctrl->pctldev)) {
-		dev_err(dev, "failed to register pinctrl driver\n");
-		return PTR_ERR(pctrl->pctldev);
-	}
+	if (IS_ERR(pctrl->pctldev))
+		return dev_err_probe(dev, PTR_ERR(pctrl->pctldev), "failed to register pinctrl\n");
 
 	ret = intel_gpio_probe(pctrl, irq);
 	if (ret)
-- 
2.50.1


