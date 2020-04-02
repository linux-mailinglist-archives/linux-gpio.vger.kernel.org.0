Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8888E19C9EF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 21:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733055AbgDBTVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 15:21:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:55096 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732625AbgDBTVv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 15:21:51 -0400
IronPort-SDR: O0smRVehKLG+A1cMuH+D2Dl4FjY8ffsAzEzMDCWGPiCSR9pEGTzU4K8Do8ie9mkS6sfyaPH21d
 6Fcpti8cZyUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 12:21:50 -0700
IronPort-SDR: I3xyMGekXKlMuutMuCtbP3oXaDERzPpKCO1bpN1PY7MtRf23r20+hXOuf7FG09Uo4GMy82uMr7
 AKJOZbqhk2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; 
   d="scan'208";a="268123085"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2020 12:21:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7EBB6149; Thu,  2 Apr 2020 22:21:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: Extend TODO to cover code duplication avoidance
Date:   Thu,  2 Apr 2020 22:21:45 +0300
Message-Id: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears at least two drivers has a lot of duplication code in
GPIO subsystem. To avoid adding more and get rid of existing duplication
extend TODO.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/TODO | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 3a44e6ae52bd..b989c9352da2 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -99,6 +99,10 @@ similar and probe a proper driver in the gpiolib subsystem.
 In some cases it makes sense to create a GPIO chip from the local driver
 for a few GPIOs. Those should stay where they are.
 
+At the same time it makes sense to get rid of code duplication in existing or
+new coming drivers. For example, gpio-ml-ioh should be incorporated into
+gpio-pch. In similar way gpio-intel-mid into gpio-pxa.
+
 
 Generic MMIO GPIO
 
-- 
2.25.1

