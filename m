Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1B21C6E25
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2020 12:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgEFKOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 May 2020 06:14:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52822 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgEFKOf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2020 06:14:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 975E82A235E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        linus.walleij@linaro.org, heiko@sntech.de
Subject: [PATCH] pinctrl: rockchip: return ENOMEM instead of EINVAL if allocation fails
Date:   Wed,  6 May 2020 12:14:24 +0200
Message-Id: <20200506101424.15691-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function rockchip_pinctrl_parse_dt returns -EINVAL if
allocation fails. Change the return error to -ENOMEM

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 098951346339..a9299f0bd21e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2940,14 +2940,14 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 					      sizeof(struct rockchip_pmx_func),
 					      GFP_KERNEL);
 	if (!info->functions)
-		return -EINVAL;
+		return -ENOMEM;
 
 	info->groups = devm_kcalloc(dev,
 					    info->ngroups,
 					    sizeof(struct rockchip_pin_group),
 					    GFP_KERNEL);
 	if (!info->groups)
-		return -EINVAL;
+		return -ENOMEM;
 
 	i = 0;
 
-- 
2.17.1

