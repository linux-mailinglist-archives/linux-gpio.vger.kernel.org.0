Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68CA2BC4B3
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Nov 2020 10:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgKVJ0B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Nov 2020 04:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbgKVJ0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Nov 2020 04:26:00 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF15BC0613CF;
        Sun, 22 Nov 2020 01:25:59 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id q34so11400097pgb.11;
        Sun, 22 Nov 2020 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLNf64cxRwyCkQ3UwwzNzMfSfN7sMJmJohesR2Q1JJA=;
        b=VSGqEpxg+T1nAqFaEn3HalChOB0AZCOeaimtpZAWMCeItGIKb+L2eqvE2LdZE+6aUS
         wjVBN338VwTR7dCF0NjdZYHmv4PRFQoUPbXhCvQk/ZMSCLPGrSS2XUXd9ZjzbgX5ES48
         QqJH8cMowiK/6Q8aWHzGsDyOX187lpXhGNWmf6L+R5jgbvdCFv4IMDmK7uCw0RZwk1xr
         XGv7SAaRVsi+a90swe90WjJNoskwf9M01bU6DLqzkNe7u1BtoLPx8B0QKCrJgfUv9F4c
         57llE+egVUG0ldkzKVALREUnxgOEg721fHLRWG/l9CtQsmBy+fTR56VIAiHcoSE52+9J
         XZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLNf64cxRwyCkQ3UwwzNzMfSfN7sMJmJohesR2Q1JJA=;
        b=sK8joSUKnNgJmwQEN05r1+kR9O2uy1AXR8Jkub6VSB6iZOEOXPrKdpK6ia+qWb0Tqh
         gdma27AchDL7Fjca5+x0qrOY15pF0fX7p2nHXnWP29tPumCiXJngg0XQxuUC7cXc2jDf
         PlwxALmOKdJhS43GXDu3nktG6DqwZzzb3WoDaQl53LxYHYND+DOcFv7nRDennUA8tG0z
         qwPrZHLoJy5uHXrakERvwmM/UOKhRCM/+cqwGozTqMm6zR1lQS4bLd9P2oKwZeMSzeWG
         Tafu2UuW+DY8bw4HGOllO0HnizrpsVivBzgV4VGx65DCkJwoKjnkm1DtGPeSZl2s+na9
         2Jeg==
X-Gm-Message-State: AOAM532EvKa5pOc14AB/C31+VKx0ZkXCt8JuBeoZR/Dc7fVP557sYFIZ
        IXQV94NKqG8zfARsR0VcAM8=
X-Google-Smtp-Source: ABdhPJzypt4O1tQ6sk09hDVizpeDqRCGRkN6F1rnvELSMIOyTUDFOtfBzn3iJtQrjkPjik5L4WoYEg==
X-Received: by 2002:a62:7ac2:0:b029:18b:c5bb:303d with SMTP id v185-20020a627ac20000b029018bc5bb303dmr20950694pfc.71.1606037159002;
        Sun, 22 Nov 2020 01:25:59 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id k23sm3643090pfk.50.2020.11.22.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 01:25:57 -0800 (PST)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] Documentation: gpio: fix typo and unclear legacy API section
Date:   Sun, 22 Nov 2020 18:25:48 +0900
Message-Id: <20201122092548.61979-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "Interacting With the Legacy GPIO Subsystem" of the documentation
was unclear at best, and even included a sentence that seems to say the
opposite of what it should say about the lifetime of the return value of
the conversion functions.

Try to clarify things a bit and hopefully make that section more
readable.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 Documentation/driver-api/gpio/consumer.rst | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 423492d125b9..173e4c7b037d 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -440,18 +440,20 @@ For details refer to Documentation/firmware-guide/acpi/gpio-properties.rst
 
 Interacting With the Legacy GPIO Subsystem
 ==========================================
-Many kernel subsystems still handle GPIOs using the legacy integer-based
-interface. Although it is strongly encouraged to upgrade them to the safer
-descriptor-based API, the following two functions allow you to convert a GPIO
-descriptor into the GPIO integer namespace and vice-versa::
+Many kernel subsystems and drivers still handle GPIOs using the legacy
+integer-based interface. It is strongly recommended to update these to the new
+gpiod interface. For cases where both interfaces need to be used, the following
+two functions allow to convert a GPIO descriptor into the GPIO integer namespace
+and vice-versa::
 
 	int desc_to_gpio(const struct gpio_desc *desc)
 	struct gpio_desc *gpio_to_desc(unsigned gpio)
 
-The GPIO number returned by desc_to_gpio() can be safely used as long as the
-GPIO descriptor has not been freed. All the same, a GPIO number passed to
-gpio_to_desc() must have been properly acquired, and usage of the returned GPIO
-descriptor is only possible after the GPIO number has been released.
+The GPIO number returned by desc_to_gpio() can safely be used as a parameter of
+the gpio\_*() functions for as long as the GPIO descriptor `desc` is not freed.
+All the same, a GPIO number passed to gpio_to_desc() must first be properly
+acquired using e.g. gpio_request_one(), and the returned GPIO descriptor is only
+considered valid until that GPIO number is released using gpio_free().
 
 Freeing a GPIO obtained by one API with the other API is forbidden and an
 unchecked error.
-- 
2.29.2

