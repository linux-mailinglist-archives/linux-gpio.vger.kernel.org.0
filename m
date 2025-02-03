Return-Path: <linux-gpio+bounces-15272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A6A25A96
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FF447A1201
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5262066CB;
	Mon,  3 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxH/TW3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256F205E02;
	Mon,  3 Feb 2025 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588518; cv=none; b=JJLlOIopAvwNc23B026tO8RyUHQpH5XmF+kmtiXjKreeRvIytlm65lB9YzA/HiGbtaaeCR+Ijg+CikXiwt2BixzYOIMetB4uv3DMOZjecBZuUp5f1AmUiAaVkaNI1f3CvFFdSmcHdYlx5nfiTlf8c6X/MGIgUYY5QXjVVZVEti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588518; c=relaxed/simple;
	bh=LUJpClbX7oMeUIh098wHjPAs78Ycm8E1WEHScS2ZJfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx0Yz9XnK94NXyE6gPP87xtYIQ/HJlujiYCnyCGZKPEorKsJiklJTBcnUnqD6ElQuzYIFUoI0zzRRKM8pS/vVEz6IOo9eSlI0/VCTP3ibCOkDhibMIRZfJZNmiZAavf8RWwNUYBBORtMTluVAWQLfHVOy1K/DprWklV4neq++HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxH/TW3p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588516; x=1770124516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LUJpClbX7oMeUIh098wHjPAs78Ycm8E1WEHScS2ZJfM=;
  b=QxH/TW3pOThWLmFIqipjUtooVb6kfBhtYjFFWpwLhT4Q24o45DJ3uuQo
   LM4hTRQ51KX8WFvnh4HnHLmqRCa8QedT4+HlFajo75QXDrBFLjL++wejb
   GsOuza3VZG0UOqM4zINoo0T6lWaSEVADZKCTeYCaJxtpwtIY12ML+ZL5g
   Xl2c8nwRmGaAYomKtXII6Iqejzm3svym6dzsdzW6mB1lZXQSu7VPZkZbh
   tXocRBnmMKDnHsecEkHb8eVtXTee5LvI7Hs2UU+12LAeH3LOvDilmUYHa
   H4vw/Asps8Zxpzm5hiWggQjw2c9ZF3STrmDGr6EINFpzH/nzu4H6HskmR
   w==;
X-CSE-ConnectionGUID: +g8Jy1sdSlWUb2n4DX4oWg==
X-CSE-MsgGUID: zWrEatxaSVSG3Co6JlLvqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39217695"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39217695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:13 -0800
X-CSE-ConnectionGUID: M8cdY6WARtKAza77qY8N3A==
X-CSE-MsgGUID: ggyzJbBtSy6Jy8DKAdIE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115287404"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 05:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3509F63F; Mon, 03 Feb 2025 15:15:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 13/14] pinctrl: cy8c95x0: Separate EEPROM related register definitios
Date: Mon,  3 Feb 2025 15:10:39 +0200
Message-ID: <20250203131506.3318201-14-andriy.shevchenko@linux.intel.com>
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

Currently it's not easy to see at a glance the group of the registers
that are per port. Add a blank line and a comment to make it better.

Also add a missing definition for one of the EEPROM related registers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 28374490d47d..f03775341b60 100644
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


