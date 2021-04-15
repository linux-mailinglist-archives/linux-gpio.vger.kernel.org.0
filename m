Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287C9360987
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Apr 2021 14:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbhDOMft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 08:35:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:62605 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhDOMft (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Apr 2021 08:35:49 -0400
IronPort-SDR: RudDsy4V5OkennTD9AcommJofzzuragHq2ypLnhxwFmr1mYqN6Y87Cu98h5b77dXCp/gqgz6yw
 OVWh582nPSHA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="192716407"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="192716407"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 05:35:10 -0700
IronPort-SDR: QNj6FeDR+pSWFwtg8VcscztLrdwCPbI69j14ElyKTS/2ywnq95UEQTTEFIwDS83z+1hmaBrH6p
 iMHwKQtuezVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="418727109"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2021 05:35:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3C9FE142; Thu, 15 Apr 2021 15:35:25 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <drew@beagleboard.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dong Aisheng <dong.aisheng@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: core: Fix kernel doc string for pin_get_name()
Date:   Thu, 15 Apr 2021 15:35:21 +0300
Message-Id: <20210415123521.86894-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The kernel doc string mistakenly advertises the pin_get_name_from_id().
Fix it, otherwise kernel doc validator is not happy:

.../core.c:168: warning: expecting prototype for pin_get_name_from_id(). Prototype was for pin_get_name() instead

Fixes: dcb5dbc305b9 ("pinctrl: show pin name for pingroups in sysfs")
Cc: Dong Aisheng <dong.aisheng@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 92955c5e0e0b..3d779fd81e7c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -160,7 +160,7 @@ int pin_get_from_name(struct pinctrl_dev *pctldev, const char *name)
 }
 
 /**
- * pin_get_name_from_id() - look up a pin name from a pin id
+ * pin_get_name() - look up a pin name from a pin id
  * @pctldev: the pin control device to lookup the pin on
  * @pin: pin number/id to look up
  */
-- 
2.30.2

