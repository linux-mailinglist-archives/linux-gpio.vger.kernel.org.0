Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4017433A00E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Mar 2021 19:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbhCMSsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Mar 2021 13:48:11 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:42223 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbhCMSrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Mar 2021 13:47:36 -0500
Received: by mail-vs1-f49.google.com with SMTP id v123so14279236vsv.9;
        Sat, 13 Mar 2021 10:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4OlbTaZsfRr8m4U6wSFd2NjZwjTvfpq70Z7sr9ivb8=;
        b=TlkyQeb7WVUjXry9Dj1yNgMClsyO8BzfTsKdf7pYK+BAsShxPqzuQI0Z8imQXj6WAi
         armIRNRNovz5Jsz+ss8fk2ZPSdIz27jl+bIPWsGSzpKi1zw8jtM8Wbu0AIJBoNOyib3j
         8HEctNSwN0QWXp7dg/ggmC5JjoAIy/vIEsd2khk5QyzNwp5KXJR/ev8rFNr7Uz5KX+Qd
         TrgTRtkQ+N1TFCQLriHRU/p11PuU64QHefSWxRDjxi4poN8OOWwH9nGy7nO4bued3vaT
         0UehzwixhK2WHnaiVhxzb4WkK0ZT3IGVtV/XW1U3UDpYSvEqXx5hS4Vv/ilbtP0oHaKE
         zu2w==
X-Gm-Message-State: AOAM531XHze5ULFUQzflcwt50Z2EYFqR5dDM6PAQbx4747rIGT1t9Zv8
        /JQv/XUhYZWbVWG4v/sEToOl8beDcZw9aftf0SY=
X-Google-Smtp-Source: ABdhPJzwoWPysyHbwdlp9M+VJu77QpQG1me8NmKxbmEsPbO2YahFUoj0nXRcbp3PfDd1aIU7blraldCc9ki67Z807fM=
X-Received: by 2002:a67:8883:: with SMTP id k125mr2019352vsd.18.1615661255965;
 Sat, 13 Mar 2021 10:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org> <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
 <YEyFyQ0TF5u/WS9X@piout.net>
In-Reply-To: <YEyFyQ0TF5u/WS9X@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 13 Mar 2021 19:47:24 +0100
Message-ID: <CAMuHMdWzEQAOgy7_e_6RcQjP6z0n9LQA6R2LBs1nXMZeAYywvQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexandre,

On Sat, Mar 13, 2021 at 10:28 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 12/03/2021 14:57:54+0100, Enrico Weigelt, metux IT consult wrote:
> > On 02.03.21 06:30, Drew Fustini wrote:
> > > Add "pinmux-select" to debugfs which will activate a pin function for a
> > > given pin group:
> > >
> > >    echo "<group-name function-name>" > pinmux-select
> > >
> > > The write operation pinmux_select() handles this by checking that the
> > > names map to valid selectors and then calling ops->set_mux().
> >
> > I've already been playing with similar idea, but for external muxes.
> > For example, some boards have multiple SIM slots that can be switched
> > via some gpio pin.
> >
> > Not sure whether traditional pinmux would be a good match for that.
>
> If you want to be able to use both, then I guess gpio-mux is what you
> are looking for. Obviously, it will also require support in the bus
> core. On what bus are those SIMs? (I guess the answer will be UART and
> then unfortunately UARTs are not represented as busses).

We do have support for devices connected to UARTs.
See patternProperties in Documentation/devicetree/bindings/serial/serial.yaml.
Or do you mean something different?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
