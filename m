Return-Path: <linux-gpio+bounces-15262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CCA25A89
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBA918874CE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C38205504;
	Mon,  3 Feb 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoEqkTVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6287204F63;
	Mon,  3 Feb 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588514; cv=none; b=c2SAtGutfKX2L37lRdN6eVE7epZfa72fV4Nzo7b13OV/qMXNyyb7dtYg57zIy7hOPffLlg2myHHfD6hQCnkUldsiAt8654N8gI7Z7ikPIM72x/Jg/0jWMTY8zjpiCJouqm7EWrXmoqPByToX4w7S8LLKN7k5knbMvnBTnKVJW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588514; c=relaxed/simple;
	bh=gXwz5Ujw6IWP5uaIKaqjpo3prwTqc/XmNMiFvq5Esi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3f9V5iHrqOBFlj67Ll/NnumCPXxU3elGoq0cXjkVnf8JOeCbFHlspOKwaOHKb+0cCBhE+IEcvub6A4JwvTAPf63bERzT/X8QpQ+5hlFtz2KRZRoVfMdP+0wyI1XIPgZE33XnDsqb2oOahL9F7UAVRg+RfIYEHMllLPNTvrZ5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoEqkTVm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588513; x=1770124513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXwz5Ujw6IWP5uaIKaqjpo3prwTqc/XmNMiFvq5Esi8=;
  b=HoEqkTVm7WCcdiTZbLwzNjTcLRndL2BXhXXZaeezBwJLUGBF40nGkY7+
   +LL7xgO0LBrYHEjlwtOfVRT3GmV8RUJrDL9zX43IX3sJlEJKiTaZnlrHI
   V8csFdmV8fnAvR9OgJTLSP3A1wMnxKoOXHq+4LX0HwWmI2ho2XxAemWJj
   0xjTWl3v2yfM9WkU8WB95U4MBqD2WQ1GMJTY7kUIunGYnhfJglkVMerNA
   QBZSpRYKPTbyp8coAvyELHlHMBcbhqMiB2DETm/Yuy30kQjhDT9yqZid3
   x3KjwFqi5WNGFrYqKWi97puna7gfYa2/awSVMKv1SZeERPHQWEoXIGxjh
   w==;
X-CSE-ConnectionGUID: 2OFxr12/QyimnIzpVi3Fvg==
X-CSE-MsgGUID: zV0g/XRrRBq3vlwp65wdrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615947"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615947"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:10 -0800
X-CSE-ConnectionGUID: AEK6G9XaRTST1hQWO6A4hA==
X-CSE-MsgGUID: 2ewiZXqGTvS8wgdLUOUOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854190"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BFB5F353; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 03/14] pinctrl: cy8c95x0: Enable regmap locking for debug
Date: Mon,  3 Feb 2025 15:10:29 +0200
Message-ID: <20250203131506.3318201-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When regmap locking is disabled, debugfs is also disabled.
Enable locking for debug when CONFIG_DEBUG_PINCTRL is set.

Fixes: f71aba339a66 ("pinctrl: cy8c95x0: Use single I2C lock")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 192a37c28a1d..0bcecebb1c0c 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -470,7 +470,11 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 	.max_register = 0,		/* Updated at runtime */
 	.num_reg_defaults_raw = 0,	/* Updated at runtime */
 	.use_single_read = true,	/* Workaround for regcache bug */
+#if IS_ENABLED(CONFIG_DEBUG_PINCTRL)
+	.disable_locking = false,
+#else
 	.disable_locking = true,
+#endif
 };
 
 static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
-- 
2.43.0.rc1.1336.g36b5255a03ac


