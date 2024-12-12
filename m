Return-Path: <linux-gpio+bounces-13833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 011789EF529
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4325E290F01
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133FD218594;
	Thu, 12 Dec 2024 17:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="M4a1OkK1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261E222D62;
	Thu, 12 Dec 2024 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023598; cv=none; b=UgI7QOdQ5Wc2VJLYc5zNQB3WXKCQlw6INDX4A6RrjCswRXJNNjMrjYvRgWK5li00kDmYmIKZ7cOsRl6L5dR8r4lV98u+JSKvOKrOSWtUtVACtrI/ZH9Kyff9+2NUNF51MZ4Fk3WjeY35zu+i3/t3gYp8xnNJTpKj7zRcqzVXEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023598; c=relaxed/simple;
	bh=rB4mtu4iKHlj6RWDnYUzj+JRFRcsKGfxUeEHcGVPK8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8eRvOBmvL81vT57tmJoZKU7K1W8bY1VnYhbjYQbFdZkUXXxHyHvGJJra+6FIhnOvUqQcUJZniJAf65xfsuC5/7u+HrA6j3ZyPKT/3yBuNgWDYvC96lYj7jxILcu2vByKTSfYiqvsuXjobnEci2Ri4/QLjv7Iz4eYTn8NjZaaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=M4a1OkK1; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LmkMtwB1zI1FGLmkNtmLkK; Thu, 12 Dec 2024 18:13:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734023587;
	bh=51NrNSj4/sSiDsIxX0ra1E3Fc+ogQSxfneBLhB1PdEY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=M4a1OkK1/KTkazL3kJMvho9xTVFjNzVxBexe2/pLh+vtNBD3Vm5D/LFdWR4R+skiB
	 8w+M7uVeFXGcItfq3HIjyXCamXbDYr7t6SVKDZ0P+CVYz7M7qFPfbfo3XjVB2ZNHPs
	 NemI1cghqLjEjNqiW1LVLn04Vjkk9uElFDlh0i0ZTkE2zLovC5bmL2jPwoeTxL9pet
	 gjh43VixjsXybMDPa2gBEHAkwiPYDInht1V3EuGD4hib21H4PDux2+MmNFwjRhqzQa
	 30iaJ5mbsHtRQtj+82TjZDZdga0KPsnYdI/ontiBAdvz1si9kNOpQibCF/vlmWr2h7
	 ZtHp9yZoRfPUA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 12 Dec 2024 18:13:07 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: ocelot: Constify some structures
Date: Thu, 12 Dec 2024 18:12:58 +0100
Message-ID: <32edcf0567fffd0b1a219e7e2dad7e0bd8c5aaf4.1734023550.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct ocelot_match_data and 'struct irq_chip' are not modified in this
driver.

Constifying these structures moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  41459	   9008	     80	  50547	   c573	drivers/pinctrl/pinctrl-ocelot.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  42803	   7640	     80	  50523	   c55b	drivers/pinctrl/pinctrl-ocelot.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/pinctrl-ocelot.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 61532a7a612a..329d54b11529 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1777,7 +1777,7 @@ static const struct pinctrl_ops ocelot_pctl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct ocelot_match_data luton_desc = {
+static const struct ocelot_match_data luton_desc = {
 	.desc = {
 		.name = "luton-pinctrl",
 		.pins = luton_pins,
@@ -1788,7 +1788,7 @@ static struct ocelot_match_data luton_desc = {
 	},
 };
 
-static struct ocelot_match_data serval_desc = {
+static const struct ocelot_match_data serval_desc = {
 	.desc = {
 		.name = "serval-pinctrl",
 		.pins = serval_pins,
@@ -1799,7 +1799,7 @@ static struct ocelot_match_data serval_desc = {
 	},
 };
 
-static struct ocelot_match_data ocelot_desc = {
+static const struct ocelot_match_data ocelot_desc = {
 	.desc = {
 		.name = "ocelot-pinctrl",
 		.pins = ocelot_pins,
@@ -1810,7 +1810,7 @@ static struct ocelot_match_data ocelot_desc = {
 	},
 };
 
-static struct ocelot_match_data jaguar2_desc = {
+static const struct ocelot_match_data jaguar2_desc = {
 	.desc = {
 		.name = "jaguar2-pinctrl",
 		.pins = jaguar2_pins,
@@ -1821,7 +1821,7 @@ static struct ocelot_match_data jaguar2_desc = {
 	},
 };
 
-static struct ocelot_match_data servalt_desc = {
+static const struct ocelot_match_data servalt_desc = {
 	.desc = {
 		.name = "servalt-pinctrl",
 		.pins = servalt_pins,
@@ -1832,7 +1832,7 @@ static struct ocelot_match_data servalt_desc = {
 	},
 };
 
-static struct ocelot_match_data sparx5_desc = {
+static const struct ocelot_match_data sparx5_desc = {
 	.desc = {
 		.name = "sparx5-pinctrl",
 		.pins = sparx5_pins,
@@ -1850,7 +1850,7 @@ static struct ocelot_match_data sparx5_desc = {
 	},
 };
 
-static struct ocelot_match_data lan966x_desc = {
+static const struct ocelot_match_data lan966x_desc = {
 	.desc = {
 		.name = "lan966x-pinctrl",
 		.pins = lan966x_pins,
@@ -1867,7 +1867,7 @@ static struct ocelot_match_data lan966x_desc = {
 	},
 };
 
-static struct ocelot_match_data lan969x_desc = {
+static const struct ocelot_match_data lan969x_desc = {
 	.desc = {
 		.name = "lan969x-pinctrl",
 		.pins = lan969x_pins,
@@ -2116,7 +2116,7 @@ static void ocelot_irq_ack(struct irq_data *data)
 
 static int ocelot_irq_set_type(struct irq_data *data, unsigned int type);
 
-static struct irq_chip ocelot_level_irqchip = {
+static const struct irq_chip ocelot_level_irqchip = {
 	.name		= "gpio",
 	.irq_mask	= ocelot_irq_mask,
 	.irq_ack	= ocelot_irq_ack,
@@ -2126,7 +2126,7 @@ static struct irq_chip ocelot_level_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS
 };
 
-static struct irq_chip ocelot_irqchip = {
+static const struct irq_chip ocelot_irqchip = {
 	.name		= "gpio",
 	.irq_mask	= ocelot_irq_mask,
 	.irq_ack	= ocelot_irq_ack,
-- 
2.47.1


