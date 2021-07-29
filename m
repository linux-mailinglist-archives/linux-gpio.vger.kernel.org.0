Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0576E3DA07B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 11:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhG2Jnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 05:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbhG2Jnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 05:43:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C93BC061765
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 02:43:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f18so9808615lfu.10
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsaad1GJ/XkOm8cfftebiAxoVa/TpWToS62izuGJ9pY=;
        b=ROFh5zsDdjGB7xsZ3gfN08X4TCqyLE5GcRkJ/K9oEApY7i/IignrvExID9mp+hgOyH
         m+q2hwtfQ3PcGy4Zu1LihgEvq5qWFR/OkQ+71zz+O8nUDZjw76nkxxU3HSuT73irF7KN
         57aQnO2wW+VyKNylkZJkCNV4eqIcS2Gdtt3M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsaad1GJ/XkOm8cfftebiAxoVa/TpWToS62izuGJ9pY=;
        b=UM8y+IW8d7bI75BTXYSipRXa9AqekVoiA9fKpIGE0YMHdr+2G6dUzMTmImQoofgU8A
         RS/bmSbq8W0MxPx3NsQ3XQkEmCjAFIV0rv12Y7OaLvIA/R1T6WKjU/pltCjO3thLEhUT
         7C51d8Nhd0wIT3BAJgX/OuG1o2qVyphoDvmaLGAqcJn6ki2N8jjRFVbg3usX+W+mbwud
         eYYxsLjLtBgDQYsc4oezjEtq0gVyzkTNJEHr9ZukrhvTaqlR8aaG8bKPL0OKn7cseaeD
         XXtoHq34o1ly++HW5rLoHjuYbbMXZCjVmJBV1wpjmDdUn9Pb0WQsXTWnYAYtEWc17WyB
         Y0kA==
X-Gm-Message-State: AOAM531j6B3rPp2MyWl0xVm+n99sGbMyfCY0w/x/pzsxzIP8vQyTsYdQ
        cAvuHjTXPfRC4WflKG7FVWNzBl8MZiE5dBQGfN2rZA==
X-Google-Smtp-Source: ABdhPJxZA8w1PV7njkB8YqwoZbP8na6AFtXiJ942E2I1irAuG8V7nC6e8Ne+qo+7pXOc9OavLte6E41ZTbaK5boATXU=
X-Received: by 2002:a05:6512:a89:: with SMTP id m9mr3260592lfu.342.1627551821389;
 Thu, 29 Jul 2021 02:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
In-Reply-To: <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 29 Jul 2021 17:43:30 +0800
Message-ID: <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, mark.rutland@arm.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        light.hsieh@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-07-26 at 16:02 +0800, Chen-Yu Tsai wrote:
> > On Thu, Jul 22, 2021 at 3:54 PM zhiyong tao <zhiyong.tao@mediatek.com
> > > wrote:
> > >
> > > On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> > > > Hi,
> > > >
> > > > On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <
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
> > > > > +
> > > >
> > > > Instead of all the obscure macros and the new custom "rsel"
> > > > property,
> > > > which BTW is not in the bindings, can't we just list the actual
> > > > bias
> > > > resistance of each setting? We could also migrate away from R1R0.
> > > >
> > >
> > > ==>Hi Chenyu,
> > > The rsel actual bias resistance of each setting:
> > >
> > > MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
> > > MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> > > MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> > > MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
> > >
> > > The rsel actual bias resistance is different between PU and PD.
> >
> > Thanks. Somehow I missed this when looking through the datasheet.
> > This
> > encoding is interesting. Since it doesn't make sense to have both
> > pull-up and pull-down, even though the hardware seems capable of
> > doing
> > so, I suppose the intent is to support 75k or 5k for pull-down, and
> > (75k, 10k, 5k, 4k, 3k, 2k, 1.5k, 1k) for pull-up?
> >
> > We could add these values to the binding so we could check for
> > misuse.
> >
> > The range of values seems to also cover those supported by the
> > alternative R0/R1 settings. The values for kprow[01] and kpcol[01]
> > seem to be different though.
> >
> > We should get rid of the MTK_PUPD_SET_R1R0_* macros at the same time.
> > They seem to be some magic values used with bias-pull-*, which is not
> > how the properties should be used. At the same time, they overlap
> > with
> > mediatek,pull-* properties.
> >
> > It would be great if we could standardize on the generic pinconf
> > properties, and also use real values that fit the requirements of the
> > properties, i.e. using real resistance values. I'm not sure if it
> > would make sense to enumerate which pins support which configurations
> > though.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> The rsel actual bias resistance of each setting is different in
> different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> common for all different IC.

I see. I personally prefer having things clearly described. I can
understand this might be an extra burden to support different chips
with different parameters, though this should be fairly straightforward
with lookup tables tied to the compatible strings.

Let's see if Rob and Linus have anything to add.


ChenYu


> Thanks.
>
> > > > Then we can specify the setting with the standard bias-pull-
> > > > up/down
> > > > properties [1].
> > > >
> > > > Also, please ask internally if Mediatek could relicense all the
> > > > header
> > > > files that Mediatek has contributed under include/dt-
> > > > bindings/pinctrl/ [2]
> > > > to GPL-2.0 and BSD dual license. These files are part of the DT
> > > > bindings
> > > > and we really want them to be dual licensed as well, and not just
> > > > the
> > > > YAML files.
> > > >
> > >
> > > ==> We will confirm it internally and reply it later.
> > >
> > > Thanks.
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > >
> > > > [1]
> > > > https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> > > > [2] Note that a few files were contributed by other people
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
