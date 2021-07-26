Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688BD3D5A66
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 15:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbhGZMzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbhGZMzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 08:55:03 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BC9C061757;
        Mon, 26 Jul 2021 06:35:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so3923696pjb.3;
        Mon, 26 Jul 2021 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDnFUzEpwUZ0YfpG5MxVM3XmgL29n/OeMou07kNqoqQ=;
        b=YcokiN8Wb/p2RwpnYraQj3FtKY6Pwrg123lJ+kfYxN85eBie5XKkuPeGakhg2WDEdS
         0GAZsGleqoW1jLE10ZGhX2puZPH/SGmbFPdY0jJkbmThUnSUB0Fip4QF9vdFgNiBOEAK
         QMSAMenJNqbxQ8YZCSmsPAuhc0oY5o2wUHAYtGP0G6+AQDk+IG1eyW9nJ3JXHEqF6eGk
         WjnD+YgJSU9sRnXWBWLMwhj02bbnIA3RAE4TqFkbH/r4rze9TUTTHKsdDdufaIy7cDX+
         ovQZXNFGZ5iMqMNlb2r5aHtDDL+5P+YAv72Re50cedMg2JKnYeEeTwh691cfZYIl7oP5
         GmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDnFUzEpwUZ0YfpG5MxVM3XmgL29n/OeMou07kNqoqQ=;
        b=ge2FmOrxPcgkv+9FkjFmyr31+KNUZS8yrZ54+P0YFJ42kqnytl+vW8TTbRtEOIncye
         o/kp659Eg+E1m2ovwwJ62wmOe3aINWIoU2kv1Bfy17HxiOEocQdBoiuYfkqNmyYrVhvc
         vnSxfngHt3U+aTEOA7HfOsQhPDj5054lRK5sWasWOF1DzD1U0rWm3NmowYXUR3YfdbWs
         dMDtOYXOSKCHSmRsDumEU/UT+lNRYrLVvwT9B6+H3J4lO9ISYoWRY7ElDZd3uEUiTDSg
         jOV2mME0ETVhCu8PaMqlLss9B4ZNJUTTMg9CxzFfNPxIuKDSRsxZXoXB1FZOauROAzmF
         zy5g==
X-Gm-Message-State: AOAM531J5cgA4NT8+U4jsbnGswQMow16nXDfyQlFcAd5txD59H64R2JI
        Kf2agP/PsnW170JLpfYNDO19VjWUxxHBIYWgVbk=
X-Google-Smtp-Source: ABdhPJwyfssSzPDSLK5fAaHAOlJWMVc/HS1903P3ZYo0e9a/dhDRKB9EzCDaCIXIDX4GY6MZpoSyr1msBuRlvmCNzgc=
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr18326189pgm.74.1627306530813;
 Mon, 26 Jul 2021 06:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210721191558.22484-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com>
In-Reply-To: <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Jul 2021 16:34:51 +0300
Message-ID: <CAHp75VeV0BsgdStTAiH6uwb4FKG4XQg7NqODw7523+s=SS6Fag@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 4:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jul 21, 2021 at 9:16 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

...

> > +#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (((x) >> 28) & 0x7)
> > +#define RZG2L_GPIO_PORT_GET_INDEX(x)   ((((x) & GENMASK(27, 20)) >> 20) & 0x7f)

It's funny one of them uses style "a" (no GENMASK() use), another
style "b" (GENMASK() is in use). I suggest being consistent: either
drop GENMASK() everywhere, or use them in all suitable places.

> > +#define RZG2L_SINGLE_PIN_GET_PORT(x)   (((x) >> 24) & 0x7f)
> > +#define RZG2L_SINGLE_PIN_GET_BIT(x)    ((((x) & GENMASK(23, 20)) >> 20) & 0x7)

Ditto.

-- 
With Best Regards,
Andy Shevchenko
