Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53719441D23
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 16:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhKAPJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 11:09:41 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:57485 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231304AbhKAPJl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 11:09:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id DCC2C5C0186;
        Mon,  1 Nov 2021 11:07:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 01 Nov 2021 11:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=oYK4pXojD6J5Wa+UyhlJtj9Yzf
        aW2MYHVOQZX050zE4=; b=qvALMwGokjB1UMeCdtXaB+Do3g+AJFzbjc20FXLw0L
        x9VTLmRI+lyvF7AzXPxVQSzqf6mzCrrGtTaZIkpuc6Z3PhPtEo5SSSV+jePiQ9aT
        Xw5+Cp2JvHeK8aD7Gh7KDkL4VKji43skg0SV4ykU/U626e/3inidtCnJ1M0mOwpk
        LEXYvT+IU7BZiUWvgoUHnwgkjeGCYS/eR7FnFoTojvXIQdDN9SHqxIREACeVxg2K
        A/Cvb0oyVDQzNHJc3/VIUlSJyjSR56Z23JZQtG89WCwusQjVcR1SEROpwuJmHyU8
        l+gzNftB6e+dEoezTO/fKOLjXG4Ok9IUAjxP0BHfiCsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oYK4pXojD6J5Wa+Uy
        hlJtj9YzfaW2MYHVOQZX050zE4=; b=DZfPiYhncnIA7+dusy9AS0cBJYqXGVoMc
        EWjtDtapSCOCtCn4AYF9mox2iB9c1rCp6XfmNWkWdd+bxtBORAJQ7DUQygqPtZcS
        E1yV7JlUHXTq07s6/lDBSiwBneSfAxI5WTQjfZXhrLfAmFEik9y4NS738dVROd26
        0YtbHnf0HdM/R/zdJHCo4t3JgyikhKSfw+W5AinjRHMbEBQOoeObzPjpr92pum+d
        esLwAmTIJ98qGRJQu5t+cGPiqLQI5lKWAydtA/erODOJMvNajpQz4P1oAvG1YuvL
        ShRcdC/uJG0tN5DCWNWRelusFjNwEENLSTaK+5D1xgjyEwKW8DBcw==
X-ME-Sender: <xms:mgKAYdi4Ul2TTFWxPQQeS3KlkDIYAEPn5pZh3lY-cFghrXX1Y0awug>
    <xme:mgKAYSDgYA21xlYsJgjHTcwym569LxOU7Jeq8gH_Ps2w8GHbMQpU2fvgoG0f7aYuA
    DZVRO7TxzPx7mDX6aA>
X-ME-Received: <xmr:mgKAYdGFfBBMAL9eF85xsSb49Ho9a3YUqIwkaNf3ZnBpL9kbOGFk0dozC2aiVAdKmHtc6v5cLceA8ajjBmMLCzWDpZ7LBhuSbyueszc6ZtgF_r5UtbfY0H8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehvddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epuefgleekvddtjefffeejheevleefveekgfduudfhgefhfeegtdehveejfefffffgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
    hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:mgKAYSQszsRQKeO7haUaLn1U_PBa9t3DsQo3qSubQZD0Xh_vPrZBSg>
    <xmx:mgKAYazn5CxUQf1_biKoF8XPEVw-UbXEA91qB5o8kgJcJ3mbYEWTEg>
    <xmx:mgKAYY7IEQFYrDEMQ86RAtljO-Bob28akIPeUhlBtw-6lH_jbIwVdA>
    <xmx:mgKAYVyyQqglLnJj0nGqFJy_IbCj2XBufLcPIPPa18dABXA1ZDGUYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Nov 2021 11:07:04 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: apple: Always return valid type in apple_gpio_irq_type
Date:   Mon,  1 Nov 2021 16:06:40 +0100
Message-Id: <20211101150640.46553-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

apple_gpio_irq_type can possibly return -EINVAL which triggers the
following compile error with gcc 9 because the type no longer fits
into the mask.

  drivers/pinctrl/pinctrl-apple-gpio.c: In function 'apple_gpio_irq_set_type':
  ././include/linux/compiler_types.h:335:38: error: call to '__compiletime_assert_289' declared with attribute error: FIELD_PREP: value too large for the field
    335 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                      ^
  [...]
  drivers/pinctrl/pinctrl-apple-gpio.c:294:7: note: in expansion of macro 'FIELD_PREP'
    294 |       FIELD_PREP(REG_GPIOx_MODE, irqtype));
        |       ^~~~~~~~~~

Fix this by making the return value always valid and instead checking
for REG_GPIOx_IN_IRQ_OFF in apple_gpio_irq_set_type and return -EINVAL
from there.

Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 0cc346bfc4c3..a7861079a650 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -258,7 +258,7 @@ static void apple_gpio_irq_ack(struct irq_data *data)
 	       pctl->base + REG_IRQ(irqgrp, data->hwirq));
 }
 
-static int apple_gpio_irq_type(unsigned int type)
+static unsigned int apple_gpio_irq_type(unsigned int type)
 {
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -272,7 +272,7 @@ static int apple_gpio_irq_type(unsigned int type)
 	case IRQ_TYPE_LEVEL_LOW:
 		return REG_GPIOx_IN_IRQ_LO;
 	default:
-		return -EINVAL;
+		return REG_GPIOx_IN_IRQ_OFF;
 	}
 }
 
@@ -288,7 +288,7 @@ static void apple_gpio_irq_unmask(struct irq_data *data)
 {
 	struct apple_gpio_pinctrl *pctl =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
+	unsigned int irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
 			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
@@ -313,10 +313,10 @@ static int apple_gpio_irq_set_type(struct irq_data *data,
 {
 	struct apple_gpio_pinctrl *pctl =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	int irqtype = apple_gpio_irq_type(type);
+	unsigned int irqtype = apple_gpio_irq_type(type);
 
-	if (irqtype < 0)
-		return irqtype;
+	if (irqtype == REG_GPIOx_IN_IRQ_OFF)
+		return -EINVAL;
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
 			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
-- 
2.25.1

