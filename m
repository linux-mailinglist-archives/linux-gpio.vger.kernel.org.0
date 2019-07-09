Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137DA636F6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 15:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfGINaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 09:30:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44044 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfGINaf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 09:30:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so13419066lfm.11
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2019 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0aUhy01MvjYTIuBK0AjDqzuZqZYxgG2aAS7wxVUO+Ws=;
        b=JoYm0A/NaqY/RJJ8uj0MbIJYXDsl5MJCKrhp/jp2LS2zO6pysb/Mb9/byTuAK7zFr9
         X2eynOziS6C8SBX5vVQYnNem1NIY4zlXXQBpszyorhkYABCI/XqVSrJjXM8YSG0nmEUT
         lp7XJcaLcGLKkscah7/ZYbCliLd6Uvob9249QwNYQ59W6zGUYZ4Yxq3McUtmmD65917K
         oE3sM2HHEMG1nOfOscOoQ1BkhvdioxCnKxhcc/BsQxVyJFhJFgEaFwjX1gKpjnwzbq63
         ZFyyHSsHwqJMfB7g0hhp36b5QJkY5Yj/jWTS+CWthz18hOQzNFfz41N49VXBuRvNt/wt
         1tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0aUhy01MvjYTIuBK0AjDqzuZqZYxgG2aAS7wxVUO+Ws=;
        b=WY82lrlQVr2GNv0BYHdSx2LyUgnB14gHgeEzyAoiBCTsBWyfPkv8GStYBiFUFGDK3T
         XDaakr+Wd3QxpKcqrnCBsVu28xfHDNGZEnzPj5/7pmi7KDnNVyuJFMPdJHjVEGsikdnz
         XqrU9qUpt8m2HgpNesjkuCdlHf8rMn2iTI9yyfzt6Ww3P7W2aab3sbzgcNtgmSxd8iZ/
         gqpdZXSZeYN5NDjIv7g9GuaOsoGaO8BP2S4fMoBxzUeZv7cxeR3cmE/oktMR2X2JIJBc
         wpyJ55DNpC1Z8UEzi/REZn+SxCh4ZFGeFl/J93zLDK22zcCOq9Nmlt6NYIPeq+tzIJAt
         ueUQ==
X-Gm-Message-State: APjAAAV/cs5Prj+qDN5Q8Z43fYpt+rVXrzCDOf7Fs7kXEBbd+1nazdj/
        IbWL9R4IZJ3wBoo4Pt15CRkNHQd0TYAR4OUYZpyFWw==
X-Google-Smtp-Source: APXvYqyvmS/ah3xdKBS2SMnUvhVq3tVc6azhTV9Dh7OiscP4kyOJBs9BHR3v7HDEhjl+V/9EVEJBcrBmIptZAfL6/vU=
X-Received: by 2002:a19:7616:: with SMTP id c22mr2897636lff.115.1562679033241;
 Tue, 09 Jul 2019 06:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl>
In-Reply-To: <20190708082343.30726-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Jul 2019 15:30:22 +0200
Message-ID: <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, Jul 8, 2019 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> If gpiolib is disabled, we use the inline stubs from gpio/consumer.h
> instead of regular definitions of GPIO API. The stubs for 'optional'
> variants of gpiod_get routines return NULL in this case as if the
> relevant GPIO wasn't found. This is correct so far.
>
> Calling other (non-gpio_get) stubs from this header triggers a warning
> because the GPIO descriptor couldn't have been requested. The warning
> however is unconditional (WARN_ON(1)) and is emitted even if the passed
> descriptor pointer is NULL.
>
> We don't want to force the users of 'optional' gpio_get to check the
> returned pointer before calling e.g. gpiod_set_value() so let's only
> WARN on non-NULL descriptors.
>
> Reported-by: Claus H. Stovgaard <cst@phaseone.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I remember I had this discussion in the past, and I made a large
refactoring to make it possible for drivers that need gpiod_*
calls to simply do:

select GPIOLIB

in Kconfig.

This should solve also this problem I think.

However I do realize that there may be situations where people
simply want to make GPIO support entirely optional without
having to e.g. create custom stubs and encapsulate things
inside if IS_ENABLED(CONFIG_GPIOLIB).

I was thinking something like this in the stubs:

gpiod_get[_index]() {
    return POISON;
}

gpiod_get[_index]_optional() {
   return NULL;
}

This way all gpiod_get() and optional calls are properly
handled and the semantic that only _optional calls
can return NULL is preserved. (Your patch would
violate this.)

Then other stubs can do:

gpiod_set_value() {
  WARN_ON(desc);
}

As in your patch, and all will be smooth provided the
_optional calls have been used to obtain the desc.

Yours,
Linus Walleij
