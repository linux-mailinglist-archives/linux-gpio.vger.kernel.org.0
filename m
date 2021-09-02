Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2243FE810
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Sep 2021 05:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhIBDgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Sep 2021 23:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbhIBDgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Sep 2021 23:36:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97700C061575
        for <linux-gpio@vger.kernel.org>; Wed,  1 Sep 2021 20:35:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t19so1047661lfe.13
        for <linux-gpio@vger.kernel.org>; Wed, 01 Sep 2021 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gL2ilJvS9thJPKxvfAwKwluP8VS/DzvajJ4jaGSJwc=;
        b=IRTZFjZoogEmBBaugLy0pzf0q5DcgA5uSZSobTaya5fjXwJUzC/oaRDfW2PJI57wq1
         ZBLPCOC8jN6KWXUZfsU6pMwRya5y/VUp/Qzh6O//ItwBo9cnEW868KU+FCAlMdkIbxuT
         gGGKlCW3txze91xJPv10X0akUda4/uNz21Xoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gL2ilJvS9thJPKxvfAwKwluP8VS/DzvajJ4jaGSJwc=;
        b=o8lXU8+NVZF1AVmP9Q8jyof9kudK4waSut0aklNejHnSvewkXeamNWl7O6rIWYLHKa
         32xk1LvRWYf9LqhnqZ/kZp+wTajuYJJ75+5hhyIbnxYB4hlX1OK3humE0n+HreVLvjxt
         MGQW6N/t0aZQeq+9SCg1vn+8AEkbib7vplrpcdUxEer9gEq2f/T490/X9B3P8MxYysTW
         g/LiaUMXtpv77vxwan813OJHurOMNGf5GELX/gW1/iyNTNn/cr3FJX3p5YI1UkVcaF9c
         oM3lmrVwpImeFZS8l9CGhi4kikW/7WNev3brFIpKvvndijywk19qa+EKdmoomK/Txomv
         9gqg==
X-Gm-Message-State: AOAM533ijRSAI9dVXFRrNpv0AQPVUQmCIzGcMeNs/hezPHK7TF26V3g5
        klhEJc6LilglLQB2NP5eQoSO6TGu/nQmouFM2Yo6dQ==
X-Google-Smtp-Source: ABdhPJwp8Zka/IVZHD5rJYhSAvF9EYBibqi1JlXlE5eSLcADyhgkokl5Wumq+rdTbEutCChOFvC3Elh8L79u+yN5V5g=
X-Received: by 2002:ac2:4116:: with SMTP id b22mr894820lfi.587.1630553713975;
 Wed, 01 Sep 2021 20:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com> <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
In-Reply-To: <1630551265.2247.11.camel@mhfsdcap03>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 2 Sep 2021 11:35:02 +0800
Message-ID: <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
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

On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> > >
> > > This patch adds rsel define for mt8195.
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > @@ -16,6 +16,15 @@
> > >  #define MTK_PUPD_SET_R1R0_10 102
> > >  #define MTK_PUPD_SET_R1R0_11 103
> > >
> > > +#define MTK_PULL_SET_RSEL_000  200
> > > +#define MTK_PULL_SET_RSEL_001  201
> > > +#define MTK_PULL_SET_RSEL_010  202
> > > +#define MTK_PULL_SET_RSEL_011  203
> > > +#define MTK_PULL_SET_RSEL_100  204
> > > +#define MTK_PULL_SET_RSEL_101  205
> > > +#define MTK_PULL_SET_RSEL_110  206
> > > +#define MTK_PULL_SET_RSEL_111  207
> >
> > Could you keep the spacing between constants tighter, or have no spacing
> > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so on. This
> > would reduce the chance of new macro values colliding with actual resistor
> > values set in the datasheets, plus a contiguous space would be easy to
> > rule as macros.
> >
> > ChenYu
>
> Hi chenyu,
> By the current solution, it won't be mixed used by MTK_PULL_SET_RSEL_XXX
> and real  resistor value.
> If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
> means how much resistor value.

What I meant was that by keeping the value space tight, we avoid the
situation where in some new chip, one of the RSEL resistors happens to
be 200 or 300 ohms. 100 is already taken, so there's nothing we can
do if new designs actually do have 100 ohm settings.

> We think that we don't contiguous macro space for different register.
> It may increase code complexity to make having MTK_PULL_SET_RSEL_000
> defined as 104.

Can you elaborate? It is a simple range check and offset handling. Are
you concerned that a new design would have R2R1R0 and you would like
the macros to be contiguous?

BTW I don't quite get why decimal base values (100, 200, etc.) were
chosen. One would think that binary bases are easier to handle in code.


ChenYu

> Thanks.
>
> >
> > >  #define MTK_DRIVE_2mA  2
> > >  #define MTK_DRIVE_4mA  4
> > >  #define MTK_DRIVE_6mA  6
> > > --
> > > 2.18.0
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
