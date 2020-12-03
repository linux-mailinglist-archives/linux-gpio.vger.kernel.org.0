Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999342CDD9E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 19:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgLCS1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 13:27:03 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:45311 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbgLCS1C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 13:27:02 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N63NW-1k5H3A3mUC-016QPv; Thu, 03 Dec 2020 19:24:25 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com, m@bues.ch,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/3] drivers: gpio: amd8111: prefer dev_err()/dev_info() over raw printk
Date:   Thu,  3 Dec 2020 19:24:22 +0100
Message-Id: <20201203182423.5499-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201203182423.5499-1-info@metux.net>
References: <20201203182423.5499-1-info@metux.net>
X-Provags-ID: V03:K1:NPQYOay/O7xWfZswY6hsysAxuOGoo3irixtnjIU4Q0p8Mv/Vjo+
 X7TtAMFtkiJypubtvOtkkw+JBTT2m4zA2g70R0oDjuLXU2fwHTcTcDLCcr8NAgW21TVQ4b4
 PEeT+jAlAVRXBh4NNWIpEgmqp6dqJIHYQ1HrqVrQg3+C+jp28kPHPqDOwmt00PTQsiGdkHX
 Q3kiTlq4GPb1P9+QryG5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xaEchQnbeUM=:RyJ4VSBt+MeAVIv0i8BtHj
 IDOPF+oWEc9x/T1UV8fVoEUG6K7dqrfunTXtA40jtjW7h66dvMsw0+e66Sto00gYGgmKlyEgR
 M24++lIw38azruN9PEb9sTrvwZDzapg1tRid/gh3unMZnlmnoxAekyjjkiszCDGUYWYp1nvhW
 qGYUEJLpctxYXcZPWyMdb6tyeeFrvTJNJ8c95Xk9gyfc6Gqmy8cNsTJYWySwhEgMHRZC0gygj
 vOoSLi0KD+3eAdDWhciuttnf4inP+0XmiW9ax2nEv/yV095G3g/jxmb02FAb1zUi64Zb46Ncx
 co24Mjf974AQFIXTQx1DiNIu5BEhkoZ2h09fZ1QfkX+EB2m8qxa/q30m8vnu4W4lFe9mm7deL
 IGULEHo0D8C+8CKF+Yq4yj3Hje/Vnu+gsceUzAS/Nm50X/YzUr1W/64+g6ZW/
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For logging in device contexts, dev_*() functions are preferred over
raw printk(), which also print out device name.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-amd8111.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index fdcebe59510d..0e260950992d 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -179,7 +179,6 @@ static int __init amd_gpio_init(void)
 	struct pci_dev *pdev = NULL;
 	const struct pci_device_id *ent;
 
-
 	/* We look for our device - AMD South Bridge
 	 * I don't know about a system with two such bridges,
 	 * so we can assume that there is max. one device.
@@ -223,11 +222,10 @@ static int __init amd_gpio_init(void)
 
 	spin_lock_init(&gp.lock);
 
-	printk(KERN_INFO "AMD-8111 GPIO detected\n");
+	dev_info(&pdev->dev, "AMD-8111 GPIO detected\n");
 	err = gpiochip_add_data(&gp.chip, &gp);
 	if (err) {
-		printk(KERN_ERR "GPIO registering failed (%d)\n",
-		       err);
+		dev_err(&pdev->dev, "GPIO registering failed (%d)\n", err);
 		ioport_unmap(gp.pm);
 		goto out;
 	}
-- 
2.11.0

