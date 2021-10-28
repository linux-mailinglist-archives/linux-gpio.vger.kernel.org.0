Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6DE43DD74
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJ1JM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:12:59 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:45645 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1JM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:12:58 -0400
Received: by mail-ua1-f50.google.com with SMTP id z22so7850080uaq.12;
        Thu, 28 Oct 2021 02:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIdjJwfIBGv1KS5xhlxqTwJnLJVOANH70wfvTGUMbeI=;
        b=MTI/PviUH7WLYyisUCS7UlJRSoWQ9uIMpq+iviYVQ/WbT4D4x3BeNKAOhuzsF6AjVL
         vIalfZZSA+OHJd54S1iP9HvIk7W+b8iVfWsghrD/iZ4tab5i/BDJ6Kgd284WWCmc1jTM
         m1pZr52DY2ppOoEluNd4qH7xWwof52+0Ls/YGvpQx7aZCX/lMXMDShy2ZftxnSbdZ6cw
         STgjM4RkMog7xsa4uC8tPx75lfhZ209iq9RzBAdonB6zkVdHwYZLCnPlx9/QnPrD6VYu
         uQHlg+kFQdiSzkj3pEKU/H8QmZFJ/WQX65GEXE59hdacFSAg1B5EbE3dfT8AbXdddpaX
         NZsA==
X-Gm-Message-State: AOAM532Y3pKr81xDPKJhIVe9LPurCt0KInN+5UCg68ZC0rqPCcpn3yEI
        5mNWDH/YrbgVocIvwyulbdyKlhYHhj3hIg==
X-Google-Smtp-Source: ABdhPJzIhfq0NCdhh0fNLeuuIsaoD0K1CJogFbOa1BJfOl03xCJIC7UmovGr6pCInWISsiXrUZ95dw==
X-Received: by 2002:a67:ca81:: with SMTP id a1mr2656042vsl.56.1635412231255;
        Thu, 28 Oct 2021 02:10:31 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id n17sm380262vkp.36.2021.10.28.02.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 02:10:30 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id e2so10195882uax.7;
        Thu, 28 Oct 2021 02:10:30 -0700 (PDT)
X-Received: by 2002:ab0:3818:: with SMTP id x24mr2932390uav.122.1635412230510;
 Thu, 28 Oct 2021 02:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211027134509.5036-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX81X+1AHp4Dsp70kG1TaYj=x3T8j3xidfLuskjd1Vc6g@mail.gmail.com> <CA+V-a8tRRaF=-1_94g54mYREujLed4G-=DtCXP=QJ6YeRwgfWg@mail.gmail.com>
In-Reply-To: <CA+V-a8tRRaF=-1_94g54mYREujLed4G-=DtCXP=QJ6YeRwgfWg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Oct 2021 11:10:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXK0dVpNsCUAv6eqPi0Zqek1hymvW6HrcDfJPtDVJ4hog@mail.gmail.com>
Message-ID: <CAMuHMdXK0dVpNsCUAv6eqPi0Zqek1hymvW6HrcDfJPtDVJ4hog@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance-ohms
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Thu, Oct 28, 2021 at 10:59 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Oct 28, 2021 at 8:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add support to get/set drive-strength and output-impedance-ohms
> > > for the supported pins.
> > >
> > > While at it also renamed the below macros to match the HW manual,
> > > PIN_CFG_IOLH_SD0 -> PIN_CFG_IO_VMC_SD0
> > > PIN_CFG_IOLH_SD1 -> PIN_CFG_IO_VMC_SD1
> > > PIN_CFG_IOLH_QSPI -> PIN_CFG_IO_VMC_QSPI
> > > PIN_CFG_IOLH_ETH0 -> PIN_CFG_IO_VMC_ETH0
> > > PIN_CFG_IOLH_ETH1 -> PIN_CFG_IO_VMC_ETH1
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > The rest looks good to me!
> >
> Thanks, I'll post a v2 just with patches 3 and 4 only. Hope that is OK with you.

That's fine for me.  I can take 1/4 and 2/4 of this series, if LinusW
and Rob give their Acked-by.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
