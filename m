Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A682D9421
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 09:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439221AbgLNIZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:25:07 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9599 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgLNIY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 03:24:58 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvZCc12HGzM5T1;
        Mon, 14 Dec 2020 16:23:24 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Mon, 14 Dec 2020
 16:24:04 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <john.garry@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v2 0/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Date:   Mon, 14 Dec 2020 16:24:12 +0800
Message-ID: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is the GPIO driver for HiSilicon's ARM SoC.
It provide patches for device driver, MAINTAINER file, and enable gpio-hisi
at defconfig.

Thanks
Jiaxing

---
  v1->v2: 1. set (ARM64 || COMPILE_TEST) && ACPI at kconfig.
          2. Delete some useless header files.
          3. Replace "hisi-ngpio" with "ngpios", fix firmware too
          4. Direction setting is modified to be handle by generic GPIO
          5. Add error code print
          6. Some tiny clean up
---

Luo Jiaxing (3):
  gpio: gpio-hisi: Add HiSilicon GPIO support
  MAINTAINERS: Add maintainer for HiSilicon GPIO driver
  arm64: defconfig: enable GPIO_HISI

 MAINTAINERS                  |   7 +
 arch/arm64/configs/defconfig |   1 +
 drivers/gpio/Kconfig         |  11 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-hisi.c     | 328 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 348 insertions(+)
 create mode 100644 drivers/gpio/gpio-hisi.c

-- 
2.7.4

