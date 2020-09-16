Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7690B26C668
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 19:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgIPRsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 13:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbgIPRsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 13:48:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2625C0086B5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 06:43:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so7030676wrn.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KWaDQ7uhIqw2OfY7WhIv98jjbgPy0IbYqKs55rRj5Ms=;
        b=i9BalPT4mWy0zyrOLfTWbIOF6KnoctQ96zFUjXi1v5Y4OjC11p6V2XZlW9IXv2YUA+
         RULN16fN1TvTqYSHWiIBKnGFZNdIC317uMj6SJzcbar9WeItWypLMMHI4wGzYAHqPJXW
         cTtDv9q5DKw+EmrS0E+asIx9o5mZjlcC3+cv1Pe4gKL8MxdWYi8otF3RzIG5HJKWCv1/
         MYqAR1bKomXraD48pOFvLCvjtF27vYtQVqtIjTKC99MVFheSfOsl8OACeTV0SA4mzXPy
         ozAk2zBwF7g47bPxnQconu8gXT7DGul3kQS8wMnXHt/ma+QPDwiw/USCwL2/NhAkmiD3
         5NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KWaDQ7uhIqw2OfY7WhIv98jjbgPy0IbYqKs55rRj5Ms=;
        b=kzwMX9VAfvrFaab6U97RBl15vFKFBa9bQ2MhwJ9UIEXoL/RIpx5N+w4pfXFNYw3Gvk
         ZnIrfyJblUi5kWsg1dwzACdmoTc0T0iTwL30GXJ+PGL42DdqlI/fGXSkOdotsVJTJ9D+
         Z3ZSAuXNhYsGdsqnkCB/2F6JneJIyF5fDeDw1kAb+J6BkBNFhQ+021oSsLgPb2njySwh
         927LuSkE3ZTZGzvOYYXUqYH9sHTQHbGU2py/2S0CVEl+07IaBn8PXVfEEJhNVLGE1FZu
         9uR5ykzFuVkzEm3juIuDORSLWXQlwmNY/8ZSFkETzUKA5aw2fLYgJf8LXQgOceEERT4x
         6NTQ==
X-Gm-Message-State: AOAM530gNgywnNvmBG7ZpKl29wVeEOcYJ0hn4eAPs/nWDZ2WNQ06ZG/P
        JicnfSw5+sp0ZRdSOel6zXUYZA==
X-Google-Smtp-Source: ABdhPJxz9AZg7VWUTlAzS3yFXuC9HGuABP1fBBplZ8AZKiRrWDbYPIflkTEfUkBKzRBZWPgG0ngpSA==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr27318888wrs.260.1600263825354;
        Wed, 16 Sep 2020 06:43:45 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id 2sm5255813wmf.25.2020.09.16.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:43:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH next] gpiolib: check for parent device in devprop_gpiochip_set_names()
Date:   Wed, 16 Sep 2020 15:43:27 +0200
Message-Id: <20200916134327.3435-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's possible for a GPIO chip to not have a parent device (whose
properties we inspect for 'gpio-line-names'). In this case we should
simply return from devprop_gpiochip_set_names(). Add an appropriate
check for this use-case.

Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b7b608ef9..ac2c77edc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -375,6 +375,9 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	int ret, i;
 	int count;
 
+	if (!dev)
+		return 0;
+
 	count = device_property_string_array_count(dev, "gpio-line-names");
 	if (count < 0)
 		return 0;
-- 
2.26.1

