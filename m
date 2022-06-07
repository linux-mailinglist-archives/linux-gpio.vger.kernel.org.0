Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D635253F1D2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 23:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiFFVnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 17:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiFFVnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 17:43:40 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592A856237;
        Mon,  6 Jun 2022 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654551810;
        bh=/rWCIXPO+DIHy5Wbvb0BsPXQuXvrzb8zMl/UnJyKspM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=IcURhFFFu+vzmB3Fi6OLRgy0a+suJkg6LAU2z5iEc24Nmis5bjtKEihWOJUcDmpKa
         l6W36nVhATTrmRloAAaKYt/5/WrHH5KdUKOsTUSZMk45hfoPCYx+B80Ez9Zi22OvH6
         wGEs4ABON1qO/18NyZlG0CdEw20+fYU7ysPTXScc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1nSVwT3bPg-00neUP; Mon, 06
 Jun 2022 23:43:29 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     Marc Zyngier <maz@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
Date:   Mon,  6 Jun 2022 23:43:00 +0200
Message-Id: <20220606214301.2061467-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LhGxtsXUq/6ysDnU3oTP8OdWjKQdiLoxcP4ZbK3dGsPVNl4Uu2T
 NjNq/YOJDOmQQSdo+XzAxBoSIHSWq0ODxiOhH3FOjVmYVIwK5VguTuztpW6BwUBlyFNTwA1
 TQbxOC43xmEPYNS3+Y7Dk5Rw4r+aWkZU/iefvza6QSSkDVIkE8HrX/t59JtqoKmcqUGpDyw
 tXhto6Dg+/6k7pZmdwvsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Y5Abz3mh9Y=:upHy6CS9v/bm2UnsNwn07u
 kouAio+9nVrabGQsCEIuoxocJKOW7wvDbeyaY+u1iHomTg+hEy8T+fIXADn3moC5ecVRpKdFh
 jPpFvxSwGq20RpIQ2+eGDp7oJhFNiffTx1LG0+LeQTkYQ505h03vRNSw37Kgf1yr6DMIqjGDU
 IJbhchvbgkXiSxtlWlXgzA0SLy0hQ9y3p4HqKGd9atSBxSwZ3Uy2up6QYHBQm8iA89j7h5+Zw
 +14fiiEqxfEkI3XsYqOfmywPUvDY+UApKBFb0Mywv6jeg5FKnZ1UFiv0FHRyofcNa+Cv/Z5RO
 3hCaJFazggeVAW1rLWtDb11OvdFzLhnBYU9B/kNTS9Pw2XlDPsdBWIOnzm/S/0O9pFaT7KKBj
 3OL7XmAqdQZDFi2oJ4C2xwnGnTL8+nafluNPt3/YT/TDeflkktbsY7Ujb5Qc7uhesiA2EdQ67
 koyMzomKdCmv1+rAOTxcbV4Rme74phZNuIqdIlN6j8fya69l2rmvjGSbz7oQTnyUZ1VtHC8uI
 Nvfkme0O7Nvvd8eYH0P43u9THy46vGIO69z0LIhITe9fEcaRo4jNwKGb7x5w0XWmSQjx9bkzt
 qeJ+BcL1jM7urgk+wYugAa0PSDe29ZqWH2qn/q4xTyFBLoAc830O4T8cDPZC14j3V6592BTtn
 z193rw/rDs2ZDOs+Tx5Z90T9/kCuEtvzfC7vQVPai1L7Wqql4sRHN0D+VoPxkqOz7F+wD+FYh
 azRUw1BftpjadONMpBfnb1T/n92dU7AYk/xA/hORIOSzwBmHeqgM5jgYELKCU3JRaMqZcw+gE
 nhV/Z90KCrFeUHFQA0Y1o7kQ3iG9YPmY/pAZoXTdeFWF4mWi3S7/iSoeo19FXmLiijB2Hz5Xo
 lgPzz8/JGxm8uCS8s94aG85RlOm2O0CrDz3S3utegwh0tYfieeJoj4kW42Xx9EaX1C0xd0AEx
 ry6qdqETMAtPS9Q+ysa4eZd8dFDvcMH/KLkq8e4yaDucX2iqc1OwdfyLxnOoT8FlJSTFLVn77
 P3XPl+fcBZ7JmogvxI3tmiwQzJ1YFnmIOkPv78pgSUx/JbvsqQC45TtTQaw3+CIoSziFEXFos
 CX+kiW76VcwBGLFZiugeKbwYIzUiccW9Dq3gFOJkeSyvPya5Bq0HGS7Tw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning for irqchips that are not marked with
IRQCHIP_IMMUTABLE.

Convert the pinctrl-wpcm450 driver to an immutable irqchip.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/n=
uvoton/pinctrl-wpcm450.c
index 0dbeb91f0bf27..cff784a7ce4d7 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -293,6 +293,8 @@ static const struct irq_chip wpcm450_gpio_irqchip =3D =
{
 	.irq_unmask =3D wpcm450_gpio_irq_unmask,
 	.irq_mask =3D wpcm450_gpio_irq_mask,
 	.irq_set_type =3D wpcm450_gpio_set_irq_type,
+	.flags =3D IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };

 static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
@@ -1068,9 +1070,8 @@ static int wpcm450_gpio_register(struct platform_dev=
ice *pdev,
 		gpio->gc.fwnode =3D child;
 		gpio->gc.add_pin_ranges =3D wpcm450_gpio_add_pin_ranges;

-		gpio->irqc =3D wpcm450_gpio_irqchip;
 		girq =3D &gpio->gc.irq;
-		girq->chip =3D &gpio->irqc;
+		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler =3D wpcm450_gpio_irqhandler;
 		girq->parents =3D devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
 					     sizeof(*girq->parents), GFP_KERNEL);
=2D-
2.35.1

