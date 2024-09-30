Return-Path: <linux-gpio+bounces-10578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5E98A7B7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 921E2B231ED
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 14:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4D7199230;
	Mon, 30 Sep 2024 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TJ+LHRQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038141991A1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707697; cv=none; b=FcKA3R4ZjnQReBBUVdJXkGbMlGm1LXyCIL1ygZP8zRbkXh7i8EXL13ckZjcc9IoOd7DjgteE/c10u3KBdjuJW2RGV6W9JAU3Jm5/Rm+4IEFrWR2KiXInScqmcAus2VoU4nOq0s4XboBuSIYLFA9KINOfIHmJS3I3s3R4z6sRVKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707697; c=relaxed/simple;
	bh=EY3F+m5wtnL1iuaa2UQuujSwU3tmQznVQ28Ti6ey858=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoHAUP4dBQLOYSep7K1wlM4c0tEMk6oD8LVVB5g2xB9p0oxgkYDphPOi0VDEwbDuYAxnSzr6itIvC/qkcf+qq+KT0OvYrLqnttU+MN2zRnMpOWLtJXZV4Y7/Iev7DB4aw/EVwZ/rRGyPEiF1hAaAeWUUg3XVvwyhE0HWtHJg3rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TJ+LHRQT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ccfba5df5so2917474f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727707692; x=1728312492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKBnQ9A5YYf2FUXo4R11RKTG90nbTdsrzyW+p16FTYQ=;
        b=TJ+LHRQT19Db/FZNlZ1Y4CoU31ZjS2xDoqps69TSvyun/i1hTHGirAnJ4s7sKlw4h8
         Ci7mkOsGpmRwwGvqspvuNj25cqjDLlken8vlVoFvJlAnA+/ElXE5iLKk2MRg1mw4+5KN
         rCcV0qw7gReIkoP9+34swToZHZgFA+dABMo0+9kSAFEG4h/Il7zrMX7u+Z/rACOW+8HV
         wRQdvNojK9G9x2P4QEx1AJdEqxElNTVJcGq6C2wy6sreq2krQb/za9J9H9+J9cATa1Ch
         mn9GxDQk83/85Em5DA1nvACr+DKTqwwQDJHySThhnP+6Hk6TcQZMwCkl7/+C/tByWUtd
         NMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707692; x=1728312492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKBnQ9A5YYf2FUXo4R11RKTG90nbTdsrzyW+p16FTYQ=;
        b=a0P3SMJJxsvJBIemCcAFOlJ8llZ3dh1g3cQKq9IMNTM7MzFlTJskZn3cdDoo89VsIV
         NxpA3XWf1rDBY5Z9zpjhIBnWKpfLr0xPo9RX8ZdkUH2OvW8FVXRTmnCk3Ncq7hyjoPi7
         TXJMQ9KsxdPAWnlfAnj1p5FcLYrWEan2NtC06x2Jguy92MjVnEoHyhKiqul5cY3Y7A+C
         BVwrUO11UeJYQAG4x5v7L7o8iwCfK0Ce/vc97yTCMll0+gxu+C2D53c2njwB9gKWRWHb
         8mwqk5g4Y6mJsXL6uPugNwywD/uLTXi9nxeaMQoJBsOGLPULbyNk54lIzM0FDHeXXFZa
         JCxw==
X-Gm-Message-State: AOJu0YyadvMyJtiO8GOf/Rl7zq9K7CDwjkB+uUs3d3vTFEFW1RUVIscg
	6/TeFXHFrPzXiG3B4U7n7ATcWkTtTiAusOz31NjXfqhjMcLT8S6kIy0t6tWP2hs6VUZdcjUEteS
	5
X-Google-Smtp-Source: AGHT+IH4juMB4VpfWquIbAxYYFepSx6InHOYaJpHPC7iDAq1R8QsT1e8M8xtsnfnrYxRu0Q9od2aPg==
X-Received: by 2002:a05:6000:d46:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37cd5acbd4cmr7667839f8f.27.1727707692023;
        Mon, 30 Sep 2024 07:48:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd566a41fsm9241505f8f.45.2024.09.30.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:48:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] gpio: xilinx: use helper variable to store the address of pdev->dev
Date: Mon, 30 Sep 2024 16:48:03 +0200
Message-ID: <20240930144804.75068-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930144804.75068-1-brgl@bgdev.pl>
References: <20240930144804.75068-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability don't repeatedly dereference pdev->dev but
instead store the address of the embedded struct device in a local
variable in probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index afcf432a1573..d99824d42c77 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -561,9 +561,10 @@ static const struct irq_chip xgpio_irq_chip = {
  */
 static int xgpio_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xgpio_instance *chip;
 	int status = 0;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev->of_node;
 	u32 is_dual = 0;
 	u32 width[2];
 	u32 state[2];
@@ -571,7 +572,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	struct gpio_irq_chip *girq;
 	u32 temp;
 
-	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -624,7 +625,7 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	chip->gc.base = -1;
 	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
-	chip->gc.parent = &pdev->dev;
+	chip->gc.parent = dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
 	chip->gc.get = xgpio_get;
@@ -633,21 +634,21 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;
 
-	chip->gc.label = dev_name(&pdev->dev);
+	chip->gc.label = dev_name(dev);
 
 	chip->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->regs)) {
-		dev_err(&pdev->dev, "failed to ioremap memory resource\n");
+		dev_err(dev, "failed to ioremap memory resource\n");
 		return PTR_ERR(chip->regs);
 	}
 
-	chip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	chip->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(chip->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(chip->clk), "input clock not found.\n");
+		return dev_err_probe(dev, PTR_ERR(chip->clk), "input clock not found.\n");
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	xgpio_save_regs(chip);
 
@@ -667,8 +668,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	gpio_irq_chip_set_chip(girq, &xgpio_irq_chip);
 	girq->parent_handler = xgpio_irqhandler;
 	girq->num_parents = 1;
-	girq->parents = devm_kcalloc(&pdev->dev, 1,
-				     sizeof(*girq->parents),
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
 				     GFP_KERNEL);
 	if (!girq->parents) {
 		status = -ENOMEM;
@@ -679,18 +679,18 @@ static int xgpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 
 skip_irq:
-	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
+	status = devm_gpiochip_add_data(dev, &chip->gc, chip);
 	if (status) {
-		dev_err(&pdev->dev, "failed to add GPIO chip\n");
+		dev_err(dev, "failed to add GPIO chip\n");
 		goto err_pm_put;
 	}
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 	return 0;
 
 err_pm_put:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 	return status;
 }
 
-- 
2.43.0


