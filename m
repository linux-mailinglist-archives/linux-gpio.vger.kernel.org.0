Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6BD2224F1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 16:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgGPOMO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 10:12:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38108 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgGPOMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 10:12:14 -0400
Received: by mail-ot1-f65.google.com with SMTP id t18so4294264otq.5;
        Thu, 16 Jul 2020 07:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMNpnTIeC/iF+Y3olmBi/4bZyuqHtNOjligpTstZIfc=;
        b=Pjm8F4eAg63xn97ukkyxU0cjoFqsseDjSwDVVikbwfs+WGRV+QkJf9CBTtIduRyQE8
         UmyfcVsbFZ5O6K8aAkn1Tr3eIqxJAoFPdyucizvTgBELQpbtfkTJ3DLsINDYrKcgxGMz
         QleakIOg0G/LW/mAwqdOdzGoGkA8PI+NFr2rDaTxQtaxfGfv2UF4M9TfOrKYfzA6NaDZ
         HFEJ+knLxlnzg/sTTBBgcI3A+BiIg4wvgRmolId8QdZzFibgJAtZ4tXIQhvovb2HKvDC
         uRRW5rHcdQ4mPFNrY2oyavkWevqfT2VW4l61HXOkRfra5snueOdIExGmMLAzQ+Bg1dnm
         e7sQ==
X-Gm-Message-State: AOAM532zZvTRzySDHziuECHB7SOIqESTnyCGVWEwsv/XKRvpPXwRefak
        GOmrPRyGfKR+A5TtWqv3TKH5d808aERpRzzFN/o=
X-Google-Smtp-Source: ABdhPJz8JShPr1B7m8+xQ6qDCyyXempqtdVlG59chzJx01cDNuzLpVEsfXL9aedezZ0bI1sxnSPnZgoSUWwkLs0WANk=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr4355766otb.107.1594908733133;
 Thu, 16 Jul 2020 07:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-21-lee.jones@linaro.org> <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
 <CACRpkdYep_r1KsTnU2gVr-DeOf50hRiyTRq=jgeas=fD-qPHVg@mail.gmail.com>
In-Reply-To: <CACRpkdYep_r1KsTnU2gVr-DeOf50hRiyTRq=jgeas=fD-qPHVg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 16:12:01 +0200
Message-ID: <CAMuHMdUVp3Zt1jr4mrmpm23W3f7S8ha9T9UGPiwkkENgXuE-Dw@mail.gmail.com>
Subject: Re: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc
 headers and fix others
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Jul 16, 2020 at 3:57 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jul 15, 2020 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in sh-pfc-for-v5.9.
>
> OK since Geert is queueing this I'll drop this patch from my tree.

Oops, sorry, I didn't know you were planning to apply this one.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
