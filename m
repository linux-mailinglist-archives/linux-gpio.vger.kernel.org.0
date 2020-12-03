Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E172CDD9C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 19:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgLCS1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 13:27:01 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48593 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbgLCS1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 13:27:01 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M42fG-1kktHE2PNQ-00035r; Thu, 03 Dec 2020 19:24:24 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com, m@bues.ch,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/3] drivers: gpio: bt8xx: prefer dev_err()/dev_warn() over of raw printk
Date:   Thu,  3 Dec 2020 19:24:21 +0100
Message-Id: <20201203182423.5499-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:ork4hdHpaaosunrFdJfmk8/tL63KrIVOMkn2G2YULcn042vLnu2
 e8QR8CzEbnfieHb1AY0q4DamOuMQydQ69EvnNMEaPCUf2+Rtjtzh6xY6FnhGrgfvUChA1D/
 +d1u+s9KjMap/lyWDNdFOIFccTjeXnj5woSv6LZSONgFfZHRzP/ZdDmn6azMeBEARXwO24L
 yQBcXiff9A4AKsSNKyxUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZShIZ9xpTqo=:TuUGsPdW/aTRv2/HfKukZw
 zPX72Cpv7RpyXOOFP2AnAovZwAPoKPPk43CLz6gExatx8aJt5J7+oMzuRd17O6XqbCvH1WS/B
 oPTg1bGXgmsT+JXAm4tjqeFfWc8TBqGeuy20jXyw7GQXkKXupe1+/bne9yNpvxsKNjFVgjNjT
 R7TJx92sQJbGkI/QR5Rq4TURITYfw4sO9gpgbMNhQTp2oRNGZvnMmN8la1kd7yipLg1D89r1H
 AT0Nl5CDdyt8WHyQbeN623Pqr1mjhfE7NWjiRyR7B+/iLmpH01kUNdto5JLdjlpxp+qnrAEBJ
 YLEMHEhbV6Dda1oAu/627n+FAFoLO3cNwI+HeuU+4kQ3IcY4bXoXTQAR+PjfW924BAvTVSsfm
 M9OnBXOQCNZU8UnUGpeIlJjRi/JbaEOjX8xL+DMA25zPyj4pR6RSwebS/+Vpf
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For logging in device contexts, dev_*() functions are preferred over
raw printk(), which also print out device name.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-bt8xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index a6f30ad6750f..7920cf256798 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -175,13 +175,13 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 
 	err = pci_enable_device(dev);
 	if (err) {
-		printk(KERN_ERR "bt8xxgpio: Can't enable device.\n");
+		dev_err(&dev->dev, "can't enable device.\n");
 		return err;
 	}
 	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
 				pci_resource_len(dev, 0),
 				"bt8xxgpio")) {
-		printk(KERN_WARNING "bt8xxgpio: Can't request iomem (0x%llx).\n",
+		dev_warn(&dev->dev, "can't request iomem (0x%llx).\n",
 		       (unsigned long long)pci_resource_start(dev, 0));
 		err = -EBUSY;
 		goto err_disable;
@@ -191,7 +191,7 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 
 	bg->mmio = devm_ioremap(&dev->dev, pci_resource_start(dev, 0), 0x1000);
 	if (!bg->mmio) {
-		printk(KERN_ERR "bt8xxgpio: ioremap() failed\n");
+		dev_err(&dev->dev, "ioremap() failed\n");
 		err = -EIO;
 		goto err_disable;
 	}
@@ -207,7 +207,7 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 	bt8xxgpio_gpio_setup(bg);
 	err = gpiochip_add_data(&bg->gpio, bg);
 	if (err) {
-		printk(KERN_ERR "bt8xxgpio: Failed to register GPIOs\n");
+		dev_err(&dev->dev, "failed to register GPIOs\n");
 		goto err_disable;
 	}
 
-- 
2.11.0

