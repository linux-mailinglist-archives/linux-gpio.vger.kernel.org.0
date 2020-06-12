Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3581F77A7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgFLMGc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 08:06:32 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:53832 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgFLMGc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 08:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1591963590; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=VD1lYp851tEOX4dOM9B2+TveG6z7jeQIId2w1xa70ys=;
        b=WxrqkciNWOfuttyELtwbtPk+/F1p08zytlofkozjNh8fy99rVkwry5GyUjT1OaqmWU5sQE
        h+b3nUvdnK1PuB7zF7DqU32ERmz7aKbElGFOgC9ftssBV88AFPx9hqA/Nyn3hFIyAhqTEw
        vIuWV8cKeBjgEBBtfh+Oud9iIjhRydM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Add ingenic,jz4725b-gpio compatible string
Date:   Fri, 12 Jun 2020 14:06:09 +0200
Message-Id: <20200612120609.12730-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a compatible string to support the GPIO chips on the JZ4725B SoC.
There was already a compatible string for the pinctrl node, but not for
the individual GPIO chip nodes.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    The Ingenic pinctrl devicetree documentation will be properly
    updated in a separate patchset.

 drivers/pinctrl/pinctrl-ingenic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6a8d44504f94..0f624ba7075d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2292,6 +2292,7 @@ static const struct regmap_config ingenic_pinctrl_regmap_config = {
 
 static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-gpio", },
+	{ .compatible = "ingenic,jz4725b-gpio", },
 	{ .compatible = "ingenic,jz4760-gpio", },
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
-- 
2.27.0

