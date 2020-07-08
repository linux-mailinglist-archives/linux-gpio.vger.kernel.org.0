Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85B3219170
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgGHU1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGHU1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:27:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E23CC061A0B;
        Wed,  8 Jul 2020 13:27:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so52151269ljp.6;
        Wed, 08 Jul 2020 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQQoHIbvJW5EDg7H0+gJpKf4aGk7u+oklTpgjOewH2I=;
        b=JkySrmxz2dzfwq6SrvWCWbbFIySR57ahieVlkp0VsHp0PXJWKij6qn1rkMOVC0s1Og
         RHmJClSXFneSZvOplFmccnGw7oZzhh1z+/CUBBtjdWU1blwVKPYVw8/eEmZOxE4Ko2AT
         po17D8mFZ4rp1hZwJ3vPFMBpcmnjVzoPfQoiVWdq4ZsMbu+hw6994+ud6CMUvpor8cx4
         hwc2z7EzNybRsdbAGpqL3uFxvVVK0kal917fezSCbSjvq364dh96r8XQSBfzVhPGuH4L
         H2PZ9CsKzIuTAhipb4q3AQPqHA5q1EFns6UeLnp7Is/4avydc5g9HskhYDLyB86ZsB6q
         h6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQQoHIbvJW5EDg7H0+gJpKf4aGk7u+oklTpgjOewH2I=;
        b=Kh4txpplwMF37/J28+UHmP+hpvGfnDa5eKfyMfL7dgY6piRtEE080hz0K+jfzeSFKN
         yQvYQHWqnWA7Ae3rNuJ6ufPyKHFBWoVQUsrLFFEPysp17w2L0S/YDEwYmIvd4CCmmY5/
         7Dz6/0XyZm6fOvaS2gi758FZ3KhBj/nwM3R89rgwDvS73CudZgIFKqJn0g12MRozZNj/
         iCe5Ee7zsKMs5l4ZgIw1H6Z9QAjU8xhbF9C/gikEDTLWjuiCMCqcuk8LLbow7TprHph8
         oOfQE5JKfh/3NCnrp0NT/Cqudbx/VnCoD8RMKtcsdmXbJthnEbXMipWRjjDa8xJySWUY
         vkPQ==
X-Gm-Message-State: AOAM531mypGMjhk2iqgqlC4JB785uBbLcxECxCN+zbUYCJX52duOxnQg
        LM74AHxT/bziAS/HxLLmh0A=
X-Google-Smtp-Source: ABdhPJwLrkA4LrPtHV1k2KRKaym/NQJZ91PW/ZuXesCvPLtwl7zOQlA8IMmdqf6cubnjH4Q8FQ7qjQ==
X-Received: by 2002:a2e:919a:: with SMTP id f26mr3771836ljg.244.1594240019863;
        Wed, 08 Jul 2020 13:26:59 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:26:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] gpio: max77620: Don't shadow error code of platform_get_irq()
Date:   Wed,  8 Jul 2020 23:23:53 +0300
Message-Id: <20200708202355.28507-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_get_irq() returns a positive interrupt number on success and
negative error code on failure (zero shouldn't ever happen in practice, it
would produce a noisy warning). Hence let's return the error code directly
instead of overriding it with -ENODEV.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 39d431da2dbc..9121d2507f60 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -264,12 +264,14 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
 	struct max77620_gpio *mgpio;
-	int gpio_irq;
+	unsigned int gpio_irq;
 	int ret;
 
-	gpio_irq = platform_get_irq(pdev, 0);
-	if (gpio_irq <= 0)
-		return -ENODEV;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	gpio_irq = ret;
 
 	mgpio = devm_kzalloc(&pdev->dev, sizeof(*mgpio), GFP_KERNEL);
 	if (!mgpio)
-- 
2.26.0

