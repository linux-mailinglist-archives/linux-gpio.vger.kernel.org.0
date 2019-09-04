Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A380A8D2A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 21:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbfIDQaV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 12:30:21 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41163 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731520AbfIDQaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 12:30:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so11513960pgg.8;
        Wed, 04 Sep 2019 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Bk5FCrmIebdNTJxqeSp5asp911jjtdI8aFxkaoSkUA=;
        b=Z7MJE3qJHR8e1zg4M/OzjRMI8uXwVNEOcJS7BGFiaDV6mFALldUUSXDzH7MDyjvIPC
         N3ORyV1v0tHe0bs85LwIt8W3EDERZ9+ixgYiqYntooIRtWwd0cs7l/fnCUltEybL5LnU
         AxSYEpWniZ9Vc9HG6/XZyqZTO3u9wlVyUmwU9p7BU8s7K7YCcQ2O8/SGOBjo4uPyS6zx
         nsN0/ojOMkS3Jj2Vk7LwCMkBQY3EvHhBSKnV2G+lZMK7koE2fAZwP+wc19x3joGmOyTQ
         d/eDjlbD1Ea+xJ4ZG3I1n6BpTMlO0Ow++2Hu03dK+pWgvMIOwmtd/bC/EWjXYZh9p51n
         BSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Bk5FCrmIebdNTJxqeSp5asp911jjtdI8aFxkaoSkUA=;
        b=Oo4AMOULWdLQUiKg7EyC7fcRpvnfr/gLe47rjo4JPJGQgpN55pY+w3JL/QdIDRvmmy
         hOfxGRTUib/jYtmHTzWembWqmyR095OGiWLdS/+qyOYL0bUsNQzZGfxf+3ZqD4MGJZa6
         L3qjQRIgVnLawOe3quuOUf0rP3xq8ApNaLKq4KjHt83QwMM8SXygJ4wWodi2HgP9uEqc
         /UMKave6HMGBA2dBSrb7++aCJvyZr8Qffv319Js2cu2ldr1k+nHL9vb3s9GpXhsk4S6W
         GF1AEoCUuYukejux/+AnIGxwlSm4rktvT+ufxpJK/gSt7e4XoSlcztQdOnKikQ3GGc3F
         f/DQ==
X-Gm-Message-State: APjAAAXknD6Zkg903t7BL5F7n7hoP+Wuy8XzYRNs0CPNvJGqDWbZX4Ug
        0z03MXQBV1znBFXLk1O+2NpQ63QHgwwimg4uiN4=
X-Google-Smtp-Source: APXvYqwfTMyky+gr506dU7vA5RQA2gAYCn+ZMYC+IVVNtVkdvfPY6ix3mRDrBzSvrtUGH0BfnF3ha8tgX/jGZ72bAxY=
X-Received: by 2002:a17:90a:19c4:: with SMTP id 4mr5998093pjj.20.1567614620706;
 Wed, 04 Sep 2019 09:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com> <20190904061245.30770-3-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-3-rashmica.g@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Sep 2019 19:30:09 +0300
Message-ID: <CAHp75Ve0zEkuD-75aZ6FU+A=DvX8NvVvY3n9p_pYDyfa76sxoQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> The ast2600 has two gpio controllers, one for 3.6V GPIOS and one for 1.8V GPIOS.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

> -       for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> +       banks = (gpio->config->nr_gpios >> 5) + 1;

Same comment as per the other patch.

> +       for (i = 0; i < banks; i++) {

> +static const struct aspeed_bank_props ast2600_bank_props[] = {
> +       /*     input      output   */
> +       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> +       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */

Perhaps GENMASK() for all values?

> +       { },

Comma is not needed here.

> +};
> +
> +static const struct aspeed_gpio_config ast2600_config =
> +       /* 208 3.6V GPIOs */

> +       { .nr_gpios = 208, .props = ast2600_bank_props, };

Seems curly braces missed their places.

> +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] = {
> +       /*     input      output   */
> +       {1, 0x0000000f,  0x0000000f}, /* E */

GENMASK()?

> +       { },

No comma.

> +};

> +static const struct aspeed_gpio_config ast2600_1_8v_config =
> +       /* 36 1.8V GPIOs */
> +       { .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };

Location of the curly braces?

-- 
With Best Regards,
Andy Shevchenko
