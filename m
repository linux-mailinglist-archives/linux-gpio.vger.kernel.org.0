Return-Path: <linux-gpio+bounces-9888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A4696F32E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DECB71F249D3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B7C1CB338;
	Fri,  6 Sep 2024 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjnAdVnk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8961C9EC7;
	Fri,  6 Sep 2024 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622640; cv=none; b=GahiPnYgLTGXIrBbdhyUVmkjiDwYweN/mlrahzhHwpcAwbyJ0EDNijWxDXr1W3to1BADNLb4z0zV23WafFKWw8OcpGDCZ1N6D8gf/a8b06zn7syW5NJENS3vfucaWskjE+u3teG9a/o8jxT0HXT42W2kxR3D9exLJ23gj2esTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622640; c=relaxed/simple;
	bh=uaDYEPRdS1ji4vdHJOFP5PfaRlGOOrp6sfKVd6dO4is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yx/IYRo+phL/yv9Sg4m+/ng+G0rSY/DDf5pNXmkuci90dLc6fKfUZc3EamvL+1LAU4Q/q3olBD0VljDkn804vgXF30uab/wj6nc7HptF0uP0pFFlL3AmvVUFbu7ZAFVKOk6pqq59XAz7vLRftQcXHNAT0+I9aRnhPoyFdUpUFS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjnAdVnk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725622637; x=1757158637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uaDYEPRdS1ji4vdHJOFP5PfaRlGOOrp6sfKVd6dO4is=;
  b=TjnAdVnkisCNw4J63fFyQ0OomgSqWaq9/R7fRBACCAkVm3R+5HKvEcG6
   YBqVXNPyJpTHDcvG0L8BWkSXJRyot2uygfMuROtg/j3OmeI/782l7nF9w
   T/Lh1JjsWFQzX2lrr/SnyLsgFXpuQfLSlfipXbLW8Gl3CbqCzl+5DQFoP
   zN3AHjVag+VLzYkQVo7I8UKGt5/9o9xmuschiuiDg43f+ovJhw4JISsp5
   DgOm5/z6nlu6R0xDoHT8/5/DQGg+RjS1CjfKOg+3JjfVaiyH8ZBGHgP6d
   bg3JgCQ3CHW1I/LAX0XjXvPcTyiuk+2p4QkTzdcxaooLW+Ex724PU6nTy
   A==;
X-CSE-ConnectionGUID: x50wic7mQw2ZHW0roj5nNQ==
X-CSE-MsgGUID: jb3eKrCRSUSkFtmgj8ucMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34952537"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="34952537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:37:17 -0700
X-CSE-ConnectionGUID: 2KaGta+kR0GfiHaxN3uANg==
X-CSE-MsgGUID: YSNQ1aoQQga+d9IbMnJsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70729675"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2024 04:37:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 500FF1BE; Fri, 06 Sep 2024 14:37:14 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 2/3] pinctrl: baytrail: Replace ifdeffery by pm_sleep_ptr() macro
Date: Fri,  6 Sep 2024 14:36:07 +0300
Message-ID: <20240906113710.467716-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
References: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicit ifdeffery is ugly and theoretically might be not synchronised
with the rest of functions that are assigned via pm_sleep_ptr() macro.
Replace ifdeffery by pm_sleep_ptr() macro to improve this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4533c4d0a9e7..44a77ec1c8ed 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1514,13 +1514,6 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 	gc->parent	= vg->dev;
 	gc->ngpio	= vg->soc->npins;
 
-#ifdef CONFIG_PM_SLEEP
-	vg->context.pads = devm_kcalloc(vg->dev, gc->ngpio, sizeof(*vg->context.pads),
-					GFP_KERNEL);
-	if (!vg->context.pads)
-		return -ENOMEM;
-#endif
-
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
@@ -1581,6 +1574,16 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
 	{ }
 };
 
+static int byt_pinctrl_pm_init(struct intel_pinctrl *vg)
+{
+	vg->context.pads = devm_kcalloc(vg->dev, vg->soc->npins,
+					sizeof(*vg->context.pads), GFP_KERNEL);
+	if (!vg->context.pads)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int byt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data;
@@ -1603,6 +1606,10 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = intel_pinctrl_context_alloc(vg, byt_pinctrl_pm_init);
+	if (ret)
+		return ret;
+
 	vg->pctldesc		= byt_pinctrl_desc;
 	vg->pctldesc.name	= dev_name(dev);
 	vg->pctldesc.pins	= vg->soc->pins;
-- 
2.43.0.rc1.1336.g36b5255a03ac


