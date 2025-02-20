Return-Path: <linux-gpio+bounces-16314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F34A3DC57
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15DD819C024C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B8D1FAC4A;
	Thu, 20 Feb 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnZ3YCp5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FA1F150A;
	Thu, 20 Feb 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061012; cv=none; b=JkLwxieNsDS+7rO+KF45xMtdrcGxp1cVFTMbrcU5ThNTtA5XncLpcNBeQotMP5xRne9DWfzPip20a7qxIxZKhJfKarIUWwyjSXvG5KsdOYUaQuDh/WQgOTc18gdsFRpKgOV4TJKkw0SDQARiGMV27KXTvb9e3B8GpjUm52vSwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061012; c=relaxed/simple;
	bh=QbBaaoCw/NPHuhr2EOc+gN+Y9OLuszesOW/i0ccT8E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+UkSVTYk6Jx9a79ZnUhfp3FwFCz38XLL5GiVVK2W8PwEPuhNHUmsrNq1XHSrA9Yl4Vsi/UTchl9JB8zOCDQWIbEUUl3/8PqLdA5PwHGYHF7nsIS1iPhm4HNpAGSyZgS3tGiwPK/RnDVPdwTIlKPBtFpaUP8vyFhdFnIc79+0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnZ3YCp5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061010; x=1771597010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QbBaaoCw/NPHuhr2EOc+gN+Y9OLuszesOW/i0ccT8E8=;
  b=TnZ3YCp5goIIqLF/bj/Skg9yL0RylnNZOzchMFN136Yz2EHJEOsQgDod
   TRKm8I7p2kTlvv3hMMiOmnCqPGT3ZrWyrRd7/D/k1V8MPv1ogzP8a9ND0
   x1e2cHzF4FNYsON3v4Ng+SrRsrd72LERHiV8+x4DEm4fXWhvWge/JYi+x
   U14Mb3An7Fi+a2lhcao3Z0/A9NLAm52Zi4PBBTjpwP8nYAysPGX4TH8bG
   7vmFncKbx69S4tTL7jftP8neE42AH9DVCNaYQunUZh1nY1UCqFDv82eVb
   6w0bCJPdXNkz+7AXVtltzlxE0fzoZnySWfsxAjoZqLOr+5Sk2iQdO+gl3
   w==;
X-CSE-ConnectionGUID: vyt8YD84TTe8JmKfLoLrvA==
X-CSE-MsgGUID: iBTQTrthQJewx3eYfDlh4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51458089"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51458089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:49 -0800
X-CSE-ConnectionGUID: B+zEdYltQgmq1oQOwJ8P5A==
X-CSE-MsgGUID: 6x+0T9P4S7eFzXihlSIAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114883158"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2025 06:16:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 66B732D0; Thu, 20 Feb 2025 16:16:46 +0200 (EET)
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
Subject: [PATCH v1 3/4] devres: Add devm_remove_action_optional() helper
Date: Thu, 20 Feb 2025 15:44:59 +0200
Message-ID: <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>
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

Add a new helper to remove an action that was added via devm_add_action()
family of calls, but not warn in the cases where action wasn't found since
it is optional and wasn't even added.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/device/devres.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff..4daebbf7f227 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -145,6 +145,19 @@ void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
 	WARN_ON(devm_remove_action_nowarn(dev, action, data));
 }
 
+/* Same as devm_remove_action(), but doesn't WARN() if action wasn't added before */
+static inline
+void devm_remove_action_optional(struct device *dev, void (*action)(void *), void *data)
+{
+	int ret;
+
+	ret = devm_remove_action_nowarn(dev, action, data);
+	if (ret == -ENOENT)
+		return;
+
+	WARN_ON(ret);
+}
+
 void devm_release_action(struct device *dev, void (*action)(void *), void *data);
 
 int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
-- 
2.45.1.3035.g276e886db78b


