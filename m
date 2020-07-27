Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145A522F465
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 18:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgG0QMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 12:12:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:40735 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727975AbgG0QMT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 12:12:19 -0400
IronPort-SDR: nfds2uD59BR1WOFhVyxxdvaOPyGwUWhrk4hzT0E5COKHIZW04+a9Qxpo12wQiuqvE+FpkOUxk6
 0iVYQ6FGzFfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="148525652"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="148525652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 09:12:19 -0700
IronPort-SDR: 8AHUi0jmj/nok4N26IN10JaGrfLYyvKfBqDMRlkRQDltfh700QL/oCDVsS9w4HaqpCyT6OsgFt
 GD1DH/BGVAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="329730199"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2020 09:12:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 19AADFC; Mon, 27 Jul 2020 19:12:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] pinctrl: cherryview: Drop stale comment
Date:   Mon, 27 Jul 2020 19:12:14 +0300
Message-Id: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no more .groups member in struct chv_pinctrl,
drop associated comment because it's not applicable anymore.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9ef246145bde..41708f7ea65c 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -86,9 +86,6 @@ struct intel_pad_context {
  * @irq: Our parent irq
  * @intr_lines: Mapping between 16 HW interrupt wires and GPIO offset (in GPIO number space)
  * @saved_intmask: Interrupt mask saved for system sleep
- *
- * The first group in @groups is expected to contain all pins that can be
- * used as GPIOs.
  */
 struct chv_pinctrl {
 	struct device *dev;
-- 
2.27.0

