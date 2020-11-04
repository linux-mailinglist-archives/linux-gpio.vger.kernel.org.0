Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0D2A63B0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 12:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgKDLzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 06:55:20 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:4858 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729630AbgKDLxx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 06:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1604490832; x=1636026832;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iOB0FmVKh2flypz/GhzcBtMmu6wDA36S0s4YdkICK68=;
  b=csPjb4X6cB/mboHZayVUwr2h3LFNlpKgxAFvGljLng/rBJPthdD9OHF/
   djzN6mOf58BGuh09B8gTl9Mtld9LkZf7NvtzrBL5v6j2c3ovc3vCcJgZh
   BZYz8FIAaLwe1rDobElDXk7lZ9y0iKdjlIZgo3j930Dkc+HYpGaAiA0gO
   LK2TnY9gs6Cozq/pLprVxFVdJ3NLtBbLXO8aHpuFjyYr2ruwoSOo6rbMp
   PdlxQPYrkq9iJhvLX4afg3uUd10vhfNoopOSwWA7JlylhzHqV+Q9Kt8+Q
   V71kZS9Vl83XR/K+khOSb6Ow8ON7WUHsAff2027zTfeDKWcNoiyiTD8gQ
   Q==;
IronPort-SDR: QJ2LhP7PPYFEQfitkCN+EUN8R3akJwdiUKtSDmNWGfKWslH1jesT5bTPHZoQmGarlNoamMiw7C
 7RkYCmKrAk367aggXzCwUyuY77BNk/85oxlWSLr52bXZb0nTPxZnYVl/0rST+7YQqT7JDM+mTm
 /kbVTumwoUIgczgBB3xVZp8N9mJsruteoIgKKVR2gZug/4ym0uCsAhawb9ILtGeLgmGrMNdAZD
 tYSoRPenU8QHcZFH6vmWKLb1CKrJ/euAd2WBzls4y+0LxW9Cxbgvh/Q2iM/BiYTU+j87qjelOw
 q0I=
X-IronPort-AV: E=Sophos;i="5.77,450,1596470400"; 
   d="scan'208";a="261754753"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Nov 2020 19:53:52 +0800
IronPort-SDR: UvsqZA2JHD0pYB0/l3W+3ltC73GGszlGqstpb8vByyHbPIhsQXM89k9DTIcz0rdUiHAFsOe4Jr
 G15igORmf+zGFO4wyLe2hj6WMWdW3DX3tXlld6lW4oVnOGQdztyFTJqEuZaGNWeq6CIbp+zP9c
 PO35DPsO7IFuTvX5ZnKrLcsEVdkoJlXOgXM/eoqA440ntv9jcVg1FAeG3RiPLC+uCwrap6Fl1Y
 q8kBFsO/58m0CT3JLfRHnYlW4CCSQ/oS1MayD5f4+gnGZpj1axLs4Eo+LNFGGFKNYyNxFGpN3j
 6kpEIcB6RGrG7NMUVtoGfr7u
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 03:40:00 -0800
IronPort-SDR: NsbssG1JbBySk/CIorKY2F67NCf4RhxbRwsOyAn3iVn4vXelossPiSeP/li3g6qOCn9XgK21GQ
 gb/W3oIIj7Oqu8DdZVivc/FYFKFp1tq8G+trPDu6+AAbq75Rr4eNyBUc3VFe8H7UC9eUu1u+0l
 VnYDqm64G1sW1DC3Y/sN0hn1m1qTuK/wnnWztpwF4XtVm+Sb894keOHu/62B/ayLHUABA8ChaC
 /6uqpZaJX88qdPQ1EG+aYmA7m3IjYdIhExhKKpOYW9F7iDAsOGevbwF3XqGbL3PLBbQcjormOk
 v2M=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.79])
  by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 03:53:52 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
Date:   Wed,  4 Nov 2020 20:53:48 +0900
Message-Id: <20201104115348.51930-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If a user tries to export or unexport an invalid gpio (e.g. gpio number
>= ARCH_NR_GPIOS), gpio_to_desc() will trigger a register dump through a
WARN() call. Avoid this rather scary error message by first checking the
validity of the gpio number before calling gpio_to_desc() in
export_store() and unexport_store(). The user gets a normal error
message to signal his/her error without any possible confusion with a
kernel bug.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/gpio/gpiolib-sysfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 728f6c687182..b6fd0d82757a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -3,6 +3,7 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/sysfs.h>
+#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -456,14 +457,15 @@ static ssize_t export_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	if (gpio_is_valid(gpio))
+		desc = gpio_to_desc(gpio);
 	/* reject invalid GPIOs */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
@@ -503,14 +505,15 @@ static ssize_t unexport_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	if (gpio_is_valid(gpio))
+		desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpio_unexport ignores them) */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
-- 
2.28.0

