Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9CC1C50BC
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 10:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgEEIpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 04:45:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:41140 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgEEIpS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 May 2020 04:45:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E94A4ADD5;
        Tue,  5 May 2020 08:45:18 +0000 (UTC)
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH] gpio: tegra186: export MODULE_DEVICE_TABLE
Date:   Tue,  5 May 2020 10:45:01 +0200
Message-Id: <20200505084501.13170-1-ykaukab@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export MODULE_DEVICE_TABLE since the driver can be built as a module.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 drivers/gpio/gpio-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 79b553dc39a3..178e9128ded0 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -894,6 +894,7 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
 
 static struct platform_driver tegra186_gpio_driver = {
 	.driver = {
-- 
2.25.0

