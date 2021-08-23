Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814F83F465F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 10:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235398AbhHWIHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 04:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbhHWIHg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 04:07:36 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD156C061756
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 01:06:54 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id f15so4181629ybg.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/zCG9ivFnH5oqg7ao6RBT5SBq8GrO87iHWo6rWwoX4=;
        b=M4olpOi5c6kiBdUGJ3UItw1G0SBvluTYJzZRYymjprivaDsdZK6MnPhB8usOxlLa7w
         W2zaXqSeW3Jbn7b+OoyNQJbyiMKgp6tjk8VW9oUJtXG9+PNzpYoGoNDvj79Ic4bi/zMs
         E3cwLugJU1+jXscaCQzEhdeyGlKrRByY59Psvoep+iZZ+oQWNrQoockrhDzNpQ06//oH
         mVIGNe/UcjjLC0Z2pnb8RYE0BiDcpzktqUuX44YXiSZRTvMJmfJFaQRkkyA3SXMuTnH6
         CEybtA554/XPXAYQ8Rs9CoiP9lXB8cAZYwSJzqWIlTxxzX+uD1Jlp936JYAYSWl2ry/7
         Bctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/zCG9ivFnH5oqg7ao6RBT5SBq8GrO87iHWo6rWwoX4=;
        b=BD5nI2ROAGvV3eWzt9N+a2YYBHWHtn2IE39lzk7dHAm0AKZHKF9tG01CVVOIvzw8mN
         nAlapn7nYPwurllNed4XNzs7O1Pl2FAQJaUC3Agt54BZ3SVVZKGr3T4IyzlOMG2l4e+m
         WT/T4YjBhn9Q/Epnv2x9zcXGMxPi3IrFHa/UkF3jSaGHx59fqdKthdoY8nTOKhYIdwtu
         ve8XVH5oY7fjNyQNGAEqjlA6Kmn8pdPgrnLMcpcz40aIYMVbW1v6IkV/E/X3/lTxjQt8
         cKOm/OwyfHhg2sKH8J25NR1lxhUCxZ3YduxrfgQNwuU69LxYTU8TuTaSNDN8Zh5WDk3Q
         hpYA==
X-Gm-Message-State: AOAM533V1b7xcs6AUwdBfW3t29tM7mffOelcvpQAq6RLFfGjWE2dJLYn
        j5ngBIWHnbfMJCJjfVMBan/AmDEACCC7Wzni8GdDzQ==
X-Google-Smtp-Source: ABdhPJzFQqLG99qfpoMaXnaBRKXLdVxUqfwc1eLs6IWkwE8rXnfq1pJ040CA+QX5zWWtABZR4cqJRYtZ2jB0Ao4oFHI=
X-Received: by 2002:a25:21c5:: with SMTP id h188mr40272726ybh.23.1629706013975;
 Mon, 23 Aug 2021 01:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Aug 2021 10:06:43 +0200
Message-ID: <CAMpxmJXO595xXbyG4fnc1ckadPOt4d0SXJ8qD7KuSP1XP5dFzA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: mpc8xxx: Fix 3 errors related to the error
 handling path of the 'mpc8xxx_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        Hui Song <hui.song_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ran Wang <ran.wang_1@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 20, 2021 at 5:37 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This has been split in 3 patches because:
>   - the root issue of patch 1 and 3 is not the same commit as the one for patch 2.
>   - the strategy to fix the issues is not the same
>      - patch 1: add a new call in the rror handling path
>      - patch 3: switch to a resource managed function
>
> They could be merged together if easier to review. The subject would then be
> something like "gpio: mpc8xxx: Fix the error handling path of 'mpc8xxx_probe()'"
>
> If prefered, 'devm_add_action_or_reset()' could be used to switch the probe to
> a fully managed resource function and remove the 'remove' function.
> That's mostly a matter of taste.
>
> If such an option is preferred, I'm a bit puzzled by the
> 'irq_set_chained_handler_and_data()' call in the remove function because I
> don't see why it is there.
> Also see the comment at the end of patch 1 also related to this function call.
>
>
> Christophe JAILLET (3):
>   gpio: mpc8xxx: Fix a resources leak in the error handling path of
>     'mpc8xxx_probe()'
>   gpio: mpc8xxx: Fix a potential double iounmap call in
>     'mpc8xxx_probe()'
>   gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and
>     avoid a leak
>
>  drivers/gpio/gpio-mpc8xxx.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> --
> 2.30.2
>

Hi Christophe,

These look good but I'm leaving for a couple days in an hour so I
won't be able to send a PR to Linus before the next release. I'll make
these part of my regular PR for the upcoming merge window.

Bart
