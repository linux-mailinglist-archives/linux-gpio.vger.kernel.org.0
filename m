Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0F51F509B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgFJIwk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJIwk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 04:52:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059C3C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 01:52:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i27so1435843ljb.12
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZj9FRS2XY4VqFQxuNlqLqbv79Zq0nSJ0wqXA0WHqXg=;
        b=VBHhJCu/HbBJ2Q24M4THp6StoZHbqwa/jkSOPhIazusNP2uMVP594ATj7eMtCLLgFu
         wsV57vQYUFuXy1k8ZZHFINfMQJwnjJkiVX6w4rkRXu9PkYkufBcAp8i2vZ9h2jIwNw6l
         TA9TUmhZ1iLn9yRmX9qz623BCCkIvzo0b7Spt4rz4egY3u/JAv8Wve0MqOemyHbXi7K8
         fgZR3jXhb2RgDkHrXe3DTknMCjighQr02/nSDmhfS98rYUKMcVx9ruwdLgnOO4k0HQIv
         BGZjjDsYCuHsYj0Qd7KxK6Nc+e7ZNbrS4WtJkpzruTlt3pL1mSg72sTjPORf6bMHaSAO
         JhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZj9FRS2XY4VqFQxuNlqLqbv79Zq0nSJ0wqXA0WHqXg=;
        b=GEwPZTUTqJXXsabp29ooJP2X727dz7w5dzhpG79q1lQDEEKVX1ET7Zv7lyAtP/kM3+
         JZzaDIm06FfaeJ9YWV0gSDE1eBC0FZFqMJUtQihbu8Bq9VfUJZrSRGNq9fSPpmrj0aPs
         JBMijOSPP+KiH+8KDxpNLQ8uDjhitJiF64FUlYGH9ZwjlIQfgyd0J4euLJ1ACyEjyWcT
         id5YRzHJgoNAguVhPZyRaWqjSqbNApq+MHH5aDKf/ITJO7ircIJU1Zv3RU5G7vL/jYHk
         /+IK+uBwz/lhL6JOXmgb2bqy3kN/rZKr+a6r/uBoZCN51wPYCizD05SX033AeWnHtbYi
         fpZw==
X-Gm-Message-State: AOAM532Hb/GCgQy5mZjObHeIDK8fLRrUSjgWcoEimdqK+D748ZOED51k
        QFVbUQpsV4d2hjgnDDuzTL556izeYWujRC6McoAPIA==
X-Google-Smtp-Source: ABdhPJztWOIRy+Pmfhld9nG2TEcFdJeoDu3IbxxlhHk4JCQWGXBbF2DQUa89TWM40jKt/+uuCCMYWRPeG+Mn4NBekAk=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr1282281ljc.100.1591779158505;
 Wed, 10 Jun 2020 01:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200605024919.56177-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200605024919.56177-1-navid.emamdoost@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 10:52:27 +0200
Message-ID: <CACRpkdbS7Vo+uV2LJTQNiqoPHWScDrgQiv=TakL1UFQ=ZGXxiQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: handle pm_runtime_get_sync failure case
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>, wu000273@umn.edu,
        Kangjie Lu <kjlu@umn.edu>, smccaman@umn.edu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2020 at 4:49 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:

> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpio/gpio-rcar.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 7284473c9fe3..eac1582c70da 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
>         int error;
>
>         error = pm_runtime_get_sync(p->dev);
> -       if (error < 0)
> +       if (error < 0) {
> +               pm_runtime_put(p->dev);
>                 return error;
> +       }

I need Geert's review on this, he's usually on top of the Renesas stuff.

Yours,
Linus Walleij
