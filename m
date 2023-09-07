Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4F2797538
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 17:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjIGPqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 11:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245435AbjIGP3a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 11:29:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4305B1FE9
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:29:02 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso12350065e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694100490; x=1694705290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzpZWHat+ptY4i8T7d70uw7fEAXlmofiE9gJ/p0X22U=;
        b=lLFmQhX/6PTdTS5/V36fzyf4K8v/UUBciFnZZ6moSwWJHFMzMri0SGVDsxkeH+SmQa
         76cwT8vOfJWWRWkyB8GL8kIL1qEv7tm5g64huvaNi7qpDy3i+okE8nhDNmHxve70E7Ts
         rO+nahpyr5vt+croe0OfraOS2tE6LKb4hLoFynjmdlfs1XZRj/72DzteF57WsHOfDgsO
         +ZvbbVVcxs5pO15ABOlfNBXnOJ8CaHl3ak02GGooB58hBca2qBOqjGZbN6BWHqPj3gwf
         3nDNxRiRRmlNP5CAMxn9cd5r2O/95cOeihQrbWEt5nqYw5wIB0V0gbiv2Dl1ZdKZram8
         S34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100490; x=1694705290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzpZWHat+ptY4i8T7d70uw7fEAXlmofiE9gJ/p0X22U=;
        b=l9nM4cnKQLkuYKGlAvAMCtG+bvEoqjXZv6E9D1Dvp8izHlyAL+DO6nZa2JQAuUPccF
         ljrQbQfJc7gu7rDNlEvZeRbwft2EhO0/PoifGZC5KGBfhqyrTRo0xzFqIQbJFZkGYNh7
         /mj4UaMa8y0QbHdAS4VlT1A6/Ro4A6rVecFxImdbWVd5G4Y4JJW7LNFHQbKoNfCkMGvE
         Zi0k8X3GXKSXlHW+FY7thlqv/G/GU2/65dFxDQgvjjiUnGy10wXLqBn8+SkjWxQMLxut
         aF71KjJUse3T0V1a05u9jcYlhCtO1bR3xUZdNp1TTPDcdjBLaeGUTBGkPoLAioOucD5e
         ReJA==
X-Gm-Message-State: AOJu0Yyn0ZTDxwiITpa/IsTHbLNDXY30lXpgjQ7qU8y4XjmEcYmKA6rL
        Dss5uFdBG8C9vFHJ44iTni3loQ==
X-Google-Smtp-Source: AGHT+IEMrWqCe5xMabRBv863fM0ihgw8yV+E02Os/rx4rFHyiXrXdvVxp9K8Xsp3/xkyjEuBAAYEFQ==
X-Received: by 2002:a05:600c:2a41:b0:401:be70:53b6 with SMTP id x1-20020a05600c2a4100b00401be7053b6mr4884675wme.15.1694098353959;
        Thu, 07 Sep 2023 07:52:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:56f5:e2d4:1e04:b28e])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003feef82bbefsm2757588wmi.29.2023.09.07.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:52:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/5] gpio: mockup: remove unused field
Date:   Thu,  7 Sep 2023 16:52:27 +0200
Message-Id: <20230907145230.44085-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230907145230.44085-1-brgl@bgdev.pl>
References: <20230907145230.44085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The desc assigned to debugfs private structure is unused so remove it.

Fixes: 9202ba2397d1 ("gpio: mockup: implement event injecting over debugfs")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 17d4d48524b7..ff1a263f1b05 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -58,7 +58,6 @@ struct gpio_mockup_chip {
 
 struct gpio_mockup_dbgfs_private {
 	struct gpio_mockup_chip *chip;
-	struct gpio_desc *desc;
 	unsigned int offset;
 };
 
@@ -369,7 +368,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 
 		priv->chip = chip;
 		priv->offset = i;
-		priv->desc = gpiochip_get_desc(gc, i);
 
 		debugfs_create_file(name, 0600, chip->dbg_dir, priv,
 				    &gpio_mockup_debugfs_ops);
-- 
2.39.2

