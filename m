Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A6A564C7
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfFZIoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:44:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36584 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZIoR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:44:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so1002609lfc.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrsdhnFau8at9JlSXyhg1bmlEKtsXOdJ/aJxqZu1+v4=;
        b=owCoZL5C5zOeIJDMvu+Es2yz/dt3bZhbw0aV5tVJPdvRcW1OjLhvSnzslp22WLmySj
         jvZokQHYTkBiGqnuMp1XhaYQZWkF/OKXtj4cHgr8Dcy940J7yTzoyEYLfd5x6SNZ3eEE
         m2TUPGr0GN4n5Jn7DclDo9aGkPyer/BpBB64ifKfClkNzYYYBXQG3Uy7pPE2/TgKdxOC
         wPdkTeE/jt6y0n0g2bQhs2TQd3tjAALvvvlbMCPg7Tij189nyLiwhNdFEdeIuA9l6zmg
         Z2f7eC8hGhR+B5wn/+y/O4mV4KwSSdsZ/CMMVuSLCj7d/Po7ww1iaNUyPPigV5WwBVHm
         5RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrsdhnFau8at9JlSXyhg1bmlEKtsXOdJ/aJxqZu1+v4=;
        b=BrJqq+Z6ytfdeqvDliSGK/iMYJUKPe5f/FoiSy3X3U+L/bx6XMb/liJb7RbZhDQCbZ
         f0kGE0lY0JjnmbBOvjPKmcX7nHoCuvBRvT4rGW5lm3jpgNNV2SkbeZ3VZbHFDpIc7LPW
         ClomXcSSMHjTaPO6gV1jNpfNMWGZmLDeBH1hoKBB2ehKyRNy7Qx+DgSC4OSYbVmyp8ZM
         JVoLM8RuPqXEzabs8LBjRgkjw8J0+MGtg54qUyd0TMTFSgjT6D0vDG/0E1Nfkq7ZQ2S3
         PHEGPcuRkC+ROh4aC4y6AE1MB3SyMc7HXMH7KZERpEL5sq8gt9R4C8e2f/ZcyvjOI4gf
         EFlA==
X-Gm-Message-State: APjAAAXYxrfMuGr2cY0V+KGlEtVzztkL/knzx/WMirzaLEVwsUKMxT9b
        7iwJLy6Dc9eaHQsLtTNH4ZuHqsm8+hU=
X-Google-Smtp-Source: APXvYqxj63kFCvI5i+7HqiOfhykEA5py99i/BiBo/PSYrWas4Un9pQS3KvhCYc7HiCcGCsw6loUjhg==
X-Received: by 2002:ac2:51ab:: with SMTP id f11mr1931189lfk.55.1561538655448;
        Wed, 26 Jun 2019 01:44:15 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y5sm2683635ljj.5.2019.06.26.01.44.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:44:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/5] gpio: siox: Switch to IRQ_TYPE_NONE
Date:   Wed, 26 Jun 2019 10:44:04 +0200
Message-Id: <20190626084407.27976-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626084407.27976-1-linus.walleij@linaro.org>
References: <20190626084407.27976-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The siox driver is hardcoding a default type of
IRQ_TYPE_EDGE_RISING to the irq helper, but this should only
be applicable to old boardfiles and odd device tree irqchips
with just onecell irq (no flags). I doubt this is the case
with the siox, I think all consumers specify the flags they
use in the device tree.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 0b4450118865..40067e1535d3 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -247,7 +247,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	}
 
 	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
-				   0, handle_level_irq, IRQ_TYPE_EDGE_RISING);
+				   0, handle_level_irq, IRQ_TYPE_NONE);
 	if (ret)
 		dev_err(&sdevice->dev,
 			"Failed to register irq chip (%d)\n", ret);
-- 
2.20.1

