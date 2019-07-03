Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC035E12E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 11:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfGCJm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 05:42:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:42709 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGCJm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 05:42:27 -0400
Received: from orion.localdomain ([95.114.150.241]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZSJa-1i3wZD2yyE-00WZIe; Wed, 03 Jul 2019 11:42:25 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: pl061: drop duplicate printing of device name
Date:   Wed,  3 Jul 2019 11:42:24 +0200
Message-Id: <1562146944-4162-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:+1vQXFykhGB75zGAweFB11S8tsj2ZEYSeBTunoSwjvd/la1fZiu
 WPa5VvnXgVCmc5jksDFYq00k7MgD591Ovr/fvJJE0//WyR5va/3KMrmvIzWfmbU9t6YX+Lr
 XMPa3ZbZAOqBuqgCtB6mQKozWKOy2Kl/ezjKohSlgv+4IyaRv/ihKVUNXPvKlibFKzk/834
 nVu1iqnWejSVn66Z4Y+3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nlK2QIBgKlc=:nn2MuhzPwDMwLQzUdLMClo
 psgekGUF1LnstZlGhJ6zkiFGj2YNhZzKBLzD7huD//ymk/cfQRKxReMiYf02cIekGc8kY5tys
 lBBixNq82OPC2BVRhJXzo3e7hcDHZQtVmMK/rJkK3SpHIZalcXjIenyt0LucK3pRSYEsap2Rv
 sGXQjlOYKx8fEOXSxKefiB9GGU9aldLA6XPTqICn0qR7FpfkDPmfzsR13J0V8eKGFgcfq2CFi
 naVOpaRtIT740tECrKmDglIFq+EiQPfBl3/54YTtnsEHZIN5mMHsDk3LEJDjg1HsI/6xUwUx+
 2NA+YQufYRFF4EPUa4lrMyI66hVkUCl+5MgVUlqkW2SJJANUr/dZyZhGYP5d7Cne5K553ilLT
 M3cLpknCGVDtcQLnb4/+/bxIM632R4/bGfLLRCLprVm7aRiUjlcU0fy7/II4vFfZZ86ZAhIR+
 8x6ci3bG4KzVV77CoHJP63GG7my6YMm0ISlhKMt6ZRrQ2UiKF2ihkG+XRYw9ChBGyly+/Zn7P
 exPRRhK6ugWECg6gW51XGv6+aMh0dz9mX8ipzaSO44QoPl1X47EFlhn4ADnMu61nrKvR7krXU
 7EY4yhj2HzDwDVCxqYdOFpijdbxGIJseLquQ9Ncvab6KkL0orPBWliGMXFOmjt3X7ISSaCQz5
 NldkobxLqm1sByw1NDe8npXosflTadtLcz1NBqlc1gLn17pf+rpqAoA70XiBUq5oR0eUrbYjD
 iuI29WLexssXY5R+BB/YU1U1ki4X0/fMs8EUbQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The dev_info() call already prints the device name, so there's
no need to explicitly include it in the message for second time.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84af248..83a44dd 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -349,7 +349,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		return ret;
 
 	amba_set_drvdata(adev, pl061);
-	dev_info(dev, "PL061 GPIO chip %s registered\n", dev_name(dev));
+	dev_info(dev, "PL061 GPIO chip registered\n");
 
 	return 0;
 }
-- 
1.9.1

