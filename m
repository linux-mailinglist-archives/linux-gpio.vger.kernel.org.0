Return-Path: <linux-gpio+bounces-15374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5451A28708
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32C227A5814
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453C722AE75;
	Wed,  5 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3m9adId"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99022ACE3;
	Wed,  5 Feb 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749175; cv=none; b=Kc3sPRPtF4LdY/YBXbDVlPIOtBCu9BwzG/RXI3WXrm18Dggt7JchzL0yWZUTzfkPEIyWaG36IMgfFtv3cBJcakkr1KyaDQvZXEWAoh8Yd7KXEIVw2RBRET2BeXWqK9ygVxRLhROESS9I4MTJfIgDDHGnzHPCKddgbBjBNsgR9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749175; c=relaxed/simple;
	bh=tjMPrFtH7wAH3bi/jk/qnEWeqMAYZF1oQcUmi9I02uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGx5KJz4Cq0PZ4k7w6qqgdMjF0XfMh2PB60pDHTNf0+RJ1n0kR3ceRb+606MJfwQ2slzpNCNZ69INjBqXKRKv2TAnuZzgzkjd750ArueGSnzsjdMfc8nsosO9rdPfYOaxRFANStAYmGblBo+S+yokxdTN3tDAgb7wj9R8pKthUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3m9adId; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749173; x=1770285173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tjMPrFtH7wAH3bi/jk/qnEWeqMAYZF1oQcUmi9I02uY=;
  b=C3m9adId2/OezR5maT6j25HUkqjcWiX7mTP+wovsNeFw5gzjIIVW1jJk
   97+fUDFdr+ILkx1N7m2uIVZwg6u5q7B+sbcWiiELn8/5jwde2NXZRSchF
   mkXzWnZQLotOXDwYxQmzXXpVejTnYIaceymMKDCzeySmj5y9Bh26biguA
   zNaJ+1P06tClAZuGkCiQn88A1kyqXVECjfkd/szfdv9IWKMci5iCj/eYq
   iB1IMA9W09sD5gP5cQvJ15z1gVeVShQPqKHtxYS8VvAIWF5rVgzIvYpNU
   LrGMTsmxAIRXr6XcxR60B65lS/L5J+Cx+8dn2M8Z5rvqEuvAbbAbq1x8g
   A==;
X-CSE-ConnectionGUID: AxPj/AXeSYiCXzWFuxSuhg==
X-CSE-MsgGUID: HtE3jka1RE2GvZIhcZuScA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38512598"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38512598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:51 -0800
X-CSE-ConnectionGUID: W9cvhKs+Q42i2OlXuczLWA==
X-CSE-MsgGUID: T/wLfKomTweK+R20HFF3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141744571"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 01:52:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 09090627; Wed, 05 Feb 2025 11:52:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 09/10] pinctrl: cy8c95x0: Separate EEPROM related register definitios
Date: Wed,  5 Feb 2025 11:51:19 +0200
Message-ID: <20250205095243.512292-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
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
index 4b683401cae1..6a2c7343bf55 100644
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


