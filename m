Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9873BA051
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbhGBM0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:41 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42419 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232180AbhGBM0k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228648; x=1656764648;
  h=from:to:cc:subject:date:message-id;
  bh=5eBKJK+/7yccBTR+CWndE21pD0OcZAqPQFk3FO/jEQU=;
  b=o6gxl2hCpS4OAihErLy9TLPm7t9oednOfoZb6LuSDsO2yymxtzbMklMR
   HF5RvMo0b0K4BhHr33zZ9IQkktHjt/Ww7S0EU6nNdcTTEMZ1SQpWPTURq
   +gbT2KfYGK+V8+FFnHD1qKeWTCQuQHsSD9/OodoxVtBHftKb7E5oNIyIU
   km6ehsP0kVPNwhgpObgg8c+lxwoEfW8XrSbZEWCJqeDEkge1h12aopAPR
   9IEv4BSw1rqM6kRA/VjRgIrjcSxwJoCXCKPk9mdjGqmLG4zVAFaaTMFdq
   3zfV6gX0nzVHs5K4hUSIbF8o/il2szviO8IGw/T/2rcHkOV7UgwWIVtrr
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252574"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228645; x=1656764645;
  h=from:to:cc:subject:date:message-id;
  bh=5eBKJK+/7yccBTR+CWndE21pD0OcZAqPQFk3FO/jEQU=;
  b=njHDBg280tJ3Dt5zP7F0rsJrTqfOIqyRdkq1O8yc4E2VfWtwNl5TgdOy
   /oITv0viAAQ4GleWuXCKhRrdzeHZg8X05C6y/ePHw3zmVPSfJT1ti9kVh
   j+qCo9DSULVcQ6FHdlCplgs2hqEAc4YM499cmM9T+0Lyfbvt4fKshd9SO
   weXcq28XOcH7Hebi7h4U5CunggpJJAiryNSYNRhFWYdUMq0MBKe1JOxzh
   5LOgq88ULUBJW+UjmnurTfCuDs+JT0ZUtpEgZHdR610v2hXKlgqxutZJG
   Xf3XEVgbbqxZxz4XzKwJz2PQeOv/2lkv25dqXBODkJKQyfpy3uRjn/xBw
   w==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252573"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 0CC53280075;
        Fri,  2 Jul 2021 14:24:05 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 4/7] mfd: tqmx86: fix typo in "platform"
Date:   Fri,  2 Jul 2021 14:23:50 +0200
Message-Id: <7c689191a76ddf0f18ff14989651038f509f1746.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename variable from "ocores_platfom_data" to "ocores_platform_data".

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: new patch

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

