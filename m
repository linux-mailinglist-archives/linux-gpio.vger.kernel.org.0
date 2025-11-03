Return-Path: <linux-gpio+bounces-27989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE71C2DF59
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 21:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FE3C4E1D92
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 20:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17981241CB2;
	Mon,  3 Nov 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ0Pcvnt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC972622;
	Mon,  3 Nov 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200161; cv=none; b=UD5Yn078Z5NDNw8qCXRmZpnfeu89FvTQir4q3jJAZGmDCWv8OKsTsLRo3i+yeiMLgDfKUcH07zPizmfInK+02AYotmJyuHZnHWkyWd7ljEyd8I6tyUiVkjbgl5kTUeaeLTQM6lnFi+uJZj3WvboNGQPJ2Dim22KSHCzIDUshhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200161; c=relaxed/simple;
	bh=L/5er9j1LDk/qN/2JzAmnS+Q+mkukV3MmntLxh1IBlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/GSqrKR4BwFgwjO36c/bPUpCgLiYBEU5oEhaqCqqVL4S27S/g1SvrLZ3vk1RlxWkbPLwByneClAWQ64poJPLZ+WoMkcb4uArPB+gAtkG907aElU5Icdc5TRJg4UHdaxmkc3Wv5NRz33j9/Efxc+YK9c2Lb0JV0Yv2WJDb/Pn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJ0Pcvnt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200160; x=1793736160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/5er9j1LDk/qN/2JzAmnS+Q+mkukV3MmntLxh1IBlU=;
  b=FJ0Pcvnt1y1J0jSmNmOvWsFDjTpMpwTU49aC3P3kHB5cUbZuUCMdardX
   HEgrnglgTKVo3wZumuet0tDgU/YYdBFWavwdXgyH+QUprZ9M0uzo6C5N5
   17shk6sUMoW2BM/GksNz4qB1YF82xVHtesWrCqgfNxEgNLsUNA8eNXEAK
   J+1NLCjuGFFQZICuX0ll2z6QKpBSET13OnbH/itS5D3CyK3iqO7GQjmgD
   EiNQrhWWHoaOraXf0I/jOxjvLkfYKPBnjHhN6153fG969aAPp1XPvxkco
   Qii1XPB3n5DKW968s92Q8I6LWXElcmoSERegHWUzJkUfF5DNfkX7rd9Uj
   w==;
X-CSE-ConnectionGUID: vFJdfWOvSdmIeng8sukTAQ==
X-CSE-MsgGUID: bszgsLtqQ3SyPDnDotXfhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51855288"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="51855288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:02:39 -0800
X-CSE-ConnectionGUID: GLGpBzxbR4iZ4ZBaNciGxA==
X-CSE-MsgGUID: p+oCWcYERHCfj92lw52RYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="187271931"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 12:02:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 784EF97; Mon, 03 Nov 2025 21:02:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/4] pinctrl: cherryview: Unify messages with help of dev_err_probe()
Date: Mon,  3 Nov 2025 20:58:29 +0100
Message-ID: <20251103200235.712436-3-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 3106bf342197..9c89ccc3b59d 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1528,10 +1528,8 @@ static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 	for (i = 0; i < community->ngpps; i++) {
 		gpp = &community->gpps[i];
 		ret = gpiochip_add_pin_range(chip, dev_name(dev), gpp->base, gpp->base, gpp->size);
-		if (ret) {
-			dev_err(dev, "failed to add GPIO pin range\n");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
 	}
 
 	return 0;
@@ -1567,17 +1565,13 @@ static int chv_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		chip->irq.init_valid_mask = chv_init_irq_valid_mask;
 	} else {
 		irq_base = devm_irq_alloc_descs(dev, -1, 0, pctrl->soc->npins, NUMA_NO_NODE);
-		if (irq_base < 0) {
-			dev_err(dev, "Failed to allocate IRQ numbers\n");
-			return irq_base;
-		}
+		if (irq_base < 0)
+			return dev_err_probe(dev, irq_base, "failed to allocate IRQ numbers\n");
 	}
 
 	ret = devm_gpiochip_add_data(dev, chip, pctrl);
-	if (ret) {
-		dev_err(dev, "Failed to register gpiochip\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register gpiochip\n");
 
 	if (!need_valid_mask) {
 		for (i = 0; i < community->ngpps; i++) {
@@ -1677,10 +1671,8 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	pctrl->pctldesc.npins = pctrl->soc->npins;
 
 	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
-	if (IS_ERR(pctrl->pctldev)) {
-		dev_err(dev, "failed to register pinctrl driver\n");
-		return PTR_ERR(pctrl->pctldev);
-	}
+	if (IS_ERR(pctrl->pctldev))
+		return dev_err_probe(dev, PTR_ERR(pctrl->pctldev), "failed to register pinctrl\n");
 
 	ret = chv_gpio_probe(pctrl, irq);
 	if (ret)
-- 
2.50.1


