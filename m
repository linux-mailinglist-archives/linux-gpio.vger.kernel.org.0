Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A01A48824
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfFQQAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:00:15 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:35467 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbfFQQAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:00:15 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MJmX3-1hwUCa0G4H-00KAdJ; Mon, 17 Jun 2019 18:00:13 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] drivers: gpio: amd-fch: drop unused pdev pointer in privata data
Date:   Mon, 17 Jun 2019 18:00:11 +0200
Message-Id: <1560787211-15443-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560787211-15443-1-git-send-email-info@metux.net>
References: <1560787211-15443-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:zmcK5fvi08/8UDVJcdm44zcSqaLqQ/FROiRTi7HBymvVHVTFLlo
 5Dph5dSwFlb/l7JjxsHzqziQYayk3xt4drsQ/I3fbO5aHJM2qQC3k9daDfwZAiS1y012Ml7
 D4McUm4K50gfkxwNpCMbLtK5owfhiEAqNgfVwRZHqV5zdz/95Q0F7MDnPqDq86vhUO0qpJG
 gNDzk3k/4QjhRb3/Hd0GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SdjRqnOVkFU=:T9xwUzpwcg2iA6pN0Dt8dn
 t6xleEr9k1xw80trPlkF6hOM6wt7JxrQFZXwZb1pJkKsfAGdynyQf927Jco9uAQTMpb4U1TES
 LkcQK0kvRrd8rzewqOa6kKi/Uk4h/xvAeSDq+KKKBkXYsEVpe+D8GMJqeokGxieIH9RjXpsIl
 tL6wCMrcK76RCGF8DzDWKR9J8jd83i4K5gGH0V+Ye7rtfcs/OGws7XBQM15TVF3yUOzOKRXXG
 8N6uWcTY0yIWZ3S+Q+0g4u2ZRHgPvR5yuaB1wxkQ/0lIVAYHG69DYUsxQOobmFhi0e/IIr1PO
 f8+uJv2jOi743IdCJfW3BAlPm6/XRKUFdNYaLb4RdzX5BHR05aNvaAbRfY32EuewX8RnSKOnO
 JUhngr2ZK0xEQC5IWl++wyss+N8rp6iD2kidHMQu4uy8fnLiBOqOK6QLopDx+xTqNnlA2WfcL
 Qwx8i9zdfTz7BL1sYoKRjg7Jvg5QrScmYchZVTtPABZYinpuxf/u6Vg8m2ScpyTtMJid5bC8m
 Kj2Q6WKrkVqQws2/8qHDUTTQtDSI7CNIbri94P7GIal5LsbXFMZMxc/m2XBKk3uIApX4RSbiB
 Qq3ruYp6HomahtT5w6yDQKNK8arbNVnuuiBmKBoHElfQagEdxDcfJx7/I4YJqQMZGh/fsj5C2
 d5Ra9l0TgOjJlhuHGMG/Z1VMepKUny9wP70V5zH72m+6BUXSeBGROriYexdCmP1v4pyhGctjd
 yX69E/iZbDA4V5QhvqOeXmDuEyJjhzkXyV1P4Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The pointer to the struct platform_device in the driver's private
data struct is never used and therefore can be dropped.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-amd-fch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 390a8b8..181df15 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -32,7 +32,6 @@
 		"amd-fch-gpio-iomem");
 
 struct amd_fch_gpio_priv {
-	struct platform_device		*pdev;
 	struct gpio_chip		gc;
 	void __iomem			*base;
 	struct amd_fch_gpio_pdata	*pdata;
@@ -153,7 +152,6 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->pdata	= pdata;
-	priv->pdev	= pdev;
 
 	priv->gc.owner			= THIS_MODULE;
 	priv->gc.parent			= &pdev->dev;
-- 
1.9.1

