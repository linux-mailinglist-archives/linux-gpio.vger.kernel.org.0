Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05286437728
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhJVMhH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 08:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVMhG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 08:37:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF4DC061764;
        Fri, 22 Oct 2021 05:34:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w19so1046771edd.2;
        Fri, 22 Oct 2021 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sJaedp+WwFniAnsPOoxdNlKqeKWuyKqfMjHYa+KV7DM=;
        b=psg2ERjBTmguvun4iRACGpDey3AvgvUOnPmxWUCYXNVPU2Lja48yf8k+qfNAZHOwvE
         mdx3NZ0QRraYobiycacjFN6GrT7SLBMgp8n8Kqr/AvOabhepU1KW/RVlwhMr3BwMhdG+
         p/zqmQMKhWN3xPImJkgHjc/eH9wQ5b7oURXn4dazCZpAlvpXKQAc2n4p8pJCc++RwtFl
         k+1IlequuJarwJ4yBYhG+DbtcgFq8+azfLBvpEO0/5QbHqJ1Jv/O6hG34TPMH1wzYs6M
         oEfjywrYcb0XcWD2TlkYM83WX4je/xXED6cfzrUGgUk4MS6heQk4AGP3/k/LW6FFf8sD
         5cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sJaedp+WwFniAnsPOoxdNlKqeKWuyKqfMjHYa+KV7DM=;
        b=sz2CxHbXKfshMVHzxBWLN/bmmTFzt/P58FHBVNo6vdbkF6A91ifTyYyqcp2hQ2C3Hx
         z+VDU8K8E6yCjaJL4YTNuvEj28WRurD4lLWeFHYbjIwkaVGFZBm+X+aYNCt1ws4vKuuN
         Hn91bFUezWLzbV1f0yAVdCsyROn1eVrL4W91HDXukVN7e5u4vWSrquen3DetwrzY7nAD
         HMbk/8Md2CHyMmLfMUDU33RAeLaa4Z1YWrmpGPRMph5wLYHDpXYJh9zSiGSgzs3jUBXx
         y4Y84awf2jF6xBw07EM/K9vUoysDMLGz+P8IvD7SqglInxeTciC6iLxjmigwMy0UCkZ9
         swqQ==
X-Gm-Message-State: AOAM530094OoWgu4RhEmFXW5O2uKXY9jph3MfqZh2LmuLriWGAwV3tm9
        4OGOAcWEioy+PsfeSnwq0YVhctwV8XHDbIdKXWw=
X-Google-Smtp-Source: ABdhPJzELMMCdF3V0ssE/+Finv7LByJ4VhsgFR1Ko44YZnSsrQh8x6Ri7/3ky81qJckrRAZEb9X0ta8R9EPXbJ4mi0w=
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr17043167edp.107.1634906087448;
 Fri, 22 Oct 2021 05:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-7-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 15:33:50 +0300
Message-ID: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct clk_starfive_jh7100_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx >= JH7100_CLK_END) {
> +               dev_err(priv->dev, "invalid clock index %u\n", idx);
> +               return ERR_PTR(-EINVAL);

After this
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=7065f92255bb2468dbb9aa0537ff186ef64d5a02
It's okay to use

> +       }

       if (idx >= JH7100_CLK_END)
               return dev_err_probe(priv->dev, -EINVAL, "invalid clock
index %u\n", idx);

Ditto for other similar cases.

> +       if (idx >= JH7100_CLK_PLL0_OUT)
> +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> +
> +       return &priv->reg[idx].hw;
> +}

...

> +       while (idx)
> +               clk_hw_unregister(&priv->reg[--idx].hw);

I still consider that usual pattern, i.e.

       while (idx--)
               clk_hw_unregister(&priv->reg[idx].hw);

but since you are pushing hard for your variant I'll leave it to the
maintainers and author.

-- 
With Best Regards,
Andy Shevchenko
