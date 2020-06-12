Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0701F7A1D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgFLOuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:64074 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgFLOuO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:14 -0400
IronPort-SDR: v1BXfYQzzAQ+ERSgK6jJle7L3n6MHgC97J5Ig4lqP31c0OFahXtr1tRNwq0PXSsWD5Znd4T8tJ
 ouNL6QuO+MwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: dPzjcmEq7E2Z7pQWZIs7AF2kgNpcD8I2VbJORD6p4/KzUfo3reYxbyk0btPRaCFZXuT3/zO52R
 HjrEnG6ll92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="271920977"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2DBFE63F; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 08/13] pinctrl: intel: Introduce for_each_requested_gpio() macro
Date:   Fri, 12 Jun 2020 17:50:01 +0300
Message-Id: <20200612145006.9145-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce for_each_requested_gpio() macro which helps to iterate
over requested GPIO in a range.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 4e17308d33e9..c1f312bc28eb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -249,4 +249,8 @@ const struct dev_pm_ops _name = {					\
 				      intel_pinctrl_resume_noirq)	\
 }
 
+#define for_each_requested_gpio(chip, i, base, size)			\
+	for (i = 0; i < size; i++)					\
+		if (!gpiochip_is_requested(chip, base + i)) {} else
+
 #endif /* PINCTRL_INTEL_H */
-- 
2.27.0.rc2

