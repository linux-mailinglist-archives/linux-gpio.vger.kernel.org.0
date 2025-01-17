Return-Path: <linux-gpio+bounces-14905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE8A151C3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07160188D91D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D6919EED2;
	Fri, 17 Jan 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeWZhI37"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E919CC0C;
	Fri, 17 Jan 2025 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123800; cv=none; b=kWw4M+uL9GpW6Whplu4HfkkLbIIz+mE+lJ+K8jOhysdkJsSeU6KQcZUT9qrkKxrYYXfyBftrkbyMcsuVkHBzQR0cxQZAtTy18m/C6QAJoxqlwjSBppvxMYRKMxDkjWgg6Ap9ZVj/hYBveuVPxO5ALQKzpBSYmXplj5tBb88e/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123800; c=relaxed/simple;
	bh=iimgZOs9g8vQE0CqP6Y63dqla7aGMw++DUMSU6qigeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2xNXnCLS9zLwPfTjdfNMRLtxgx2SzE1YlUi+AxqRSh0Te0OKpOK3sH0LTCJtDofRJeLpUC6I5yLmeYaKlCFy6wZMvO78PhiwIz8T55oPXaElyst0nCTO6Lp/e9jEzxAUDc7p5nQQaFyYIh29Ql4rZ0Hs0qCJBLHsoN3huZC3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeWZhI37; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123799; x=1768659799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iimgZOs9g8vQE0CqP6Y63dqla7aGMw++DUMSU6qigeQ=;
  b=LeWZhI37w1SRxUSTlU8AxN1G7UBp8wP1/DxNrCv8myS7efWzw6c8sjXa
   uDnv60QeObTs5rruuJMk3nsPGiE7pVNJiJo5kLIygvr0AN9TvJnxrMk+T
   8uUdpPJDMMfUv4AzwaZHJ40VdaGDZ72x+/R9VYVyrPFIg0KOhfgIm371q
   BnR8vGNnVvX7zJSfpnMGnL9QI71rjlpXBeHcO+NZHdx2NZCXSRfHB+2iX
   fRgQj3W/IXOMAOlsdGtRoEgN9653jkBiFCEkwr9+vEw93iIjfk1FPoo63
   47a8m1W2CsId1oqeJtpPInYiutzBtQFoxNyXD8ZzZH+xPX5DQsKOQ8dhQ
   g==;
X-CSE-ConnectionGUID: ay836z5XRX+5GIgI205gag==
X-CSE-MsgGUID: tQtdK6s6R1KP2G8sTGo6Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792856"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:14 -0800
X-CSE-ConnectionGUID: XyNwdmJgRJ20wPIbCprzyg==
X-CSE-MsgGUID: 62kDm0XmRw60sQ2LzYaJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671235"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DE224725; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 16/16] pinctrl: cy8c95x0: Fix comment style
Date: Fri, 17 Jan 2025 16:22:00 +0200
Message-ID: <20250117142304.596106-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One comment style is not aligned with the rest. Fix that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 6ee21e697e43..b0e3d675dc8d 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -501,7 +501,8 @@ static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
 	if (ret < 0)
 		return ret;
 
-	/* Mimic what hardware does and update the cache when a WC bit is written.
+	/*
+	 * Mimic what hardware does and update the cache when a WC bit is written.
 	 * Allows to mark the registers as non-volatile and reduces I/O cycles.
 	 */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


