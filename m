Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF0A7A487D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Sep 2023 13:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241243AbjIRLdP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Sep 2023 07:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241761AbjIRLdC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Sep 2023 07:33:02 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9768DE66
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 04:32:11 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44d426d0e05so1735733137.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695036730; x=1695641530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ1hMKB1iB8dAD1LFazBadXx45gs+UjtNDgrBqnCBUo=;
        b=fYc201JNOm85UhfriW1Li6EKcs+b33GQmN2K+TTw4YoBDfR+JyNfP81F9s8WlnoueX
         bjLXzIx2KIfqZj5nExtqcnW3TrAWGaEIt8Ick4ips535rDwsJ2gMLFmzPxWT6XdFX9qJ
         Y7kbmQfkc7El0Soaax2FLnrqyptRlY7Lz7qojZVtqP4Ax4DbOH2P8u4F5WZMd0KrbgcU
         6ZXtf8ua9gcycjNnt35tMJzl18Jrmi67fIgRxWkqjHgExPmQYqur6Q46ZbMkgOjClj88
         J7vjO3lTviZvyDJOGBtGGSWbFNrLEyNyBjxGN36dVJkph5omEern5eHYfaeF8T6uFQSE
         4sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695036730; x=1695641530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ1hMKB1iB8dAD1LFazBadXx45gs+UjtNDgrBqnCBUo=;
        b=km/FVWz1uXby3toiz42rfTxVyvUCe+BVYYJIotBoyh8RVvVG298c2w1wZaGGAdp4SI
         LcN/hh/W4F+w+zoQT4IElZmAtj1+GvdVRKZbGg3z5aAVHqXvco+rkleV3JLItgRz8n9X
         FFT/E5UEGVKBgmcwHl2AmpAUYp1DN5j2mqrFzUlFcq3nz+S38oKW9GwjI1WH6yARD7zo
         vkKY4RkqZ0IboB6PBzQK8tw0ssezh/J+A38WITovF9AU/qjryQfnmSi2wN/JJHQ32g9m
         NKmqOKpA4P18Ljf5RjTB5KXYcRAxiVV+bkvk3yACd4JvBe9j/tuz/mKwj/srN2BoGsjg
         eKHQ==
X-Gm-Message-State: AOJu0YyXhKM4ESmtHMDzhnNp4lPvzL+ue+rbEAgafNyQX4VOdgU2IYib
        iuh3DDh1UnBCTKtENx1NvHgPD1n3jXv7+bWcFYrgVQ==
X-Google-Smtp-Source: AGHT+IH6WTWHIBU8iYzdKZOEYuBcimHPITgvbwfNRJESqbvBBkRntYAnIFYou7q9tm+/2Oyoneqn1TTqoBgXOkpzewg=
X-Received: by 2002:a05:6102:2336:b0:452:60c5:20b with SMTP id
 b22-20020a056102233600b0045260c5020bmr2943809vsa.15.1695036730526; Mon, 18
 Sep 2023 04:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <ceeda269bceee1c805f148bcbc628abc9d42601a.1693721348.git.christophe.jaillet@wanadoo.fr>
 <CAMRc=Meq+1z50=tXXt3MFAexRCmfSQ5rs6hT7311KRGO=q2RHQ@mail.gmail.com> <4f629125-2b62-1284-3311-d95639044764@wanadoo.fr>
In-Reply-To: <4f629125-2b62-1284-3311-d95639044764@wanadoo.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Sep 2023 13:31:59 +0200
Message-ID: <CAMRc=MfmOTy6zU0v3gc6-d9zLpuzZaP9ChCajF=POmKhEQ+g_g@mail.gmail.com>
Subject: Re: [PATCH] gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linus.walleij@linaro.org, andy@kernel.org, galak@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 16, 2023 at 5:10=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 03/09/2023 =C3=A0 19:02, Bartosz Golaszewski a =C3=A9crit :
> > On Sun, Sep 3, 2023 at 8:13=E2=80=AFAM Christophe JAILLET
> > <christophe.jaillet@wanadoo.fr> wrote:
> >>
> >> If an error occurs after a successful irq_domain_add_linear() call, it
> >> should be undone by a corresponding irq_domain_remove(), as already do=
ne
> >> in the remove function.
> >>
> >> Fixes: c6ce2b6bffe5 ("gpio: add TB10x GPIO driver")
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >>   drivers/gpio/gpio-tb10x.c | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> >> index 78f8790168ae..f96d260a4a19 100644
> >> --- a/drivers/gpio/gpio-tb10x.c
> >> +++ b/drivers/gpio/gpio-tb10x.c
> >> @@ -195,7 +195,7 @@ static int tb10x_gpio_probe(struct platform_device=
 *pdev)
> >>                                  handle_edge_irq, IRQ_NOREQUEST, IRQ_N=
OPROBE,
> >>                                  IRQ_GC_INIT_MASK_CACHE);
> >>                  if (ret)
> >> -                       return ret;
> >> +                       goto err_remove_domain;
> >>
> >>                  gc =3D tb10x_gpio->domain->gc->gc[0];
> >>                  gc->reg_base                         =3D tb10x_gpio->=
base;
> >> @@ -209,6 +209,10 @@ static int tb10x_gpio_probe(struct platform_devic=
e *pdev)
> >>          }
> >>
> >>          return 0;
> >> +
> >> +err_remove_domain:
> >> +       irq_domain_remove(tb10x_gpio->domain);
> >> +       return ret;
> >>   }
> >>
> >>   static int tb10x_gpio_remove(struct platform_device *pdev)
> >> --
> >> 2.34.1
> >>
> >
> > That's not enough, you also need to dispose of all remaining mappings.
> > Please see drivers/gpio/gpiolib.c and how it handles the gpio_irq_chip
> > domain.
>
> Hi,
>
> you'll have to give me more explanation because I've not been able to
> find anything useful to me.
>

I should have expressed myself clearer. Your patch is correct and I
will queue it. But in your remove callback, you'll need to go through
the existing irq mappings and dispose of them before returning. Please
see gpiochip_irqchip_remove()[1]. You can send it as a follow-up.

Bart

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L=
1725
