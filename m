Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EC8EFB5E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfKEKdl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:33:41 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42653 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388307AbfKEKdl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:33:41 -0500
Received: by mail-lf1-f68.google.com with SMTP id z12so14702686lfj.9;
        Tue, 05 Nov 2019 02:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BGR/OHx7hm7Z21yhiYS2yL3adDMF9qlPbgCfBFQDZgs=;
        b=Rqq4MKHmXSW3756Q0mL1QWu4Bmz5WndeL0gi81hwb/MCbcAxNzlywzn+dbOCv6tmZT
         wxea76bborbWpM7P4EhYdGy3f/1ELgUFXzTtgSKNyjiNW+Q46v+9fXOLOZTBL8Zgaamd
         rB4OHSbYeHZdEQzKBXZL/MOao17YwjiJdalMzv1JgQUv/P3SePfrXIpLSWlbRVw/cUPl
         hhOkmwnTdRsN1w1e5LhhJZvBFAWd+FPI+4J4FrBRp/egZIK2nzTk0IOI2yNdDYPsoy7/
         4EQHTghMhlysL5Edi7IaPZXlRs2D8teSy8G9NvqcWzWEK67vHg8pB5FJVFjWDHJKx/L6
         xbzw==
X-Gm-Message-State: APjAAAWMpUQj1pLeXxdo1Lq7K/96G5/PU0Uf6ZbtGO8ykHm3JmGLIgwG
        W3xZ6uKVUgS6wd40SRprv/E=
X-Google-Smtp-Source: APXvYqyX1i4Hu5XAsl/6xtJyY1f1oL0OnejdmmSCi36xJxFbxtihUXBfi2lYhNxDx7EpOmAbQlLEdg==
X-Received: by 2002:ac2:4248:: with SMTP id m8mr20035672lfl.94.1572950018626;
        Tue, 05 Nov 2019 02:33:38 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 132sm9007054lfk.8.2019.11.05.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:33:38 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:33:29 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 46/62] gpio: gpio-tpic2810: Use new GPIO_LINE_DIRECTION
Message-ID: <0718414bb87c44b5967d83197f8f47f652527dd5.1572945972.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945972.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945972.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-tpic2810.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index c8b34d787eed..99d5a84a9129 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -39,7 +39,7 @@ static int tpic2810_get_direction(struct gpio_chip *chip,
 				  unsigned offset)
 {
 	/* This device always output */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tpic2810_direction_input(struct gpio_chip *chip,
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
