Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696C410CC2A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 16:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfK1Pyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 10:54:54 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49699 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfK1Pyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 10:54:53 -0500
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CAA5E40021;
        Thu, 28 Nov 2019 15:54:50 +0000 (UTC)
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
Subject: [PATCH v4 3/5] gpio: syscon: Add support for a custom get operation
Date:   Thu, 28 Nov 2019 16:54:36 +0100
Message-Id: <20191128155438.325738-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128155438.325738-1-paul.kocialkowski@bootlin.com>
References: <20191128155438.325738-1-paul.kocialkowski@bootlin.com>
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
 drivers/gpio/gpio-syscon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 31f332074d7d..36136b7f3a3b 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -43,6 +43,7 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
+	int		(*get)(struct gpio_chip *chip, unsigned offset);
 	void		(*set)(struct gpio_chip *chip,
 			       unsigned offset, int value);
 };
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
2.24.0

