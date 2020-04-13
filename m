Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6F61A658D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 13:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgDMLSb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 07:18:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:47514 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728948AbgDMLSa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:18:30 -0400
IronPort-SDR: JedLTD9UjIEhwM0rkeAu4dHOny18CEKqp66vLPb/4YlEGhDpOarfmmlkZxsjvwmDNtbKSrXFQV
 7dxbX5Tb9Ysg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:18:29 -0700
IronPort-SDR: +LvBag4iCOUcI2DxuieXL8EElgLgWbW6jhH3Vo0O404sMhyobw4UgL+e5yy3y++Joh9YNTj5Xy
 N/0ASkljcshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="287854660"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2020 04:18:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7263316B; Mon, 13 Apr 2020 14:18:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/6] pinctrl: intel: Introduce new flag to force GPIO base to be 0
Date:   Mon, 13 Apr 2020 14:18:24 +0300
Message-Id: <20200413111825.89866-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases not the first group would like to have GPIO base to be 0.
It's not possible right now due to 0 has special meaning already. Thus,
introduce a new flag to allow drivers to force GPIO base to be 0 on
a certain group. It's assumed that it can be only one group per device
with such flag enabled.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/pinctrl/intel/pinctrl-intel.c | 3 +++
 drivers/pinctrl/intel/pinctrl-intel.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a1b286dc7008..6a274e20d926 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1281,6 +1281,9 @@ static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
 			case INTEL_GPIO_BASE_MATCH:
 				gpps[i].gpio_base = gpps[i].base;
 				break;
+			case INTEL_GPIO_BASE_ZERO:
+				gpps[i].gpio_base = 0;
+				break;
 			case INTEL_GPIO_BASE_NOMAP:
 			default:
 				break;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 89f38fae6da7..87fc0555ef90 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -70,10 +70,12 @@ struct intel_padgroup {
 /**
  * enum - Special treatment for GPIO base in pad group
  *
+ * @INTEL_GPIO_BASE_ZERO:	force GPIO base to be 0
  * @INTEL_GPIO_BASE_NOMAP:	no GPIO mapping should be created
  * @INTEL_GPIO_BASE_MATCH:	matches with starting pin number
  */
 enum {
+	INTEL_GPIO_BASE_ZERO	= -2,
 	INTEL_GPIO_BASE_NOMAP	= -1,
 	INTEL_GPIO_BASE_MATCH	= 0,
 };
-- 
2.25.1

