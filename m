Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7560C1FDBD7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 03:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgFRBPE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 21:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729425AbgFRBPD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 21:15:03 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CA9E2193E;
        Thu, 18 Jun 2020 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442903;
        bh=VhUP5N88YIUjI9qfkLVrMa+Aua/Ag0rIGQN16DXGFuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kJ3JO3qMY2Bo13/tdeaXNsHqoyGamxk4Ar8DzTf0P564z4jYmD9VQl2pNBdBUyLgV
         4nH4TH2QmDRONqRdhU65Xtcojvv0zEXrT+Rm0oE6Ahi3piwGlFccFwMLeKxeQUy+7W
         xpLP7cydzIr2C6HXNAyNqtw9IhF9yiTdUlL4ZQaY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.7 323/388] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
Date:   Wed, 17 Jun 2020 21:07:00 -0400
Message-Id: <20200618010805.600873-323-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 9eb728321286c4b31e964d2377fca2368526d408 ]

When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
an error handling path has not been updated.

Axe a now unneeded 'pinctrl_unregister()'.

Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/20200530201952.585798-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index c00d0022d311..421f7d1886e5 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -638,7 +638,6 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 
 	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (ret) {
-		pinctrl_unregister(ipctl->pctl);
 		dev_err(&pdev->dev, "Failed to populate subdevices\n");
 		return ret;
 	}
-- 
2.25.1

