Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44DB0924F9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 15:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfHSN3S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 09:29:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5157 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727172AbfHSN3S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 09:29:18 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8EC5B6C097E5FE472E6A;
        Mon, 19 Aug 2019 21:29:11 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 19 Aug 2019 21:29:05 +0800
From:   Wei Xu <xuwei5@hisilicon.com>
To:     <xuwei5@hisilicon.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linus.walleij@linaro.org>,
        <rjw@rjwysocki.net>, <lenb@kernel.org>,
        <mika.westerberg@linux.intel.com>, <andy.shevchenko@gmail.com>
CC:     <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
        <jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
        <salil.mehta@huawei.com>, <shiju.jose@huawei.com>,
        <jinying@hisilicon.com>, <zhangyi.ac@huawei.com>,
        <liguozhu@hisilicon.com>, <tangkunshan@huawei.com>,
        <huangdaode@hisilicon.com>
Subject: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
Date:   Mon, 19 Aug 2019 21:27:05 +0800
Message-ID: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Invoke acpi_gpiochip_request_interrupts after the acpi data has been
attached to the pl061 acpi node to register interruption.

Otherwise it will be failed to register interruption for the ACPI case.
Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
after gpiochip_add_irqchip but at that time the acpi data has not been
attached yet.

Tested with below steps:

	qemu-system-aarch64 \
	-machine virt,gic-version=3 -cpu cortex-a57 \
	-m 1G,maxmem=4G,slots=4 \
	-kernel Image -initrd rootfs.cpio.gz \
	-net none -nographic  \
	-bios QEMU_EFI.fd  \
	-append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"

The pl061 interruption is missed and the following output is not in the
/proc/interrupts on the v5.3-rc4 compared with the v5.2.0-rc7.

	 43:          0  ARMH0061:00   3 Edge      ACPI:Event

Fixes: 04ce935c6b2a ("gpio: pl061: Pass irqchip when adding gpiochip")
Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
---
v2 -> v3:
* addressed the comments of Andy to show only affected output of
/proc/interrupts and drop the whole log of v5.2.0-rc7

v1- > v2:
* rebased on https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
* attached the log based on QEMU v3.0.0 and Linux kernel v5.2.0-rc7
---
 drivers/gpio/gpio-pl061.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 722ce5c..e1a434e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -8,6 +8,7 @@
  *
  * Data sheet: ARM DDI 0190B, September 2000
  */
+#include <linux/acpi.h>
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -24,6 +25,9 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
 
+#include "gpiolib.h"
+#include "gpiolib-acpi.h"
+
 #define GPIODIR 0x400
 #define GPIOIS  0x404
 #define GPIOIBE 0x408
@@ -345,6 +349,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	if (has_acpi_companion(dev))
+		acpi_gpiochip_request_interrupts(&pl061->gc);
+
 	amba_set_drvdata(adev, pl061);
 	dev_info(dev, "PL061 GPIO chip registered\n");
 
-- 
2.8.1

