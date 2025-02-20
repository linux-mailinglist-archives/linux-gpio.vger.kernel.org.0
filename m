Return-Path: <linux-gpio+bounces-16332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6F8A3E0AA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA683AA70E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5ED20C473;
	Thu, 20 Feb 2025 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK/GNOqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33644200BA8;
	Thu, 20 Feb 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068570; cv=none; b=Xe1TdgnQ2qGjH7cb9FjDa2mRTEypzBlsEYPigpDz0UwJxh7S1EEpgts/hY5C7p8jVzfcNtTLz1NWNfDjtV4aV+JIKeXnv3GRaWAtRhWNxGEU4FPz8LtRgP51Nev0fUhTRlsciIXcWiWuS39fwLRSkjMySkT4pP0cQ9Cv+PK0wKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068570; c=relaxed/simple;
	bh=qQsvhWzqOhysU7Uf/PP6cJwy1gFVpMq/YUkgWUdWhTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emRffNKwmjf314OqtnXaYZci7pRD6Vu7kXK4H/v55HdPw6UFnRNXIHBn6J3yMeFi969OnB5K05RjUXWNb9bYgRfD86sfuDK6LxyAjI74vGLXPwIhLVA2iB9h0tDNImXBwwCcPdcyhs+hYtWzwGZ+zN8WyYhIG7xORiOn3DFlWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK/GNOqx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068568; x=1771604568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQsvhWzqOhysU7Uf/PP6cJwy1gFVpMq/YUkgWUdWhTI=;
  b=BK/GNOqxYxABWT3eeAtCr0SidLtBVJFS9AsGywl9t/WPEkt7LiJdWyJ+
   jBn1hRO+MKYFko3lP8Fbeg/8oJ548AE+Lv7SYdhwiXwFU2+lLDm/jwojk
   WJv+LjqyjtdpGSb9lmK7XwtftHFumyPOy9/GcITz6VM/8tZ64iTO6o6mr
   LjBgbKWQ+FBn6lCEXadmHiYUonSY/5zvOIVG3haXmOD/FqXp7+kXYS6r8
   WcNGk7TL3eVvTVWQkgQ4+xpdrWwCooWQ4s8AclkpWl3vOc3i8Re5VDD+o
   PCHFL1lQRsWT8i2xc63nEO6DIIYrPgP48QSLXEGqoXC2T6eN6oXHwSGTS
   A==;
X-CSE-ConnectionGUID: 5/be5t2qTDCHFxnflY0V7Q==
X-CSE-MsgGUID: d8KXYOwGSayijIjqcIv/5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40043959"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40043959"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:22:45 -0800
X-CSE-ConnectionGUID: isacXEzqTGS4092MUstTMw==
X-CSE-MsgGUID: XTTGValZQnSLYLAIKlV6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="119702561"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2025 08:22:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CA7454DF; Thu, 20 Feb 2025 18:22:40 +0200 (EET)
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
Subject: [PATCH v2 2/3] devres: Add devm_is_action_added() helper
Date: Thu, 20 Feb 2025 18:20:27 +0200
Message-ID: <20250220162238.2738038-3-andriy.shevchenko@linux.intel.com>
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

In some code we would like to know if the action in device managed resources
was added by devm_add_action() family of calls. Introduce a helper for that.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
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


