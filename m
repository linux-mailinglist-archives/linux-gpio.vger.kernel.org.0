Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914632282BD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgGUOuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgGUOus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807AAC061794;
        Tue, 21 Jul 2020 07:50:48 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f139so3154128wmf.5;
        Tue, 21 Jul 2020 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjTgQI+41EvFAwx0NyOwWkTwxupqkoNnMMp/Owe0Gtc=;
        b=OzBO5Vr4Hy68lnPjQ94xutNXTOKyNEI53yTxtB0gJa1j7pjQSvIU/qRv1/YI3UqagB
         D5M3xd8xXiSVD/QPfvB73JQ5gQ6PP40UtbRy1X02uu5kyld0rkmVjs2yUkGPemg+kOlD
         gLV3wn/6MAU6azFbKwm10yzWg5mNwj07JG9TmSdGeSJLnx7vxQelJefhvkJITRMlb6Fo
         /N0eH8MX5Ao6ZLwWk6RAVdqUwIUg/KSiqfcjj/2VW6TT2Vh/AKNevcmY4oBT7rQoh//H
         LrBdjQXiphUjiUaNEdHUqpqAQz19uKfLkoM60T10ffPSusGUOzbmf5kDJlcazjZ9z049
         QcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjTgQI+41EvFAwx0NyOwWkTwxupqkoNnMMp/Owe0Gtc=;
        b=O3ZeT1i/AWJR9fL9I1drKKfMmuCZsWwPRh5CZOgQ9NYQGBlFhgBBkCsE9JDyJefZDB
         V9LJyl3EfI3N9BnVgngXkawaBvOOoDmuDDmVEuH/q5S43iu+3BTmFU22CEfXEYgUhA0K
         jGBXlWWHL+L1sLf/gM6WqatAJ8dEAD0UQWoEdGAAVGvAIPKnDhd7xSzyd+4N7az6x0fS
         TmCyHRJAt11o6lIVjiHVDxr6FyWo6TEXMtybpsLf95b9f5fib/yIz+VrUM617iwY/TWG
         nct2AsNxiFRJgyqdpGQ2pq6+RqFjZuKmauaGYjxAlyZ8WfivPOAAYdGE+y3/99RorJU/
         1Ocw==
X-Gm-Message-State: AOAM5334Cf2z0yc4lsHeHb5FRL2APg0cXppn1PnurCceHZMgrIwNmKFt
        5lMvefnzgZRV6mFTz3V761U=
X-Google-Smtp-Source: ABdhPJwm7WzbM4duMtwzxm+ZD2FPYZtyN9Cg/bJy3jrSud6aeAD2fIN8bZIbNFc7ABt/Qj1EJ1RHOQ==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr4318341wmb.53.1595343047215;
        Tue, 21 Jul 2020 07:50:47 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id 26sm3478799wmj.25.2020.07.21.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:46 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 3/4] gpio: gpio-msic.c: fixed coding style issues
Date:   Tue, 21 Jul 2020 16:50:26 +0200
Message-Id: <20200721145027.770268-3-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721145027.770268-1-abanoubsameh@protonmail.com>
References: <20200721145027.770268-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added a lined between declarations and other statements according to the
kenel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-msic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 0bef1a5a9b70..84e00e0ab953 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -166,12 +166,14 @@ static int msic_irq_type(struct irq_data *data, unsigned int type)
 static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct msic_gpio *mg = gpiochip_get_data(chip);
+
 	return mg->irq_base + offset;
 }
 
 static void msic_bus_lock(struct irq_data *data)
 {
 	struct msic_gpio *mg = irq_data_get_irq_chip_data(data);
+
 	mutex_lock(&mg->buslock);
 }
 
-- 
2.28.0.rc0

