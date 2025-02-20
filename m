Return-Path: <linux-gpio+bounces-16316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E78A3DC56
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C399016940D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AE81FBEB7;
	Thu, 20 Feb 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Msq7p15t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468D1FAC48;
	Thu, 20 Feb 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061013; cv=none; b=YWJlXdMXzdLHIoNZmlDJ9u/nD6PvuCtP/yzR0CXp/zUuLvgQvh+fMzATZlEBB+0/UiYbiMpC2v4jfeWIBHTWodDZFtnC4fA0nQK9Xx/9p1d30Krg/JaoHrH/APreWjYCINghB1ugK0VKHbKMJsqsAzDziX8SvpaQfORBQ+Mt4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061013; c=relaxed/simple;
	bh=c+XYcdsx3LxbWkPk4hBwmBuO2Tum6Qs2Q8FslfASiVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ck6q3JdQCoOj966nd7hIQM+WL6lzpRf3gjxC4TYWavlAKj3Xd8dtouEOrWdJQG7IpZa76Dr5oSpaP8hzNfBiOMCNlRPw858XJz/WSvdOVsRqIVUr4rvG5810O4/hCPeuBvgYCskqquWhkTo/gKGxPlJlnIiiTj49du0ECaLOOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Msq7p15t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061012; x=1771597012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c+XYcdsx3LxbWkPk4hBwmBuO2Tum6Qs2Q8FslfASiVo=;
  b=Msq7p15t3RCR+Fo5677hrwQ1usAiDWvJE8H70RKBaTv/ZReRCoXG2WiB
   1VZ7KS1743o2Xrd59Dduyqmo3qxCDg8dMWk0Ez85Q3nH2EeMS+6/ND+pv
   yeowQ5cICdlD0Gj0bTx/J5XwMMyJD4X8pU+NnMR59Ew6L6YCaL8EYw1rS
   jEPCV0mvBeh1UTIfVVniiKI8oP/7B+QIXCD5KsWEChLFzlR3mfx5ewaMa
   hm1thYoDAgWaVDxYglxYalUavvOb4iaIDxLKklOwCBQMw81ocF/7BjXv+
   i2ujz2EWBKCSuB+XhlHvq7kVybNRNsB4lU8v36LanxHTVwRIT5FdpMBEv
   A==;
X-CSE-ConnectionGUID: QIEiHvzqRl6yNrXjdZqpkQ==
X-CSE-MsgGUID: Ui7GJLR3QZyInyK1uS6F5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51458100"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51458100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:49 -0800
X-CSE-ConnectionGUID: +++IxEV5Rr6njTpQJL1C/g==
X-CSE-MsgGUID: a2S1XeIuT/GfcPa4R/jKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114883159"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2025 06:16:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 45CD673; Thu, 20 Feb 2025 16:16:46 +0200 (EET)
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
Subject: [PATCH v1 1/4] devres: Move devm_*_action*() APIs to devres.h
Date: Thu, 20 Feb 2025 15:44:57 +0200
Message-ID: <20250220141645.2694039-2-andriy.shevchenko@linux.intel.com>
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

We have a newly created header linux/device/devres.h that gathers
device managed APIs, so users won't need to include entire device.h
for only these ones. Move devm_*_action*() APIs to devres.h as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/device.h        | 38 ----------------------------------
 include/linux/device/devres.h | 39 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 78ca7fd0e625..d6341a05e4fb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -281,44 +281,6 @@ int __must_check device_create_bin_file(struct device *dev,
 void device_remove_bin_file(struct device *dev,
 			    const struct bin_attribute *attr);
 
-/* allows to add/remove a custom action to devres stack */
-int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
-
-/**
- * devm_remove_action() - removes previously added custom action
- * @dev: Device that owns the action
- * @action: Function implementing the action
- * @data: Pointer to data passed to @action implementation
- *
- * Removes instance of @action previously added by devm_add_action().
- * Both action and data should match one of the existing entries.
- */
-static inline
-void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
-{
-	WARN_ON(devm_remove_action_nowarn(dev, action, data));
-}
-
-void devm_release_action(struct device *dev, void (*action)(void *), void *data);
-
-int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
-#define devm_add_action(dev, action, data) \
-	__devm_add_action(dev, action, data, #action)
-
-static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(void *),
-					     void *data, const char *name)
-{
-	int ret;
-
-	ret = __devm_add_action(dev, action, data, name);
-	if (ret)
-		action(data);
-
-	return ret;
-}
-#define devm_add_action_or_reset(dev, action, data) \
-	__devm_add_action_or_reset(dev, action, data, #action)
-
 /**
  * devm_alloc_percpu - Resource-managed alloc_percpu
  * @dev: Device to allocate per-cpu memory for
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index 9b49f9915850..9cd1787ef28e 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -8,6 +8,7 @@
 #include <linux/overflow.h>
 #include <linux/stdarg.h>
 #include <linux/types.h>
+#include <asm/bug.h>
 
 struct device;
 struct device_node;
@@ -126,4 +127,42 @@ void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int in
 
 #endif
 
+/* allows to add/remove a custom action to devres stack */
+int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
+
+/**
+ * devm_remove_action() - removes previously added custom action
+ * @dev: Device that owns the action
+ * @action: Function implementing the action
+ * @data: Pointer to data passed to @action implementation
+ *
+ * Removes instance of @action previously added by devm_add_action().
+ * Both action and data should match one of the existing entries.
+ */
+static inline
+void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
+{
+	WARN_ON(devm_remove_action_nowarn(dev, action, data));
+}
+
+void devm_release_action(struct device *dev, void (*action)(void *), void *data);
+
+int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
+#define devm_add_action(dev, action, data) \
+	__devm_add_action(dev, action, data, #action)
+
+static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(void *),
+					     void *data, const char *name)
+{
+	int ret;
+
+	ret = __devm_add_action(dev, action, data, name);
+	if (ret)
+		action(data);
+
+	return ret;
+}
+#define devm_add_action_or_reset(dev, action, data) \
+	__devm_add_action_or_reset(dev, action, data, #action)
+
 #endif /* _DEVICE_DEVRES_H_ */
-- 
2.45.1.3035.g276e886db78b


