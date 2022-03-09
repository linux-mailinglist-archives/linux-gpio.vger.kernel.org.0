Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41DED4D3A9C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 20:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbiCITvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 14:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbiCITvK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 14:51:10 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E7DAC
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 11:50:09 -0800 (PST)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOzKk-1nn26C0XaW-00POnC; Wed, 09 Mar 2022 20:44:44 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 1/2] gpiolib: of: Introduce hook for missing gpio-ranges
Date:   Wed,  9 Mar 2022 20:43:45 +0100
Message-Id: <1646855026-9132-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:IaICHcL/ihEZJrbQlwQnRUvARq7G5Mehnj7902lReucO64HiH0M
 vVzSUZlMLJUe0Ty3gDeaUiY0LfysrNlYFsJJJs3Rge4qfqHsi0zW7YUSf3Jm3qxlyW9zVo9
 HHUn+gMkQZrRqZVrKVgrWdgOdGV5AvgGkDA6HejFQr/zP6v26skZMXQubk+BGLLcqSlCUix
 esJCPwQ3RdfqGLFP3IyCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vTdakuSLCUI=:7GisNQDFNFEX5/Bsyfs8jk
 /etR+ZpbRmsdkulThWrOCaou8yv0VplmPJloFkT3ZL/EKWQya8GAWt1+tjdHHCpl/fcR9s8CM
 uyLY4JJpD0Z4rVlfzR3hUl/yDUZFQsiicEdFnUUnepns+jTpjBmmHOOiytqGpR8Y/rfTH5LHd
 Bh5yxS5sXwEpr/MV1Seizir1BWD7bwK3BTlRw7Ill0kzbqFGPHk3tCp6IVlKQ69s+Q+OskUdm
 ZJLpshQdj8vEs59ZzGawfEEGczUftAG7KXymviz6mo4pWzKiOBDn0HOgAd443jWL8leF+taUl
 O8HAnD/XvbfxXfpmAJbs7oQFASLaOnhUiWEkqvcJSV/AVoEaXPOTiL2bYex+m2QUYLTreAk1v
 vUrX2CylANX09JuvFWOcDXqQj64LIhvn7FqXc/J2GgAvagtSEdo0xMEnH5TtwNQMI8fH5tsPI
 cTeRGKHrFiKzx5LIRFm8PuhNdTeNDncmY8KEdHqUArPfB5AK5xf0NQEVjMPaTyDa9IszAg2XB
 +ogyQoyJluit2v2tu+yhLZpW0IzGhkRr0ZTbROfr/8kgF4tuOKpehvDRjOhgGtu0r8K2nVM6G
 uZVimyJE1QsujuoxOO0CRxw+AollYRA1ApzStBv5m946M4IdgtzxKKM7kQyuQzT9SxOj9eQLa
 86fGV/j5AWPaAi9AcnM8tCTwO3GCMnh3sjyMnQU1cf4RK1OItuZmxT0UIU2kpeDrWTaxa1y4V
 c5IMt6MEd45b4Idu
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
the device tree nodes of GPIO controller need the gpio-ranges property to
handle gpio-hogs. Unfortunately it's impossible to guarantee that every new
kernel is shipped with an updated device tree binary.

In order to provide backward compatibility with those older DTB, we need a
callback within of_gpiochip_add_pin_range() so the relevant platform driver
can handle this case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpio/gpiolib-of.c   |  5 +++++
 include/linux/gpio/driver.h | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 91dcf2c..45b6edb 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -933,6 +933,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	if (!np)
 		return 0;
 
+	if (!of_property_read_bool(np, "gpio-ranges") &&
+	    chip->of_gpio_ranges_fallback) {
+		return chip->of_gpio_ranges_fallback(chip, np);
+	}
+
 	group_names = of_find_property(np, group_names_propname, NULL);
 
 	for (;; index++) {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b0728c8..47a5ea0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -489,6 +489,18 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
+
+	/**
+	 * @of_gpio_ranges_fallback
+	 *
+	 * Optional hook for the case that no gpio-ranges property is defined
+	 * within the device tree node "np" (usually DT before introduction
+	 * of gpio-ranges). So this callback is helpful to provide the
+	 * necessary backward compatibility for the pin ranges.
+	 */
+	int (*of_gpio_ranges_fallback)(struct gpio_chip *gc,
+				       struct device_node *np);
+
 #endif /* CONFIG_OF_GPIO */
 };
 
-- 
2.7.4

