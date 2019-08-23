Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F42B9AC4F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 12:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388393AbfHWKAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 06:00:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38221 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfHWKAj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 06:00:39 -0400
Received: by mail-lj1-f194.google.com with SMTP id x3so8317555lji.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYtHVFMQLzS9sJJeSyCBx/b59zqA2cgkZM6wKCYLhPI=;
        b=I5bjDMRqbnKWh8cuXJ/GOm4BEDe5Ka7HjlyevUJasXA+1BL8QDcTRTEXHHAa4aUv5P
         Gdot/lqksVt1ghCdyo7mL4ZDg8oT1BoRoAcikTQEEdvVTx59p920QplYZ5yQPyo5WjQN
         2M4W6+9UyBAhsxoe/Kg7V41jsWpyUchEl40nUbvDRT0rlOs72o13XTv7Js6tC3prUS36
         eTaE9nYa+TMFxMJslxm+EDV5Qivr9/G6sYeWePm85wGoPd3bOVRI/H6DLWYYZVYn9BjV
         of7rAZGIS4DOArycPxIYHPNE22i0cleDWKI5W1qS5VO0m7PFZvVPyBt/3l9wZMDaHss2
         qIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYtHVFMQLzS9sJJeSyCBx/b59zqA2cgkZM6wKCYLhPI=;
        b=UxnGVaow18edFo2jIFckWvsE+2T9b3ZaHqAzRhIZ5VnKFvqOEkJ626kVA6+Vy/yDsY
         veIc7X3IbGdGTIyVgIzGWOeaYeyv14oYAHVoufaUHWUSQFbg6fi+RZclMvIxoQJSFREq
         v0lLZRPwBoeLwt0Hh/mpW5bsxsZqEpyCWl84f02vFJwyzWZw0sU0OWonG3hqNP3nxrev
         dSlXt5tRPMvp/fABhKKKO+7xzy0q6fTddyaSQ6yBj9tiNvHgM8k3mvS3bgKn2U4PXie7
         dyakRBV6HjcPC74WP8SMfMZT94M53rutBpKTGJbTpeg2cM2tvwdjxbl7wRNu28O0SPxA
         qbSg==
X-Gm-Message-State: APjAAAX+E0X4Z/zb35gt4NxozEWmKltMUa8qE7YzQ+QWHoqQ08hsl6c+
        HBujDN4YocxlKx1y7r2iVybg9lQFVz8XI0HxYXS8ZQ==
X-Google-Smtp-Source: APXvYqxasa3YtuvrkVLTdP/ist4WZrp/LNp2iWxGNuSbwN7+h1+l/xw0EVq25Uqj/p5fWzGHS9WejmrxgwOgHAuN/+8=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr2301865ljg.62.1566554437819;
 Fri, 23 Aug 2019 03:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190822031817.32888-1-yuehaibing@huawei.com>
In-Reply-To: <20190822031817.32888-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 12:00:26 +0200
Message-ID: <CACRpkdapgDbkm3JjywtPv=5gYKQCCXzdabDumVukFv5Dn5pomA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 22, 2019 at 5:19 AM YueHaibing <yuehaibing@huawei.com> wrote:

> If CONFIG_GPIOLIB is not, gpiochip_lock/unlock_as_irq will
> conflict as this:
>
> In file included from sound/soc/codecs/wm5100.c:18:0:
> ./include/linux/gpio.h:224:19: error: static declaration of gpiochip_lock_as_irq follows non-static declaration
>  static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
>                    ^~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/codecs/wm5100.c:17:0:
> ./include/linux/gpio/driver.h:494:5: note: previous declaration of gpiochip_lock_as_irq was here
>  int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
>      ^~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/codecs/wm5100.c:18:0:
> ./include/linux/gpio.h:231:20: error: static declaration of gpiochip_unlock_as_irq follows non-static declaration
>  static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
>                     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/codecs/wm5100.c:17:0:
> ./include/linux/gpio/driver.h:495:6: note: previous declaration of gpiochip_unlock_as_irq was here
>  void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
>      ^~~~~~~~~~~~~~~~~~~~~~
>
> Move them to gpio/driver.h and use CONFIG_GPIOLIB guard this.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: d74be6dfea1b ("gpio: remove gpiod_lock/unlock_as_irq()")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with some fuzzing.

Yours,
Linus Walleij
