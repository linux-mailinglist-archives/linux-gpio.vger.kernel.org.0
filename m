Return-Path: <linux-gpio+bounces-14904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 628DFA151BF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90AF7165DDE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1707519D8A7;
	Fri, 17 Jan 2025 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2P2Kup/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223C1991C9;
	Fri, 17 Jan 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123799; cv=none; b=TtcUudNz167E6AI0vg3kOgE+LIagMaLJrjp27OJOuv98tcV4Zv7JhonaGumIvcO/XUN7lhtDYDJf6OWtRANONtIyW+2Iq+G8ijUqUij8y2c3K6hodXLoVrB0794jEbVXiwRBMJ10F+xGvWOp0S/7IawYChSqDd2XpPlUZHJDmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123799; c=relaxed/simple;
	bh=f8CwypOp6E8FOo/N4TKE2gkTwdmXgrBiIFIA5RkH6pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMAtGlBQQ8xDB3WgA3ed2rHp243dvx+PnSP+ye6VZYxqjBW1FrKXxrG2tHL/2mBDc4LA9M1uwhsMDV/GEMvj7SNKl8l00cbrq6q6wX0RuF3LaHpWgIqkA4PXGthweSDBX/gLZbLOZ2cmGi3Q1q3IHcQmifwy8sITPfi+m2Fpgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2P2Kup/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123798; x=1768659798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f8CwypOp6E8FOo/N4TKE2gkTwdmXgrBiIFIA5RkH6pM=;
  b=C2P2Kup/+45Qm0RUJdJG90wsj0/1p5TXo/4uN4w7ov5ZbCr2jnPZVCKX
   jUiM9c5VI72HQjuCAim7JWxOI9q22rO6fQy5TJOuc9ImYooEaFDdGVZCg
   bdtvnME57uItJd2fl/jBNchCiHPLt4kpjIFCjlhrRKmh42C7tDDb7UXiL
   Q5P2eqwk1aSoGb1wbKbl3K1m5Y8B1WUJVJRy23HEK15mGBG4iQ0eOFPkH
   sVa2pUnUNEhKY/Naay0TIG1wPZpqoc/YGFJvXzH5FBmw36Pk2JVCbIKRU
   voGS9mlesbotfMwnc1ibfCnpsUzqtpAR1eFwD8sNeonpTG+uAlPsR5QdW
   w==;
X-CSE-ConnectionGUID: 4T9zqStLSFqFp/16K7yzZQ==
X-CSE-MsgGUID: yohGFqpYQBCrREPbpDk93Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792853"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:13 -0800
X-CSE-ConnectionGUID: bV4EFPE7Rbqrxtzq9JOFnQ==
X-CSE-MsgGUID: 4TmMcRndTDKD18OJfiVYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671234"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D6B756F4; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 15/16] pinctrl: cy8c95x0: Separate EEPROM related register definitios
Date: Fri, 17 Jan 2025 16:21:59 +0200
Message-ID: <20250117142304.596106-16-andriy.shevchenko@linux.intel.com>
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

Currently it's not easy to see at a glance the group of the registers
that are per port. Add a blank line and a comment to make it better.

Also add a missing definition for one of the EEPROM related registers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 7f7bc374c2fc..6ee21e697e43 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -40,6 +40,7 @@
 
 /* Port Select configures the port */
 #define CY8C95X0_PORTSEL	0x18
+
 /* Port settings, write PORTSEL first */
 #define CY8C95X0_INTMASK	0x19
 #define CY8C95X0_SELPWM		0x1A
@@ -53,6 +54,9 @@
 #define CY8C95X0_DRV_PP_FAST	0x21
 #define CY8C95X0_DRV_PP_SLOW	0x22
 #define CY8C95X0_DRV_HIZ	0x23
+
+/* Internal device configuration */
+#define CY8C95X0_ENABLE_WDE	0x2D
 #define CY8C95X0_DEVID		0x2E
 #define CY8C95X0_WATCHDOG	0x2F
 #define CY8C95X0_COMMAND	0x30
-- 
2.43.0.rc1.1336.g36b5255a03ac


