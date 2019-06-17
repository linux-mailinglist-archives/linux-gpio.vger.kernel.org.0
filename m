Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35354894E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfFQQtk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:40 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39909 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbfFQQtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:24 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MNcYX-1i0FWj1aFn-00P21P; Mon, 17 Jun 2019 18:49:22 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 4/7] drivers: gpio: ep93xx: devm_platform_ioremap_resource()
Date:   Mon, 17 Jun 2019 18:49:17 +0200
Message-Id: <1560790160-3372-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
References: <1560790160-3372-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:H4qj98BbLOw+mGWAX5h5qWEEin3AlwZ525u9DEJ1MMHd94IDpsn
 JscsLMjH9VX6d6SYtBFBdId1yTeaw2CfElhPfxH2txNR+JhcirfbfoKacaFi8XeJwblTC2l
 bGe6lnOQghIaZsiXlLZT7tJtkOT9x5Vy3wR3rV6/yLqoRyn6LTHgj8v7lLKfFBqBaf5ieKd
 MtYsu+Qm4qUGiYh3WQepg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+rn2MCBHp40=:XmAcjRlG1LY/odOk1iCh8J
 XRlSIL6Xod1FloyyWAUvYMdROiw9lzRImHFuVpsiEFyukU4qVh2+Z1bF9YO98/ry9cTZTjQFB
 UwuKcsJzU9Pq4HLeCFi0bnN4yF6NdC/9WaAN/3h2nE+J8H1jpjRLYvseDvEwn2ROQoe7cvVjX
 /9robZRr70KzyDczwgob0FBg0KVwWLfQ0FMhP/GMISTC8OFzEdi8kOSyBdCAKrFqfiq2Mgn5a
 0J82EAd34uRKCr5C48sPKI1cc4jlDSK2DbotgpOYFeHX9znHE0zHIZZoIVkrHCDlTcYIHuK2u
 X8GUmKZso6kj++J9PjXrXK/4hUI9UFZ+G1edYUq8O2/8ctXQQTXRNSGnXDlhylzilh7SUbP/4
 8TMpKrEaMY0GD765Cj9RVeYtopMo25j4rMey9V8GnZ4ERWgVEwrds5Z3QKOW4d+k2LRIzDtAf
 VzJ45RsmaX/aekYZIkFvK57FkfgSlh/EyS1pHF91fmXwCkB5n4gTZqDj51HtwI+xtzw5RfnJe
 90gNMH+GjHIuHsgjl8Ypq+BayMgGvP0dVr5/WJznyevj88CRFPN70y6waZZhB01qkZjM4dqWz
 uXnf1ECoclUMH2AHcQ5knI0rYZlqIS+DNI1YaRBsT/ELhiob3A5MWIz+Jyn/CO4PzyYJm2s5Z
 2T0z0pbi//i66TSyBE0bcBxuf6O3GrVbN1W5M870k/Qy8hMGKh1oqpmbyGFRCbyGUKFxNRwWP
 F9jc5t5NRdJgcMODfkDwK8nB5wjGtWGFZe4Xcw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-ep93xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 71728d6..a90870a 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -393,16 +393,13 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
 static int ep93xx_gpio_probe(struct platform_device *pdev)
 {
 	struct ep93xx_gpio *epg;
-	struct resource *res;
 	int i;
-	struct device *dev = &pdev->dev;
 
-	epg = devm_kzalloc(dev, sizeof(*epg), GFP_KERNEL);
+	epg = devm_kzalloc(&pdev->dev, sizeof(*epg), GFP_KERNEL);
 	if (!epg)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	epg->base = devm_ioremap_resource(dev, res);
+	epg->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(epg->base))
 		return PTR_ERR(epg->base);
 
-- 
1.9.1

