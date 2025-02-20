Return-Path: <linux-gpio+bounces-16315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D2A3DC53
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F900174D46
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD591FBC89;
	Thu, 20 Feb 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B65dYDVM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610835958;
	Thu, 20 Feb 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061012; cv=none; b=CX4yydRjwXRKLzSoKsRuOQvfPke04NSfsZ/3NG+R7e+QpkDZ82KWKlCavqPfFslBBgUhXgzayqVWzzHxi0nAKf/S1/4sGOYzW+/MnVBd/OmIsgFt4lgsy2ziLoPr3xjNgkhuat471EuvfQPXVOackBHlOpjwMpRTqoa0HqthfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061012; c=relaxed/simple;
	bh=oOmeDbKN6HlDBXMyw/mXw5Z8WJGf9Pl/P+tN6U5rzfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+0lkZ0SpBSfqBi+k0z4pVvDQ9mnRZ1Imm14qxQ7DT3xWHWjgunxNty2PIZCmVgRxqztm7PbtrfqfWUS4mm6Ri+42/qGN/G5FC35qtprbvK6ejSK+tGXdl0nhFf/QYCvHasuzQDimLLEgHEfj7zcbkZL72rkZj/Fdd3kFHhfv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B65dYDVM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061011; x=1771597011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oOmeDbKN6HlDBXMyw/mXw5Z8WJGf9Pl/P+tN6U5rzfc=;
  b=B65dYDVMdtXZCvQqB5nas9i2WkcU9zoBkzVJNz8EWqV2SllOuWW9Sqj3
   coa8HtKKg0m8Sr55oVbgCIKFpBBbOKv6hYuc6t5nUAdTmCvJjJ8rt/AoC
   hiJ8KVul3hrvCe0wo8qEVBz85gbUOlAoOGG+F2G9tZ5RDyB5U6H53XIW/
   9ZzuE6Id0UTOvs4cgs4osQJDE/uhyS0cEXfwB7InbZI6nqW+EOfiwi5mH
   sYCYBgZYsHQy72HVmNiS4eMIP8X3pAwWYNg25t3M4uzaQ61bTI1LBs+ld
   WXNBvCoa6UWzV+CjM6a83GVSP43d/7wGRn3MS8NLuTYL2KVCpFSX7dJMd
   Q==;
X-CSE-ConnectionGUID: /9eKSDLhQhOJWfYEuh25XQ==
X-CSE-MsgGUID: J+pTkJcjSu6I42CK+Rsjrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43673102"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="43673102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:50 -0800
X-CSE-ConnectionGUID: 2rCuDBcLQFi4vP/Uuk54Ew==
X-CSE-MsgGUID: YGFDi5iJQBO8vRmcda9PZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115956008"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2025 06:16:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5C2CC48F; Thu, 20 Feb 2025 16:16:46 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/4] devres: Add devm_is_action_added() helper
Date: Thu, 20 Feb 2025 15:44:58 +0200
Message-ID: <20250220141645.2694039-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some code we would like to know if the action in device managed resources
was added by devm_add_action() family of calls. Introduce a helper for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/devres.c         | 11 +++++++++++
 include/linux/device/devres.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 93e7779ef21e..7c2babfa9396 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -749,6 +749,17 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
 }
 EXPORT_SYMBOL_GPL(__devm_add_action);
 
+bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data)
+{
+	struct action_devres devres = {
+		.data = data,
+		.action = action,
+	};
+
+	return devres_find(dev, devm_action_release, devm_action_match, &devres);
+}
+EXPORT_SYMBOL_GPL(devm_is_action_added);
+
 /**
  * devm_remove_action_nowarn() - removes previously added custom action
  * @dev: Device that owns the action
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index 9cd1787ef28e..ae696d10faff 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -165,4 +165,6 @@ static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(
 #define devm_add_action_or_reset(dev, action, data) \
 	__devm_add_action_or_reset(dev, action, data, #action)
 
+bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data);
+
 #endif /* _DEVICE_DEVRES_H_ */
-- 
2.45.1.3035.g276e886db78b


