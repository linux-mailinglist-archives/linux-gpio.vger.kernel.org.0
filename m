Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23A7118E0B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 17:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfLJQoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 11:44:54 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40944 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbfLJQox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 11:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575996291; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=Yr6/VS+jagRoWwD7pseE/w8pqhWnmY5HA9IgqzhlO6E=;
        b=R+wBcWNqvJZOwNxHG7BBsm+aWggVxuqzQuVp1AU8gQ8CRhV48w5ZiWWhJ/M0uFsP8BGOUR
        Rt3JYWr1b+Q+mDWTlfqAxxl+P+JUqho6uFTzNwmGMkXTT/MuVdxTaL8bekzwj9+dRgRLLh
        GgHzR00spYQQO7yHVNnls4PspNd5VaY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Fixup PIN_CONFIG_OUTPUT config
Date:   Tue, 10 Dec 2019 17:44:46 +0100
Message-Id: <20191210164446.53912-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

JZ4760 support was added in parallel of the previous patch so this one
slipped through. The first SoC to use the new register is the JZ4760 and
not the JZ4770, fix it here.

Fixes: 7009d046a601 ("pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT
config")

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    The commit it fixes was added in v5.5-rc1, so I didn't Cc
    linux-stable - I wasn't sure if I had to.

 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 24e0e2ef47a4..369e04350e3d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1809,7 +1809,7 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
 				     unsigned int pin, bool high)
 {
-	if (jzpc->version >= ID_JZ4770)
+	if (jzpc->version >= ID_JZ4760)
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, high);
 	else
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
-- 
2.24.0

