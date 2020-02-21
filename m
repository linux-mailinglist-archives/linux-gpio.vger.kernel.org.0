Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA75167ED6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 14:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgBUNlG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 08:41:06 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34033 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgBUNlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 08:41:06 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so2248913ljc.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVHjti8X9qAjkP+KLYv2+YuZEcskMr676gzyYTbo9aM=;
        b=FV8vFJro/qlRu/uNvUKOuk5XPOqeaUV3z3c0MvNHAC5R35ciT8bLdv4ioUro1lZNz+
         LX212SvXpktnYHIIH1/bsm/17ZnmZL/qv5TUXK2LDLq2gunjD+icH/hmw4nM2vBYaWUU
         BZqc+3hB95awD/vhhrFBA/1/+bAQiMVLBgLSt1oF/wzhYQohZkpL+NIhvFky7JyUI+wd
         NB6w/NH3B6hRbTad2KEOVMaHFmSCfedlyxc0+M98GeTBrHB6BkgeVWcEhpfvbC1G3L8W
         qO6xNWubnAg3gyrCh0nM6wCCdFFUFRIs3ZFI2hg8oZxr+hKBEDzzf5IwNeLVZI+uDIPL
         0PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVHjti8X9qAjkP+KLYv2+YuZEcskMr676gzyYTbo9aM=;
        b=ZeA7rc/RGcV15iqZ1kcZv/3c5WQzn7LnoN7eo1JkHBG5EzPoC0zHGNaUMEJ9QGT8Rb
         D8ShKBm17EI/lIUSHcGvisIRr3edcAlLkFCXI1wl3+CIMI0xZYvJTRu970Tk6w1nElvd
         eoEIIfUH6tIBBiIwExqNS+KBkwnbiSeq0NGS+D/rSm2ermnHUXEaO3o87Ezw1GkqItrn
         oBhqByBCRp47macoP7qY3N9iiNaE0BtGS/6OuB3EMIAGf8wdnBMmJ5S4irc8XyMpTEZ/
         cyj8XAbVCUexs2e8rtMXi3NF9TvCT+IpIUWAL0FOFyaJ7A8FzafNIWr0wPywvJjcawme
         Scew==
X-Gm-Message-State: APjAAAXR1CyphVqeAp5XxqW7QJWxPIwuPKwPWt0icQX9ffaVHa5Piqnu
        0l6tMcbadB90RzPXLxYZc6IkY0P9lcwTBEtUqIC60g==
X-Google-Smtp-Source: APXvYqxffTw9jtZT5IylAtS3KMQ5eN+Md6MiFoRkBnpZTiMv4udUulYwMEy1vAtMjkv5eWlqjguH8NE7Vaa3eyJu53M=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr21360405ljq.258.1582292464265;
 Fri, 21 Feb 2020 05:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20200219092218.18143-1-brgl@bgdev.pl> <20200219092218.18143-3-brgl@bgdev.pl>
In-Reply-To: <20200219092218.18143-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 14:40:52 +0100
Message-ID: <CACRpkdZbvMBHacWYotSYKM=MVbDc16Z9qyQrkjDgRi5eFJZAAA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 19, 2020 at 10:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> GPIO descriptors are freed by consumers using gpiod_put(). The name of
> this function suggests some reference counting is going on but it's not
> true.
>
> Use kref to actually introduce reference counting for gpio_desc objects.
> Add a corresponding gpiod_get() helper for increasing the reference count.
>
> This doesn't change anything for already existing (correct) drivers but
> allows us to keep track of GPIO descs used by multiple users.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I really like the simplicity of this approach ... hm!
It seems the only downside is a krefcount_t extra per gpio_desc
which is an atomic_t so I guess 32 or 64 bits per desc depending
on arch.

We discussed refcounts in gpiods in another context but it got
really complicated there. This is a clearly cut usecase.

Yours,
Linus Walleij
