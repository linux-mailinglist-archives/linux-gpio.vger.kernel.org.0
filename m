Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD2B320D3
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 23:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFAV6A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 17:58:00 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:38902 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFAV57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 17:57:59 -0400
Received: by mail-lf1-f43.google.com with SMTP id b11so10708566lfa.5
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iX4aUvP8mUEVM8HdWg49o9RU01eQ7XewzcFBTY3Bx24=;
        b=v5Rg1RqEiQjot+YKwJ+PhDGLJoCQJd8cYJq7XmjmWMf2QH01fGW4x/Z5ORituEhHJs
         uiKgOIIGIk1S+p+Ass+7N5+tZd89QzUbJTE6k48A3Q7qJCcFOQqjQnsJTpzox6RyPGxs
         +tqoa7EbDvSNfVsjq/Gqoeht11e4W1EerkKbVIyOXXkAeZwj9DTl1iT5jFOuX4o/53yT
         kQ8zzjlohBzeR90fAbuL9SAXXZix82l6hVNabjHnRL9CRR975mtb0s64+kmGCaxDSAoQ
         xa0StwixDXdTJRxnWe2jUMxiC+ao9SqvpWi5v/Wmrq6unOGvktH7uTy7K39zHyXXQZ/4
         RKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iX4aUvP8mUEVM8HdWg49o9RU01eQ7XewzcFBTY3Bx24=;
        b=ZkmMrV2JC31Y9mpuBVUVmEWGBPp6ut72DfFYb105GqmzmzcnBr9t8lUkFL+bMM3kbz
         0l3VWLiZy1z4ikl6pwmzcLFJ60ONBaED+zdkkrwh7kNOcwyD+3psTom44SqHpXMzXvkN
         zA3BVWI3kZ63t2y0xbEjB9kHL85XUzpidvwF2cfNcguiEEnA6YyYeAF+JmnvSOEQ56W0
         ltsxtdkph6PV3oVRoYo8iQShzngv+5nR3vlYfI6IqbHRolH4Kb8TUgOacuImI4WLIbsH
         Ryo+6C2Qal2mnJp6yWA7nm/4HgQDWKtImkGIqIkw+3GfFLRouP0NPUPeyElpOnTyeOkm
         CH0A==
X-Gm-Message-State: APjAAAVH0wCpyXPZK3UZ/hIkkpGTHXsD4lQYyvmIvIwjvqzu3Z4k7Bpz
        dLjShwe7EEKjXpSqBlcEjDnp1agl66pp4cmOezFT4Q==
X-Google-Smtp-Source: APXvYqw0XTvysBl/m/dr9Q5wGY5haXlZTXPgYUORtBrHw14mtkac6rnJP8Fn/UKwu14kYqlIb9d/EVQ/Ux/B6/DDXgM=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr7878184lfu.141.1559426277981;
 Sat, 01 Jun 2019 14:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com>
In-Reply-To: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 23:57:46 +0200
Message-ID: <CACRpkdajVu2H-9zX4gAEnHHR8gd=4jseabLGsHB=0CF1BKH-JA@mail.gmail.com>
Subject: Re: BUG: gpio: pca953x: 24 bit expanders broken since v5.2-rc1
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nandor Han <nandor.han@vaisala.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 31, 2019 at 7:06 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> Now, this was not a (visible) problem until patch
>
>         8b9f9d4dc511 regmap: verify if register is writeable before writing operations
>
> enforces to check the register number before invoking the
> callback pca953x_writeable_register(). pca953x_writeable_register()
> seems to know about REG_ADDR_AI (through reg & REG_ADDR_MASK) and
> accepts 0x88 as a valid register number.
>
> After the regmap patch the register is checked against
> pca953x_i2c_regmap.max_register before applying REG_ADDR_MASK
> and 0x88 is obviously beyond, explaining the symptom.

Can we simply bump the .max_register in
pca953x_i2c_regmap to 0xff for a quick fix with a comment
FIXME to figure it out the right way?

Yours,
Linus Walleij
