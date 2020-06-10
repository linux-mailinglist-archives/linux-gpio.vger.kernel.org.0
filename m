Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAC91F5B44
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgFJSfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:23293 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729074AbgFJSfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:50 -0400
IronPort-SDR: CtyRsTiR6A3U2ycS5XfC0QhRQSZeet781dwzxvlrpoJITaC1fTIa1NDelsHHtWlnwVIIJVQooX
 VPodY+vXuKqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:49 -0700
IronPort-SDR: qM0ZysEw/J7KUvFOjwVY2wlesBZdKbp3BtvOFAObcz7xA8e0v3krAQr7J/D+Q4AUc5sQ/T8O4s
 vVl6FuhRFGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="447633103"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 10 Jun 2020 11:35:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 39BB463F; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 08/10] pinctrl: intel: Introduce for_each_requested_gpio() macro
Date:   Wed, 10 Jun 2020 21:35:41 +0300
Message-Id: <20200610183543.89414-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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

