Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30B21B38E2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 09:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgDVH0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 03:26:31 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:43461 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725835AbgDVH0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 03:26:31 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03M7N7HW011031;
        Wed, 22 Apr 2020 09:26:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1+5xkmnA8W6QptUcwhFWn9YtwM/YXjxNNMsTAJBIfEM=;
 b=Bd5qUb++FiFVOunvFEwhZc7zisQoWSXHZ6R/WOpl7qH+66fZ1EtKjrUGduXhQsbOXe/u
 otpekOh2JcN9F5zhBmsEJRvxzHM78P/tMpHqAiBvvz5LBeLUO8SgsXyO6sCAtumsJ73q
 WB01MOuGPOX/uSizQZOyDt1sLSGyrwf+umgo+qPQyXgTHu7JG9Kl63GMVcOgtTwioMJT
 I+Dq7BbUS7NgoNSnsLR1WBxEpUiU9MHcmAob9f7pYOQw13pgqbPFZ9fjzdJ7GqxCRih/
 dzTv8JQESHLxSLkot/M96O1SJUBXM+gKjKOpDuiZrh5JB9QZUAEoI5sq2EEuan8M5rTe 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fqawcp9t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Apr 2020 09:26:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E61F10002A;
        Wed, 22 Apr 2020 09:26:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F192F212A5F;
        Wed, 22 Apr 2020 09:26:19 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Apr 2020 09:25:14
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/1] pinctrl: stmfx: stmfx_pinconf_set doesn't require to get direction anymore
Date:   Wed, 22 Apr 2020 09:25:13 +0200
Message-ID: <20200422072513.8352-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-22_02:2020-04-21,2020-04-22 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin direction is not used to set pin configuration.

Fixes: a502b343ebd0 ("pinctrl: stmfx: update pinconf settings")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 60100b45f5e5..1aae803c12cd 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -288,7 +288,7 @@ static int stmfx_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	struct pinctrl_gpio_range *range;
 	enum pin_config_param param;
 	u32 arg;
-	int dir, i, ret;
+	int i, ret;
 
 	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
 	if (!range) {
@@ -296,10 +296,6 @@ static int stmfx_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		return -EINVAL;
 	}
 
-	dir = stmfx_gpio_get_direction(&pctl->gpio_chip, pin);
-	if (dir < 0)
-		return dir;
-
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
-- 
2.17.1

