Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89FE7C54AF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbjJKNCS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbjJKNCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 09:02:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22B9A7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:02:14 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405361bb94eso69777525e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697029333; x=1697634133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63QGBdQugmbIeYioEFVwwnNIFK60s4bwdnFfbGlBXP0=;
        b=XB4nJkeHIqqzy8hZmcOFKdmKKaWiz8h8kfpAWWDd3xcIxr4SqO9o4BkT5o8eONs9cu
         +YHITi+JPZkytUeAEx40urGGvENrKruocoF1VhO6UNCjoVzAJDOa0BP8b5PNQghsCW2M
         agCASxTf0e2Nit8G9rAoZQAepGaKAo8uzfWb1yOP7rpjHHb6+l76bJ2aWgBTif1rStyn
         Nug8mdJdq0qoS/4aEaqNIk7T2TJR3ZtPY3ZvAC1H83sWEHq6C86pDff1m3cQg2KTdDok
         QlKUMcY9eWzyC38MG6bc2w71z9HVKHBA5beIgPmseWIBwcXP/3JfUn4xx0yM78y3d9Tw
         ZFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029333; x=1697634133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63QGBdQugmbIeYioEFVwwnNIFK60s4bwdnFfbGlBXP0=;
        b=q1kqS3owevqXG/M2/Eb8wLNXTuyljuUpAx86BV5NbAiYgldAsjrpCy+tkaiVApVN6C
         eqPjS8xhMGFj97UxOnwid2Mg3xAuyaYsAgvWC6Q4klKiNdQ7vDuxXhfBfwShKX57GsWl
         ebNDfObyI+pp/74p6uSzNf5Iw+OGGC75ObA/llGGb3h/KWESGl5e7BApGiv7WdhJ2h5/
         kLcWhLXygdmEGbOwgFSc5nX6+iHI2cHlBd3OgfHwZesJLhu6/y8eckkni2zLq66ubyX3
         PHqHidedicHZjlViHlZoRja4a+VO2e+oInZxLg9eennpKZb1J0mgq6lVYxrBHceTwp1d
         lfnw==
X-Gm-Message-State: AOJu0YzqGdtqEThmmvyTWi6ZPyJ2dCqKw4AZbOuHfS0sfDw4rUc7pyVD
        vg9EiA1BZOclYGboi4Wd4RTtfA==
X-Google-Smtp-Source: AGHT+IEHvgJ5iDJHRcGsv5VgNS5LfCN1JqKWPOmgUXFyggsQCs9ifJAjW9be6gKPlRqoj2E9if3BIg==
X-Received: by 2002:a05:6000:68d:b0:32d:88fd:5c65 with SMTP id bo13-20020a056000068d00b0032d88fd5c65mr1290432wrb.1.1697029327724;
        Wed, 11 Oct 2023 06:02:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id s13-20020adfeccd000000b003198a9d758dsm15455375wro.78.2023.10.11.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:02:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] i2c: mux: don't access GPIOLIB internal structures
Date:   Wed, 11 Oct 2023 15:02:01 +0200
Message-Id: <20231011130204.52265-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The backstory for this short series is that we are identyfing and
removing all unauthorized uses of GPIOLIB structures across the kernel.

For example: there are many users that access struct gpio_chip when the
only user allowed to safely do this is the provider of that chip.

We are very close to removing gpiochip_find(). Another function that
poses a similar problem is gpiod_to_chip() which also returns the
address of the underlying gpio_chip without assuring that it will not go
away e.g. due to a hot-unplug event or a device unbind.

We'll need to replace it with gpiod_to_gpio_device() across the entire
tree. Let's start by actually providing it and adding the first user:
the i2c-mux-gpio driver which dereferences the otherwise opaque struct
gpio_desc.

Let's also add a helper that allows to retrieve the address of the
struct device backing the GPIO device as this is another valid use-case.

Finally, let's un-include the GPIO private header and fix the code to
access the device in a safe way.

As the change is pretty minor, it would be best if patch 3/3 could be
acked by the I2C mux maintainers and went through the GPIO tree.
Otherwise, I can apply patches 1 and 2 and provide an immutable branch.

Bartosz Golaszewski (3):
  gpiolib: provide gpio_device_to_device()
  gpiolib: provide gpiod_to_gpio_device()
  i2c: mux: gpio: don't fiddle with GPIOLIB internals

 drivers/gpio/gpiolib.c           | 38 ++++++++++++++++++++++++++++++++
 drivers/i2c/muxes/i2c-mux-gpio.c | 12 +++++-----
 include/linux/gpio/driver.h      |  3 +++
 3 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.39.2

