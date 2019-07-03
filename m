Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1B55D8DF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfGCAaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:30:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:56882 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbfGCAaW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jul 2019 20:30:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 17:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; 
   d="scan'208";a="315413822"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 02 Jul 2019 17:30:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9577712C; Wed,  3 Jul 2019 03:30:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: baytrail: Use defined macro instead of magic in byt_get_gpio_mux()
Date:   Wed,  3 Jul 2019 03:30:17 +0300
Message-Id: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

By the fact byt_get_gpio_mux() returns a value of mux settings as
it is represented in hardware. Use defined macro instead of magic numbers
to clarify this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 18d9ad504194..c72d831ca8b6 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -91,6 +91,7 @@
  * does not find a match for the requested function.
  */
 #define BYT_DEFAULT_GPIO_MUX	0
+#define BYT_ALTER_GPIO_MUX	1
 
 struct byt_gpio_pin_context {
 	u32 conf0;
@@ -932,14 +933,14 @@ static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned int offset)
 	/* SCORE pin 92-93 */
 	if (!strcmp(vg->soc_data->uid, BYT_SCORE_ACPI_UID) &&
 	    offset >= 92 && offset <= 93)
-		return 1;
+		return BYT_ALTER_GPIO_MUX;
 
 	/* SUS pin 11-21 */
 	if (!strcmp(vg->soc_data->uid, BYT_SUS_ACPI_UID) &&
 	    offset >= 11 && offset <= 21)
-		return 1;
+		return BYT_ALTER_GPIO_MUX;
 
-	return 0;
+	return BYT_DEFAULT_GPIO_MUX;
 }
 
 static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned int offset)
-- 
2.20.1

