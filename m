Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C9A44636E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhKEMpo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:44 -0400
Received: from mga14.intel.com ([192.55.52.115]:21381 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232105AbhKEMpn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="232139819"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="232139819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="532577175"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2021 05:42:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0C9D312B; Fri,  5 Nov 2021 14:43:00 +0200 (EET)
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
Subject: [PATCH v1 01/19] lib/string_helpers: Introduce kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:24 +0200
Message-Id: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have a few users already that basically want to have array of
sequential strings to be allocated and filled.

Provide a helper for them (basically adjusted version from gpio-mockup.c).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_helpers.h |  1 +
 lib/string_helpers.c           | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 4ba39e1403b2..f67a94013c87 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -100,6 +100,7 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
 char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
 char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
+char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index d5d008f5b1d9..9758997c465e 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -674,6 +674,39 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
 
+/**
+ * kasprintf_strarray - allocate and fill array of sequential strings
+ * @gfp: flags for the slab allocator
+ * @prefix: prefix to be used
+ * @n: amount of lines to be allocated and filled
+ *
+ * Allocates and fills @n strings using pattern "%s-%zu", where prefix
+ * is provided by caller. The caller is responsible to free them with
+ * kfree_strarray() after use.
+ *
+ * Returns array of strings or NULL when memory can't be allocated.
+ */
+char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n)
+{
+	char **names;
+	size_t i;
+
+	names = kcalloc(n + 1, sizeof(char *), gfp);
+	if (!names)
+		return NULL;
+
+	for (i = 0; i < n; i++) {
+		names[i] = kasprintf(gfp, "%s-%zu", prefix, i);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return NULL;
+		}
+	}
+
+	return names;
+}
+EXPORT_SYMBOL_GPL(kasprintf_strarray);
+
 /**
  * kfree_strarray - free a number of dynamically allocated strings contained
  *                  in an array and the array itself
-- 
2.33.0

