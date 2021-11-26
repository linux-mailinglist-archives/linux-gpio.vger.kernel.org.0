Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5572145F086
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 16:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378037AbhKZPZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 10:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378049AbhKZPXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 10:23:07 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885D4C06139C;
        Fri, 26 Nov 2021 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=8pc6wenaS6YAPAESN8lcSW+nzlJ+wUHkM23DdCXDUPI=; b=nc
        bHZ30ylo71HCEHK+uBOQKh2Shpj2pl8TRL5IY2VIcvrhW1kjYleG4bRZwIK+r2d2U5Xm2LXWOBv+M
        NqoUnI6ZpB+tPPLdB+lNKSaXmqwHdSUov/L8yMfm2XKUBEgl1pbRj3/vMQqXb1DtkD8IhJYNcBgXY
        XeXQxoyYuzjka/XZrdWDy9qVnitCCxOxP2mXe1fV1vWY6oHLNB/xWU/vQAlOY/BCeYYpxh/Pqgt8S
        gaR8LyAXeZYEh0A3IhJwKh6n6GK2dOYQVI3USiuxuRmU5Koma+uGhWVeTyKnb/6YsA//0zqEJA/E2
        VCXOI+bu0dFif6KDPhL6q7Cyh/tdVjnA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mqcvG-0007c2-5e; Fri, 26 Nov 2021 15:13:58 +0000
From:   John Keeping <john@metanate.com>
To:     linux-gpio@vger.kernel.org
Cc:     John Keeping <john@metanate.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl/rockchip: fix gpio device creation
Date:   Fri, 26 Nov 2021 15:13:52 +0000
Message-Id: <20211126151352.1509583-1-john@metanate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO nodes are not themselves busses, so passing rockchip_bank_match
here is wrong.  Passing NULL instead uses the standard bus match table
which is more appropriate.

devm_of_platform_populate() shows that this is the normal way to call
of_platform_populate() from a device driver, so in order to match that
more closely also add the pinctrl device as the parent for the newly
created GPIO controllers.

Specifically, using the wrong match here can break dynamic GPIO hogs as
marking the GPIO bank as a bus means that of_platform_notify() will set
OF_POPULATED on new child nodes and if this happens before
of_gpio_notify() is called then the new hog will be skipped as
OF_POPULATED is already set.

Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 438808a867cf..d8dd8415fa81 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2735,7 +2735,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, info);
 
-	ret = of_platform_populate(np, rockchip_bank_match, NULL, NULL);
+	ret = of_platform_populate(np, NULL, NULL, &pdev->dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register gpio device\n");
 
-- 
2.34.1

