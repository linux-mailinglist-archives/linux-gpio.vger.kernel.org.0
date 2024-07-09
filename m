Return-Path: <linux-gpio+bounces-8149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343892C4A6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 22:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13E64B21DBC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2C3187845;
	Tue,  9 Jul 2024 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JjMfMUtM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-68.smtpout.orange.fr [80.12.242.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9A182A64
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557484; cv=none; b=gQRZX0oq49vcoK4jL4xxoIVXzXq1OpgAlI0gnJV4cTzHcGoH7cYJo2ZtDWQ/2rB7cFOaXInvrESq9oT0g5FHedW8CrkwGUZogWnG8GzU8AvCf8ZoT+wg0gmstVIAN6v3+qjYCSbWQHULxGfkR2MSmT9SeBalpABoE2LkOeZsriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557484; c=relaxed/simple;
	bh=gmf3aasC6nYbLpzKP+9gJGJLL0Mreue7d/koV0x/jsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLUlLcAWkKcvCq9UmOwLHGHVV8MpAyev3u5QUOiX7iBUqud7l30hfvAdJAPVoMjyHzdTu5gC9ax5yDRwQfW5Ys4GdurdVxUWjasPcuRLJqKV5XVNlNZNTl1g2IQKbblitrYnpqSauzqaoF4kpWgKtxY8BtKYs7JETma+lX8P6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JjMfMUtM; arc=none smtp.client-ip=80.12.242.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.. ([77.130.249.53])
	by smtp.orange.fr with ESMTPA
	id RHavsh9C6phyvRHb0sZbYg; Tue, 09 Jul 2024 22:37:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720557475;
	bh=EgfXHxdLYyi1/TpBSR1xI3tIrUBzJ3KcvfA6MU/OQKo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JjMfMUtMkRVCbGRXLRdYqkVuZXSnMREEJGWg++G2nMYcQf4OBmfp6sGGu/AK7mZSW
	 6uUIax8VnEYELmwmXxYFe8WTe3wcR0zQEjWEE69gW9NuW20DQIfnG87ixKkzIU8Rp6
	 QH/c7IWtZq9VktUVo09HCoXGUTijwehgn/3ivm0nAtBdOBbXpf+I7mstmnXZCrlUB5
	 Z0IBpeCNGgiCJn04p18Ilh9FT9es6ZX9iz8FGix+KMRRrTzFFqlrtHvau1UJC5hYB7
	 iMJSzjbdOTQyX9vIf/yizuvmNJRDjPTnrJqjxdXi6fbSisG8iEAa9z4+3ViOZaEFi+
	 Yd2X7WCdqz85w==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Jul 2024 22:37:55 +0200
X-ME-IP: 77.130.249.53
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	lokeshvutla@ti.com,
	nm@ti.com,
	robh@kernel.org,
	tony@atomide.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] pinctrl: ti: ti-iodelay: Constify struct regmap_config
Date: Tue,  9 Jul 2024 22:37:45 +0200
Message-ID: <4eefa8530a55ecde82b3ec9a445f93c01bda7ded.1720556038.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regmap_config' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  17355	   1692	     16	  19063	   4a77	drivers/pinctrl/ti/pinctrl-ti-iodelay.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  17729	   1372	     16	  19117	   4aad	drivers/pinctrl/ti/pinctrl-ti-iodelay.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 65f9439d0d5b..019b302db2b0 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -82,7 +82,7 @@ struct ti_iodelay_reg_data {
 	u32 reg_start_offset;
 	u32 reg_nr_per_pin;
 
-	struct regmap_config *regmap_config;
+	const struct regmap_config *regmap_config;
 };
 
 /**
@@ -776,7 +776,7 @@ static int ti_iodelay_alloc_pins(struct device *dev,
 	return 0;
 }
 
-static struct regmap_config dra7_iodelay_regmap_config = {
+static const struct regmap_config dra7_iodelay_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
2.45.2


