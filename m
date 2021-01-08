Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50202EF416
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 15:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbhAHOmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 09:42:14 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:41109 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbhAHOmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 09:42:13 -0500
Received: by mail-ot1-f49.google.com with SMTP id x13so9812185oto.8
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 06:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqZKyWX2oQpybpS5ziRSXAD4+p0O5RGe9Xd42KogS6A=;
        b=V+ScG1u2Eh7M61v+8kvIXO5EJvotGLpynLO1ONXUnz1b3Nk/IkM+H2zMukd+xxgD/m
         ggsWY2gnxAPnZZ7JvwZWf+DtYW7C9JobmZscY586Xr8Ra0rBta/9Jow1Ry3pKmmslEA/
         JbrL/YWFcqWPXpf4hTLVqqMa/tuveGeQZsiOd/LDCBPJurE8hMS82933F/Dhx04wTYSQ
         VH/4mQcE90CTXd3A+6b04YSXFrbkyTXHHuqA65AdN+eDoCDRh+x3q/gxlWr2Ha1CX1wQ
         hJm13YWiLmNVqXGgrmtl2+pFUemchZEhbjEASap4erCYObu7VyX99+q3gDGcHPUrmy/D
         z7HQ==
X-Gm-Message-State: AOAM533eYcw3wPca4aTJFAxvs0Me7UoLqqTvEXY8uffn8qFMRnYLAfC0
        8jKtahhUaY9jOEruyGdI2HjPEIY/waCt55rBWX2v1naz
X-Google-Smtp-Source: ABdhPJzTZ98xEgOYSTsclFBtkNsGe16a1lp8vQIL73IpBk5t7SbAwAoQOZ/DM5d3Vjt6AbP1gIy1HFDDn2/kV8vB5eQ=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2806315otc.145.1610116892911;
 Fri, 08 Jan 2021 06:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it> <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
 <860764e8df53481bb43c79560b859979@asem.it>
In-Reply-To: <860764e8df53481bb43c79560b859979@asem.it>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 15:41:21 +0100
Message-ID: <CAMuHMdUoWv9qZLYzQyxXsGd4mhiqA7SRHYF33EvSvjBUOzYVnw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Flavio,

On Fri, Jan 8, 2021 at 3:39 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
> > > about the duplicate line names, what do you think
> > > about adding to the command "gpiofind" of libgpiod tools,
> > > the possibility to discover all the duplicate gpio lines?
> > >
> > > For example, something like the following:
> > >
> > > # gpiofind button_1
> > > gpiochip0 20
> > > gpiochip0 22 (duplicate)
> >
> > This cannot happen, as the duplicate is on the same gpiochip.
>
> Just a question:  I think that a duplicate name can be present
> both in the same gpiochip and also in different gpiochips.
> The same gpio line name can be wrongly present on different gpiochips,
> for example caused by a mistake writing an ACPI table.

A duplicate name in the same gpiochip is rejected, as per the patch that
started this thread.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
