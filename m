Return-Path: <linux-gpio+bounces-3034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63B84B6F8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783F928141A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA4D13172C;
	Tue,  6 Feb 2024 13:53:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D809131740;
	Tue,  6 Feb 2024 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707227607; cv=none; b=aNdVH7iCp3RolraGhO8pF/B//BbyZZpnjQRM2J8XvOjczTf03rm03wyPpZaRcpxLpbYfKLJIYzA6awRUT+OWYaL0qYqFMQoesG8kqM6afbjJcnvb7aJ2G9mG5+IhiwN5BmlwZA2l6E4eERC8r95itw38WOMUqWkKb5g8RLbehGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707227607; c=relaxed/simple;
	bh=o7/n2RYTmpw9Kf5AtPk2HA0Ouly65ZPh8HrpIe0kPno=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QuyfCtoFbZp0fdaOaMSM+C9J7OIq3V8IsQ0kt6guXSoPx/PLF0w7XVOcOl/c9yBbX2N4f5NAeq1B24d/CC8+njUlqURCdwVnvgwe2t6skZwjjYlZHU892Ns7bQhyLzFYmYqh5yS/TZDcSr78KP2LTClcJlTZCtjo+JrNo8UiKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,247,1701097200"; 
   d="scan'208";a="196969713"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Feb 2024 22:53:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.237])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ECFC94000AA0;
	Tue,  6 Feb 2024 22:53:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able
Date: Tue,  6 Feb 2024 13:53:18 +0000
Message-Id: <20240206135318.165426-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL).
That means the pin is just gpio input and not gpio input interrupt any
more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
during irq_disable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index d400dcb048fc..4f979b7081c5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1836,22 +1836,18 @@ static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
 static void rzg2l_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	irq_chip_disable_parent(d);
-	rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
 	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void rzg2l_gpio_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	gpiochip_enable_irq(gc, hwirq);
-	rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
 	irq_chip_enable_parent(d);
 }
 
@@ -1933,6 +1929,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 		goto err;
 	}
 
+	rzg2l_gpio_irq_endisable(pctrl, child, true);
 	pctrl->hwirq[irq] = child;
 	irq += RZG2L_TINT_IRQ_START_INDEX;
 
@@ -1976,6 +1973,7 @@ static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 
 		for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
 			if (pctrl->hwirq[i] == hwirq) {
+				rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
 				rzg2l_gpio_free(gc, hwirq);
 				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
 				bitmap_release_region(pctrl->tint_slot, i, get_order(1));
-- 
2.25.1


