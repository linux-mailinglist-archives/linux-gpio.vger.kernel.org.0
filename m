Return-Path: <linux-gpio+bounces-13979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDC9F5810
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 21:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1061681B8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 20:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC261F943A;
	Tue, 17 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Jq1mAI0L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948E38DFC;
	Tue, 17 Dec 2024 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468506; cv=none; b=ic2azifZtkYwxJvGFwxyL8dAPykt0Z6I1mfNEK2XQuyxUB4gCbbUQhcdLx/4p07giCHjJZjjbgST7/jaiCPlbRY6lgp5pWJzKN3YNwMuZBmAlmccWE2n1LhHghLWXuxWZAKYxZEFzfTJOYS0fZiHT9+A0rgToDrnqd0rZg7P3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468506; c=relaxed/simple;
	bh=RvecZItRt9cgNUXWJY0CJreW5TSuGU7XrM6+OtsJu+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMYQopNaRUOzUc/BnQxNLO5EIz5UMqgdLkF2JOk/xESl2AqK1aBpg/b3ucktbomxZN5EvX5yiZdgt/dHYSwNPBFeYKHAX/tgTFapCG/5XUTiNQlklyVrhKsFMpnKOX5FVQQYBmKbnc3EbJ0BLp58lNlq5GyYL+l9eD00Y+AJH/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Jq1mAI0L; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKlt3c055174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Dec 2024 14:47:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468475;
	bh=+ZLfGvP2ejJjjELBvkytBh6umveNlTawhbLmgbuiwZE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jq1mAI0L9jcjETd5OMlpbdJKaR5lz0IO/PH34Nuz46UpdOUIazGn8zWZfFN97NPFO
	 m79pZ/2fgEi9KqzDN3JPo6qhfzbnsFaXcLJvcbqS2M7GnnZjUWhkccINg3/YSnfxsu
	 z42QhhHGF5bUZnU4hZZcXL11vv50Ntki82kTXsIA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKltZa012392;
	Tue, 17 Dec 2024 14:47:55 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:47:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:47:55 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKltv7025808;
	Tue, 17 Dec 2024 14:47:55 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/1] gpio: tps65219: Use existing kernel gpio macros
Date: Tue, 17 Dec 2024 14:47:55 -0600
Message-ID: <20241217204755.1011731-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
References: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Replace the user-defined macros with the equivalent kernel macros provided.

The user-defined macros serve the same purpose as the common kernel macros.
The user-defined macros rely on the inference that _IN corresponds to true
and _OUT is false.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index cd1f17041f8c..526640c39a11 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -15,8 +15,6 @@
 #define TPS65219_GPIO0_DIR_MASK		BIT(3)
 #define TPS65219_GPIO0_OFFSET		2
 #define TPS65219_GPIO0_IDX		0
-#define TPS65219_GPIO_DIR_IN		1
-#define TPS65219_GPIO_DIR_OUT		0
 
 struct tps65219_gpio {
 	struct gpio_chip gpio_chip;
@@ -61,7 +59,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	 * status bit.
 	 */
 
-	if (tps65219_gpio_get_direction(gc, offset) == TPS65219_GPIO_DIR_OUT)
+	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
 		return -ENOTSUPP;
 
 	return ret;
@@ -124,10 +122,10 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 		return -ENOTSUPP;
 	}
 
-	if (tps65219_gpio_get_direction(gc, offset) == TPS65219_GPIO_DIR_IN)
+	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_IN)
 		return 0;
 
-	return tps65219_gpio_change_direction(gc, offset, TPS65219_GPIO_DIR_IN);
+	return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIRECTION_IN);
 }
 
 static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
@@ -136,10 +134,10 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
 	if (offset != TPS65219_GPIO0_IDX)
 		return 0;
 
-	if (tps65219_gpio_get_direction(gc, offset) == TPS65219_GPIO_DIR_OUT)
+	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
 		return 0;
 
-	return tps65219_gpio_change_direction(gc, offset, TPS65219_GPIO_DIR_OUT);
+	return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIRECTION_OUT);
 }
 
 static const struct gpio_chip tps65219_template_chip = {
-- 
2.34.1


