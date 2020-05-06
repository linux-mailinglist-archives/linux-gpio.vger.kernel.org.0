Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A6C1C6E15
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2020 12:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgEFKJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 May 2020 06:09:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgEFKJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2020 06:09:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C2D9B2A234E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        linus.walleij@linaro.org, heiko@sntech.de
Subject: [PATCH] pinctrl: rockchip: fix memleak in rockchip_dt_node_to_map
Date:   Wed,  6 May 2020 12:09:03 +0200
Message-Id: <20200506100903.15420-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In function rockchip_dt_node_to_map, a new_map variable is
allocated by:

new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
		       GFP_KERNEL);

This uses devres and attaches new_map to the pinctrl driver.
This cause a leak since new_map is not released when the probed
driver is removed. Fix it by using kcalloc to allocate new_map
and free it in `rockchip_dt_free_map`

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index a9299f0bd21e..c07324d1f265 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -508,8 +508,8 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	map_num += grp->npins;
-	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
-								GFP_KERNEL);
+
+	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
@@ -519,7 +519,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 	/* create mux map */
 	parent = of_get_parent(np);
 	if (!parent) {
-		devm_kfree(pctldev->dev, new_map);
+		kfree(new_map);
 		return -EINVAL;
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
@@ -546,6 +546,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
 				    struct pinctrl_map *map, unsigned num_maps)
 {
+	kfree(map);
 }
 
 static const struct pinctrl_ops rockchip_pctrl_ops = {
-- 
2.17.1

