Return-Path: <linux-gpio+bounces-24086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B1B1EBB4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0D91886FDE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF45284665;
	Fri,  8 Aug 2025 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPlb2I2B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE726283FE4;
	Fri,  8 Aug 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666481; cv=none; b=feTaDzqFvS4EVkmL1hcF4k55oyGsoK6P+9wjPWF+gnzneAK3y9qscDy9zuwzM+CdjBxCGCvx7IkskSq4vpwgqEiNEPYMPg9cl5I+WtmI/FviGRdjROPYpDSqmIqd+YiR1Zkvv3M4Rmq7t4S4R9xCg3ZKHIMwjqYFCEyDdIMjMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666481; c=relaxed/simple;
	bh=LPnYZia34xhAV/WjUeSggZiiEtdVJPX0U5P7LQUSwBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tm8qOiwoqSQOZvrxqy21MceWVh7hivrojBTdxdziYcwyQeqQXQ/ctiv7iWT5rwsgS2NE6eVaP4pf946zgsZzdqNBK7RP/d3mK8iLVAw6m8LrbSgGYnKoaRbRt7y2uqXDviXncIkRMKYf+uDgiEflF5r9+dhG15+El2cwICgvb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPlb2I2B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBFAC4CEED;
	Fri,  8 Aug 2025 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666481;
	bh=LPnYZia34xhAV/WjUeSggZiiEtdVJPX0U5P7LQUSwBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPlb2I2BulQ2TssYoqMCCwm7OUr1C6ZZw4qaqxN+35Jl1z4m5D2gq6TfTX/pNPQdK
	 9VTlok1qOTFwQTCK+Q4BI10U1cp2BfFglu5Y6+AvmfDzjpwZ/PU+Ac6XUoRKkTMSRR
	 YSHK9/wtf25oVghFW5cuXw8Jr+AnqhPO/OHkWAhqQiKR+BI1gRv6I2g1Wa3hZumRZu
	 LLoqTuc0qGZNbzl5eolAVUWKWLgR76VM0abB1yhqLWoV2LYDIGEqvXAbrdK4hy8Yl0
	 quF/UiQmNocBmk3FrrCM9ga9bd4IqbV2xIObTHFF/Rlx41+NlQlvX6PnA3uwL2ort7
	 qs030c5QotjxQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/21] mfd: wm8994: remove dead legacy-gpio code
Date: Fri,  8 Aug 2025 17:17:51 +0200
Message-Id: <20250808151822.536879-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
("mfd: wm8994: Emulate level triggered interrupts if required") in
linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
in the wm8994_pdata structure, so this was always dead code.

Remove it now to reduce the dependency on the legacy gpio interfaces.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/wm8994-irq.c         | 94 ++------------------------------
 include/linux/mfd/wm8994/pdata.h |  5 --
 2 files changed, 4 insertions(+), 95 deletions(-)

diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index 1475b1ac6983..a46cea948763 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -135,53 +135,9 @@ static const struct regmap_irq_chip wm8994_irq_chip = {
 	.runtime_pm = true,
 };
 
