Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34E015C92D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 18:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgBMRJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 12:09:07 -0500
Received: from mga09.intel.com ([134.134.136.24]:49049 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727690AbgBMRJH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Feb 2020 12:09:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 09:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; 
   d="scan'208";a="406700635"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2020 09:09:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BF7EA193; Thu, 13 Feb 2020 19:09:04 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Rename 'event' to 'ge' to be consistent with other use
Date:   Thu, 13 Feb 2020 19:09:04 +0200
Message-Id: <20200213170904.82324-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename 'event' to 'ge' to be consistent with other use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 20e411fb7d1c..d8adaa485a4b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -830,11 +830,11 @@ static ssize_t lineevent_read(struct file *filep,
 			      loff_t *f_ps)
 {
 	struct lineevent_state *le = filep->private_data;
-	struct gpioevent_data event;
+	struct gpioevent_data ge;
 	ssize_t bytes_read = 0;
 	int ret;
 
-	if (count < sizeof(event))
+	if (count < sizeof(ge))
 		return -EINVAL;
 
 	do {
@@ -858,7 +858,7 @@ static ssize_t lineevent_read(struct file *filep,
 			}
 		}
 
-		ret = kfifo_out(&le->events, &event, 1);
+		ret = kfifo_out(&le->events, &ge, 1);
 		spin_unlock(&le->wait.lock);
 		if (ret != 1) {
 			/*
@@ -870,10 +870,10 @@ static ssize_t lineevent_read(struct file *filep,
 			break;
 		}
 
-		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
 			return -EFAULT;
-		bytes_read += sizeof(event);
-	} while (count >= bytes_read + sizeof(event));
+		bytes_read += sizeof(ge);
+	} while (count >= bytes_read + sizeof(ge));
 
 	return bytes_read;
 }
-- 
2.25.0

