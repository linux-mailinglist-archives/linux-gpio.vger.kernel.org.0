Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3496162092
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 06:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgBRFzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 00:55:12 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48036 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgBRFzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 00:55:11 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I5qpDZ105153;
        Tue, 18 Feb 2020 05:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=IUr6jZsezb+fPkgPfiPdUUYiWsKMcfm6EbBIGof+6oA=;
 b=PK39BrMLc6gyWoGe93OJAJ5/c7rEItWyQbLmye6KgruMmJzCHHizXRiG+q9gIweRk1Yd
 IBDpuAyDcOP0sai4qz6CY4GEXf1Xyrf6376tM89FQBEWiOF0GemdAwR4DbXOBt6Sg9rM
 cH+GFfKdJS1CZxJ7ttZQqgrs0YrSOqVvpHTzqyetabGvYT0ZtP6mfLWNh0MRybpEni5J
 YWvd2b+G3HQ7tRI1bp7J9Hf7VQJkaVYVQOJtdpascU+phVDNZkH3CYaTNE0qI49WO53D
 C4a3/+P9VmD6OD+AuAefjk7oC8ejTUSEz6z7CNKLDBUtE3z45XKhYmoy7uzz8oYAocY+ LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2y7aq5pegg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Feb 2020 05:54:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I5qj0F168146;
        Tue, 18 Feb 2020 05:52:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2y82c0sry3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Feb 2020 05:52:57 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01I5qumb020042;
        Tue, 18 Feb 2020 05:52:56 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Feb 2020 21:52:55 -0800
Date:   Tue, 18 Feb 2020 08:52:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Fix some off by one bugs
Message-ID: <20200218055247.74s2xa7veqx2do34@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=978
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180047
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These comparisons should be >= instead of > to prevent accessing one
element beyond the end of the hw->soc->pins[] array.

Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 83bf29c7ce7e..53f8a14fe542 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -544,7 +544,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -583,7 +583,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -766,7 +766,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -784,7 +784,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -801,7 +801,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -813,7 +813,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	return pinctrl_gpio_direction_input(chip->base + gpio);
@@ -824,7 +824,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	mtk_gpio_set(chip, gpio, value);
-- 
2.11.0

