Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFC321823C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgGHI2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgGHI1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:27:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CF1C08C5DC;
        Wed,  8 Jul 2020 01:27:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j11so4392949ljo.7;
        Wed, 08 Jul 2020 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQKJ7Gcwme/d26+LQ1Wsw5gxfvCSqjg+JdK4sM2LYPw=;
        b=ifSh42uk1ltrAupYkU4/2bRNxklEhIIQRdQ4tq0LR2Z+LgulrQN3QoQANFTLeHzEZt
         C/4/BkItkMxzHDrcn3rpn0gDv+en0bShckJTWnCgHH6fUK0RE2vLnrU6EIf/BDjF2g7Y
         QTK3RxeDNE6UKTac+Z8kJiannXfoXcsB8DxgWXw9g40oGXRfMhcI8W22jQJnyLWmE9Ik
         TwUTTzeQDi29BJaq9UVfPV7y6PM1NWhWsib71/pR7rEJs+xNTTGqJ2+5FTqpdlxJHtVH
         ozqwqxPeGxRgR3cTUDQLvk5RVcCNSCmhtTtUUwwqwDPXrmVVVaTJe0ju3Lo55pUNI7N0
         mVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQKJ7Gcwme/d26+LQ1Wsw5gxfvCSqjg+JdK4sM2LYPw=;
        b=ibqG6e+LKCWz8OdZ3mDlT0MulGiXGkBBVlI6WWWr6mWQpGouvV/dzrQK6ggAKux6De
         QvQKzfUbfP3pA/2kSg/g+VzMAmysNsc9KHLjjJ0P82i1dFdkOLbeBSs2ddHQTp3UhF/t
         tA3gZwgY0RjtJyvCz1te9uclLubsy6G+A6MoS7fYFJHwV+VgyWxPcwSPcN/vjzbagyQ4
         QSDmo5EMzjqEZH0kk6CcjER5wllVzmjc5x6eC3CDn/pZ9dsEmNQ6V6M57KzcV1IqnQ7N
         Da69miqcJ5R9iPJfCzLNmNtSZfdbAKYrnHEmWi+2ire2I8NgQS6WULJLO0o6JdiLLW9m
         hsLg==
X-Gm-Message-State: AOAM530p6Av74EV22rsRvlPdPl+zft01yVaKh48t/CL8MANjbQB5aiJC
        F0AliWtu6oGZmRWDaJTXCTM=
X-Google-Smtp-Source: ABdhPJyxKOuwzCAeZmbQC45AUlpmAxUlyQhOJVbjrTA6Nysp51PqkESQZMITJXp7GiYRPZhCmoSJMA==
X-Received: by 2002:a2e:3010:: with SMTP id w16mr31831123ljw.449.1594196872399;
        Wed, 08 Jul 2020 01:27:52 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id d2sm737555ljg.6.2020.07.08.01.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 01:27:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] gpio: max77620: Move variable declaration
Date:   Wed,  8 Jul 2020 11:26:34 +0300
Message-Id: <20200708082634.30191-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let's move the virq variable declaration to a top-level scope just to
make the code a bit more visually appealing.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8d54bc4307c2..6861980da0d8 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -27,7 +27,7 @@ struct max77620_gpio {
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 {
 	struct max77620_gpio *gpio = data;
-	unsigned int value, offset;
+	unsigned int value, offset, virq;
 	unsigned long pending;
 	int err;
 
@@ -42,8 +42,6 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 		return IRQ_NONE;
 
 	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
-		unsigned int virq;
-
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
 		handle_nested_irq(virq);
 	}
-- 
2.26.0

