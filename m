Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7049E37ED18
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 00:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241626AbhELULQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 16:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352268AbhELSCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 14:02:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97878C061574;
        Wed, 12 May 2021 11:01:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g4so5577572lfv.6;
        Wed, 12 May 2021 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mB2Sy8f/RdfyHgUhquFJEEonvYuVEw1zWLlnmUy+Jk=;
        b=GOeogpmgKqdqij54HrOemUOhcctTu8jcqropTAi1PhgWpwzcfgL8goQkwh5mD9gxmp
         hGQA18ryam3usNDZXHSpFya5bNAuGEyhEX6kfFgTAI0VK1PLDyWnT4zCS/RK66DSo+8t
         C1CQHGu5SXCcB+nDeff6NZRrdo6srMq807onM1kI1D8ELXeEKgf7pIjVLbA5jOnHOaF4
         ND+I4Rld7sRw1RHPpF2PplJNsa4fZweLnUeZkHxLA/re0OVuO+9mSDuQUbalPW0vpOdo
         v+PomfqmTPF78ytzL3z6LHjD0LZQUHQNBexCQ3qaEFjrtwcW0gKfYMMSJ9O1ZC5U6QR/
         EgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mB2Sy8f/RdfyHgUhquFJEEonvYuVEw1zWLlnmUy+Jk=;
        b=DvpUW15LXj2HDJxGywdvSlH5KM4dwZenFg/Qbv81hTegyKhc0gHb7JrIrv2O0xCSyt
         kIhsH4fmJalmR7y/k7GPQxXtTssx52rtwxK0xfo8xjxz0aZl51O1w8n57RN9HlXSOgFd
         +bCzmFPy9zl8UwL7knu45HHLjEKCrcx5rIQL8t3tG2lR2Rk55LLdHkrqJFcjd/+UTpVd
         kbPDeiE7/QJKanqeM7HPUr1L913vAmIKOa37whqcz9sckLAWzQjVw+RlBBXJ7tsdZxuq
         U7HvC1G1NlJhuWqfwXktGg9ccvSDwtfs+7Vi5pCg71EDa3kZc5/yjKnEpgPaDIoagFpD
         tqrw==
X-Gm-Message-State: AOAM531mToVsm+Qggot/c9kAMSTcYQ0rqD7Ecrxs05DN+KZpWIuw+7ni
        JWbC4/AoZ2RVRFwhXksgofI=
X-Google-Smtp-Source: ABdhPJwPZWErJLIGbAnsOEYzbfXRz/LctoJgDaFyC/CSa7AmmSWoglX9vgFF2q4Q7FMy79yiBn+NIg==
X-Received: by 2002:a05:6512:402:: with SMTP id u2mr24816582lfk.68.1620842504155;
        Wed, 12 May 2021 11:01:44 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id y3sm73772ljj.121.2021.05.12.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 11:01:43 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] pinctrl: at91: Constify struct at91_pinctrl_mux_ops
Date:   Wed, 12 May 2021 20:01:40 +0200
Message-Id: <20210512180140.33293-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The at91_pinctrl_mux_ops struct is never modified by the driver. Make it
const wherever it is possible to allow the compiler to put the static
variables in read-only memory. Note that sam9x60_ops was already const,
but the const was cast away when the return value of of_match_device() was
cast to a pointer to a non-const struct at91_pinctrl_mux_ops.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/pinctrl-at91.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index fc61aaec34cc..72e6df7abe8c 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -42,7 +42,7 @@ struct at91_gpio_chip {
 	int			pioc_idx;	/* PIO bank index */
 	void __iomem		*regbase;	/* PIO bank virtual address */
 	struct clk		*clock;		/* associated clock */
-	struct at91_pinctrl_mux_ops *ops;	/* ops */
+	const struct at91_pinctrl_mux_ops *ops;	/* ops */
 };
 
 static struct at91_gpio_chip *gpio_chips[MAX_GPIO_BANKS];
@@ -210,7 +210,7 @@ struct at91_pinctrl {
 	struct at91_pin_group	*groups;
 	int			ngroups;
 
-	struct at91_pinctrl_mux_ops *ops;
+	const struct at91_pinctrl_mux_ops *ops;
 };
 
 static inline const struct at91_pin_group *at91_pinctrl_find_group_by_name(
@@ -688,7 +688,7 @@ static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
 	writel_relaxed(tmp, pio + SAM9X60_PIO_SLEWR);
 }
 
-static struct at91_pinctrl_mux_ops at91rm9200_ops = {
+static const struct at91_pinctrl_mux_ops at91rm9200_ops = {
 	.get_periph	= at91_mux_get_periph,
 	.mux_A_periph	= at91_mux_set_A_periph,
 	.mux_B_periph	= at91_mux_set_B_periph,
@@ -697,7 +697,7 @@ static struct at91_pinctrl_mux_ops at91rm9200_ops = {
 	.irq_type	= gpio_irq_type,
 };
 
-static struct at91_pinctrl_mux_ops at91sam9x5_ops = {
+static const struct at91_pinctrl_mux_ops at91sam9x5_ops = {
 	.get_periph	= at91_mux_pio3_get_periph,
 	.mux_A_periph	= at91_mux_pio3_set_A_periph,
 	.mux_B_periph	= at91_mux_pio3_set_B_periph,
@@ -737,7 +737,7 @@ static const struct at91_pinctrl_mux_ops sam9x60_ops = {
 	.irq_type	= alt_gpio_irq_type,
 };
 
-static struct at91_pinctrl_mux_ops sama5d3_ops = {
+static const struct at91_pinctrl_mux_ops sama5d3_ops = {
 	.get_periph	= at91_mux_pio3_get_periph,
 	.mux_A_periph	= at91_mux_pio3_set_A_periph,
 	.mux_B_periph	= at91_mux_pio3_set_B_periph,
@@ -1284,7 +1284,7 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENODEV;
 
 	info->dev = &pdev->dev;
-	info->ops = (struct at91_pinctrl_mux_ops *)
+	info->ops = (const struct at91_pinctrl_mux_ops *)
 		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
 	at91_pinctrl_child_count(info, np);
 
@@ -1849,7 +1849,7 @@ static int at91_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	at91_chip->ops = (struct at91_pinctrl_mux_ops *)
+	at91_chip->ops = (const struct at91_pinctrl_mux_ops *)
 		of_match_device(at91_gpio_of_match, &pdev->dev)->data;
 	at91_chip->pioc_virq = irq;
 	at91_chip->pioc_idx = alias_idx;
-- 
2.31.1

