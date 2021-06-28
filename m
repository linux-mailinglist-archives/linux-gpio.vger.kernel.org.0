Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87F13B57E5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 05:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhF1Djc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 23:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbhF1Djb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 23:39:31 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2D1C061574;
        Sun, 27 Jun 2021 20:37:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i5so23603225eds.1;
        Sun, 27 Jun 2021 20:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=S+xTtvyf1TTdB36er16+HKLGmH62vQAYFuvDeWyNd0g=;
        b=eTYukS3vLHJ6TCOfp73FLsOLH67UVr8/0vryD6rNl8z6Th5v9GEdkXlL8E7yC+ANgS
         tEhQaEWwMjTgE7ZpfxPHbCRLvRuxac+XEVVov+nfmmS51FhwUb3WZtri5sCslyY01n+H
         YG+Ohnm8zh/bvYg1Iq9p1AFSg5l9JnQ+rfnS8AK+4vQRRNlvi0Gzeb9s4gt8fj5tZrYj
         0HsyHdSd5f5mZ5Ig0NN5U+VU+J9u50QhlsE5wHGzHskB1VhLG6EiFQ3h2VDWZKQCdNUZ
         Q2HKukjdcYa4KTQrt1ZxU9e46oyve9OKAB2T/NQdtfYWuC6NxBJdqSM0wU270jaNwINT
         o+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=S+xTtvyf1TTdB36er16+HKLGmH62vQAYFuvDeWyNd0g=;
        b=RsIZvEKCsyciafHhnOzjn8BQudFleuue3+z48tutLGkNYaDNuQNH62XKGj2VOtlPyU
         lx/56jtUdWVzvRtWZg8+69+9y2ofO7CLK2NrMMqaStzwxKJzTnOpe5XVBE4xpEZ45xhS
         7qeH1FyV1y0gtn0XwMzV9k+z/TBAjnpYI7PORFDVF0HvAMboS3iDtiF7XjcYm4gO5URa
         3KPCr1AYgaExgymj4oefX9j8gZsN8W8UowLwBgx3r0LDwoT9lTwcMgqMBx2LVeIOn9cb
         tXrCkjXWKApRmsXSW04bvxG6CQEc0+pr+mMv3ayxYxjw0Hv83cmBeSX7yeHY/YNvsbPb
         ixkw==
X-Gm-Message-State: AOAM531eL3wke7e+A5q71qXbp8I24bOjy6+uXg2VbvTLNdE+F8R0r+Du
        4f3obFdFKQRff9M5gzuKhLIrNROmKNnit11e0qg=
X-Google-Smtp-Source: ABdhPJwaW1a30AKscFeX6OiFf741RydW1YQCSGI2IOz4qiTjGZt4Plkfs4d0i+KcVrommOmr9w5JgU1F/nUy91nopqQ=
X-Received: by 2002:a50:f68d:: with SMTP id d13mr30750719edn.318.1624851424468;
 Sun, 27 Jun 2021 20:37:04 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Pelletier <plr.vincent@gmail.com>
Date:   Mon, 28 Jun 2021 12:36:53 +0900
Message-ID: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
Subject: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or feature ?
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

While trying to debug an IRQ handling issue on a sifive-unmatched board
(which is a very recent board on a recent architecture, so I would not
be overly surprised if there were bugs in hiding), I realised that I was able
to claim via sysfs GPIO pins which are being actively used as IRQ sources.

Checking drivers/gpio/gpiolib.c and kernel/irq/chip.c, I believe this is because
gpiolib (gpiochip_irq_reqres, gpiochip_reqres_irq, gpiochip_lock_as_irq)
does not call gpiod_request_{,commit}, resulting in a pin which is available
for use. I could confirm this by adding (just as a debugging aid):
  WARN_ON(!test_bit(FLAG_REQUESTED, &desc->flags));
early in gpiochip_lock_as_irq, and this statement gets triggered.

Is this intentional ?
Does this requesting belong to something else in the codepath from
request_threaded_irq (and similar) ?
Could it be something missing in the devicetree for this board ?

Also, I notice that both gpiochip_hierarchy_add_domain and
gpiochip_reqres_irq call gpiochip_lock_as_irq, and I am surprised I do not
get any error about this: in my understanding only the first call on a given pin
should succeed, but with my WARN_ON I am seeing both stack traces and
no other warning.

FWIW, my builds are based on vanilla 5.13-rc6.

Regards,
-- 
Vincent Pelletier
