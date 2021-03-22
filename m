Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C503440EA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCVM1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhCVM0q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:26:46 -0400
X-Greylist: delayed 426 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Mar 2021 05:26:45 PDT
Received: from forward104p.mail.yandex.net (forward104p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEB7C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:26:45 -0700 (PDT)
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 007244B0093A;
        Mon, 22 Mar 2021 15:19:36 +0300 (MSK)
Received: from vla1-d53b4f396d89.qloud-c.yandex.net (vla1-d53b4f396d89.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:b8c:0:640:d53b:4f39])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id EFA297080004;
        Mon, 22 Mar 2021 15:19:35 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [37.139.80.9])
        by vla1-d53b4f396d89.qloud-c.yandex.net (mxback/Yandex) with HTTP id WJfrn00TC4Y1-JYTSwi3t;
        Mon, 22 Mar 2021 15:19:35 +0300
Authentication-Results: vla1-d53b4f396d89.qloud-c.yandex.net; dkim=pass
Received: by vla5-f98fea902492.qloud-c.yandex.net with HTTP;
        Mon, 22 Mar 2021 15:19:34 +0300
From:   nikita.shubin@maquefel.me
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        hsweeten@visionengravers.com,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        bgolaszewski@baylibre.com
Subject: RFC Need advice on reworking gpio-ep93xx.c to DT support
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 22 Mar 2021 15:19:34 +0300
Message-Id: <1042421616413081@mail.yandex.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear all, after studying the question i've came up with the following suggestion:

- split ep93xx_gpio_resource into per port platform device:

So instead of:
```
static struct resource ep93xx_gpio_resource[] = {
DEFINE_RES_MEM(EP93XX_GPIO_PHYS_BASE, 0xcc),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO_AB),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO0MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO1MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO2MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO3MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO4MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO5MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO6MUX),
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO7MUX),
};

static struct platform_device ep93xx_gpio_device = {
.name = "gpio-ep93xx",
.id = -1,
.num_resources = ARRAY_SIZE(ep93xx_gpio_resource),
.resource = ep93xx_gpio_resource,
};
```

We will have something like this for each port:
```
static struct resource ep93xx_gpio_A_resource[] = {
DEFINE_RES_MEM(EP93XX_GPIO_PHYS_BASE + DATA, 0x04),
DEFINE_RES_MEM(EP93XX_GPIO_PHYS_BASE + DIRECTION, 0x04),
DEFINE_RES_MEM(EP93XX_GPIO_PHYS_BASE + INTERRUPT, 0x2c), /** only port A/B/F*/
DEFINE_RES_IRQ(IRQ_EP93XX_GPIO_AB), /** only port A/B*/
... /* IRQS only for port F*/
};

static struct platform_device ep93xx_gpio_A_device = {
.name = "gpio-ep93xx",
.id = -1,
.num_resources = ARRAY_SIZE(ep93xx_gpio_A_resource),
.resource = ep93xx_gpio_A_resource,
};
```

And they will registered separately.

I think this will allow more transparent transition to DT

- rework gpio-ep93xx.c to handle each platform device instance separately
- add processing for the following device tree (example):

Showing only ports A, F and no interrupt capable C:
```
gpio0: gpio@80840000 {
compatible = "cirrus,ep93xx-gpio-a", "cirrus,ep93xx-gpio";
label = "A";
reg = <0x80840000 0x04>,
<0x80840010 0x04>,
<0x80840090 0x1c>;
reg-names = "data", "dir", "int";
gpio-controller;
interrupt-controller;
interrupt-parent = <&vic1>;
interrupts = <27>;
};

gpio2: gpio@80840008 {
compatible = "cirrus,ep93xx-gpio";
label = "C";
reg = <0x80840008 0x04>,
<0x80840018 0x04>;
reg-names = "data", "dir";
gpio-controller;
};

gpio5: gpio@80840030 {
compatible = "cirrus,ep93xx-gpio-f", "cirrus,ep93xx-gpio";
label = "F";
reg = <0x80840030 0x04>,
<0x80840034 0x04>,
<0x8084004C 0x1c>;
reg-names = "data", "dir", "int";
gpio-controller;
interrupt-controller;
interrupts-extended= <&vic0 19 20 21 22>,
<&vic1 15 16 17 18>;
};
```

So the work will be split into 2 stages:
- breaking gpio platform data into pieces, adapting gpio-ep93xx.c
- adding DT support for gpio-ep93xx.c

Please advise me on this issue.
