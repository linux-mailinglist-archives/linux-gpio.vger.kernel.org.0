Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7C93D54D1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 10:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhGZHVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 03:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbhGZHVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 03:21:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC6EC061760
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:02:22 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h9so10280051ljq.8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nBC+AAdhNSp6Y9PCeNESZDrAjbJvLVNma/9NfsdXY8Q=;
        b=AXP8voMcitYr0FtY19uK6rPp9WgozJUcA/Z+cX/hXU4xDU77JzIPu0wMKOeI15djiG
         HisdjAnSIvZLpxqpCQaCCCkN6xPnuESllQ4+5pvuNQqMPqi2xMzBefZqP5qYLW143+bl
         J4xthycSsZ19yOHBcO/Gq9BD/nTkSzXWhnXMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nBC+AAdhNSp6Y9PCeNESZDrAjbJvLVNma/9NfsdXY8Q=;
        b=WiHpZNFHbFsFNVVon+1+vqUqjhmXtJBTjNgxlPW6QBWFUiHruHekjOUKnOB1+4yN1J
         +Z6JW4BQdeRiE6P/4QNdvkTNYru4a2Pb9hueodcLD58Cs6RgbrmcW4DHOLbtZHi9k6t3
         NdNoPrbI4J0tsMvVQunuof6TigzjxrSsVcBONHNnmiA9/fJa36vdCbiyR7FSJkWYzkw1
         SkLM9m55Jb5TqcNTzyJUWDVpJb1ExsL7pr7+FgsLWYiAQLUa4Eo5J5c0+rZYd+Vvd448
         QV0GuOAbWDnrRQE5MoNUDdh2MbKxLUsxOm/LoKylgz/C6yB7QLVgofCy/+frLW7TEkx1
         pFfQ==
X-Gm-Message-State: AOAM531kZkgptwPT5cXMX240ofjyVxO6yukc8EguRJrqARsvXa46wDDq
        G5++VOP0m5XqBB66pywoX0piZitdoF0XJ8inqRwLdw==
X-Google-Smtp-Source: ABdhPJwYvdNT594j5uoh7LhyYxtS6ye0Z/3uprl22Skc07KrFd35T1KpwcWE3PdCoIKu/2m3rCsleSWx5M/7mH2uzx8=
X-Received: by 2002:a2e:760d:: with SMTP id r13mr11728695ljc.437.1627286540610;
 Mon, 26 Jul 2021 01:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
In-Reply-To: <1626940470.29611.9.camel@mhfsdcap03>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Jul 2021 16:02:09 +0800
Message-ID: <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     zhiyong tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, mark.rutland@arm.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        light.hsieh@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, sean.wang@mediatek.com,
        seiya.wang@mediatek.com, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 22, 2021 at 3:54 PM zhiyong tao <zhiyong.tao@mediatek.com> wrote:
>
> On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
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
> > > +
> >
> > Instead of all the obscure macros and the new custom "rsel" property,
> > which BTW is not in the bindings, can't we just list the actual bias
> > resistance of each setting? We could also migrate away from R1R0.
> >
> ==>Hi Chenyu,
> The rsel actual bias resistance of each setting:
>
> MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
> MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
>
> The rsel actual bias resistance is different between PU and PD.

Thanks. Somehow I missed this when looking through the datasheet. This
encoding is interesting. Since it doesn't make sense to have both
pull-up and pull-down, even though the hardware seems capable of doing
so, I suppose the intent is to support 75k or 5k for pull-down, and
(75k, 10k, 5k, 4k, 3k, 2k, 1.5k, 1k) for pull-up?

We could add these values to the binding so we could check for misuse.

The range of values seems to also cover those supported by the
alternative R0/R1 settings. The values for kprow[01] and kpcol[01]
seem to be different though.

We should get rid of the MTK_PUPD_SET_R1R0_* macros at the same time.
They seem to be some magic values used with bias-pull-*, which is not
how the properties should be used. At the same time, they overlap with
mediatek,pull-* properties.

It would be great if we could standardize on the generic pinconf
properties, and also use real values that fit the requirements of the
properties, i.e. using real resistance values. I'm not sure if it
would make sense to enumerate which pins support which configurations
though.


Thanks
ChenYu


> > Then we can specify the setting with the standard bias-pull-up/down
> > properties [1].
> >
> > Also, please ask internally if Mediatek could relicense all the header
> > files that Mediatek has contributed under include/dt-bindings/pinctrl/ [2]
> > to GPL-2.0 and BSD dual license. These files are part of the DT bindings
> > and we really want them to be dual licensed as well, and not just the
> > YAML files.
> >
>
> ==> We will confirm it internally and reply it later.
>
> Thanks.
> >
> > Regards
> > ChenYu
> >
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> > [2] Note that a few files were contributed by other people
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
