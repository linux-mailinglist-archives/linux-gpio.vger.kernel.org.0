Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9682F7E45
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 15:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732660AbhAOOcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 09:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbhAOOcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 09:32:06 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C784C061796
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 06:30:49 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id s11so2429657edd.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 06:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2qBdsOGATyREyoZmpg3Ck795aIwZk0HOase0VYuv84=;
        b=FhfeOGfQ5D6Q6ZuiGHBKj7UQusUMlvFoeeGuGGb/nupEEGJtKKJj12qzJe5loBN4zI
         a5s6BICeVMt8A7RDmRQ15hDoFJWE5Q6NVpkkEww89nX6B+SdB9LdVIzjOO2X85KQby0l
         JLVkmz6hEYMwhuBQORb/qgDdLfne581Ltcm7WFcuJ56pTiaFsnX4VIpBj64IYRk/qtcf
         YMUV9+gUJS+V89x+TVRgn29mKQF+FC1rM3cjpoeK3QNGjqndG/Nv8tnR/WXTMwWkhGxX
         V+ZqTilb8GM/hax37mBhY/BeJ/K7KlS0LxKO0JE73ofLw7nKd9+mF1+gKlpWmLmXbLtu
         ppNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q2qBdsOGATyREyoZmpg3Ck795aIwZk0HOase0VYuv84=;
        b=nJ0K81bY/Du1/dpRnn2UdrtVinJG16dHZ0jbZ5C0OjQ8f8Ff2o1yiLMlN2Tc0S8Myt
         bkh9uSGAYIaqoxAxgD3LEDbemsnxmvAJmPamLnuMvAwkaRdx5nBz1aIryLyGs1dKTilj
         0xh348hP7rhc5hz4r+ILWQjpeLMU7OCZD1EzjuzWw9uKS55sa1/gojjSfh1cBvvIIARf
         +ysP1N+ggvythNJo2WnndAbiAKkmGzpOJMq0cscNWlFDHmsWR2iw+s3wD+zQHEQT5Kc6
         SzqG5l4yTyEwX+ZT6ayfSnjAcbspAgxSJDmNzu1yCMk1JgbrjnyDVT1/nrRlNmLqE23/
         W7GQ==
X-Gm-Message-State: AOAM532/359SjIJs8HYwuDvnZAn1FqmbaJlNVu2aQxS7D90AjW+XZK7c
        5zyafFMvmZ7gJ9avkyrG14ulSupe9ohRDmgf3HRohw==
X-Google-Smtp-Source: ABdhPJx8ydD+FSt2EMERY9DxGlhyVgOjdZk2e1yaAO0LU3yhPBAEJGECmZlBRLM+FZM7Sr9IrKh1I2IDxNC43/C9GYU=
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr9872667edt.213.1610721048293;
 Fri, 15 Jan 2021 06:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it> <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
 <860764e8df53481bb43c79560b859979@asem.it> <CAHp75Vdy4c4j2k8LWL_5s3KvGXPL2Zystfqb1+vcpBJzdmuNnw@mail.gmail.com>
In-Reply-To: <CAHp75Vdy4c4j2k8LWL_5s3KvGXPL2Zystfqb1+vcpBJzdmuNnw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 15 Jan 2021 15:30:37 +0100
Message-ID: <CAMpxmJVEEPU44=sHUZSPtS9-zM-De=JppUkhDVLne3sCmGc70A@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 4:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jan 8, 2021 at 4:39 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> ...
>
> > > > For example, something like the following:
> > > >
> > > > # gpiofind button_1
> > > > gpiochip0 20
> > > > gpiochip0 22 (duplicate)
> > >
> > > This cannot happen, as the duplicate is on the same gpiochip.
> >
> > Just a question:  I think that a duplicate name can be present
> > both in the same gpiochip
>
> No. This is against common sense. Can you have the same pin numbers on one chip?
>

You're correct logically but technically this definitely can happen.
As the DT examples from qualcomm show: you can have multiple pins
being called "nc" for "not connected". I'm still not sure what
assumptions user-space can make in this case. Should we have a list of
unsupported or illegal names to look up? Sounds sketchy.

Bartosz

> > and also in different gpiochips.
>
> Yes and it's fine.
>
> > The same gpio line name can be wrongly present on different gpiochips,
> > for example caused by a mistake writing an ACPI table.
>
> --
> With Best Regards,
> Andy Shevchenko
