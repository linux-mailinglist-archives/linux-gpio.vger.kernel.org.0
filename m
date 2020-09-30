Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF627E504
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgI3JVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:21:33 -0400
Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.119]:58938 "EHLO
        atl4mhfb03.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729158AbgI3JVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 05:21:33 -0400
Received: from jax4mhob17.registeredsite.com (jax4mhob17.registeredsite.com [64.69.218.105])
        by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id 08U9LSIv029984
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 05:21:31 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail01pod0.registeredsite.com [10.30.71.203])
        by jax4mhob17.registeredsite.com (8.14.4/8.14.4) with ESMTP id 08U9L874175289
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 05:21:08 -0400
Received: (qmail 32270 invoked by uid 0); 30 Sep 2020 09:20:59 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 30 Sep 2020 09:20:59 -0000
From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 2/2] gpio: pca953x: Add support for the NXP PCAL9554B/C
Date:   Wed, 30 Sep 2020 11:20:53 +0200
Message-Id: <20200930092053.2114-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930092053.2114-1-mike.looijmans@topic.nl>
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
with 8 GPIOs, latched interrupts and some advanced configuration
options. The "C" version only differs in I2C address.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2: Split devicetree and code into separate patches

 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index bd2e96c34f82..fb946b01512d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -90,6 +90,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
@@ -1237,6 +1238,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
+	{ .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
-- 
2.17.1

