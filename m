Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AE43CB58D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236476AbhGPKER (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:17 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62519 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236456AbhGPKEQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429682; x=1657965682;
  h=from:to:cc:subject:date:message-id;
  bh=OVIn+WAih8VImb6EEANT4piMsgYoUn9ccyYxp5CvlJc=;
  b=SAsnM/oQBvzKU6cqcvhA37EgQdlt65XZLfwIoOtKTqPV3mDQNi0sPr//
   ssAS2Jgu8ohhl9kS7o1TLM9uMACQmEENAWGfTaYByjcxYMlW+INY0uO/z
   JGeH1RiwJQ0qitaZj8zWN0e+xZDaRN3+RtQZty+A0zFqP0c40Fncl9r5q
   6Y2nshxkbcFlCvBac1kEwuXlfteVgYQjZrBpfnj6eR3dBxQiYRYo8qIDv
   Sv+NY13OXQYji54mLH65/JjsuOd7e+HIJVtStgCi7W/D6+3TdJY44OCRb
   ZUcdzYEj8zUPKX8IOWm25IBDVGRKRX7QyDIZjUmAN3bPE7WjaeY534kPw
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492072"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429678; x=1657965678;
  h=from:to:cc:subject:date:message-id;
  bh=OVIn+WAih8VImb6EEANT4piMsgYoUn9ccyYxp5CvlJc=;
  b=SexeZxzgmxv8Rx9u54DKnwyz1eB9PYvRBxtCIHVgz95VC1MDiyKRUKRo
   +hOb7GYSdooppT8ebpzgHhBQAkcti//9FSy/Vqs4T1dYD6gXgY3YoIhlw
   xOg7e8oOGzZnHOFJRxXN33WXOVnlGAP8SAzah/ugVBn4scEZiZcfdKVkD
   lOsmikEWkltZD8SzmiJ01l4lXX4IANtZuWp5C1+HYyf7uh5vV6jXYSe26
   uc9xF5YyEvxnRP7ZEO6sE9i9fpZPKtjH68sIpQi2ADDrN10TRcR/XeQeh
   AJzucQmEUHgYwPYx4SqYs7qy8tJ3raK4PzCboPRPG2mp2KV62BsYf0l54
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492071"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 7DC44280075;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 4/7] mfd: tqmx86: fix typo in "platform"
Date:   Fri, 16 Jul 2021 12:00:50 +0200
Message-Id: <9f816abe843b0ccac1cef2be7e78359a22b22073.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename variable from "ocores_platfom_data" to "ocores_platform_data".

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: new patch
v3: new patch

 drivers/mfd/tqmx86.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 9b65dbedc1bb..ff1bdb742e3f 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -76,7 +76,7 @@ static struct i2c_board_info tqmx86_i2c_devices[] = {
 	},
 };
 
-static struct ocores_i2c_platform_data ocores_platfom_data = {
+static struct ocores_i2c_platform_data ocores_platform_data = {
 	.num_devices = ARRAY_SIZE(tqmx86_i2c_devices),
 	.devices = tqmx86_i2c_devices,
 };
@@ -84,8 +84,8 @@ static struct ocores_i2c_platform_data ocores_platfom_data = {
 static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
 	{
 		.name = "ocores-i2c",
-		.platform_data = &ocores_platfom_data,
-		.pdata_size = sizeof(ocores_platfom_data),
+		.platform_data = &ocores_platform_data,
+		.pdata_size = sizeof(ocores_platform_data),
 		.resources = tqmx_i2c_soft_resources,
 		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
 	},
@@ -209,7 +209,7 @@ static int tqmx86_probe(struct platform_device *pdev)
 		tqmx_gpio_resources[0].flags = 0;
 	}
 
-	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
+	ocores_platform_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
 
 	if (i2c_det == TQMX86_REG_I2C_DETECT_SOFT) {
 		err = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-- 
2.17.1

