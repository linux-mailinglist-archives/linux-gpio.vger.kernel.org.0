Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6451E5C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 00:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfFXWen (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 18:34:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39665 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfFXWen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 18:34:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id p24so11183910lfo.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8eI1qO6AFmOqg+DGNHTfaHm/FdxuE7uuuEzH8JMWmA=;
        b=QSe0zP7x1PhqeFm5Pa1g378mzzZ9F4w1zBJn8qZeqnRDI9KV/yXGJRMQzdGKm8ZUgM
         ixEcJO5JNi7MHG9Ry+Xmb17GQNKPjDakyNvN6vMbO3YS+BkBvuIF79xwNWqUM/hmufCH
         1h2TXBqR7yMD4Bt5H3LvAyESbfAVNfgYjX5REfOYMLCxcd3rL6Xvka5TDM7zoSZH7tw+
         FZJTaOQ4evD0HamcazF6LA7ghv7gapAci8IVBNM8TYj2DLbj3alkIPZMvTKbZznDfxiL
         6OuJCyyot+2ls0X0JcFnRBfcW2kFMaZyaUs775cOcEXOOCGezhTRgUDYaR+3ZeZPt1Xj
         +4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8eI1qO6AFmOqg+DGNHTfaHm/FdxuE7uuuEzH8JMWmA=;
        b=riEOWDhqp/Le2hzsCp50n+zhRYvQ/S59VY7HLLo9zKfrgjF8N4Qtipijw+bdDa+8nn
         L12z1ykrtjXHHQpEZ8bGeq3ghOfuEK/bFBqkD0Bu4qCak9YZzmFijRirBPtotyjBEKeS
         vSMOt1zV4W02LsB5zosauFypMLQpF+GzZjD028oXXr5PY8gbQqLootxYcMsOpQsKoYAk
         GJXFXa4m7ugFexsH9BH2IkgvHY82rAQxK8wYwvvA8Q5MPitFnuMZ3et1RsIyofIJyQ9B
         jChiW8kygK04PJiVjGkyUlCveYy1uYGnjnyAsJWP2/n11mn9H/c9590zRFH6Ik4D73eD
         /JKA==
X-Gm-Message-State: APjAAAU1otVI1ds9cKfBKuiyO6gKa7j4L8DAhN9mLyFRqm8+Zy273EyL
        jREzGnaBCkvrq2xqkSvJZA8kqThc8fG1OB/ww0NrYg==
X-Google-Smtp-Source: APXvYqxFHSmad1x1wi9PdCcVTpSY3IPLSnbObJWPfhnJk0sD/mXvfU9nvhf52ekQIxfe3n4jChqssFab3rPEkOYHe0M=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr74724539lfn.165.1561415681723;
 Mon, 24 Jun 2019 15:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190621152329.21072-1-thierry.reding@gmail.com>
In-Reply-To: <20190621152329.21072-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 00:34:30 +0200
Message-ID: <CACRpkdbKCOgJDYWx0hJ+tYyimXbShMNV00oHsVAskeJm1kT0Jg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add device link support
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 5:23 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Create a device link between a GPIO consumer and the GPIO supplier (i.e.
> the GPIO chip's parent). This makes the driver core aware of the
> dependency between the two devices so that it can properly order the
> suspend/resume sequence.
>
> As a side-effect the GPIO consumer will be force unloaded when the GPIO
> supplier goes away, which prevents the consumer from accessing dangling
> GPIOs.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

I was thinking we were gonna see this soon :D

> +void gpiod_add_device_link(struct gpio_desc *desc, struct device *consumer)
> +{
> +       struct device_link *link;
> +
> +       link = device_link_add(consumer, desc->gdev->dev.parent,
> +                              DL_FLAG_AUTOREMOVE_CONSUMER);

I think this needs a NULL check.

Some GPIO chips still have NULL as parent here, they just
register a gpio_chip right out of boardfile code without any
corresponding device. MIPS does this for example IIRC.

> +               device_link_remove(desc->consumer, desc->gdev->dev.parent);

And same on remove.

But why not use desc->gdev->dev as link, simply?
That device has the same lifetime as the gpio_chip, sometimes
even longer I think, if e.g. there is userspace holding the
GPIOs.

Yours,
Linus Walleij
