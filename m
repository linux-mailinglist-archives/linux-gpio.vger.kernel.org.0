Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A602F1A1F76
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 13:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgDHLJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 07:09:41 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33052 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728081AbgDHLJl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 07:09:41 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A9CB520144F;
        Wed,  8 Apr 2020 13:09:39 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 31588201476;
        Wed,  8 Apr 2020 13:09:36 +0200 (CEST)
Received: from titan.ap.freescale.net (titan.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 938A5402D5;
        Wed,  8 Apr 2020 19:09:31 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     linux-devel@linux.nxdi.nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v1] gpio: mpc8xxx: Add shutdown function.
Date:   Wed,  8 Apr 2020 18:55:22 +0800
Message-Id: <20200408105522.18194-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

The shutdown function needed to make interrupt handler to be NULL
when kexec execute.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 604dfec..a24e6c5 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -446,9 +446,21 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int mpc8xxx_shutdown(struct platform_device *pdev)
+{
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
+
+	if (mpc8xxx_gc->irq) {
+		irq_set_chained_handler_and_data(mpc8xxx_gc->irqn, NULL, NULL);
+		irq_domain_remove(mpc8xxx_gc->irq);
+	}
+
+	return 0;
+}
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
 	.remove		= mpc8xxx_remove,
+	.shutdown	= mpc8xxx_shutdown,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
-- 
2.9.5

