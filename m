Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D912D124DE6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 17:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLRQhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 11:37:11 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:44107 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfLRQhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 11:37:10 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MG9Xu-1iTL6J1RBk-00GY5i; Wed, 18 Dec 2019 17:37:03 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: lochnagar: select GPIOLIB
Date:   Wed, 18 Dec 2019 17:36:46 +0100
Message-Id: <20191218163701.171914-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qgb4fv+y9jcZDdpdrYUzzZ6dcoTpOmWPWNxttY6NQEFKg1bDoXQ
 B8bqBnvvxos5FtMQnxCDOFQ527z89fM6fqTggu4VOZPdwXxYEy9r3w37gzECjT+eMTqGnF6
 ly9JMYeZKcJe3EuopMcDg8AL0lA4eT/yhs+C/64xsg5ABByb1llXoz3Uc2UmzGq6ONJoy1g
 2REgf8iAJKqKqxht1sJYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R7XF/1zRMos=:rp3V/WKf77fEMd73eFH0AC
 XfE2lkTKfYE6GtWPmzrYqXady4wg1PyKRAzgDKWZ+CA7kxJfOpadlZEtW9HC0hXifbbvMxhlo
 FtoXE7p2C+rWifRMsZXInr6rGUuBikVCCZ/CW2UETfN+C7MYdQNwDVyyvngfeBcCJ4cUG88NA
 kiyyMvEvtHt+4ygR4JtIS+yfqMiwmOY5ZB0npBnlXMYHsl02BbpcyeAPbK8DOFs+lTviqgMAh
 UIvMh4BINzOYUeTL6KlCeFGBrxRqrfGKHZl5gvIReuITkcnCMEfwgSEQ4yXE05kQopQsvzdma
 ImHi5E7Jhae12wCiWvk1qoQkZF/yqssco3orf/ancxLSwnUpRY4ULKkguqBj497u1WWjjQ4c9
 YF63nQRZ5abYyHbNdTJKZCGckwfJclo1WW7zIPa4L3Juz/LgjkqhzXVjNyP3m5eBhLlhdixhl
 7d9S6QTHnJW8iW+GNYkACv5GoV2RLjORwRv6Q96vtJ7kT8FwkRvhn4jwvHmI5p8nXlFoIDA2+
 WnwqOtgjmyEkDsNZBH/ZdPy1TTtVBJuB5xOwUHzHkzAA+SbBqMcsgmj979dYVSS4oHvmEE+tz
 Os0lKHQ3ejWk2A6v4KTFKjyxtLvW7l5y3v2Smc9adP6kqYzmOsf+oOQ9Vm5KLDP6zfIIZUR2j
 xx9aAE4XwAPBfvkNfn7q4gYRBxqj89Emcgr1I2c9VvP5CInn7T7Qi/s78hjLPrcSNti1Xd4nt
 8ZDNyamZZprFN8sHMIZo/tBD+SozGu1kGrg9O2LM1v3OpR8Hg2hx1utXYSKWZn8mFRMhABuvS
 Hl42gTjKfBvHrpWXhGPbfVEet4eapQAgdBDFtHT3aB/EBWANHtmm5/QrIq6BoaYBj2H9O/Y/b
 q+zRAyjuqTC7A1AQglAg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a rare randconfig build I came across one configuration that does
not enable CONFIG_GPIOLIB, which is needed by lochnagar:

ERROR: "devm_gpiochip_add_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
ERROR: "gpiochip_generic_free" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
ERROR: "gpiochip_generic_request" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
ERROR: "gpiochip_get_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!

Add another 'select' like all other pinctrl drivers have.

Fixes: 0548448b719a ("pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
subsystem, or if there are still good reasons for leaving it disabled
on any machine that uses CONFIG_PINCTRL.
---
 drivers/pinctrl/cirrus/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/cirrus/Kconfig b/drivers/pinctrl/cirrus/Kconfig
index f1806fd781a0..530426a74f75 100644
--- a/drivers/pinctrl/cirrus/Kconfig
+++ b/drivers/pinctrl/cirrus/Kconfig
@@ -2,6 +2,7 @@
 config PINCTRL_LOCHNAGAR
 	tristate "Cirrus Logic Lochnagar pinctrl driver"
 	depends on MFD_LOCHNAGAR
+	select GPIOLIB
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.20.0

