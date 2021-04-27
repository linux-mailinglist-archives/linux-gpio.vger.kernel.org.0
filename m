Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E47F36C32F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbhD0KZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 06:25:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58499 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbhD0KZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 06:25:13 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lbKtH-0003oc-Dr; Tue, 27 Apr 2021 10:24:27 +0000
From:   Colin King <colin.king@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpio: sim: Fix dereference of free'd pointer config
Date:   Tue, 27 Apr 2021 11:24:27 +0100
Message-Id: <20210427102427.11066-1-colin.king@canonical.com>
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
 drivers/gpio/gpio-sim.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2e2e6399e453..7bba5783a043 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -751,8 +751,10 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
 
 	config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
 	if (config->id < 0) {
+		int id = config->id;
+
 		kfree(config);
-		return ERR_PTR(config->id);
+		return ERR_PTR(id);
 	}
 
 	config_item_init_type_name(&config->item, name,
-- 
2.30.2

