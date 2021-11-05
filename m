Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E679446376
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhKEMp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:28683 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232628AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231734429"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="231734429"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="579644106"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2021 05:42:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1BE5C11E; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 02/19] lib/string_helpers: Introduce managed variant of kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:25 +0200
Message-Id: <20211105124242.27288-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some of the users want to have easy way to allocate array of strings
that will be automatically cleaned when associated device is gone.

Introduce managed variant of kasprintf_strarray() for such use cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_helpers.h |  3 +++
 lib/string_helpers.c           | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index f67a94013c87..7a22921c9db7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -7,6 +7,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
+struct device;
 struct file;
 struct task_struct;
 
@@ -103,4 +104,6 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
+
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 9758997c465e..90f9f1b7afec 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -10,6 +10,7 @@
 #include <linux/math64.h>
 #include <linux/export.h>
 #include <linux/ctype.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
 #include <linux/limits.h>
@@ -730,6 +731,36 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
+struct strarray {
+	char **array;
+	size_t n;
+};
+
+static void devm_kfree_strarray(struct device *dev, void *res)
+{
+	struct strarray *array = res;
+
+	kfree_strarray(array->array, array->n);
+}
+
+char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
+{
+	struct strarray *ptr;
+
+	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	ptr->array = kasprintf_strarray(GFP_KERNEL, prefix, n);
+	if (!ptr->array) {
+		devres_free(ptr);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return ptr->array;
+}
+EXPORT_SYMBOL_GPL(devm_kasprintf_strarray);
+
 /**
  * strscpy_pad() - Copy a C-string into a sized buffer
  * @dest: Where to copy the string to
-- 
2.33.0

