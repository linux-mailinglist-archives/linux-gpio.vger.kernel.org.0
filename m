Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E5A60D61
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 23:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfGEV4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 17:56:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38390 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbfGEV4F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 17:56:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id h28so2828583lfj.5
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XgKC08iiEaNapEt8oecESiRwrLkTQTJmIfIX4GB6LAo=;
        b=MGDGDqvlWi1VmpjxiAjxE8n12n9Zt/Hu1m/27IujOA15048scaVNqKGwFrfcu5/97S
         arY+icppvf6BGGkP3fZXw4APZBKgnCVYTwzXU7pQAKIhBESuKgT0CMHHskpH0VAn0xjq
         dGeK5Czy7CocvUPvqAgQyCl3l7yc7SOJb7BbNSAkPjvwa83cELO0xt0Bt5IZOFgw1cQH
         MNyRr002c46SDSVziYSlDsQguBEwJib/Y/ApMu+wJhLo6Kt/o2EvPJhhsjTm2eJMH8O0
         e8DtWK5V+f4y/bZm36kxr4mtv2niMywmiF8DaC/UOyH9CIhkAhtH6Z9S2i/TQIyP5nt8
         UW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XgKC08iiEaNapEt8oecESiRwrLkTQTJmIfIX4GB6LAo=;
        b=EjK9ZzHYbje2QHDE/HndD4Him+QVyxJ7TAFVSMhDl12BG0r8Sz/50Li5M/Dn73y2KN
         LxuLxj9EqH3e45bvlfQNqavih7GFx+ER3iyVx/6OXxNqh0C61om1vNdZgU6kdtjxI2ol
         G12jKEC/iGJzUt1Jxs7+SWHu1W8Qb/7tn+pZDRos+pNKfnHzfjNd5L7A9nZ0f1J+wysq
         KXpEW4Hh9Okl1VbBjp8RwpnlH/6rwefBxSft0bHjtTUwUx571Gb0Lv6ehiVFXt37omfm
         zmYWI7nD3QIvkgNhyx3mZmY4UzcMqVeZRnYVMH49+p7jfWFqK5hXLinSe0RsBOr7vNvA
         UXWA==
X-Gm-Message-State: APjAAAUACrfc/odPNiqQnO96Jiw74aJJEZFKgL+++1AhzhOFkF3dDoK0
        yOlkQkDewfpaI07MCQTKiW8urRW0CMsXdnnaFyXYFQ==
X-Google-Smtp-Source: APXvYqwMkXMyOGNxusvNtzdRCvnI5J43hplKIhDlLunGWI5KYF1VSpVsFZX9oMXvfjTIHq2L2mfIqHeqxPVAqPcbsK8=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr3096454lfc.60.1562363762981;
 Fri, 05 Jul 2019 14:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190704042027.18966-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190704042027.18966-1-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Jul 2019 23:55:51 +0200
Message-ID: <CACRpkdbWWWhQ5V5tc0FkQSx80ZXZ+ki-mn9Cc_Vm-jOwVu0R3A@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Preserve desc->flags when setting state
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

thanks for your patch!

On Thu, Jul 4, 2019 at 6:21 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> desc->flags may already have values set by of_gpiochip_add() so make
> sure that this isn't undone when setting the initial direction.
>
> Fixes: 3edfb7bd76bd1cba ("gpiolib: Show correct direction from the beginning")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v2:
>     - add braces to avoid ambiguious else warning

This is almost the solution!

> -               if (chip->get_direction && gpiochip_line_is_valid(chip, i))
> -                       desc->flags = !chip->get_direction(chip, i) ?
> -                                       (1 << FLAG_IS_OUT) : 0;
> -               else
> -                       desc->flags = !chip->direction_input ?
> -                                       (1 << FLAG_IS_OUT) : 0;
> +               if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
> +                       if (!chip->get_direction(chip, i))
> +                               set_bit(FLAG_IS_OUT, &desc->flags);

You need to clear_bit() in the reverse case. We just learned we can't
assume anything about the flags here, like just assign them.

> +               } else {
> +                       if (!chip->direction_input)
> +                               set_bit(FLAG_IS_OUT, &desc->flags);

Same here.

Yours,
Linus Walleij
