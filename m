Return-Path: <linux-gpio+bounces-2149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01882BB63
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 07:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687201F25CD0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 06:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171B95C8FA;
	Fri, 12 Jan 2024 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGlzY+o2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A7B5C8E0
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-336788cb261so4872323f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705042529; x=1705647329; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63UjO/yImm96QE/+VfB7fa+RlurKaZGr2phbbenRcSU=;
        b=GGlzY+o224Ru9J3u249etAKvOErEhzoWqH0GMAbsYHN8QY906PgEIh2/zmVgyNyAJW
         zyVDVtEqCwdCoYxwC4yzkKOlmYe9DZQs3Vz5ncT5ZgPh5lGUNmlTJXRJZTx8bf/PS2xu
         YF5UNHUWocLhF0wWgngvo+ab2xVBUKoeRKD8kiKmzhoVwDChW85loa5352xW2F29x3Bp
         iJe4ST+CzHyR/hPXkZf7b/eFgoJU7RgMZ9X/roJYZAPFy1RtZMRLQKzYELHKm8sry05J
         1HFa+fhcwEjnkijem7cx/aCqYwEs8cZ4bN7BBr2rO7nMMLw4quW4ysGHrZXD1fDAx4Oh
         2bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705042529; x=1705647329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63UjO/yImm96QE/+VfB7fa+RlurKaZGr2phbbenRcSU=;
        b=LlsHWKaByfbEt+JCQnjaaHclzUjZv576beb4XU7BFFkwwNNpn/IzojHXA4pm/cM+9R
         CCXA1/nqG/fa9OihXqosMxNQAjSrQPsiwseRzfZd2zLAIQxI1OSwCHM4W4pNF3XsmsJf
         nOTnQEyI12bwCYpym1U0/f4wvTh/t3JQ2qa/fjdCQn8y4D6UiQRBRgYjm++0dTV3KSLE
         Mu5SM2oSKqfGgspqjyVUgdfG3ww8AacfkFgKcwC0Kuj6lZfexOAc7IJxd8V9uv+sh96P
         0gjWuQvLm3VRzyc3aEafLCkPyHPlcQ+Cp5P/+Ry0vVjs7xUkaJ4GJMMe74QIlM9FRJs7
         MO6A==
X-Gm-Message-State: AOJu0Ywd8NxZob2lCiHrzqJWLTzkM8OwvcvGr0nzi+OYWl5m2F+Kj6A4
	1xeWy36h7NWTS1SPffK7cAv/yQ01qvax/g==
X-Google-Smtp-Source: AGHT+IFYyXyn3K/JOwDJilFEclpAaIimSSiow+hzHZK4+0CXb3Se3RROQAPmH0iur0XUlIjkKHaeUA==
X-Received: by 2002:a5d:590f:0:b0:337:7680:8ccf with SMTP id v15-20020a5d590f000000b0033776808ccfmr453616wrd.56.1705042529315;
        Thu, 11 Jan 2024 22:55:29 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b0033761b2de64sm2986699wrw.76.2024.01.11.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 22:55:28 -0800 (PST)
Date: Fri, 12 Jan 2024 09:55:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tzuyi Chang <tychang@realtek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: rtd: Fix signedness bug in probe
Message-ID: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "data->irqs[]" array holds unsigned int so this error handling will
not work correctly.

Fixes: eee636bff0dc ("gpio: rtd: Add support for Realtek DHC(Digital Home Center) RTD SoCs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-rtd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
index a7939bd0aa56..bf7f008f58d7 100644
--- a/drivers/gpio/gpio-rtd.c
+++ b/drivers/gpio/gpio-rtd.c
@@ -525,18 +525,21 @@ static int rtd_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *irq_chip;
 	struct rtd_gpio *data;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->irqs[0] = platform_get_irq(pdev, 0);
-	if (data->irqs[0] < 0)
-		return data->irqs[0];
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	data->irqs[0] = ret;
 
-	data->irqs[1] = platform_get_irq(pdev, 1);
-	if (data->irqs[1] < 0)
-		return data->irqs[1];
+	ret = platform_get_irq(pdev, 1);
+	if (ret < 0)
+		return ret;
+	data->irqs[1] = ret;
 
 	data->info = device_get_match_data(dev);
 	if (!data->info)
-- 
2.43.0


