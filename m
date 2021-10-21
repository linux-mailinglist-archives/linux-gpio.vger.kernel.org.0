Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92234435FDC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 13:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJULFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 07:05:05 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:45886 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJULFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 07:05:02 -0400
Received: by mail-vk1-f179.google.com with SMTP id n201so45484vkn.12;
        Thu, 21 Oct 2021 04:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0/uJXapAU5mNKKcxBTRMfYrMyIyw+LndiogB9Grn7Y=;
        b=lHuFCYN091IbxcRLT0QxwIlkrxql5IStwjdjw+2Pk4O1IhQ5MKaWhkdSidFZOQ7NLq
         Nt6i7vddakXk4j+WHGXcn71u3gSj/teb/iOoFhrfwO3rukmO/FvNr1Su8sWBlrTYfxwN
         OHBJlbEeMpdqBh2T5MkMc+30s60J/c3JyV5UYX+hZheTV6vroA0WQ30yRQqa1tyEELl6
         0HUgZhkA4+skGyx1/gBsT7cV6PBCu8O300VTdZcAjcsU39eDvgyx1mai8UnebWZpvOct
         IIHe1G1qNYyISLGsG1KS7eRQJ9UNkRVk2R/nbLQSgNCF/hFVt9kW2rbHlEOyMW7Pj/F/
         wbow==
X-Gm-Message-State: AOAM531LsZZGkkrEO7gktWelMPWk1O4DmHCVA6D6IcA9TVWvoCVRJffj
        XFe1gnpffZaYhcIJMbLekh7mGFuyfNJRHg==
X-Google-Smtp-Source: ABdhPJw+YRg2TaYeWXwmGeQ2rSkrO3PifNCGDEztodnChP+YEvpkIu1ACLEjulzauOexlOdhGUwT+A==
X-Received: by 2002:a1f:6047:: with SMTP id u68mr5027531vkb.15.1634814166287;
        Thu, 21 Oct 2021 04:02:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id t69sm2885534vkc.32.2021.10.21.04.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 04:02:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id u5so273581uao.13;
        Thu, 21 Oct 2021 04:02:44 -0700 (PDT)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr5379353uam.14.1634814164305;
 Thu, 21 Oct 2021 04:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7> <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7> <CAMuHMdWDRGmxt55vvRTnyu5SwXCDtkcOLmKA87cd4SSa8S+Z=Q@mail.gmail.com>
 <20211021104950.nhvify5lo7y5fdfh@vireshk-i7>
In-Reply-To: <20211021104950.nhvify5lo7y5fdfh@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 13:02:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
Message-ID: <CAMuHMdUutrjVRv7QOjQ3dKqWxAD6fQu4QqXvOjCREj3guGi6xA@mail.gmail.com>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh,

On Thu, Oct 21, 2021 at 12:49 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 21-10-21, 12:07, Geert Uytterhoeven wrote:
> > On Thu, Oct 21, 2021 at 11:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > The structure will get aligned to the size of largest element and each
> > > element will be aligned to itself. I don't see how this will break
> > > even in case of 32/64 bit communication.
> >
> > Structures are not aligned to the size of the largest element, but
> > to the largest alignment needed for each member.
>
> Right, I was talking in terms of the structures we have here for GPIO.
> The biggest member here (for any structure) is 32bits long, and
> compiler shouldn't add extra padding here.
>
> > This can be smaller than the size of the largest element.
> > E.g. alignof(long long) might be 4, not 8.
>
> Right.
>
> > And m68k aligns to two bytes at most.
>
> Interesting, I assumed that it will be 4bytes for 32 bit systems. So
> in case of m68k, we will see something like this ?
>
> struct foo {
>     u8 a;       // aligned to 2 bytes
>
>                 // padding of 1 byte
>
>     u32 b;      // aligned to 2 bytes
> }

Exactly.  And on CRIS (no longer supported by Linux), there won't
be any padding.

So I recommend to always add explicit padding, to make sure all
members are aligned naturally on all systems.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
