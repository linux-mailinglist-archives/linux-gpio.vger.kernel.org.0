Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEFA38C58C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhEULVc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 07:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhEULVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 07:21:30 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F149C061574;
        Fri, 21 May 2021 04:20:06 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q15so13952123pgg.12;
        Fri, 21 May 2021 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0IfFZW3XDMadLNY3MLRNLu8CWZ0fRKcfHiK2HF4n6II=;
        b=cuX/pMf/TfRY5jXrbtMY6sRZQU1YF5AqJRryqp9ImAd9ME3VSkmy6xjW3STSABikMI
         KaT0e49wTS6TqfHFvkDU5b/pqL6uDCC2JCjLZhdRLlV6p503eba0vus/l9A6d4wASGEc
         HLABRXWpuf4ch/J1a9s+hbdgwS1o38yujk/eV/Zend8I4dCRw1NS2Oe2Bpf0AMIeFXbd
         uaugNROBoy0ikLwas46KVd96HwZ4r8j43anjbMDxz0kyRb0rlv9vbOibOGtf9OoleWle
         sB3x87bfwb9dYqwAVWJuCnJc+vGY0l2cU11wnC+mGk1b/W0YxaRmdD33pQXMpd7Bs103
         PfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0IfFZW3XDMadLNY3MLRNLu8CWZ0fRKcfHiK2HF4n6II=;
        b=eKIQnu/xbBmUoXt5vtFyPKs6sLgzARKk4KtoVKpIDitSxbqCuF+DEcTi+kFbXgNJdw
         dwsNyH5ara5QWUjJ3mWCd9kOARStP8leWJNVcB/zxEqIpmgqdPCuyctoZDGbCk0ikYaJ
         TVzOfgxouCKxetEm0D6JXDEnsAIkLrHVND0UgDeuVtRivLecLIDHHgq10dorxSWIn8am
         4Xws1sBhnwQPE2KTcpkPKZU80gpbAuD+bzYmg27B0+PM6JtB1b6fGCABriBFKjbUzHsj
         5BwAWWD1wSjyf8TYxA71FKPOqSGdgQK7YtzrAW5nT/UUTm3W0XGn8ly6jdHRIk8gnYQ9
         fv2g==
X-Gm-Message-State: AOAM531O0d7ArLEveQPGzhjO5cd0cuE1wN0pknqc6rUSA+WhPdHeH3hA
        Cv5zvU2kvgq4UbN9uDFGRQYFUnD4OPQRKcD7Xtc=
X-Google-Smtp-Source: ABdhPJxsgvEGgiJjzzvGasTMF74DBKT73SOPAMMu/rbdDiH/eZygX1O8t5oja4b9vvphcE8fbwelCK1ykkJVYutw3aY=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr9415037pgg.74.1621596006002;
 Fri, 21 May 2021 04:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com> <8c048bda0ace591d7e91c07ed9155338@walle.cc>
In-Reply-To: <8c048bda0ace591d7e91c07ed9155338@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 May 2021 14:19:49 +0300
Message-ID: <CAHp75VdbomvbAY42Bje7F8qjWfgeSnU8i2ULJRXpYKA+oTmwrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
To:     Michael Walle <michael@walle.cc>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 1:19 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-05-21 12:09, schrieb Andy Shevchenko:
> > On Fri, May 21, 2021 at 12:53 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> >> Changelog v2: (based on suggestions by Michael Walle)
> >>   - drop gpio_regmap_set_drvdata()
> >
> > But why do we have gpio_regmap_get_drvdata() and why is it different
> > now to the new member handling?
>
> Eg. the reg_mask_xlate() callback is just passed a "struct
> gpio_regmap*".
> If someone needs to access private data there, gpio_regmap_get_drvdata()
> is used. At least that was its intention.
>
> Thus I was also suggesting to use "struct gpio_regmap*" in the newer
> callbacks.
>
> I don't get what you mean by "different to the new member handling"?

Currently we have a symmetrical API that is getter and setter against
a certain field.
Now this change drops the setter and introduces some other field somewhere else.
Sounds to me:
 - either this has to be split into two changes with explanation of
what's going on
 - or something odd is happening here which I do not understand.

-- 
With Best Regards,
Andy Shevchenko
