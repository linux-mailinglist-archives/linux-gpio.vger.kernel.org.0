Return-Path: <linux-gpio+bounces-16330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A5A3E084
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B89817C737
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CBD1FBC82;
	Thu, 20 Feb 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUAVfbZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD41F1521;
	Thu, 20 Feb 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068567; cv=none; b=CsbEEBO04gCVScZ06aFHV7K7N3H9gMemU2KYp391jtDmR3t525CJbMKcMCYrvx+As1NVuxCW0ONxx+wYC7umOagkxBGS/vQrCH2fwGI6EWQvDhc5GzwDQbMjQfWeS/XCYEqRyymcZo5H5LxOfCyCe46Vdfr3DOWf6QLe5Wi1LpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068567; c=relaxed/simple;
	bh=40WcB3T/cbBplqV258++oEsPJzCCXyLpojIXfcnEbPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdlrCG0+HDmSP+RxYGyv9uFJD1bIyaoYqqQRQXfLNFAVOEUuJRPTX3i3hEGmkiBs7Rn3j5hy2D0a/AHyP3kyaN5yipF3mffGs+Rzt5T+zjoO0JwdIwd65SVXgub6vvSgLsoF9C8hz3b1Os/8mCVaocZgoyWDLh5pv9G4IDxhuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUAVfbZ0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068566; x=1771604566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=40WcB3T/cbBplqV258++oEsPJzCCXyLpojIXfcnEbPU=;
  b=AUAVfbZ05715RNuaApXwLM1uZNlBmjmO7zfxRbYtNol0BNyleUPGJjPQ
   zzPcd6VAGY4fR25plZLpFu7Mu+RAzztgCOc1i79/Jwl6hxKcdN/S4gytm
   Y6Ej432rdo5HNUGhSLdA51MkErIfXLz/XRwzB9X4+0AYV2IKpseqPqs9o
   GaGOQCTKEqii8V/BQdZVAIXQj55isGGGo257atbLHHKtsJWb+yN2+Dck/
   drQb8yZ3kWo8x2QthN7viRQJr0Oyy/uK3eGqDZUCIo4egbmKRgor1T2sq
   0pEXRkJv98W6whTDl4a19Pzpty9dgKFGrn/2Eeo225O849eBB3Th1cYvn
   w==;
X-CSE-ConnectionGUID: 7ZdO1wzNT+SMeSOJ6obTTA==
X-CSE-MsgGUID: bjUjuANjQeGlxbFrA2BDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40043963"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40043963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:22:45 -0800
X-CSE-ConnectionGUID: TVnp2ZHKSO+ficYxx8smDg==
X-CSE-MsgGUID: hTh7mBYNQaq/XsqDi7nMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115061332"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 08:22:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BA9DF123; Thu, 20 Feb 2025 18:22:40 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/3] devres: Move devm_*_action*() APIs to devres.h
Date: Thu, 20 Feb 2025 18:20:26 +0200
Message-ID: <20250220162238.2738038-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
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