-static void wm8994_edge_irq_enable(struct irq_data *data)
-{
-}
-
-static void wm8994_edge_irq_disable(struct irq_data *data)
-{
-}
-
-static struct irq_chip wm8994_edge_irq_chip = {
-	.name			= "wm8994_edge",
-	.irq_disable		= wm8994_edge_irq_disable,
-	.irq_enable		= wm8994_edge_irq_enable,
-};
-
-static irqreturn_t wm8994_edge_irq(int irq, void *data)
-{
-	struct wm8994 *wm8994 = data;
-
-	while (gpio_get_value_cansleep(wm8994->pdata.irq_gpio))
-		handle_nested_irq(irq_find_mapping(wm8994->edge_irq, 0));
-
-	return IRQ_HANDLED;
-}
-
-static int wm8994_edge_irq_map(struct irq_domain *h, unsigned int virq,
-			       irq_hw_number_t hw)
-{
-	struct wm8994 *wm8994 = h->host_data;
-
-	irq_set_chip_data(virq, wm8994);
-	irq_set_chip_and_handler(virq, &wm8994_edge_irq_chip, handle_edge_irq);
-	irq_set_nested_thread(virq, 1);
-	irq_set_noprobe(virq);
-
-	return 0;
-}
-
-static const struct irq_domain_ops wm8994_edge_irq_ops = {
-	.map	= wm8994_edge_irq_map,
-	.xlate	= irq_domain_xlate_twocell,
-};
-
 int wm8994_irq_init(struct wm8994 *wm8994)
 {
 	int ret;
-	unsigned long irqflags;
-	struct wm8994_pdata *pdata = &wm8994->pdata;
 
 	if (!wm8994->irq) {
 		dev_warn(wm8994->dev,
@@ -190,53 +146,11 @@ int wm8994_irq_init(struct wm8994 *wm8994)
 		return 0;
 	}
 
-	/* select user or default irq flags */
-	irqflags = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
-	if (pdata->irq_flags)
-		irqflags = pdata->irq_flags;
-
 	/* use a GPIO for edge triggered controllers */
-	if (irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
-		if (gpio_to_irq(pdata->irq_gpio) != wm8994->irq) {
-			dev_warn(wm8994->dev, "IRQ %d is not GPIO %d (%d)\n",
-				 wm8994->irq, pdata->irq_gpio,
-				 gpio_to_irq(pdata->irq_gpio));
-			wm8994->irq = gpio_to_irq(pdata->irq_gpio);
-		}
-
-		ret = devm_gpio_request_one(wm8994->dev, pdata->irq_gpio,
-					    GPIOF_IN, "WM8994 IRQ");
-
-		if (ret != 0) {
-			dev_err(wm8994->dev, "Failed to get IRQ GPIO: %d\n",
-				ret);
-			return ret;
-		}
-
-		wm8994->edge_irq = irq_domain_create_linear(NULL, 1, &wm8994_edge_irq_ops, wm8994);
-
-		ret = regmap_add_irq_chip(wm8994->regmap,
-					  irq_create_mapping(wm8994->edge_irq,
-							     0),
-					  IRQF_ONESHOT,
-					  wm8994->irq_base, &wm8994_irq_chip,
-					  &wm8994->irq_data);
-		if (ret != 0) {
-			dev_err(wm8994->dev, "Failed to get IRQ: %d\n",
-				ret);
-			return ret;
-		}
-
-		ret = request_threaded_irq(wm8994->irq,
-					   NULL, wm8994_edge_irq,
-					   irqflags,
-					   "WM8994 edge", wm8994);
-	} else {
-		ret = regmap_add_irq_chip(wm8994->regmap, wm8994->irq,
-					  irqflags,
-					  wm8994->irq_base, &wm8994_irq_chip,
-					  &wm8994->irq_data);
-	}
+	ret = regmap_add_irq_chip(wm8994->regmap, wm8994->irq,
+				  IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+				  wm8994->irq_base, &wm8994_irq_chip,
+				  &wm8994->irq_data);
 
 	if (ret != 0) {
 		dev_err(wm8994->dev, "Failed to register IRQ chip: %d\n", ret);
diff --git a/include/linux/mfd/wm8994/pdata.h b/include/linux/mfd/wm8994/pdata.h
index 6e2962ef5b81..b95a56a338c3 100644
--- a/include/linux/mfd/wm8994/pdata.h
+++ b/include/linux/mfd/wm8994/pdata.h
@@ -226,11 +226,6 @@ struct wm8994_pdata {
 	 * lines is mastered.
 	 */
 	int max_channels_clocked[WM8994_NUM_AIF];
-
-	/**
-	 * GPIO for the IRQ pin if host only supports edge triggering
-	 */
-	int irq_gpio;
 };
 
 #endif
-- 
2.39.5


