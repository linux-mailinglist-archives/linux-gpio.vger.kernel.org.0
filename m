Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5877E33663
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 19:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727622AbfFCRSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 13:18:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33680 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfFCRSd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 13:18:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id v29so5696464ljv.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kj6JT+jHXGMgF6wpvxZYkTfPGiKrPB/frgW1hOjbrMA=;
        b=hyECpzvQd4Hy+9lad6DlatxfjeHDgMuaALhIfrQmsjEQNp6FH3aOgiKvYB0xVpsLYh
         rlGhKICZSmJX0KBEUS9zmukzOXMf4nCXmgLVcwqQu7TNBndtMTtZt5Te0glKDv4bop41
         gZd93FhSHK+rt7ZJbIIs0t/HqSNfzSkWXlfqHpdqgOMaQBBhTJs7guk8iaoyXZ5S1Mtl
         2FBYEqHIgtRVmL4Y9xXMjWLNsewRRMBtCwIpgv8fBTl1az0LTew4CuDdAreBmV4r9aRV
         GRiEeQxzsHui/M+SsD6y2u6aOFTVmUJqrxikIu+0r5Uca5hRAQL/fkgvgqsFO2fOU/So
         WDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kj6JT+jHXGMgF6wpvxZYkTfPGiKrPB/frgW1hOjbrMA=;
        b=RYhU9ozcN59yN9Fk/QBWUPsZ5BILSyP5rlrwxLYspZe7HojV7AT/cpZzj+c7AQiEpA
         zbAUaulDP1YTvmuJG2yslui+MXicoAhVbMUrVJitNTOp9ONDORIq7gmdTEM0IHwWx/xc
         r55R6eVTwJKgdSDwXOVlTtNUZluEyRAqOSdr4j5K20rFShAkiQfT5zd1eLXs/0AMk9Pv
         bZUtnYik3lVvyQMbCo9Ddizn/HqBDbRu1wzuoRMZROrDtAEQ8NqJ1C5gglCLwkEfbu47
         cYbS8wfUeQuKikQBLFkHjX5g0v4zYOARyX5imxT2WvCTcGzLfK7+Gq3qSWhEK/ONltHF
         RUvg==
X-Gm-Message-State: APjAAAVrg2J7d9e4lj7/Rj2xx+oNujRtqMLJgYef529uJOvudDAwLt1Z
        gHu8dncmPVPdBrTM5/ZzdyOyQ7zbYze6x0y59z096Q==
X-Google-Smtp-Source: APXvYqyFnODudaj909lWUHE37IZ9sbywYN6M0rtVkC2iqcHnFD9xerHpf7WP1RnGxEjy5VPDFLhVtiiV2to5M4DXZw0=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr8624764ljk.104.1559582311867;
 Mon, 03 Jun 2019 10:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190602205424.28674-1-linus.walleij@linaro.org>
 <20190602205424.28674-2-linus.walleij@linaro.org> <20190603091649.GD27753@ulmo>
In-Reply-To: <20190603091649.GD27753@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 19:18:20 +0200
Message-ID: <CACRpkdb_LZZWxfTmMsfXGZ7=GeTvQ_sR8sWp10Q0nMaBnA=vDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RFC: gpio: ixp4xx: Convert to hieararchical GPIOLIB_IRQCHIP
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 11:16 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> Me

> > +const struct gpiochip_hierarchy_map ixp4xx_gpiomap[] = {
> > +     { .hwirq = 0, .parent_hwirq = 6, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 1, .parent_hwirq = 7, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 2, .parent_hwirq = 19, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 3, .parent_hwirq = 20, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 4, .parent_hwirq = 21, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 5, .parent_hwirq = 22, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 6, .parent_hwirq = 23, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 7, .parent_hwirq = 24, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 8, .parent_hwirq = 25, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 9, .parent_hwirq = 26, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 10, .parent_hwirq = 27, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 11, .parent_hwirq = 28, .parent_type = IRQ_TYPE_LEVEL_HIGH },
> > +     { .hwirq = 12, .parent_hwirq = 29, .parent_type = IRQ_TYPE_LEVEL_HIGH },
>
> I think this is a good example of what I was referring to. There's no
> easy way to represent this mapping in code, other than basically writing
> up the table as a switch statement, or a couple of if/else clauses. But
> if you have a large number of pins in the GPIO controller and they all
> can be easily described by just a handful of lines of code, I think it'd
> be nice to avoid all that extra data.

I agree, but we can add those as we go along. I wonder if such code expressions
of the mapping are really that magical? Isn't it simply at best ranges of hwirqs
so a n_hwirqs need to be added to the map and just collapse the above to:

{ .hwirq = 0, .parent_hwirq = 6, .nr_hwirqs = 13, .parent_type =
IRQ_TYPE_LEVEL_HIGH }

I'm up for that. Maybe as a separate patch though.

Yours,
Linus Walleij
