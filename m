Return-Path: <linux-gpio+bounces-30482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B7D185EA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C643038395
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4E138A724;
	Tue, 13 Jan 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqzXszSc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872B36C0D0;
	Tue, 13 Jan 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302723; cv=none; b=rj6RaGTqqviuV5imokBmFjkEU//jamjgymHBsFrfCqh28ApeS1QeBaYrNx8YWxEmkJWI3xXkYhj1L2WpAqhsLpekl+HPSol8mkHQLOQncDcnMNycI+FPeVKvFUIyXQn1omtbgEdCqzkJAbw+YxADKyFv5Zx5zNqWfqPIjWaYysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302723; c=relaxed/simple;
	bh=u4Rdy1iND+SQoEj1+HDPkD77EJiwR+s8++mQkv1dSNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i04stNv+JsSysI6zShDegFcuT0pEU6S5KPLmiuOVkGD8gu6lA2PsD/I/wSEF+zA+wo8a0/mHFgh7/Fskkrvs2Ask14utrm5nPTyooDAZSYtqzWvEoiWQVyZNce31wBfKt7lwhDmbWUFVgVcXkGuKhEOFZFhl/2IbvIhBpy+P8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqzXszSc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302723; x=1799838723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u4Rdy1iND+SQoEj1+HDPkD77EJiwR+s8++mQkv1dSNU=;
  b=HqzXszSceUPrCr0A7dEBMYenv+gE9sXPOqqv0Vm57ydGHCsWRiaAFZd/
   Om5RwKGgXi7tdoPxhJiznCxKU0KnhKxc84u9xAGMKwtVc7gCyftnk8hJm
   0IJcNBE8EnUaAm/oWEACXbpGnpN67L79YMaQamHCb3uvG9a2SVvHXfHCc
   okLBLcsWJ23wxOUS5zkKgA+JC0a4SLzxJ3ZpzSBt6xXhTLy/ubxBXLcPm
   D4ryY2IlXopo+qZhQ14H/oh8TqmAJoAg34ZADwAe1xxhQ7tllvhJxonyC
   p7qceUErxrS4Nw0LFHCSbV0zm0YeA/wNdLF1/4c1Tr5E3cu9haQwTl9dW
   w==;
X-CSE-ConnectionGUID: 8C5QaQC3QcaR1nmx7av+vw==
X-CSE-MsgGUID: 39F0aGktT6Kb5FO91EnFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69317380"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69317380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:00 -0800
X-CSE-ConnectionGUID: dRu10CMoS12B6YwIt1D/bg==
X-CSE-MsgGUID: /U//8FbgQL26fWlvsJCNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204965217"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 03:11:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3E56B9B; Tue, 13 Jan 2026 12:11:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v2 2/3] gpio: pca9570: Don't use "proxy" headers
Date: Tue, 13 Jan 2026 12:10:53 +0100
Message-ID: <20260113111156.188051-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
References: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca9570.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index eae35135c71e..a41837f1201b 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -9,11 +9,15 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/bits.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 #define SLG7XL45106_GPO_REG	0xDB
 
-- 
2.50.1


