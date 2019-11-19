Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B767D102532
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 14:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKSNKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 08:10:45 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51484 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKSNKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 08:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xdwn8S8QXOXCjALSV7rEIUjew9DMjqUMbJ1psI3VZVM=; b=cg6Gd3jGN4RSjdUh39a06nSVSn
        z4g793sNAMYcqKL1gMXKsy/S67fOTON4XDPAwzkDHwfeINMHgt6KxCNzMIgSdbWK9g1vUGeKYXyXa
        k4B9uiZEMEF/1TdRlS/FLpykxbYww5OyYNiWcC3Fi2KGuBMvMTYrZhZxxuHLcIsQkom0/x8ihRYOU
        yBvWDN//auc+e7BbSN3j6rz8eBO+UCPbGhb+2cZ/DH+aXE6Dy8AMx1kicC9PXcMZEvHRFBjO381TQ
        BPt2lZthATF6JKKPef6bv+cETUfgl2hZ92WvV1k06yf7OckG+z4kGEVoKfmnQkY7jeEHQ4c79yz7S
        eFgfIdTA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:35112 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iX3HD-0001U2-Oo; Tue, 19 Nov 2019 13:10:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iX3HC-00069N-0T; Tue, 19 Nov 2019 13:10:38 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio/mpc8xxx: fix qoriq GPIO reading
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1iX3HC-00069N-0T@rmk-PC.armlinux.org.uk>
Date:   Tue, 19 Nov 2019 13:10:38 +0000
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qoriq requires the IBE register to be set to enable GPIO inputs to be
read.  Set it.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpio-mpc8xxx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5d9412..c7ac14f06837 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -32,6 +32,7 @@
 #define GPIO_IMR		0x10
 #define GPIO_ICR		0x14
 #define GPIO_ICR2		0x18
+#define GPIO_IBE		0x18
 
 struct mpc8xxx_gpio_chip {
 	struct gpio_chip	gc;
@@ -357,6 +358,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	gc->to_irq = mpc8xxx_gpio_to_irq;
 
+	if (of_device_is_compatible(np, "fsl,qoriq-gpio"))
+		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
 	if (ret) {
 		pr_err("%pOF: GPIO chip registration failed with status %d\n",
-- 
2.20.1

