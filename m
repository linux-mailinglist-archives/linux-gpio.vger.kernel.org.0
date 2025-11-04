Return-Path: <linux-gpio+bounces-28027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5DC31AE6
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9023D18C044E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EB8333432;
	Tue,  4 Nov 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIKQBVmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA932E73E;
	Tue,  4 Nov 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268303; cv=none; b=kcttjZEUbEO5J9XeLWNOgYE00F+MBTzVnsy7w5FXnPr8+dI2/xoLCWU5rUricRhJR2gc6Uko6blp6urZa2joANiKDKiOs2IF+60mGmmeQPnrVruk9hP40ad0+JVGY8k7tRLKzhS9EpfvBVd+9KEBSFPbsNUP8KMOpS7qwX3jLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268303; c=relaxed/simple;
	bh=6zn4YoCVfRUVlCJYhU3G3MElINw4jana7yUXBkEBYbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZb3i2fmQ75XLRItsLKNvuMOKb7KIQOo9bgpQM8BTLvy9tg36heFUg7pP4S/P/bFZZCIpUxuYRMxLAcGfGcMnT9a60sSrBZl50s2wvI6oWLdTw3hsjTePzQFP2zOVwRuObXgCm0+1ndJot6xz7Gf5zzcsvFeVMmvbZ2Rb7BQLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIKQBVmu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268300; x=1793804300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zn4YoCVfRUVlCJYhU3G3MElINw4jana7yUXBkEBYbw=;
  b=KIKQBVmur14uGE7tPWdXky0fkjnDZDpNJqCW2J+dqGxVxycZ9OYS9j4s
   NyBjYZGGELWX7PganOFQoCA0bFKHZ0avxlkEQtbqgAXLPEBQXvKf09quB
   ajxgwedvUtUZbI1QeNEy/nfiQcVnvbnEeEjva92M1Xyv5GpVxTLXa1CgX
   Hoj8Q4FGPKYkgGpQJXZNuSmtcfTwJp1wWRLaPFlfW2el9LMSgJGqazpQg
   nFdj/d9uOP46jmyNT8prhgiULh95DBNImGER3qyO19BMZzwKer763n3yX
   qz6RwV/v/yTRxkC0SCpch0/nGRMvO4/VR2vDyQPnrsnS1sfrGrm4nynYh
   Q==;
X-CSE-ConnectionGUID: Mjes35bHR7mVlqCXp+oPDA==
X-CSE-MsgGUID: ZamCvIOSQpmGHjB6Pj5R2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86992435"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="86992435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:19 -0800
X-CSE-ConnectionGUID: ydLwhcuYTomr5KdDFr69tA==
X-CSE-MsgGUID: z5Do80aKQYiGeFhyJDdSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186855537"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2025 06:58:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CC47D96; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 01/10] pinctrl: intel: Introduce INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:35 +0100
Message-ID: <20251104145814.1018867-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new macro will be used for the further refactoring of the drivers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 4d4e1257afdf..654af5977603 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -76,6 +76,15 @@ enum {
 	INTEL_GPIO_BASE_MATCH	= 0,
 };
 
+/* Initialise struct intel_padgroup */
+#define INTEL_GPP(r, s, e, g)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+		.gpio_base = (g),			\
+	}
+
 /**
  * struct intel_community - Intel pin community description
  * @barno: MMIO BAR number where registers for this community reside
-- 
2.50.1


