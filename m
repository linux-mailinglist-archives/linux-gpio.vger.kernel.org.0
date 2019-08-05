Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1EE821B3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 18:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbfHEQ13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 12:27:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:59920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728867AbfHEQ11 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 12:27:27 -0400
Received: from localhost.localdomain (unknown [194.230.155.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9934421738;
        Mon,  5 Aug 2019 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565022447;
        bh=/ZZzwZYYj40VxWlMnnJr2aRQf2zWW1hLpbof9O0nbv8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1pR3CVT2mbcgKSu3WphJkUZ38G5z6KtjUemuOhSC8S6bXBkq6yWD5FRWQeS3GjXbh
         R3DW2MUTP1aYdiQn11pEdqPW1C+4TogiB8QX8aeVKtU41lJ6wYPSkdDga/k6HmZaGL
         V1JmybTNObgOUTxgm8axpPqhV0K8OkgZgJuHIF5A=
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
Subject: [PATCH 3/4] pinctrl: samsung: Fix device node refcount leaks in S3C64xx wakeup controller init
Date:   Mon,  5 Aug 2019 18:27:09 +0200
Message-Id: <20190805162710.7789-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805162710.7789-1-krzk@kernel.org>
References: <20190805162710.7789-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In s3c64xx_eint_eint0_init() the for_each_child_of_node() loop is used
with a break to find a matching child node.  Although each iteration of
for_each_child_of_node puts the previous node, but early exit from loop
misses it.  This leads to leak of device node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index c399f0932af5..f97f8179f2b1 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -704,8 +704,10 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 		return -ENODEV;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	if (!data) {
+		of_node_put(eint0_np);
 		return -ENOMEM;
+	}
 	data->drvdata = d;
 
 	for (i = 0; i < NUM_EINT0_IRQ; ++i) {
@@ -714,6 +716,7 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 		irq = irq_of_parse_and_map(eint0_np, i);
 		if (!irq) {
 			dev_err(dev, "failed to get wakeup EINT IRQ %d\n", i);
+			of_node_put(eint0_np);
 			return -ENXIO;
 		}
 
@@ -721,6 +724,7 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 						 s3c64xx_eint0_handlers[i],
 						 data);
 	}
+	of_node_put(eint0_np);
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
-- 
2.17.1

