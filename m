Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5166589CF6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 13:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfHLL3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 07:29:00 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54464 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728473AbfHLL27 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 07:28:59 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 988ECB04B9D23C81953D;
        Mon, 12 Aug 2019 19:28:56 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 12 Aug 2019
 19:28:47 +0800
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, <linus.walleij@linaro.org>
CC:     Linuxarm <linuxarm@huawei.com>, <xuwei5@hisilicon.com>,
        "Shameerali Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        "Salil Mehta" <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, <jinying@hisilicon.com>,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
From:   Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH] gpio: pl061: Fix the issue failed to register the ACPI
 interruption
Message-ID: <5D514D6F.4090904@hisilicon.com>
Date:   Mon, 12 Aug 2019 19:28:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
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

Tested with below steps on QEMU v4.1.0-rc3 and Linux kernel v5.3-rc4,
and found pl061 interruption is missed in the /proc/interrupts:
1.
qemu-system-aarch64 \
-machine virt,gic-version=3 -cpu cortex-a57 \
-m 1G,maxmem=4G,slots=4 \
-kernel Image -initrd rootfs.cpio.gz \
-net none -nographic  \
-bios QEMU_EFI.fd  \
-append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"

2. cat /proc/interrupts in the guest console:
estuary:/$ cat /proc/interrupts
CPU0
2:       3228     GICv3  27 Level     arch_timer
4:         15     GICv3  33 Level     uart-pl011
42:          0     GICv3  23 Level     arm-pmu
IPI0:         0       Rescheduling interrupts
IPI1:         0       Function call interrupts
IPI2:         0       CPU stop interrupts
IPI3:         0       CPU stop (for crash dump) interrupts
IPI4:         0       Timer broadcast interrupts
IPI5:         0       IRQ work interrupts
IPI6:         0       CPU wake-up interrupts
Err:          0

Fixes: 04ce935c6b2a ("gpio: pl061: Pass irqchip when adding gpiochip")
Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
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
@@ -345,6 +349,9 @@ static int pl061_probe(struct amba_device *adev, 
const struct amba_id *id)
      if (ret)
          return ret;

+    if (has_acpi_companion(dev))
+        acpi_gpiochip_request_interrupts(&pl061->gc);
+
      amba_set_drvdata(adev, pl061);
      dev_info(dev, "PL061 GPIO chip registered\n");

-- 
2.8.1


.

