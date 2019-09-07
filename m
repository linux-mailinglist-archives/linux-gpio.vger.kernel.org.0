Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C933FAC3CA
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2019 03:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393716AbfIGBFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 21:05:41 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3990 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfIGBFl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 21:05:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d7302680001>; Fri, 06 Sep 2019 18:05:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 06 Sep 2019 18:05:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 06 Sep 2019 18:05:40 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 7 Sep
 2019 01:05:40 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 7 Sep
 2019 01:05:40 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 7 Sep 2019 01:05:40 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d7302640000>; Fri, 06 Sep 2019 18:05:40 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     YueHaibing <yuehaibing@huawei.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "John Hubbard" <jhubbard@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: fix build failure: gpiochip_[un]lock*() static/non-static
Date:   Fri, 6 Sep 2019 18:05:34 -0700
Message-ID: <20190907010534.23713-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567818344; bh=eO1xZfAtxjNLKEcOZ88Jf/cJ0R2lqa5Lv5whwF3UwU4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=ZFUUKLlFAab9l88gosi3tE+tELd+vYeSMblhkb2LZY9JV8ZGjNTiKSDr8VsfvJumb
         qbX2LjAe/IpARlEipReKQsGvLSQn3NKElg3yFGZptq5uHRp296sWeIwGcekntiuxrW
         GK0dBaqt71ru5lmHO/l2lgGOR7mVQOzTtVIETCpJhMs2rXMUdAyxXG1RYY7+T/lScS
         NpNjoerq33+meJW+Hdj4o5AUUffbufEKxY1vuHurw1Zu1mZtPnKq7wYZ0KXKVMxTUR
         SeKlvDhe+ZeSf5S9eF7mKptnVDD5B7jn6con62CSqx598RnPovICKAS6Z5gbZtsQ+6
         yborNyJoXes9Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While building with !CONFIG_GPIOLIB, I experienced a build failure,
because driver.h in that configuration supplies both a static and
a non-static version of these routines:

	gpiochip_lock_as_irq()
	gpiochip_unlock_as_irq()

Fix this by moving the non-static routines under the scope of
CONFIG_GPIOLIB.

Fixes: commit c7663fa2a663 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio=
/driver.h")
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Hi,

This is for today's linux-next.

More background:

It *looks* like the original commit did correctly put the non-static
versions of these routines in CONFIG_GPIOLIB, and the static versions
inside !CONFIG_GPIOLIB, but my git history foo is not strong enough
to figure out how we got here, so I'm not sure if the "Fixes:" tag
really refers to the guilty commit.

thanks,
John Hubbard
NVIDIA

 include/linux/gpio/driver.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b74a3bee85e5..39be896aad38 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -702,13 +702,11 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
=20
-/* lock/unlock as IRQ */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
-
 #ifdef CONFIG_GPIOLIB
=20
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
=20
 #else /* CONFIG_GPIOLIB */
=20
--=20
2.23.0

