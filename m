Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06D21166E7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 07:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfLIG1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 01:27:31 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58076 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfLIG1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2019 01:27:30 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB96RSuW040218;
        Mon, 9 Dec 2019 00:27:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575872848;
        bh=7hvhhN/6YoaOIPBhtvUMCaNZZpkzI6k17aeCBBhi1eM=;
        h=From:To:CC:Subject:Date;
        b=ax4rUGAKP5K+2xiPQAjAcd3sycahAD+ZHe1nyic9+82PCNwZiDtlYrVLiXU49vSEM
         Ohbd0Xmik3QPQLHM0oVtKLd7udQ7fXfdUS+RWOvYltVlJL00kp6bE4oFhd+lViQXTC
         +UBHdYPnCTPH4rZXC3HqeSZ5ML9UfCYnH8ZWCc8A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB96RSJn064117
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 00:27:28 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 00:27:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 00:27:28 -0600
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB96RQMf043836;
        Mon, 9 Dec 2019 00:27:26 -0600
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2] gpio: pca953x: Don't hardcode irq trigger type
Date:   Mon, 9 Dec 2019 11:57:49 +0530
Message-ID: <20191209062749.26429-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Don't hardcode irq trigger to IRQF_TRIGGER_LOW while registering IRQ
handler. IRQ/platform core will take care of setting appropriate trigger
type.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
v2:
Drop explicit call to irq_get_trigger_type() as this is take care of in core
code.

 drivers/gpio/gpio-pca953x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6652bee01966..40e48f7d83bb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -770,8 +770,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 
 	ret = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, pca953x_irq_handler,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
-					IRQF_SHARED,
+					IRQF_ONESHOT | IRQF_SHARED,
 					dev_name(&client->dev), chip);
 	if (ret) {
 		dev_err(&client->dev, "failed to request irq %d\n",
-- 
2.24.0

