Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FBF1F9853
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbgFONWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:22:35 -0400
Received: from goliath.siemens.de ([192.35.17.28]:37812 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbgFONWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:22:35 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 05FDMVpP013752
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 15:22:31 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.53.252])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05FDMT0r009427;
        Mon, 15 Jun 2020 15:22:31 +0200
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 2/2] gpio: pca953x: Add support for the PCAL9535
Date:   Mon, 15 Jun 2020 15:22:29 +0200
Message-Id: <eecfadcb92f9f9c1446b4824471e9d7f45a9d8aa.1592227348.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592227348.git.jan.kiszka@siemens.com>
References: <cover.1592227348.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

The PCAL9535 is compatible to the PCA9535. Additionally, it comes with
interrupt support and input latching. Other features are not supported
by the GPIO subsystem.

Datasheet: https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..cd5fb522563e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -89,6 +89,7 @@ static const struct i2c_device_id pca953x_id[] = {
 
 	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
@@ -1145,6 +1146,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 
 	{ .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
+	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
-- 
2.26.2

