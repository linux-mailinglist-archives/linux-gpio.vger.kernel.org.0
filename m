Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB1D40BE2F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 05:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbhIOD1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 23:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbhIOD1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 23:27:00 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B61C061762
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 20:25:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h1so2543500ljl.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jpkoy1O4W37gxxZz4Q3BGON9SqZWsCkichzbFfj+wPo=;
        b=j5pbDlKbHAd/SoLCe/0YXf/jcjOdh7iKg2fsZFsarJCya01vUWLgShKILNoLJ7fKDX
         QYlstdoebXeBTxYpSIVHChb8b+8ERKwmiwpjChYkhJ1M0jnrKMS0za5Nc0xykKZh6ym7
         EOn20yZdsi/QGUBN2LgWOZceToXqcG+/zRPKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jpkoy1O4W37gxxZz4Q3BGON9SqZWsCkichzbFfj+wPo=;
        b=NbG+zIrEbSd8kq7Uw7zAoSRHDCAMxehGqvqXJyM9vOu/vJHztRC1lOBYoR10hjFYjD
         zpEBRM0GQC8w+NnsnAC+YWBQyqt3Z90pHA5/l4Fm5ZaDPn/AT7TfmAs7gt7Y7B4zzyRO
         InJEQQHE6DhIN1Z3a28PLAHHveshT7ufqt/Oa4veKJB6fdr5cNfs1dZ7Zn7KA9f2APIj
         Ov4h61NS8ELddTD0neQ25mBGl0rjuBNbgEKc2CK3EDHDujiw3wg6l+OMU6bmJl++/tkv
         g2Gw9V7Awu57UOfWQtDx1ookSXnaSFl5NSlMFeiADDQOHbZFa2RD2+sBYmM+j3QvcDke
         HC1Q==
X-Gm-Message-State: AOAM531IsSO+yqz5OFS/QmQ0PUgc9ROBjYVMGVl9ooxK3ZPviBKX0xvi
        5+Dg6/6HLPnUgI2GSffIwzF8OR9OvD4kmbkRv4OsxA==
X-Google-Smtp-Source: ABdhPJzxW4QysuCYdlnzVAVxRBzARMIBn0RRJp/tSFmhr5M92N1O+bjF81zqZa2hjgCSzEpa1xAoPr+pFCI3qHYh47I=
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr18546099ljc.392.1631676339641;
 Tue, 14 Sep 2021 20:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com> <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03> <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
 <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
 <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com> <05f453a466995a6c272d585f18e81c5fcb837a0b.camel@mediatek.com>
In-Reply-To: <05f453a466995a6c272d585f18e81c5fcb837a0b.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 15 Sep 2021 11:25:28 +0800
Message-ID: <CAGXv+5FF25a=28YNmVx_FNJ1o+OrR_LWkd1VPe6ejoxX9-bkaA@mail.gmail.com>
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

