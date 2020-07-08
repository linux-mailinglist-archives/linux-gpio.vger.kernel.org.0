Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17D321823E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgGHI2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbgGHI1v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:27:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2EAC08C5DC;
        Wed,  8 Jul 2020 01:27:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so53170738ljg.13;
        Wed, 08 Jul 2020 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7a3U3FWt+2vvGq/4SeXOH+9VZAL84/sZqX5NPLbxHY=;
        b=YlyWPfUgHqncBUEyzjMnqeQFBBJS/y2jCMlcsMj+NCY2iCQ2jJxoCDHGVYfHmdg4s9
         CuVT+pQ79H9pc94xSZZCHjx98YTkpeWFjdm8KE96EAGw36y+aX7Ctx9OVJVm90bkxcJB
         KAdc+QOlrWyqA21hj58kNm2J9x7AWm8SldLYXug2s6oOAsxmgv1MSfOQ4Bw0zPc1luB5
         9LwYYuDWtsjs8GjGr4ETxqsp6314HtFwqgqZ6gCrANwcXlO2QH/sOZDJLFAdXqs89GCx
         AfirMWrU99lMo+Qvk2FiFjwrmWVTf4GSsqxcOeXy6ScmtKVwmOB6kKJcOQ49YVOU/8WA
         4ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7a3U3FWt+2vvGq/4SeXOH+9VZAL84/sZqX5NPLbxHY=;
        b=WzScEBTCGFtNjMMTjybkvqpXGscOAFKkyaXxcaoOOAmXx0kmFeJyA7nCTGj8Bfuuj3
         pA93ZsYF19pSSLcfvgOLcTS2vbIAarOqrLqMPKEmC96cd5FQPTM4OaojIWBgNNme3Bjo
         gxwSZR4J66H371pmX+2RSAEOXynjpGTOxNpoAbM84s2cHDtXtFa/RHcfvKYcJK1udydD
         q/TEhKrld3Ot1uXM28zfxy5B0MX72RxGCclv7oo/qU0qTzWpPDN5YXe6ZDcgI+4zKXpW
         mRU2bWXMGZqd9vh9y9qjxVH1YvyAeLydZI/Xxvy68qHq/+Kp6j9imuiv5Te0N8jEjmxG
         PudQ==
X-Gm-Message-State: AOAM531CqBWmQ7CVPG8G6jj0yUNZ6vs3c6GtzjQzuz0r0yLX05ARHwkR
        PZLQSEZ5eFBnba9hNZw0paI=
X-Google-Smtp-Source: ABdhPJxPK2ha7FsL8Jach3PIhvFCcx7Ep3E9QChRmE1gbuo2S6y+JJUMSbF62Iq/aVEL2ymidTnlDg==
X-Received: by 2002:a2e:8794:: with SMTP id n20mr14091674lji.359.1594196869189;
        Wed, 08 Jul 2020 01:27:49 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id d2sm737555ljg.6.2020.07.08.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 01:27:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date:   Wed,  8 Jul 2020 11:26:31 +0300
Message-Id: <20200708082634.30191-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
let's use it instead of a raw value in order to improve the code's
readability a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 473b4e900bbb..6a7ede6b8b74 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -19,8 +19,8 @@ struct max77620_gpio {
 	struct regmap		*rmap;
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
-	unsigned int		irq_type[8];
-	bool			irq_enabled[8];
+	unsigned int		irq_type[MAX77620_GPIO_NR];
+	bool			irq_enabled[MAX77620_GPIO_NR];
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 
 	pending = value;
 
-	for_each_set_bit(offset, &pending, 8) {
+	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
 		unsigned int virq;
 
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
-- 
2.26.0

