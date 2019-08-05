Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6311821B6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 18:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbfHEQ1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 12:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728867AbfHEQ1Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 12:27:25 -0400
Received: from localhost.localdomain (unknown [194.230.155.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C69442173C;
        Mon,  5 Aug 2019 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565022444;
        bh=r3J2uJ3DeELKcuAEJzIBaysAZ2UpTcn1ONNqrTuza0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RzWRgOHgLBILkakJwBcTZTNjFT7iwjWPTSJz/BNrzM38g3cge4HGGfWwiLRcKF1Mm
         pG/5Mm5+qhLu3zNv/hK/yTHTw4Ul861TGHqQOEksg8vbbGIWNAMP1bBCg6ixJphVRo
         hzjB7ZFsGkV9HrUgt2m2UDVyJqXJUMizXq1iK4as=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
Subject: [PATCH 2/4] pinctrl: samsung: Fix device node refcount leaks in S3C24xx wakeup controller init
Date:   Mon,  5 Aug 2019 18:27:08 +0200
Message-Id: <20190805162710.7789-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805162710.7789-1-krzk@kernel.org>
References: <20190805162710.7789-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In s3c24xx_eint_init() the for_each_child_of_node() loop is used with a
break to find a matching child node.  Although each iteration of
for_each_child_of_node puts the previous node, but early exit from loop
misses it.  This leads to leak of device node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 7e824e4d20f4..9bd0a3de101d 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -490,8 +490,10 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 		return -ENODEV;
 
 	eint_data = devm_kzalloc(dev, sizeof(*eint_data), GFP_KERNEL);
-	if (!eint_data)
+	if (!eint_data) {
+		of_node_put(eint_np);
 		return -ENOMEM;
+	}
 
 	eint_data->drvdata = d;
 
@@ -503,12 +505,14 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 		irq = irq_of_parse_and_map(eint_np, i);
 		if (!irq) {
 			dev_err(dev, "failed to get wakeup EINT IRQ %d\n", i);
+			of_node_put(eint_np);
 			return -ENXIO;
 		}
 
 		eint_data->parents[i] = irq;
 		irq_set_chained_handler_and_data(irq, handlers[i], eint_data);
 	}
+	of_node_put(eint_np);
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
-- 
2.17.1

