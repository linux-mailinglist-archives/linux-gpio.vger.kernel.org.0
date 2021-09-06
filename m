Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764114017BF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 10:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbhIFIWE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 04:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240442AbhIFIWD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 04:22:03 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF41C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  6 Sep 2021 01:20:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q21so10002880ljj.6
        for <linux-gpio@vger.kernel.org>; Mon, 06 Sep 2021 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pmqwpCx8ZMQCEi7EjNBS3MHRQOj6SBBM2cu19SNWsGA=;
        b=PgxlW0+h5rASHGuALwkbIG5RRFW3/jgyS4BO8F516o+hGNXSVTYeNccCctmO1da4kJ
         frUBl+29CB+CWSi86Uk5iz7me22r6l9T2/HxGq1Skl/L+ZY7JZ/QeJrhUVQVfmeNwKdu
         7kqtZW/gBKJb539Z6hTPcSrua5/ZoYOcRuv+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pmqwpCx8ZMQCEi7EjNBS3MHRQOj6SBBM2cu19SNWsGA=;
        b=nlpMSSVVgLWKMcS0IFJfJ3uUzqmg8hBZGUO32Z7LnUsJ+OmgFku6wfGr+XZ0KEQEfz
         HW+ntdjMMdpsODi+95eIO5AW+8NAasKkfDAoHvJrkaEk4AmRZqkn/wfKY0n9pD7HUmA8
         GmwnimiO3irR1ucxK5ebz371gkqJ0zh9978Kb19dfUr88TBNgVbsllssjlibRe45BwfN
         R5jvi+YhmWL3KfDLXoLDhGhtJQdSqNf3bpMZ/ab/mXHgEAdVBq7Q5SlYJjy9w76rej6y
         ofc1hOPgyLB/kHS7jVuTs2qXnrz+6jQUbByO1MtDmnfR7+W4eW4QEuZKFVBWUPYIx6I+
         /kxQ==
X-Gm-Message-State: AOAM530U1dMFpXa8FbdLK5DtQHfZDun4XOnsWt+WWvJRnD75SnYB92A9
        9h+CzF6fgzXCv8W1idaoTI/n8Mapt1LMp41wNA/rrg==
X-Google-Smtp-Source: ABdhPJwfhmdmbsJ7om87xlbz5He7kbU62NhVooKXWMG1vYyZ75Yh7Ze1Si4M2njIhE3vtjp0jSKm+d3IF/0k5nF26J0=
X-Received: by 2002:a2e:4951:: with SMTP id b17mr10106239ljd.414.1630916456951;
 Mon, 06 Sep 2021 01:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com> <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03> <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
 <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
In-Reply-To: <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 6 Sep 2021 16:20:45 +0800
Message-ID: <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 4, 2021 at 4:40 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 11:35 +0800, Chen-Yu Tsai wrote:
> > On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <zhiyong.tao@mediatek.com
> > > wrote:
> > >
> > > On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > > > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > >
> > > > > This patch adds rsel define for mt8195.
> > > > >
> > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > ---
> > > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-
> > > > > bindings/pinctrl/mt65xx.h
> > > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > > @@ -16,6 +16,15 @@
> > > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > >
> > > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > > +#define MTK_PULL_SET_RSEL_111  207
> > > >
> > > > Could you keep the spacing between constants tighter, or have no
> > > > spacing
> > > > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so
> > > > on. This
> > > > would reduce the chance of new macro values colliding with actual
> > > > resistor
> > > > values set in the datasheets, plus a contiguous space would be
> > > > easy to
> > > > rule as macros.
> > > >
> > > > ChenYu
> > >
> > > Hi chenyu,
> > > By the current solution, it won't be mixed used by
> > > MTK_PULL_SET_RSEL_XXX
> > > and real  resistor value.
> > > If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
> > > means how much resistor value.
> >
> > What I meant was that by keeping the value space tight, we avoid the
> > situation where in some new chip, one of the RSEL resistors happens
> > to
> > be 200 or 300 ohms. 100 is already taken, so there's nothing we can
> > do if new designs actually do have 100 ohm settings.
> >
> > > We think that we don't contiguous macro space for different
> > > register.
> > > It may increase code complexity to make having
> > > MTK_PULL_SET_RSEL_000
> > > defined as 104.
> >
> > Can you elaborate? It is a simple range check and offset handling.
> > Are
> > you concerned that a new design would have R2R1R0 and you would like
> > the macros to be contiguous?
> >
> > BTW I don't quite get why decimal base values (100, 200, etc.) were
> > chosen. One would think that binary bases are easier to handle in
> > code.
> >
> >
> > ChenYu
> >
>
> Yes,we concerned that a new design would have R2R1R0 and we would like
> the macros to be contiguous in the feature. we reserve it.

I see. That makes sense. Do you expect to see R3 or even R4 in the future?
Or put another way, do you expect to see resistor values of 150 or 200
supported?

Maybe we could reserve 200 and start from 201 for the RSEL macros?

Some planning needs to be done here to avoid value clashes.

> We think that decimal and binary base values are the same for the
> feature.

With decimal numbers you end up wasting a bit more space, since the
hardware is always using binary values. I just found it odd, that's
all.

ChenYu

> > > Thanks.
> > >
> > > >
> > > > >  #define MTK_DRIVE_2mA  2
> > > > >  #define MTK_DRIVE_4mA  4
> > > > >  #define MTK_DRIVE_6mA  6
> > > > > --
> > > > > 2.18.0
> > > > > _______________________________________________
> > > > > Linux-mediatek mailing list
> > > > > Linux-mediatek@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
