Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E77AADFF3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 22:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391567AbfIIUff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 16:35:35 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35477 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfIIUfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 16:35:34 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M42Ss-1i7QNX0dMG-0000SB; Mon, 09 Sep 2019 22:35:15 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Hulk Robot <hulkci@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Enrico Weigelt <info@metux.net>,
        Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: fix incorrect merge of linux/gpio/driver.h
Date:   Mon,  9 Sep 2019 22:34:59 +0200
Message-Id: <20190909203512.675822-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h5/cCxSSdt5FyRzyzFCDSMqQaF4Hg9pI9atK4iqsbR31lQ7KMiY
 HZAeIg66EFmJSMrNyZ0P/3udIPL7P1Uq1RxcQw39eige+TJduUc+qI84JaCbNmE6pN4562u
 DT1TXQM7Hlqr3MmgDbtAXSEe5/srat/L/e5wF2ipINDnqAXjq+FY+ttXtWqlmsckjga8ojv
 EMGEeDY/Hd764j+oJDcSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b+UibNyUIXA=:6UWSiK4lOn47hPscpafs31
 HqEVEaRbsmhbhyRdmvHhzTuD/aYfFYtVSn3FHljL39ZdJjYaYhZFXgUIw6tm5gkR16MhvuPN/
 3ZfWT4S/0RNCO2jvvsUpDbTTjuTmg46ni4xR6FXbd23KthshPqsNc+sDBV0wzSwJTbmsp/d4S
 djOnrQR0a2kJYYAVE5OS/1TCf0O6SSh6G08Bc4yOjDzOAhGFK9KJdt7VS/lzy0qB5KkqJhH+w
 EPCYPeuxuBuwMvzjhUsaRB7/EY38Sers1+TYcPhoHSFixvOdh/MNTaG726z2HpoZS6YNRt+UZ
 6bG98fEtKF9TXqFZ4QO5H0QAvZ2Z9QxVaYwMuYzsqpeeljj5QHvJ1RscdQmxy3sZWcgX+oyUR
 c293x3gUXFSlibU3SXkHtJlJKk9PdI5nHs7U8YRH3D8bNIRwHAEKwjzeUUhl5Bwkr+vQk6OUa
 GO3a9nw0bFp/mtEQriDKdiZYG1NGXP4Ul7z3xj/xSHugA7JheWv0QaFu+ME89xFY5RcWM/SW8
 vdmhWQiN+tWGQoXXvbbIGD9xwzaT+C2p7bvFhGE2FA+zRnwMc7SWHyhdXFmzgme0OD53HW+sw
 RHnUBuSEmzAD9oknLHCSqNwOg8IxDo2DByNekZi8368oW9YGHDFzaNMIAhTNXNNEfp2mpLa9a
 jz47ltPFMqwmo6c3Kx3TwoUkhV1MJvZbBTycxjNvuv37U/ohvEOWXUB42MZ+k13nGhWAFdT7w
 kAeoOBPhOVOKpVgzZv7IGvG1f0povpQU84nP097S4RiFkczPGIiQ6Z0a+5dA+bKMSCp9f4tPW
 Ov4vJCqBcusKI0JFv3hmi7US1yrK+XkysebHIopXK6HDTvT4v8=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Two otherwise correct patches got merged incorrectly, which leads to
build problems when CONFIG_GPIOLIB is disabled:

include/linux/gpio/driver.h:722:19: error: static declaration of 'gpiochip_lock_as_irq' follows non-static declaration
static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
                  ^
include/linux/gpio/driver.h:706:5: note: previous declaration is here
int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
    ^
include/linux/gpio/driver.h:729:20: error: static declaration of 'gpiochip_unlock_as_irq' follows non-static declaration
static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
                   ^
include/linux/gpio/driver.h:707:6: note: previous declaration is here
void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);

Fixes: 8a6abcd04e4c ("Merge tag 'gpio-v5.4-updates-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel")
Fixes: 9091373ab7ea ("gpio: remove less important #ifdef around declarations")
Fixes: c7663fa2a663 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/gpio/driver.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b74a3bee85e5..fb134ff20f6b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -702,14 +702,14 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
 
-/* lock/unlock as IRQ */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
-
 #ifdef CONFIG_GPIOLIB
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
+/* lock/unlock as IRQ */
+int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
-- 
2.20.0