On Tue, Sep 14, 2021 at 8:27 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-09-06 at 16:20 +0800, Chen-Yu Tsai wrote:
> > On Sat, Sep 4, 2021 at 4:40 PM zhiyong.tao <zhiyong.tao@mediatek.com>
> > wrote:
> > >
> > > On Thu, 2021-09-02 at 11:35 +0800, Chen-Yu Tsai wrote:
> > > > On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <
> > > > zhiyong.tao@mediatek.com
> > > > > wrote:
> > > > >
> > > > > On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > > > > > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <
> > > > > > zhiyong.tao@mediatek.com> wrote:
> > > > > > >
> > > > > > > This patch adds rsel define for mt8195.
> > > > > > >
> > > > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > > > ---
> > > > > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > > > > >  1 file changed, 9 insertions(+)
> > > > > > >
> > > > > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > > b/include/dt-
> > > > > > > bindings/pinctrl/mt65xx.h
> > > > > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > > @@ -16,6 +16,15 @@
> > > > > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > > > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > > > >
> > > > > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > > > > +#define MTK_PULL_SET_RSEL_111  207
> > > > > >
> > > > > > Could you keep the spacing between constants tighter, or have
> > > > > > no
> > > > > > spacing
> > > > > > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and
> > > > > > so
> > > > > > on. This
> > > > > > would reduce the chance of new macro values colliding with
> > > > > > actual
> > > > > > resistor
> > > > > > values set in the datasheets, plus a contiguous space would
> > > > > > be
> > > > > > easy to
> > > > > > rule as macros.
> > > > > >
> > > > > > ChenYu
> > > > >
> > > > > Hi chenyu,
> > > > > By the current solution, it won't be mixed used by
> > > > > MTK_PULL_SET_RSEL_XXX
> > > > > and real  resistor value.
> > > > > If user use MTK_PULL_SET_RSEL_XXX, They don't care the define
> > > > > which
> > > > > means how much resistor value.
> > > >
> > > > What I meant was that by keeping the value space tight, we avoid
> > > > the
> > > > situation where in some new chip, one of the RSEL resistors
> > > > happens
> > > > to
> > > > be 200 or 300 ohms. 100 is already taken, so there's nothing we
> > > > can
> > > > do if new designs actually do have 100 ohm settings.
> > > >
> > > > > We think that we don't contiguous macro space for different
> > > > > register.
> > > > > It may increase code complexity to make having
> > > > > MTK_PULL_SET_RSEL_000
> > > > > defined as 104.
> > > >
> > > > Can you elaborate? It is a simple range check and offset
> > > > handling.
> > > > Are
> > > > you concerned that a new design would have R2R1R0 and you would
> > > > like
> > > > the macros to be contiguous?
> > > >
> > > > BTW I don't quite get why decimal base values (100, 200, etc.)
> > > > were
> > > > chosen. One would think that binary bases are easier to handle in
> > > > code.
> > > >
> > > >
> > > > ChenYu
> > > >
> > >
> > > Yes,we concerned that a new design would have R2R1R0 and we would
> > > like
> > > the macros to be contiguous in the feature. we reserve it.
> >
> > I see. That makes sense. Do you expect to see R3 or even R4 in the
> > future?
> > Or put another way, do you expect to see resistor values of 150 or
> > 200
> > supported?
> >
> > Maybe we could reserve 200 and start from 201 for the RSEL macros?
> >
> > Some planning needs to be done here to avoid value clashes.
> >
> > > We think that decimal and binary base values are the same for the
> > > feature.
> >
> > With decimal numbers you end up wasting a bit more space, since the
> > hardware is always using binary values. I just found it odd, that's
> > all.
> >
> > ChenYu
> >
> > > > > Thanks.
>
> Hi ChenYu,
>
> In the next version, we provide a solution which we discussed internal
> to avoid value clashes.
>
> The solution:
> 1. We will keep the define "MTK_PULL_SET_RSEL_000 200". It won't
> change.
>
> 2. We will add a property in pio dtsi node, for example,
> the property name is "rsel_resistance_in_si_unit".
> We will add a flag "rsel_si_unit" in pinctrl device.
> in probe function, we will identify the property name
> "rsel_resistance_in_si_unit" to set the flag "rsel_si_unit" value.
> So it can void value clashes.

I suppose a "mediatek," prefix should be added. And to future proof
things this should probably apply to all bias-up/down values, so
"mediatek,bias-resistance-in-si-units"?

And the description should include something like that:

  Past usage of bias-up/down values included magic numbers to specify
  different hardware configurations based on register values. This
  property specifies that all values used for bias-up/down for this
  controller shall be in SI units.

And this proposal is still subject to maintainer (not me) review.


> 3.We will provide the define "MTK_PULL_SET_RSEL_000 200" and si unit
> two solution. users can support which solution by add property
> "rsel_resistance_in_si_unit" in dts node or not.

Thanks. I think this solution does provide a clear separation of the
two value spaces.

ChenYu

> > > > >
> > > > > >
> > > > > > >  #define MTK_DRIVE_2mA  2
> > > > > > >  #define MTK_DRIVE_4mA  4
> > > > > > >  #define MTK_DRIVE_6mA  6
> > > > > > > --
> > > > > > > 2.18.0
> > > > > > > _______________________________________________
> > > > > > > Linux-mediatek mailing list
> > > > > > > Linux-mediatek@lists.infradead.org
> > > > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
