Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3087B79CC2E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 11:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbjILJpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 05:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjILJpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 05:45:31 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B6CE67
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 02:45:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so61097175e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694511926; x=1695116726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UafgOnXtuKh9m65/RPTh4Y2p9AF6HuTxWc4dq2+OROA=;
        b=P9ntPn5y3ViXGsTUSe4nqvuU6z+so9DFl+2H4p0YGox9aTlzh3PJ/aNi1Th2D63ZDz
         LkVDZSJOqa9gWD5v/YRCWjYOVO5mmPMDObGO996aWw+qZdCrZVOW9hKhaZGvHlpKUNBJ
         N4q4rmJMcHELIdDB+AxXU/9m7gt2JphpS0bPzU0Stvbs0piZRoLU8n4omKuW19fyO5tH
         uXDvHsY1ns7d8FnXzXIP02Dh6qIswUfacIrSB7moIvoPIldjARH2ezd4eYfkJH2WJh+N
         eEzYdlAfziDWaSN0jdHny84De4t0uzMMsvUVRkIr5Fsean1Ykf6n3fTynBslu+y5r5W5
         MC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694511926; x=1695116726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UafgOnXtuKh9m65/RPTh4Y2p9AF6HuTxWc4dq2+OROA=;
        b=apSPG4j5Vf5ZdNCNqyGOnMikAGJl2qDVsFFk3CaQMhANpVatkNK8btOWlmNAD1fXCe
         hvVx4IsvtS+BySmbELvsmm9uogrWIDuR68Cb5ugVHx0DGOqZ7ieSeEpnfROpww0T3LW2
         KrjnGL77jdwlHDYEG6SCfS9h0lWSNNBSj2BMUY6A4f5cK10diXH7TUFV+noDLltHvdLp
         kQMW2rx5+YtKukrbRjsXPRRzIBKQ5pARN+yOEcIt2UmbiDTKK0jCu028Ey90Ze3EHy8N
         hO3t3qtSxTA7sPDgMfptSLuKM4SWIfa0QddeKW/x2ZXsdyns2wb9r3iY67E6s1U8zeS5
         7e/Q==
X-Gm-Message-State: AOJu0YwPdgkdM8EzczzSVLVqnXiZI01bDo9r6Cwaox9DcA5kkJOSMm8i
        QfNbBA+RKK/rhGaXCBEUlz+v4bioxTU13vzCrng=
X-Google-Smtp-Source: AGHT+IHfTi5tcH7CVZjdKGOzUnrCN0zFPiSYfWMyALIyvaA9NW8oMfpgk0XlqIzyxv5gap0GXugeQA==
X-Received: by 2002:a05:600c:3b1e:b0:402:f536:41c5 with SMTP id m30-20020a05600c3b1e00b00402f53641c5mr10218128wms.3.1694511926409;
        Tue, 12 Sep 2023 02:45:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003fefb94ccc9sm12321621wml.11.2023.09.12.02.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 02:45:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 3/3] gpio: eic-sprd: use devm_platform_ioremap_resource()
Date:   Tue, 12 Sep 2023 11:45:19 +0200
Message-Id: <20230912094519.22769-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912094519.22769-1-brgl@bgdev.pl>
References: <20230912094519.22769-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make two calls into one by using devm_platform_ioremap_resource().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index be7f2fa5aa7b..1e548e4e4cb8 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -594,7 +594,6 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *irq;
 	struct sprd_eic *sprd_eic;
-	struct resource *res;
 	int ret, i;
 
 	pdata = of_device_get_match_data(dev);
@@ -621,11 +620,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		 * have one bank EIC, thus base[1] and base[2] can be
 		 * optional.
 		 */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			break;
-
-		sprd_eic->base[i] = devm_ioremap_resource(dev, res);
+		sprd_eic->base[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(sprd_eic->base[i]))
 			return PTR_ERR(sprd_eic->base[i]);
 	}
-- 
2.39.2

