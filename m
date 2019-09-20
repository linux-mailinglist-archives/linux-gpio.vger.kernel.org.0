Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674E5B8FA1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2019 14:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408830AbfITMUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 08:20:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47652 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408804AbfITMUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 08:20:36 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iBHtm-0006GF-AQ; Fri, 20 Sep 2019 12:20:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        YueHaibing <yuehaibing@huawei.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctl: ti: iodelay: fix error checking on pinctrl_count_index_with_args call
Date:   Fri, 20 Sep 2019 14:20:30 +0200
Message-Id: <20190920122030.14340-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to pinctrl_count_index_with_args checks for a -EINVAL return
however this function calls pinctrl_get_list_and_count and this can
return -ENOENT. Rather than check for a specific error, fix this by
checking for any error return to catch the -ENOENT case.

Addresses-Coverity: ("Improper use of negative")
Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index e5e7f1f22813..b522ca010332 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -496,7 +496,7 @@ static int ti_iodelay_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	rows = pinctrl_count_index_with_args(np, name);
-	if (rows == -EINVAL)
+	if (rows < 0)
 		return rows;
 
 	*map = devm_kzalloc(iod->dev, sizeof(**map), GFP_KERNEL);
-- 
2.20.1

