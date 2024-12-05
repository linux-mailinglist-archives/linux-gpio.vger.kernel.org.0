Return-Path: <linux-gpio+bounces-13546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B13259E5644
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C20C2810AA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E997B217F36;
	Thu,  5 Dec 2024 13:13:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C681A8F80
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404399; cv=none; b=jOK3rBDwVZ00MEwy93vZW1Ed+/k5srkdfoaragJ1H0/jHsW1Ai68On/T9sYrTfWzUlNwJVB9wPRwAd4YxR3yVpeZQvNgbhJ/68umg+jUEZha4QwePB/deXh+pksl7h8LCgOtOCQk8/RSO2dW6gG/4VQ6kMqLf0kGSsHlR/jzi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404399; c=relaxed/simple;
	bh=dDbW9KLhmOx+wIfqjCyw7iAjYkiy4o2x6EZyg8tiVXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B31ynNyk6zkGFvn12UY5rQwzoh9ys1EHp/K8ZEIDTabaZ/tLsvkzpP4mO8xQCZP/9UtkLY0qSZT58HTN1HTvXrcW2ybom6ukAh86+XxiFLL3bQ8gq3056xbCFxIuiPOssx4j18gmKC7W+KPeY2c1hoyu9oPRlHoPRzfmiADv5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by andre.telenet-ops.be with cmsmtp
	id l1DB2D0063EEtj2011DBbV; Thu, 05 Dec 2024 14:13:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBfK-000LQH-Dq;
	Thu, 05 Dec 2024 14:13:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBfL-00EQXW-5Z;
	Thu, 05 Dec 2024 14:13:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: ingenic: Replace seq_printf() by seq_puts()
Date: Thu,  5 Dec 2024 14:13:10 +0100
Message-Id: <9a5b38027ed674ca773fe28a3b3246631eae8834.1733404358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify "seq_printf(p, "%s", ...)" to "seq_puts(p, ...)".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 31703737731bd0ee..bc7ee54e062b5b85 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3699,7 +3699,7 @@ static void ingenic_gpio_irq_print_chip(struct irq_data *data, struct seq_file *
 {
 	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s", gpio_chip->label);
+	seq_puts(p, gpio_chip->label);
 }
 
 static const struct irq_chip ingenic_gpio_irqchip = {
-- 
2.34.1


