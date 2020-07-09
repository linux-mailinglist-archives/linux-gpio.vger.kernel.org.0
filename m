Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3AA21A589
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgGIRMk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgGIRMj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1838C08C5CE;
        Thu,  9 Jul 2020 10:12:38 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so3245173ljn.8;
        Thu, 09 Jul 2020 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=281uz9iaiGVo7VI6qKT+7ajuEHZDORjgoupNNobQtjM=;
        b=dL5T5yzX5EMhvYQoovcVbN5GsAkbwY6Tv6UtajhB8R1LolxI1i5zzLcXKe/aHi10xY
         DGPT/H8Mnrs8FN248T88ucJUk2R+3JIKpehl8AYJEmGCDMXbUYHjnbJXRgjq/QUyDhsi
         yPKv1Svd7uNhFqmHDT2JjP7V2cd3sPJMEUWzUdkSKycXsxoUcU1j+cb1E+U5bLQVNZG8
         fqFP99LMqdh8lcrBTtjJTRxSXt3JISJJK7EHRMJCEaRnJg2XknfFaCwCJf4EUCjuPwR4
         FbBYOCjZyeJV0d3GsKZ8qt45hdiQCMUa/qj+4dTa/WnRkNIZ+KclVDsvBoIfH49x/I2z
         tk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=281uz9iaiGVo7VI6qKT+7ajuEHZDORjgoupNNobQtjM=;
        b=WfxPnvwnnBLyRss2VXpvPooZ9NM7B8iwgjnhaqbII0hCOmbwIM7UEFYIBRyp5pWD1d
         U6cs5WA2g05TIpf/Gnod9dyabQzwVUtuVf4Mj2BUVhPnV79llIRZLmalKLhoisLrXlfT
         RAtxWcJOCxtPjCooAfGez/a00S9pe0r1B74xeFfE6KW5hgMdbWhjhjijrFWMJL7kVXCU
         8YulvEQhaxSBsb/REZJjwx6dGAtuCkJtXl/ZtsMP43w80nKNDPwyMPN/t+s10WrGuTgF
         ZhkOLo7/6cQG/9dOyTezbgG9jRI5Ctf/BnKhMB01+lcfVbEHZytMghNuh8/ZRXQxWVYs
         +RwA==
X-Gm-Message-State: AOAM5316/0EpF28OIDk5TQqVNLqCXOBN/Bjk7iRipLD1x5reZRvVk370
        ypc1rbGyuQ9De29VRp/Pa7E=
X-Google-Smtp-Source: ABdhPJxCoBAy+wgmz50uuC6+ftWgSFaVULLgqwWmOzjh7/32t2kf4vRVU30fWvSsyWs0sebITNZNwg==
X-Received: by 2002:a2e:8046:: with SMTP id p6mr23586723ljg.100.1594314757485;
        Thu, 09 Jul 2020 10:12:37 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date:   Thu,  9 Jul 2020 20:11:58 +0300
Message-Id: <20200709171203.12950-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
let's use it instead of a raw value in order to improve the code's
readability a tad.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..4c0c9ec2587d 100644
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

