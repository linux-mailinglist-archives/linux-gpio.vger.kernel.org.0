Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3794D3A9D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 20:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbiCITvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 14:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbiCITvK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 14:51:10 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C59B55BF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 11:50:10 -0800 (PST)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MuDPf-1oHfsn2FEz-00uaod; Wed, 09 Mar 2022 20:44:44 +0100
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
Subject: [PATCH RFC 2/2] pinctrl: bcm2835: implement hook for missing gpio-ranges
Date:   Wed,  9 Mar 2022 20:43:46 +0100
Message-Id: <1646855026-9132-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:gD25VDJriO0WlPO9G1KIEXwcB2q62js2g/T5+gpDWM+vpuAtgJX
 8gc4fsnQow22MKJ411B8VqfZ8qfx/epjNPdU2EhjeNnKoBL04UFvhM1+XEVN1qTkXrHHIlX
 SXGxqfKTny0zh4vETTwQJEYJwKsJ2bQne4Rkc8yZyXFPIHSDIW5hO7/Lpkzk0DGMyYdp/Dx
 gc+LdAHL0qBbFqJqoolKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VnTOY1DYj4E=:7hOSv9L7KCyduhHbDjKQXD
 p//UKeWlplBXepTZLFggFEKZJPA/srfZa7MYcRG5BxGyiC3mm4CCCrgff4kYIhFDVmUw3vN8/
 uqcGHnxdfVhLHqoQ5IldwGIQDvxl1ty9A+B13nesoRofyJRm/l4yy1ADizUGNTyE5VfQ7tVpY
 46qFxs+dStrFZ52Mzm1mcyvKU1p6jyQ+fmlhLkEREiCPSA/3mT42pJAs3LWGCukfsdhNE2SVJ
 DdtTQ/LhNdLyenSQIumpv/1xvNbjL1+tBv2mkAm6wl6OruWmD0mKaQPiEWw4y5OBjxLREMxhA
 QLSfrGow7qBqdz+zcpy7N2NvZmzYlYjTIsYZaT+8PBLQUrvwvEYSUuR9yCh8wmdf/ayj3JcZa
 RY8VSToOqwfJumuKCgMxfGCVudp9/BNNah9smgJee9lU9STiHbwKpxLsDr0b6MuALDt7Otj1c
 CCqbdwv4NsCq4fqs8OIghsnBmlVHISmtvyaIY5G7z179124JSfYUDkOHbDx5h4v2VSEiCdJA1
 7QEbbk7KRQgototq9ueqGEu5EIhOtif0mvbhUzGfZgBmTPEe9iFkck6x0JBtkUHrbowS4pMj1
 J0SOK1QEULfvnsS67i06NS7WCzQ0KBQUYi3Pz4R/qBNeEx47gSrNlCsyyVNAAPPxjYz9RabxR
 lG0HukaZ7Sdlese4kctKbiCPNfWG02Z217VDF+6Rxvg3xkC64b4GAu9PoiD6/JYmeLmtxV/kk
 0j9Ne4oLO68KNXWG
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit c8013355ead6 ("ARM: dts: gpio-ranges property is now required")
fixed the GPIO probing issues caused by "pinctrl: bcm2835: Change init
order for gpio hogs". This changed only the DTS files provided by the kernel
tree. Unfortunately it isn't guaranteed that these files are shipped to
all users.

So implement the necessary backward compatibility for BCM2835 and
BCM2711 platform.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 47e433e..dad4530 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -358,6 +358,22 @@ static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
+static int bcm2835_of_gpio_ranges_fallback(struct gpio_chip *gc,
+					   struct device_node *np)
+{
+	struct pinctrl_dev *pctldev = of_pinctrl_get(np);
+
+	of_node_put(np);
+
+	if (!pctldev)
+		return 0;
+
+	gpiochip_add_pin_range(gc, pinctrl_dev_get_devname(pctldev), 0, 0,
+			       gc->ngpio);
+
+	return 0;
+}
+
 static const struct gpio_chip bcm2835_gpio_chip = {
 	.label = MODULE_NAME,
 	.owner = THIS_MODULE,
@@ -372,6 +388,7 @@ static const struct gpio_chip bcm2835_gpio_chip = {
 	.base = -1,
 	.ngpio = BCM2835_NUM_GPIOS,
 	.can_sleep = false,
+	.of_gpio_ranges_fallback = bcm2835_of_gpio_ranges_fallback,
 };
 
 static const struct gpio_chip bcm2711_gpio_chip = {
@@ -388,6 +405,7 @@ static const struct gpio_chip bcm2711_gpio_chip = {
 	.base = -1,
 	.ngpio = BCM2711_NUM_GPIOS,
 	.can_sleep = false,
+	.of_gpio_ranges_fallback = bcm2835_of_gpio_ranges_fallback,
 };
 
 static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
-- 
2.7.4

