Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AFC34CE2D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhC2KvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 06:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbhC2Ku4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 06:50:56 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92615C061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 03:50:56 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x126so9576255pfc.13
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=satztO+VQ1S8ilUifK0SKeeA12xdhue7rWHZqa5tcQ0=;
        b=eb3V1H3me2pzSve/RPcEVCJvXKI8e7t+LBUAJ+ZNZdO1/WPk/Mw7xVEECx7GWAL9fz
         igcXzA9F4RpSsxBoOXS2d1eGm/bS7aX4YfTkeAoe2K/X3gQa17Okn3AS5yPuw6ThlFra
         JnMQYoDcrpOSF9c6ca+eE5+yoQ+rEXZMfUGL53q1M0ybBTboClC1wPprekLwfGlSyCDe
         gcts2muVmrf9C+MAU9MUFIKG8vYKjthzVHduyQTTjW5NjrL0sa/VkElrTlf4TnGwc37v
         A2I5gev/Eoj4XoB7XIVIal/sa1pODjr3nT8Oj01Y8vBSN5AOYoyAhzRcX/FJ0Vv/xI/i
         AbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=satztO+VQ1S8ilUifK0SKeeA12xdhue7rWHZqa5tcQ0=;
        b=ZZGavxOZTUSEatbt8QfgETiudW6keSaAELMr2u9kjjTZ70ChgElutFEppswX7Jkiz2
         qTZJbVXLSAwrk5t/i0UfYmDEYHsoPjYHLH8vXyH8ORpioPOC6JcrTnpIaLN7sKfMdE5r
         RQs9F6Wt5VxW0poeQHGuYFEtswlZqSALULyLGSvFfBWtMSZ4rVd5//ThSNNKEORL0x5v
         bNK77Qo4DQbfJcnrCV+eaC2hSqROfYHrrQACleiyZmWMgXPj7es1v8eXEY/OS518RXNg
         ZOqhl4/D7fkzCrZVYUZR2uZ62UTq4BfxCKD5i1LGHjmuorq4RJP7ked+pvmPT2JAXPcg
         KmXQ==
X-Gm-Message-State: AOAM530WTCjP4g98iiMrTTN8OlR4M44PAzF2J2qaxHgBL4xvu9Q7JTbX
        u4nd3hXBQ5On1y+cmDIOIcIrMIz/bBELy/xnasXGLi7AIO0mHjUW
X-Google-Smtp-Source: ABdhPJxWUJfKF99zZrTIZ1KAKcRnGgRHXQU49eZKGLLoiZT5ZnGwtNh32caBr0R9DybhgeU8g+6MBfVG1I/Bs7/Q4Ow=
X-Received: by 2002:a63:c48:: with SMTP id 8mr1352767pgm.74.1617015055984;
 Mon, 29 Mar 2021 03:50:55 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 13:50:40 +0300
Message-ID: <CAHp75VfFfJ8g-mHSneNbk4ujDdTbfu3CypSY_e106+3jhS6SWA@mail.gmail.com>
Subject: gpio_is_valid()
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

Anybody to shed a light why we have two stubs of gpio_is_valid() and
one actual declaration?
% git grep -n -w gpio_is_valid -- include/
include/asm-generic/gpio.h:44:static inline bool gpio_is_valid(int number)
include/asm-generic/gpio.h:143:static inline bool gpio_is_valid(int number)
include/linux/gpio.h:109:static inline bool gpio_is_valid(int number)


-- 
With Best Regards,
Andy Shevchenko
