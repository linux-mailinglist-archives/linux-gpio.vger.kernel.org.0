Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2072636C592
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 13:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbhD0Luf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 07:50:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60989 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0Luf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 07:50:35 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lbMDu-0001qZ-GF; Tue, 27 Apr 2021 11:49:50 +0000
From:   Colin King <colin.king@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] gpio: sim: Fix dereference of free'd pointer config
Date:   Tue, 27 Apr 2021 12:49:50 +0100
Message-Id: <20210427114950.12739-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return of config->id dereferences the kfree'd object config.
Fix this by using a temporary variable for the id to avoid this issue.

Addresses-Coverity: ("Read from pointer aftyer free")
Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Don't make id local to the if statement to improve coding style.
    Thanks to Bartosz Golaszewski for this improvement suggestion.
---
 drivers/gpio/gpio-sim.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2e2e6399e453..b21541c0b700 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -744,20 +744,22 @@ static struct config_item *
 gpio_sim_config_make_item(struct config_group *group, const char *name)
 {
 	struct gpio_sim_chip_config *config;
+	int id;
 
 	config = kzalloc(sizeof(*config), GFP_KERNEL);
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
-	config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
-	if (config->id < 0) {
+	id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+	if (id < 0) {
 		kfree(config);
-		return ERR_PTR(config->id);
+		return ERR_PTR(id);
 	}
 
 	config_item_init_type_name(&config->item, name,
 				   &gpio_sim_chip_config_type);
 	config->num_lines = 1;
+	config->id = id;
 	mutex_init(&config->lock);
 
 	return &config->item;
-- 
2.30.2

