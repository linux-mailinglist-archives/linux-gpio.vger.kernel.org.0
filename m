Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F482A6B9A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 18:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKDR1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 12:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgKDR1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 12:27:07 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE111C0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 09:27:06 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 184so28174572lfd.6
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 09:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=4/Ari/JVxXZPHvRMjWeTV+TrzrBKoZb8CYCzssdi+Jk=;
        b=zU8KvdbzfejJtmjKjKXOAdFbj8v2U8pzqMPP7KGpRYW3as5BxUkHLgpYUSy1uBdQh0
         Qzu0FD5rCXdPTtKfb+3InVJ0+A4973QrqR8RyPmzYbqHY94aTp5kc3ZsUjCqjRuuBWLh
         qVreGS5MOMAfG+2e5uPK7rpzpED8Cr6ErWfQdQyp6ZDAMtuEnlRYSdV3dGqsF5ms39iT
         QKJCaW5xsbAt8YxVlSo3cXpCTQW8v3HpdK0P9K9sMvVs4b+iLDYeKTu0XAatdZD8nACG
         FHoKeT8Dpggd2/92D22hdkflRVtllYkKF+bxXaRE0y0wQO/sGu0Rt3ghOgY0bylN6zL2
         mdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4/Ari/JVxXZPHvRMjWeTV+TrzrBKoZb8CYCzssdi+Jk=;
        b=qRA3dauL0ZOpP0S4TwB7pSXTWPrk2zKYE+Zsbuv705AxwhJb3tx2EP9J1HubjV2lwv
         3CI5JTKOHpfCRxLFOGQwlOUyRf17qKSBDqlfAZ4Goq781Z419iJ3NQAFe7UA43JAZqjx
         2aABy0Wi8pADseWFuG4BAuW8D7PmxwQKAGjFT4spaaKgBvosaq3I+l/aWollJB2+bKFg
         Y4WrjSdv/nzFdLQnEfhXEVQ3iWpk/9WLy+y6HO6fCwR5+PnHZADgWTRZPbMN6HwUh6X8
         7C9MW9IN9rj1y+dC0jgp5fQSXDTuSRmjtEr3bkPCGJvK/1CM1LK4gDhKsmbzpyBWbhYX
         jG2A==
X-Gm-Message-State: AOAM531gzorE+HRIln0w11PFb47j0p3SEW6w9xwV97UYjIlk5GO6a8Vy
        4+b7GQxAdrVRemUTmTjsnWu4ljyXmisGmK0DYRvt6g==
X-Google-Smtp-Source: ABdhPJzI4co41WmUWmXKKprceuX3wRtUhSLI5hYFN4sZyUcohC7uPZXCCtxbkrTqkwd3l7U1L2/9rKDlmESpLCyEDGg=
X-Received: by 2002:a19:2d4f:: with SMTP id t15mr748178lft.346.1604510825213;
 Wed, 04 Nov 2020 09:27:05 -0800 (PST)
MIME-Version: 1.0
From:   Nicolas Schichan <nschichan@freebox.fr>
Date:   Wed, 4 Nov 2020 18:26:54 +0100
Message-ID: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
Subject: gpiolib sysfs access when CONFIG_GPIO_CDEV is not set
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Following an update to the 5.10-rc1 kernel, I found out that trying to
export a GPIO using /sys/class/gpio/export fails with the kernel
reporting a message in the kernel logs:

# echo 41 >/sys/class/gpio/export
[   46.761394] kobject_add_internal failed for gpio (error: -2 parent:
gpiochip2)
sh: write error: No such file or directory
#

I have tracked it to the fact that I have CONFIG_GPIO_CDEV is disabled in
my kernel config: Enabling CONFIG_GPIO_CDEV made export work again.

Enabling CONFIG_GPIO_CDEV and commenting all the code in
gpiolib_cdev_register() except the final "return 0;" made the issue
appear again, leading me to think that the issue is related to
something that is done cdev_device_add() must be done to fix the
issue.

Looking at the code of cdev_device_add() I was able to determine that
the device_add() call made there is required to get the gpiolib sysfs
export to work again.

In the end I have done this (which I won't even pretend is the proper
way to fix this), and sysfs attributes are finally working without
CONFIG_GPIO_CDEV:

diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
index cb41dd757338..dd72bd0e4af4 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -16,7 +16,7 @@ void gpiolib_cdev_unregister(struct gpio_device *gdev);

 static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 {
-    return 0;
+    return device_add(&gdev->dev);
 }

 static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)

If this is the preferred solution I can send a proper patch.

Best Regards,

-- 
Nicolas Schichan
