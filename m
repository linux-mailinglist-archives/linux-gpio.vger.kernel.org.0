Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9691D11A02B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 01:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfLKAqo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 19:46:44 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42652 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLKAqn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 19:46:43 -0500
Received: by mail-pl1-f195.google.com with SMTP id x13so663310plr.9;
        Tue, 10 Dec 2019 16:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1elZBuJY4GBuX3uFolJrHbi8MGBzm5QM+2Z4mH8mi4=;
        b=astYXXI7KsL9ZVMyven/lyBSCD+/nkxR0Wp1M28nr0/q9Q1rsAWVyZSl7NoVK9semO
         L82R2jAK9wxxEz4ovoTvYcF07SL/oCYWyVB+xKpOGAIkeLaWFEDtc3a1xr5dIvF8WCsc
         Z+F5cexr46s+Y0iHX4cd6CFEwjUv4QjLsy/MS5et2p3y5tzTZeaK84ZtdycGQYtjiQx7
         PRBvKfAZA7V6myac+8CopbpjxyQSY10TyNcR+75/ZH18u/EiRXPoiOcjmsxUpcVkZ0VC
         rpygh6fUHeXcP1OTO9gN7M2M7YusMcbZ1ZLc7D2YtVNZE8E4Qvv+xlFTxI9qQHAaw2G2
         Jl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1elZBuJY4GBuX3uFolJrHbi8MGBzm5QM+2Z4mH8mi4=;
        b=EZVeZA2qlVQmJGMuVgQd8cazX1XpmTNql5wtynvbySil2Mc5Ph+r4a+WgrSLu7wMRr
         BJn59opEq6tc5tQN1PvoKOmHhCaVVeMLhyBpnZT2WT2JrZqc9BvHRbaYWbTJum7VxW9X
         SClRtvcrpNTBG29q4cC6TxvisFfoC+PDNomnWM0ecmZq5K17TPY1HkOrJAK2EPTSEorC
         Fn8EagjNIizmmVwNCr3wG7JDI6XYH5XFa0J6LFvVrvdMrcGlB8JR1gP98eDreYMTt9qv
         OmmdoM5PQatstuFMYCzerId15rwIwQPdI4Ymw0x3KCtEkhEiMFYHfXqjvuoxyVqTOx/x
         HHGw==
X-Gm-Message-State: APjAAAV5xHoyn63I9YchKPk6Rx0AR9dw8UwqHKd7HIjKe1o46Vsulwqx
        gViDlmsQpiWM+bB7IqxDj9dJSH+uveE=
X-Google-Smtp-Source: APXvYqyARvj0CN1MobUTixxAcUMZJF1WTGiash12tvmzPnRJFwqM9PZfuau42OOlxtBoIAQeVfPbyw==
X-Received: by 2002:a17:902:bf06:: with SMTP id bi6mr278190plb.229.1576025202782;
        Tue, 10 Dec 2019 16:46:42 -0800 (PST)
Received: from sol.lan (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id t8sm230431pfq.92.2019.12.10.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 16:46:42 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        bamv2005@gmail.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
Date:   Wed, 11 Dec 2019 08:46:31 +0800
Message-Id: <20191211004631.8756-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Restore the external behavior of gpio-mockup to what it was prior to the
change to using GPIO_LINE_DIRECTION.

Fixes: e42615ec233b ("gpio: Use new GPIO_LINE_DIRECTION")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changes v1 -> v2:
 - add Fixes tag.
 
Fix a regression introduced in v5.5-rc1.

The change to GPIO_LINE_DIRECTION reversed the polarity of the
dir field within gpio-mockup.c, but overlooked inverting the value on
initialization and when returned by gpio_mockup_get_direction.
The latter is a bug.
The former is a problem for tests which assume initial conditions,
specifically the mockup used to initialize chips with all lines as inputs.
That superficially appeared to be the case after the previous patch due
to the bug in gpio_mockup_get_direction.

 drivers/gpio/gpio-mockup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 56d647a30e3e..c4fdc192ea4e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 	int direction;
 
 	mutex_lock(&chip->lock);
-	direction = !chip->lines[offset].dir;
+	direction = chip->lines[offset].dir;
 	mutex_unlock(&chip->lock);
 
 	return direction;
@@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct device *dev;
 	const char *name;
-	int rv, base;
+	int rv, base, i;
 	u16 ngpio;
 
 	dev = &pdev->dev;
@@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (!chip->lines)
 		return -ENOMEM;
 
+	for (i = 0; i < gc->ngpio; i++)
+		chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
+
 	if (device_property_read_bool(dev, "named-gpio-lines")) {
 		rv = gpio_mockup_name_lines(dev, chip);
 		if (rv)
-- 
2.24.0

