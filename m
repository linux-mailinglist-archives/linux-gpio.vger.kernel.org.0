Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCFC524B19
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 11:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfEUJDM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 05:03:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34028 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfEUJDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 05:03:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id j187so1809070wma.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2019 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gYAhmVJgkHA+N2QnfUw5rqlqXxgQ3j6KVbsfq1tlZMM=;
        b=UFZ36oLKvX+AyXAL5nBQnC1qDCWWRrbfH0PozmB8HyvyoDlKvokj7BmHtKfsRST0eM
         eybFag24qHXOs0w22rgVTfxJ4hpMkJN0U/gNSlD/03mQA7xEqfhgnfJMUQByxWq6q4K1
         ketUdVCeKml9tZk15s7E51XrcBBA56Iezl5+6KY7rNL+J7StZgjFMHtLove61AyuUhST
         Gt1tROiyikHmf7H4OqCWa6iQ0JC/XEhMgSGrXLg6poSr2n2SUlILi5JfXPuUKp21zlnk
         s5WrepjFiqFxyyG4Sta1RKTDrS6hLSVgH5tiH9nuqcswNcg1ObyqHamwSu4a1BYf6KWS
         9grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYAhmVJgkHA+N2QnfUw5rqlqXxgQ3j6KVbsfq1tlZMM=;
        b=kCoFwxXqC6v1Hp8zi5OSmMEROYC0sYzSnYxO6iVtvlUjykZiM4yKrdEql00mE1+6ms
         RcXV6NPYD6N+VUi2fY4mcze7V7KYRUM2G3jnE+EvlDVqlCcCxaMONLl0X/a2lkG9hYR6
         K3TM2q1VDwSppd6ZyuddicSG2jPWL1olAyHcRiCV3cQCdyWqnWHWfNvADy+kYpd8M/Pf
         nALroOyyO/kQi6POmNrlPvgaHLXh7xVzgvHAkl15HyPb1/0aQJlIObLXJ43/UVYt7vEG
         aW1lvarD5cn1R9ojrPTCdd9o27qTHXyada+7tr9t+6O2jPw66JP6/nV4D4+dypHrR63a
         Mh7Q==
X-Gm-Message-State: APjAAAVnJ+qWlt2yjj4lKwnmPEbpDvDBEOx8KjfnLX5NZapYkCNrt6Ow
        qqVp7xCVwVneZVzkk2j0KPhPaphDvCc=
X-Google-Smtp-Source: APXvYqzQFUH3mqLm/FE4fhZMNjE0sMSpeNtW+zoz6zvRZGpviSrxRVUCwwBB+AeiucqksJdT2sXCLQ==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr2480549wma.100.1558429390261;
        Tue, 21 May 2019 02:03:10 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id j28sm35898692wrd.64.2019.05.21.02.03.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:03:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] gpio: max732x: use devm_gpiochip_add_data()
Date:   Tue, 21 May 2019 11:03:06 +0200
Message-Id: <20190521090306.28113-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521090306.28113-1-brgl@bgdev.pl>
References: <20190521090306.28113-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the code a bit with a resource managed variant of
gpiochip_add_data().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-max732x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 7fd1bdfe00e5..42c9b6ce4227 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -698,15 +698,13 @@ static int max732x_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	ret = gpiochip_add_data(&chip->gpio_chip, chip);
+	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (ret)
 		return ret;
 
 	ret = max732x_irq_setup(chip, id);
-	if (ret) {
-		gpiochip_remove(&chip->gpio_chip);
+	if (ret)
 		return ret;
-	}
 
 	if (pdata && pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
@@ -736,8 +734,6 @@ static int max732x_remove(struct i2c_client *client)
 		}
 	}
 
-	gpiochip_remove(&chip->gpio_chip);
-
 	return 0;
 }
 
-- 
2.21.0

