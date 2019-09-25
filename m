Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2944BDA1C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 10:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442868AbfIYIqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 04:46:10 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39921 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442857AbfIYIqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 04:46:09 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BB9B61C0006;
        Wed, 25 Sep 2019 08:46:07 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 3/5] gpio: syscon: Add support for a custom get operation
Date:   Wed, 25 Sep 2019 10:45:53 +0200
Message-Id: <20190925084555.147771-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
References: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some drivers might need a custom get operation to match custom
behavior implemented in the set operation.

Add plumbing for supporting that.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpio/gpio-syscon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 31f332074d7d..05c537ed73f1 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -43,8 +43,9 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
-	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+	int		(*get)(struct gpio_chip *chip, unsigned offset);
+	void		(*set)(struct gpio_chip *chip, unsigned offset,
+			       int value);
 };
 
 struct syscon_gpio_priv {
@@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	priv->chip.label = dev_name(dev);
 	priv->chip.base = -1;
 	priv->chip.ngpio = priv->data->bit_count;
-	priv->chip.get = syscon_gpio_get;
+	priv->chip.get = priv->data->get ? : syscon_gpio_get;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
 		priv->chip.direction_input = syscon_gpio_dir_in;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
-- 
2.23.0

