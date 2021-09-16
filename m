Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE3340D667
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 11:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhIPJmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 05:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhIPJmY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 05:42:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C4DC061764
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 02:41:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y28so16178783lfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ViqmEUURV9KzmdbdWaeuenbxlMIV07XJg+kIahFwNc=;
        b=TZ5teF52Vg9Wl8dI5uNYZIKIIwZyCLDyfLsauRqnJSjhzmlyIjvwe/HhChQmL4Gm60
         QzvYUu6OEvJofCOF5hGp66Du4CYUMrtt2tou6SKd+wX8cnzZgLECynlg2b3pczLMS2By
         urZ95aABKdbV6SuYg00B0CXbz+wDgjfBm7fIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ViqmEUURV9KzmdbdWaeuenbxlMIV07XJg+kIahFwNc=;
        b=qkS+bJDftXTkzm3yuydHdQWEIF05D/Eic/ELoW81k0Tsz2+uZaZfORIHI1PX++GAYc
         Dk5CZAw1nAK4FLpYxjWxWrCNpSCamFMVAcPD0efsY2Uy/MXGkHw4rPeyCjHfVkj1eueA
         wD9vMA+FeW50iR6PEWC+fpqjpImtyvv7Pe0Nf/lN4tBEo+HrtqZgmhXoXsmq6qQDAtS6
         DQnUp8Ol9o6GdOu4P3OT9MlRdNQWgW1L6G9bwIoB/NFb6TYhEeZUQWl0HaGTJQPLsyTv
         3NaeibMqLh16aINZj4egW8mi6ePKAx/6Buctgh2FLHx88M3Z6vKNn03XBeACYaMg3OHu
         PGog==
X-Gm-Message-State: AOAM532pUmqxsaIxmNpbaVRW2iQhFU7a62dkL9h7N8VDP/Y+6wNAlAI3
        8zhdtmyE3VCzVT8niLr/d32unfjuuijN1k0ZWG9v8A==
X-Google-Smtp-Source: ABdhPJzxTLHXLQJOuZdu8Mny+fYV+/Xp/ULsddhyyWrKP/YTnILrxK46Rn/Bz/ap69BeHtP3JN3SHn1dqoJzrquL5g8=
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr3650420lfk.482.1631785262209;
 Thu, 16 Sep 2021 02:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-5-zhiyong.tao@mediatek.com> <CAGXv+5H5KnskzBYuqniBGQWBLriyFkBvVXEk1Cyg6XSmKMWP8w@mail.gmail.com>
 <b82ae857d8a3acf117721bb83d4dbbc44f612565.camel@mediatek.com>
 <CAGXv+5F=H3C9mB+uYJDmk8vPiKjWixFs8DF3Pk_Xh3x6Jpq6iA@mail.gmail.com> <74a3a96745e93c5a2392b8a39822c872fd468466.camel@mediatek.com>
In-Reply-To: <74a3a96745e93c5a2392b8a39822c872fd468466.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Sep 2021 17:40:50 +0800
Message-ID: <CAGXv+5HN_rPzwhbEYEj2=XfZFuX2b+xWoqUPYr3Bwz5SbV8fng@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] pinctrl: mediatek: add rsel setting on MT8195
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Thu, Sep 16, 2021 at 5:31 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-09-06 at 18:09 +0800, Chen-Yu Tsai wrote:
> > On Mon, Sep 6, 2021 at 11:17 AM zhiyong.tao <zhiyong.tao@mediatek.com
> > > wrote:
> > >
> > > On Wed, 2021-09-01 at 18:10 +0800, Chen-Yu Tsai wrote:
> > > > Hi,
> > > >
> > > > On Mon, Aug 30, 2021 at 8:37 AM Zhiyong Tao <
> > > > zhiyong.tao@mediatek.com
> > > > > wrote:
> > > > >
> > > > > This patch provides rsel setting on MT8195
> > > >
> > > > A bit more context, like what is rsel, would be nice.
> > > >
> > >
> > > we will add more context it in the next version.
> > > > >
> > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > ---
> > > > >  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 133
> > > > > +++++++++++++
> > > > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 181
> > > > > ++++++++++++++++--
> > > > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  35 +++-
> > > > >  drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 ++-
> > > > >  drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
> > > > >  5 files changed, 348 insertions(+), 27 deletions(-)
> > > >
> > > > Could you split this patch into two, so the common parts are in
> > > > the
> > > > first
> > > > patch, and the mt8195 specific changes are in the second?
> > > >
> > >
> > > ok, we will split in the next version.
>
> Hi Chen-Yu,
>
> the common parts and the mt8195 specific changes are a new rsel
> feature. Is it suitable to separate them?

Because you are changing an existing, used code path, it would make it
much clearer what the change is. This helps if the change accidentally
introduced some bug, and someone later bisected the issue down to this
specific patch. It would make more sense to that person if they saw
"introduce support for RSEL" instead of "introduce RSEL for MT8195".

The latter could be understood as support for the RSEL feature already
existed, and thus might seem confusing; whereas if you separate out
the core changes it would be clear that you are adding support for a
new feature, and the platform changes come later.

> Thanks.
>
> > >
> > > > >
> > > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > > > > b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > > > > index 892e79703f98..275b7ba4386d 100644
> > > > > --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > > > > +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > > > > @@ -779,6 +779,135 @@ static const struct mtk_pin_field_calc
> > > > > mt8195_pin_drv_adv_range[] = {
> > > > >         PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
> > > > >  };
> > > > >
> > > > > +static const struct mtk_pin_field_calc mt8195_pin_rsel_range[]
> > > > > = {
> > > > > +       PIN_FIELD_BASE(8, 8, 4, 0x0c0, 0x10, 15, 3),
> > > > > +       PIN_FIELD_BASE(9, 9, 4, 0x0c0, 0x10, 0, 3),
> > > > > +       PIN_FIELD_BASE(10, 10, 4, 0x0c0, 0x10, 18, 3),
> > > > > +       PIN_FIELD_BASE(11, 11, 4, 0x0c0, 0x10, 3, 3),
> > > > > +       PIN_FIELD_BASE(12, 12, 4, 0x0c0, 0x10, 21, 3),
> > > > > +       PIN_FIELD_BASE(13, 13, 4, 0x0c0, 0x10, 6, 3),
> > > > > +       PIN_FIELD_BASE(14, 14, 4, 0x0c0, 0x10, 24, 3),
> > > > > +       PIN_FIELD_BASE(15, 15, 4, 0x0c0, 0x10, 9, 3),
> > > > > +       PIN_FIELD_BASE(16, 16, 4, 0x0c0, 0x10, 27, 3),
> > > > > +       PIN_FIELD_BASE(17, 17, 4, 0x0c0, 0x10, 12, 3),
> > > > > +       PIN_FIELD_BASE(29, 29, 2, 0x080, 0x10, 0, 3),
> > > > > +       PIN_FIELD_BASE(30, 30, 2, 0x080, 0x10, 3, 3),
> > > > > +       PIN_FIELD_BASE(34, 34, 1, 0x0e0, 0x10, 0, 3),
> > > > > +       PIN_FIELD_BASE(35, 35, 1, 0x0e0, 0x10, 3, 3),
> > > > > +       PIN_FIELD_BASE(44, 44, 1, 0x0e0, 0x10, 6, 3),
> > > > > +       PIN_FIELD_BASE(45, 45, 1, 0x0e0, 0x10, 9, 3),
> > > > > +};
> > > > > +
> > > > > +static const struct mtk_pin_rsel mt8195_pin_rsel_val_range[] =
> > > > > {
> > > > > +       PIN_RSEL(8, 17, 0x0, 75000, 75000),
> > > > > +       PIN_RSEL(8, 17, 0x1, 10000, 5000),
> > > > > +       PIN_RSEL(8, 17, 0x2, 5000, 75000),
> > > > > +       PIN_RSEL(8, 17, 0x3, 4000, 5000),
> > > > > +       PIN_RSEL(8, 17, 0x4, 3000, 75000),
> > > > > +       PIN_RSEL(8, 17, 0x5, 2000, 5000),
> > > > > +       PIN_RSEL(8, 17, 0x6, 1500, 75000),
> > > > > +       PIN_RSEL(8, 17, 0x7, 1000, 5000),
> > > > > +       PIN_RSEL(29, 30, 0x0, 75000, 75000),
> > > > > +       PIN_RSEL(29, 30, 0x1, 10000, 5000),
> > > > > +       PIN_RSEL(29, 30, 0x2, 5000, 75000),
> > > > > +       PIN_RSEL(29, 30, 0x3, 4000, 5000),
> > > > > +       PIN_RSEL(29, 30, 0x4, 3000, 75000),
> > > > > +       PIN_RSEL(29, 30, 0x5, 2000, 5000),
> > > > > +       PIN_RSEL(29, 30, 0x6, 1500, 75000),
> > > > > +       PIN_RSEL(29, 30, 0x7, 1000, 5000),
> > > > > +       PIN_RSEL(34, 35, 0x0, 75000, 75000),
> > > > > +       PIN_RSEL(34, 35, 0x1, 10000, 5000),
> > > > > +       PIN_RSEL(34, 35, 0x2, 5000, 75000),
> > > > > +       PIN_RSEL(34, 35, 0x3, 4000, 5000),
> > > > > +       PIN_RSEL(34, 35, 0x4, 3000, 75000),
> > > > > +       PIN_RSEL(34, 35, 0x5, 2000, 5000),
> > > > > +       PIN_RSEL(34, 35, 0x6, 1500, 75000),
> > > > > +       PIN_RSEL(34, 35, 0x7, 1000, 5000),
> > > > > +       PIN_RSEL(44, 45, 0x0, 75000, 75000),
> > > > > +       PIN_RSEL(44, 45, 0x1, 10000, 5000),
> > > > > +       PIN_RSEL(44, 45, 0x2, 5000, 75000),
> > > > > +       PIN_RSEL(44, 45, 0x3, 4000, 5000),
> > > > > +       PIN_RSEL(44, 45, 0x4, 3000, 75000),
> > > > > +       PIN_RSEL(44, 45, 0x5, 2000, 5000),
> > > > > +       PIN_RSEL(44, 45, 0x6, 1500, 75000),
> > > > > +       PIN_RSEL(44, 45, 0x7, 1000, 5000),
> > > > > +};
> > > > > +
> > > > > +static const unsigned int mt8195_pull_type[] = {
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 0 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE /*
> > > > > 1 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 2 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE /*
> > > > > 3 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 4 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE /*
> > > > > 5 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 6 */, MTK_PULL_PU_PD_TYPE /* 7
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 8 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 9 */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 10 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 11 */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 12 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 13 */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 14 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 15 */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 16 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 17 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 18 */, MTK_PULL_PU_PD_TYPE /* 19
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 20 */, MTK_PULL_PU_PD_TYPE /* 21
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 22 */, MTK_PULL_PU_PD_TYPE /* 23
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 24 */, MTK_PULL_PU_PD_TYPE /* 25
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 26 */, MTK_PULL_PU_PD_TYPE /* 27
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 28 */, MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /*
> > > > > 29 */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 30 */, MTK_PULL_PU_PD_TYPE
> > > > > /*
> > > > > 31 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 32 */, MTK_PULL_PU_PD_TYPE /* 33
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 34 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 35 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 36 */, MTK_PULL_PU_PD_TYPE /* 37
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 38 */, MTK_PULL_PU_PD_TYPE /* 39
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 40 */, MTK_PULL_PU_PD_TYPE /* 41
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 42 */, MTK_PULL_PU_PD_TYPE /* 43
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_RSEL_TYPE /* 44 */,
> > > > > MTK_PULL_PU_PD_RSEL_TYPE
> > > > > /* 45 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 46 */, MTK_PULL_PU_PD_TYPE /* 47
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 48 */, MTK_PULL_PU_PD_TYPE /* 49
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 50 */, MTK_PULL_PU_PD_TYPE /* 51
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 52 */, MTK_PULL_PU_PD_TYPE /* 53
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 54 */, MTK_PULL_PU_PD_TYPE /* 55
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 56 */, MTK_PULL_PU_PD_TYPE /* 57
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 58 */, MTK_PULL_PU_PD_TYPE /* 59
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 60 */, MTK_PULL_PU_PD_TYPE /* 61
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 62 */, MTK_PULL_PU_PD_TYPE /* 63
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 64 */, MTK_PULL_PU_PD_TYPE /* 65
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 66 */, MTK_PULL_PU_PD_TYPE /* 67
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 68 */, MTK_PULL_PU_PD_TYPE /* 69
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 70 */, MTK_PULL_PU_PD_TYPE /* 71
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 72 */, MTK_PULL_PU_PD_TYPE /* 73
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 74 */, MTK_PULL_PU_PD_TYPE /* 75
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 76 */, MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 77
> > > > > */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 78 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 79 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 80 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 81 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 82 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 83 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 84 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 85 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 86 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 87 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 88 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 89 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 90 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 91 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 92 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 93 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 94 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 95 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 96 */, MTK_PULL_PU_PD_TYPE
> > > > > /* 97
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 98 */, MTK_PULL_PU_PD_TYPE /* 99
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 100 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 101
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 102 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 103
> > > > > */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 104 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 105 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 106 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 107 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 108 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 109
> > > > > */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 110 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 111 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 112 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 113 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 114 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 115 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 116 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 117 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 118 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 119 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 120 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 121 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 122 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 123 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 124 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 125 */,
> > > > > +       MTK_PULL_PUPD_R1R0_TYPE /* 126 */,
> > > > > MTK_PULL_PUPD_R1R0_TYPE
> > > > > /* 127 */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 128 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 129
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 130 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 131
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 132 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 133
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 134 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 135
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 136 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 137
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 138 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 139
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 140 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 141
> > > > > */,
> > > > > +       MTK_PULL_PU_PD_TYPE /* 142 */, MTK_PULL_PU_PD_TYPE /*
> > > > > 143
> > > > > */,
> > > > > +};
> > > > > +
> > > > >  static const struct mtk_pin_reg_calc
> > > > > mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
> > > > >         [PINCTRL_PIN_REG_MODE] =
> > > > > MTK_RANGE(mt8195_pin_mode_range),
> > > > >         [PINCTRL_PIN_REG_DIR] =
> > > > > MTK_RANGE(mt8195_pin_dir_range),
> > > > > @@ -793,6 +922,7 @@ static const struct mtk_pin_reg_calc
> > > > > mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
> > > > >         [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
> > > > >         [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
> > > > >         [PINCTRL_PIN_REG_DRV_ADV] =
> > > > > MTK_RANGE(mt8195_pin_drv_adv_range),
> > > > > +       [PINCTRL_PIN_REG_RSEL] =
> > > > > MTK_RANGE(mt8195_pin_rsel_range),
> > > > >  };
> > > > >
> > > > >  static const char * const mt8195_pinctrl_register_base_names[]
> > > > > = {
> > > > > @@ -817,6 +947,9 @@ static const struct mtk_pin_soc mt8195_data
> > > > > = {
> > > > >         .gpio_m = 0,
> > > > >         .base_names = mt8195_pinctrl_register_base_names,
> > > > >         .nbase_names =
> > > > > ARRAY_SIZE(mt8195_pinctrl_register_base_names),
> > > > > +       .pull_type = mt8195_pull_type,
> > > > > +       .pin_rsel = mt8195_pin_rsel_val_range,
> > > > > +       .npin_rsel = ARRAY_SIZE(mt8195_pin_rsel_val_range),
> > > > >         .bias_set_combo = mtk_pinconf_bias_set_combo,
> > > > >         .bias_get_combo = mtk_pinconf_bias_get_combo,
> > > > >         .drive_set = mtk_pinconf_drive_set_rev1,
> > > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > > index 5b3b048725cc..b6a89d41f040 100644
> > > > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > > @@ -641,6 +641,9 @@ static int
> > > > > mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
> > > > >         } else if (arg == MTK_PUPD_SET_R1R0_11) {
> > > > >                 r0 = 1;
> > > > >                 r1 = 1;
> > > > > +       } else if (arg == MTK_ENABLE) {
> > > > > +               r0 = 1;
> > > > > +               r1 = 0;
> > > >
> > > > This change does not seem related. This should be in a separate
> > > > patch
> > > > and why and what this change is should be described in the commit
> > > > log.
> > > > I assume this is to support "bias-pull-up" or "bias-pull-down"
> > > > without
> > > > arguments on pins using R1R0?
> > >
> > > we will separate it in next version.
> > > some users want only pull up/down, they don't care about the
> > > resistance
> > > value. So we support the case which only use "bias-pull-up" or
> > > "bias-
> > > pull-down" without arguments on pins using R1R0.
> >
> > I see. This should be added as a separate patch before the RSEL stuff
> > then. That way it would also be easier to backport in case it is
> > needed.
> >
> > > >
> > > > >         } else {
> > > > >                 err = -EINVAL;
> > > > >                 goto out;
> > > > > @@ -661,6 +664,75 @@ static int
> > > > > mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
> > > > >         return err;
> > > > >  }
> > > > >
> > > > > +static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
> > > > > +                                 const struct mtk_pin_desc
> > > > > *desc,
> > > > > +                                 u32 pullup, u32 arg, u32
> > > > > *rsel_val)
> > > > > +{
> > > > > +       const struct mtk_pin_rsel *rsel;
> > > > > +       int check;
> > > > > +       bool found = false;
> > > > > +
> > > > > +       rsel = hw->soc->pin_rsel;
> > > > > +
> > > > > +       for (check = 0; check <= hw->soc->npin_rsel - 1;
> > > > > check++) {
> > > > > +               if (desc->number >= rsel[check].s_pin &&
> > > > > +                   desc->number <= rsel[check].e_pin) {
> > > > > +                       if (pullup) {
> > > > > +                               if (rsel[check].up_rsel == arg)
> > > > > {
> > > > > +                                       found = true;
> > > > > +                                       *rsel_val =
> > > > > rsel[check].rsel_index;
> > > > > +                                       break;
> > > > > +                               }
> > > > > +                       } else {
> > > > > +                               if (rsel[check].down_rsel ==
> > > > > arg) {
> > > > > +                                       found = true;
> > > > > +                                       *rsel_val =
> > > > > rsel[check].rsel_index;
> > > > > +                                       break;
> > > > > +                               }
> > > > > +                       }
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       if (!found) {
> > > > > +               dev_err(hw->dev, "Not support rsel value %d Ohm
> > > > > for
> > > > > pin = %d (%s)\n",
> > > > > +                       arg, desc->number, desc->name);
> > > > > +               return -EOPNOTSUPP;
> > > >
> > > > I believe ENOTSUPP is the correct one. EOPNOTSUPP seems to be
> > > > network
> > > > related.
> > > >
> > >
> > > if we change it as "ENOTSUPP", it will report warning"ENOTSUPP is
> > > not
> > > SUSV4 error code, prefer EOPNOTSUP" when checking patch.
> >
> > The context surrounding this warning seems to be that ENOTSUPP is
> > hard
> > for userspace to understand. AFAIK the return code here does not get
> > passed to userspace? And the pinctrl core does check for EINVAL or
> > ENOTSUPP, so I think this is a valid use case.
> >
> > Linus?
> >
>
> Hi Linus,
>
> Do you have some suggestion for the warning issue?
>
> Thanks
>
> > > > I also think it would make sense to differentiate between the pin
> > > > not
> > > > supporting RSEL (return -ENOTSUPP) vs supporting RSEL but a
> > > > resistor
> > > > value not in the table was requested (return -EINVAL). This might
> > > > be
> > > > easier to do with the two-table design I mentioned.
> > >
> > > It only support resistor value on the patch on mt8195. we think we
> > > need
> > > only maintain one-table design.
> >
> > OK. I think there's a possibility that some corner case might happen.
> > I guess we'll deal with them if they occur.
> >
> > > >
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
> > > > > +                                    const struct mtk_pin_desc
> > > > > *desc,
> > > > > +                                    u32 pullup, u32 arg)
> > > > > +{
> > > > > +       int err, rsel_val;
> > > > > +
> > > > > +       if (hw->soc->pin_rsel) {
> > > > > +               /* find pin rsel_index from pin_rsel array*/
> > > > > +               err = mtk_hw_pin_rsel_lookup(hw, desc, pullup,
> > > > > arg,
> > > > > &rsel_val);
> > > > > +               if (err)
> > > > > +                       goto out;
> > > > > +       } else {
> > > > > +               if (arg < MTK_PULL_SET_RSEL_000 ||
> > > > > +                   arg > MTK_PULL_SET_RSEL_111) {
> > > > > +                       err = -EINVAL;
> > > > > +                       goto out;
> > > > > +               }
> > > > > +
> > > > > +               rsel_val -= MTK_PULL_SET_RSEL_000;
> > > > > +       }
> > > >
> > > > This is not structured correctly. Think about this: on a chip,
> > > > say
> > > > MT8195,
> > > > which has hw->soc->pin_rsel defined, but the device tree writer
> > > > chose
> > > > to use the macros instead of SI unit values. This is exactly the
> > > > scenario
> > > > you discussed privately with me.
> > > >
> > > > This also fails the case where bias-pull-{up,down} is specified
> > > > without
> > > > an argument, in which case arg == 1. This does seem to be covered
> > > > by
> > > > falling back to just PU/PD, but it's not exactly obvious,
> > > > especially
> > > > since we are skipping mtk_pinconf_bias_set_pu_pd() just below.
> > > >
> > > > So you actually need to check for the magic values first, and if
> > > > arg
> > > > doesn't match any of them, assume an SI unit argument and try to
> > > > do
> > > > a lookup.
> > > >
> > >
> > > one very important point of upstream is keeping backward
> > > compatibility,
> > > since almost all customers of other MTK platforms does not care
> > > about
> > > resistor values so we leave user to choose MTK_PULL_SET_RSEL_XXX
> > > without necessity to know resistor value.
> >
> > I'm not sure about the connection to backward compatibility here,
> > given
> > that you are just introducing support for RSEL.
> >
> > > Our policy is making most customers/users convenient.
> > > Encourage of using SI unit is not in concern.
> > >
> > > For mt8195, we choose "hw->soc->pin_rsel", so it can support SI
> > > unit.
> >
> > Regarding my concern, there are a lot of moving pieces here, so let's
> > see
> > how the next revision turns out and if this is still an issue.
> >
> > > > > +
> > > > > +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL,
> > > > > rsel_val);
> > > > > +       if (err)
> > > > > +               goto out;
> > > > > +
> > > > > +       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup,
> > > > > MTK_ENABLE);
> > > > > +
> > > > > +out:
> > > > > +       return err;
> > > > > +}
> > > > > +
> > > > >  static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
> > > > >                                 const struct mtk_pin_desc
> > > > > *desc,
> > > > >                                 u32 *pullup, u32 *enable)
> > > > > @@ -742,44 +814,117 @@ static int
> > > > > mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
> > > >
> > > > This hunk is somewhat whacky. I assume it's because you also
> > > > fixed up
> > > > the indentation for mtk_pinconf_bias_set_combo(). While nice to
> > > > do,
> > > > in this case it actually works against having an easy to read
> > > > patch.
> > > >
> > >
> > > yes, it's because to fix up
> > > the indentation for mtk_pinconf_bias_set_combo().
> >
> > I suggest moving that to a separate patch. While whitespace changes
> > are
> > sometimes frowned upon, I think this is OK given that it would
> > improve
> > readability of the patches following it. You should mention that in
> > the
> > commit message to justify the change.
> >
> > > > >         return err;
> > > > >  }
> > > > >
> > > > > -int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> > > > > -                               const struct mtk_pin_desc
> > > > > *desc,
> > > > > -                               u32 pullup, u32 arg)
> > > > > +static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
> > > > > +                                    const struct mtk_pin_desc
> > > > > *desc,
> > > > > +                                    u32 *pullup, u32 *enable)
> > > > >  {
> > > > > -       int err;
> > > > > +       int pu, pd, rsel, err;
> > > > >
> > > > > -       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup,
> > > > > arg);
> > > > > -       if (!err)
> > > > > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL,
> > > > > &rsel);
> > > > > +       if (err)
> > > > >                 goto out;
> > > > >
> > > > > -       err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
> > > > > pullup,
> > > > > arg);
> > > > > -       if (!err)
> > > > > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU,
> > > > > &pu);
> > > > > +       if (err)
> > > > >                 goto out;
> > > > >
> > > > > -       err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup,
> > > > > arg);
> > > > > +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD,
> > > > > &pd);
> > > >
> > > > Maybe this could reuse mtk_pinconf_bias_get_pu_pd(), much like on
> > > > the
> > > > `set`
> > > > side?
> > > >
> > >
> > > we will try to reuse mtk_pinconf_bias_get_pu_pd().
> > >
> > > > > +
> > > > > +       if (pu == 0 && pd == 0) {
> > > > > +               *pullup = 0;
> > > > > +               *enable = MTK_DISABLE;
> > > > > +       } else if (pu == 1 && pd == 0) {
> > > > > +               *pullup = 1;
> > > > > +               *enable = rsel + MTK_PULL_SET_RSEL_000;
> > > > > +       } else if (pu == 0 && pd == 1) {
> > > > > +               *pullup = 0;
> > > > > +               *enable = rsel + MTK_PULL_SET_RSEL_000;
> > > > > +       } else {
> > > > > +               err = -EINVAL;
> > > > > +               goto out;
> > > > > +       }
> > > > >
> > > > >  out:
> > > > >         return err;
> > > > >  }
> > > > > +
> > > > > +int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> > > > > +                              const struct mtk_pin_desc *desc,
> > > > > +                              u32 pullup, u32 arg)
> > > > > +{
> > > > > +       int err = -EOPNOTSUPP;
> > > > > +       bool try_all_type;
> > > > > +
> > > > > +       try_all_type = hw->soc->pull_type ? false : true;
> > > >
> > > > Using ternary ops is discouraged. Maybe this could be structured
> > > > like:
> > > >
> > > >     u32 pull_type;
> > > >
> > > >     if (hw->soc->pull_type)
> > > >             pull_type = hw->soc->pull_type[desc->number];
> > > >     else
> > > >             pull_type = MTK_PULL_TYPE_MASK;
> > > >
> > > > That way you don't need to test `try_all_type` every time.
> > >
> > > we will try to change it in next version.
> > >
> > > >
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_RSEL_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_set_rsel(hw, desc,
> > > > > pullup,
> > > > > arg);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PU_PD_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_set_pu_pd(hw, desc,
> > > > > pullup,
> > > > > arg);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PULLSEL_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_set_pullsel_pullen(hw,
> > > > > desc,
> > > > > +                                                         pullu
> > > > > p,
> > > > > arg);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PUPD_R1R0_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc,
> > > > > pullup, arg);
> > > > > +               if (err)
> > > > > +                       dev_err(hw->dev, "Invalid pull
> > > > > argument\n");
> > > >
> > > > The "if (err)" could be moved outside the upper "if" block. That
> > > > way
> > > > the code flow looks more consistent, plus we get an error message
> > > > regardless of the pull type supported.
> > >
> > > we will move "if (err)" outside the upper "if" block in the next
> > > version.
> > > >
> > > > > +       }
> > > > > +
> > > > > +       return err;
> > > > > +}
> > > > >  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> > > > >
> > > > >  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> > > > >                               const struct mtk_pin_desc *desc,
> > > > >                               u32 *pullup, u32 *enable)
> > > > >  {
> > > > > -       int err;
> > > > > +       int err = -EOPNOTSUPP;
> > > > > +       bool try_all_type;
> > > > >
> > > > > -       err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup,
> > > > > enable);
> > > > > -       if (!err)
> > > > > -               goto out;
> > > > > +       try_all_type = hw->soc->pull_type ? false : true;
> > > >
> > > > Same here.
> > > >
> > >
> > > we will try to change it in next version.
> > >
> > > > >
> > > > > -       err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
> > > > > pullup,
> > > > > enable);
> > > > > -       if (!err)
> > > > > -               goto out;
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_RSEL_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_get_rsel(hw, desc,
> > > > > pullup,
> > > > > enable);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PU_PD_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_get_pu_pd(hw, desc,
> > > > > pullup,
> > > > > enable);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > >
> > > > > -       err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup,
> > > > > enable);
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PULLSEL_TYPE)) {
> > > > > +               err = mtk_pinconf_bias_get_pullsel_pullen(hw,
> > > > > desc,
> > > > > +                                                         pullu
> > > > > p,
> > > > > enable);
> > > > > +               if (!err)
> > > > > +                       return err;
> > > > > +       }
> > > > > +
> > > > > +       if (try_all_type ||
> > > > > +           (hw->soc->pull_type[desc->number] &
> > > > > MTK_PULL_PUPD_R1R0_TYPE))
> > > > > +               err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc,
> > > > > pullup, enable);
> > > > >
> > > > > -out:
> > > > >         return err;
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> > > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > > > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > > > index a6f1bdb2083b..a3d73f153efe 100644
> > > > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > > > @@ -17,6 +17,13 @@
> > > > >  #define MTK_ENABLE     1
> > > > >  #define MTK_PULLDOWN   0
> > > > >  #define MTK_PULLUP     1
> > > > > +#define MTK_PULL_PU_PD_TYPE            BIT(0)
> > > > > +#define MTK_PULL_PULLSEL_TYPE          BIT(1)
> > > > > +#define MTK_PULL_PUPD_R1R0_TYPE                BIT(2)
> > > > > +#define MTK_PULL_RSEL_TYPE             BIT(3)
> > > > > +#define MTK_PULL_PU_PD_RSEL_TYPE       (MTK_PULL_PU_PD_TYPE \
> > > > > +                                       | MTK_PULL_RSEL_TYPE)
> > > >
> > > > MTK_PULL_RSEL_TYPE deserves a comment saying why it should not be
> > > > used
> > > > on its own.
> > > >
> > > > But since mtk_pinconf_bias_set_rsel() is already calling
> > > > mtk_pinconf_bias_set_pu_pd(), if the former function is reworked,
> > > > then
> > > > the two types don't need to be combined for the fallback
> > > > behavior.
> > > >
> > >
> > >
> > > MTK_PULL_PU_PD_RSEL_TYPE is type wihch is can be control by
> > > MTK_PULL_PU_PD_TYPE or MTK_PULL_RSEL_TYPE. so we combibe them
> > > together.
> >
> > But can RSEL be used without PU/PD? The definitions read like
> > "PU_PD_RSEL"
> > means either RSEL or PU/PD can be used, but if I understand the
> > hardware
> > correctly, RSEL by itself only selects the resistor value, but
> > doesn't
> > turn on/off the bias nor select pull up or down. So RSEL is an
> > extension
> > of PU/PD, and by itself won't have any real effect.
> >
> > Since this could be interpreted either way, a comment explaining
> > things
> > should be added to document the author's intentions.
> >
> > > > >  #define EINT_NA        U16_MAX
> > > > >  #define NO_EINT_SUPPORT        EINT_NA
> > > > > @@ -42,6 +49,14 @@
> > > > >         PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs,
> > > > > _s_bit,    \
> > > > >                        _x_bits, 32, 1)
> > > > >
> > > > > +#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl,
> > > > > _down_rsel) {  \
> > > >
> > > >                                                     ^ rsel?
> > > >
> > > > > +               .s_pin =
> > > > > _s_pin,                                        \
> > > > > +               .e_pin =
> > > > > _e_pin,                                        \
> > > > > +               .rsel_index =
> > > > > _rsel_index,                              \
> > > > > +               .up_rsel =
> > > > > _up_resl,                                    \
> > > > > +               .down_rsel =
> > > > > _down_rsel,                                \
> > > > > +       }
> > > > > +
> > > > >  /* List these attributes which could be modified for the pin
> > > > > */
> > > > >  enum {
> > > > >         PINCTRL_PIN_REG_MODE,
> > > > > @@ -67,6 +82,7 @@ enum {
> > > > >         PINCTRL_PIN_REG_DRV_E0,
> > > > >         PINCTRL_PIN_REG_DRV_E1,
> > > > >         PINCTRL_PIN_REG_DRV_ADV,
> > > > > +       PINCTRL_PIN_REG_RSEL,
> > > > >         PINCTRL_PIN_REG_MAX,
> > > > >  };
> > > > >
> > > > > @@ -129,6 +145,21 @@ struct mtk_pin_field_calc {
> > > > >         u8  fixed;
> > > > >  };
> > > > >
> > > > > +/* struct mtk_pin_rsel - the structure that providing bias
> > > > > resistance selection.
> > > >
> > > >                                                ^ provides
> > >
> > > we will change it in next version.
> > >
> > >
> > > >
> > > > > + * @s_pin:             the start pin within the rsel range
> > > > > + * @e_pin:             the end pin within the rsel range
> > > > > + * @rsel_index:        the rsel bias resistance index
> > > > > + * @up_rsel:   the pullup rsel bias resistance value
> > > > > + * @down_rsel: the pulldown rsel bias resistance value
> > > > > + */
> > > > > +struct mtk_pin_rsel {
> > > > > +       u16 s_pin;
> > > > > +       u16 e_pin;
> > > > > +       u16 rsel_index;
> > > > > +       u32 up_rsel;
> > > > > +       u32 down_rsel;
> > > > > +};
> > > > > +
> > > >
> > > > If it were up to me, I would split this into two layers, one for
> > > > the
> > > > register value <-> resistor value mapping, lets call it "rsel
> > > > table",
> > > > and the other for pin <-> "rsel table" mapping.
> > > >
> > > > I assume most if not all pins that support rsel would have the
> > > > same
> > > > set
> > > > of resistor values, so that would trade a level of indirection
> > > > for
> > > > better
> > > > usage of space.
> > > >
> > > > >  /* struct mtk_pin_reg_calc - the structure that holds all
> > > > > ranges
> > > > > used to
> > > > >   *                          determine which register the pin
> > > > > would
> > > > > make use of
> > > > >   *                          for certain pin attribute.
> > > > > @@ -206,6 +237,9 @@ struct mtk_pin_soc {
> > > > >         bool                            ies_present;
> > > > >         const char * const              *base_names;
> > > > >         unsigned int                    nbase_names;
> > > > > +       const unsigned int              *pull_type;
> > > > > +       const struct mtk_pin_rsel       *pin_rsel;
> > > > > +       unsigned int                    npin_rsel;
> > > > >
> > > > >         /* Specific pinconfig operations */
> > > > >         int (*bias_disable_set)(struct mtk_pinctrl *hw,
> > > > > @@ -237,7 +271,6 @@ struct mtk_pin_soc {
> > > > >                              const struct mtk_pin_desc *desc,
> > > > > u32
> > > > > arg);
> > > > >         int (*adv_drive_get)(struct mtk_pinctrl *hw,
> > > > >                              const struct mtk_pin_desc *desc,
> > > > > u32
> > > > > *val);
> > > > > -
> > > >
> > > > Unrelated whitespace change. Please remove it.
> > >
> > > we will remove it in next version.
> > >
> > > >
> > > > >         /* Specific driver data */
> > > > >         void                            *driver_data;
> > > > >  };
> > > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > > > > b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > > > > index 85db2e4377f0..8990cfe47d72 100644
> > > > > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > > > > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > > > > @@ -577,9 +577,9 @@ static int mtk_hw_get_value_wrap(struct
> > > > > mtk_pinctrl *hw, unsigned int gpio, int
> > > > >         mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
> > > > >
> > > > >  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> > > > > -       unsigned int gpio, char *buf, unsigned int bufLen)
> > > > > +       unsigned int gpio, char *buf, unsigned int buf_len)
> > > >
> > > > Unrelated change.
> > >
> > > we will sparate it in next version.
> > >
> > > >
> > > > >  {
> > > > > -       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> > > > > +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1,
> > > > > rsel
> > > > > = -1;
> > > > >         const struct mtk_pin_desc *desc;
> > > > >
> > > > >         if (gpio >= hw->soc->npins)
> > > > > @@ -591,6 +591,8 @@ ssize_t mtk_pctrl_show_one_pin(struct
> > > > > mtk_pinctrl *hw,
> > > > >                 pinmux -= hw->soc->nfuncs;
> > > > >
> > > > >         mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> > > > > +
> > > > > +       /* Case for: R1R0 */
> > > > >         if (pullen == MTK_PUPD_SET_R1R0_00) {
> > > > >                 pullen = 0;
> > > > >                 r1 = 0;
> > > > > @@ -607,10 +609,16 @@ ssize_t mtk_pctrl_show_one_pin(struct
> > > > > mtk_pinctrl *hw,
> > > > >                 pullen = 1;
> > > > >                 r1 = 1;
> > > > >                 r0 = 1;
> > > > > -       } else if (pullen != MTK_DISABLE && pullen !=
> > > > > MTK_ENABLE) {
> > > > > -               pullen = 0;
> > > > >         }
> > > > > -       len += scnprintf(buf + len, bufLen - len,
> > > > > +
> > > > > +       /* Case for: RSEL */
> > > > > +       if (pullen >= MTK_PULL_SET_RSEL_000 &&
> > > > > +           pullen <= MTK_PULL_SET_RSEL_111) {
> > > > > +               rsel = pullen - MTK_PULL_SET_RSEL_000;
> > > > > +               pullen = 1;
> > > > > +       }
> > > > > +
> > > > > +       len += scnprintf(buf + len, buf_len - len,
> > > >
> > > > Unrelated change.
> > >
> > > it is used to get rsel debug changes
> > > >
> > > > >                         "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
> > > > >                         gpio,
> > > > >                         pinmux,
> > > > > @@ -624,10 +632,12 @@ ssize_t mtk_pctrl_show_one_pin(struct
> > > > > mtk_pinctrl *hw,
> > > > >                         pullup);
> > > > >
> > > > >         if (r1 != -1) {
> > > > > -               len += scnprintf(buf + len, bufLen - len, "
> > > > > (%1d
> > > > > %1d)\n",
> > > > > +               len += scnprintf(buf + len, buf_len - len, "
> > > > > (%1d
> > > > > %1d)\n",
> > > > >                         r1, r0);
> > > > > +       } else if (rsel != -1) {
> > > > > +               len += scnprintf(buf + len, buf_len - len, "
> > > > > (%1d)\n", rsel);
> > > > >         } else {
> > > > > -               len += scnprintf(buf + len, bufLen - len,
> > > > > "\n");
> > > > > +               len += scnprintf(buf + len, buf_len - len,
> > > > > "\n");
> > > >
> > > > Unrelated changes.
> > >
> > > it is used to get rsel debug changes
> >
> > Sorry about the confusion. The unrelated change I meant to point out
> > is actually just the "bufLen" to "buf_len" change.
> >
> >
> > Regards
> > ChenYu
> >
> >
>
> Hi ChenYu,
>
> we find that we want to print rsel value, If we not change "bufLen" to
> "buf_len". It will print warning. So we change them in the rsel patch.
> It seems that it is not suitable to separate it as another one patch.

I understand it to be a style check warning triggered by your changes
covering the same section to add rsel to the debug output (and getting
seen by checkpatch).

You can structure your patches so that you first fix the code style
in a preceding patch, with its commit message expressly stating that
you are doing the cleanup to avoid checkpatch warnings in a following
patch.

That way you clean up existing code, avoid the warning, and don't do
two things in one patch.


Regards
ChenYu

> Thanks.
>
> >
> >
> > > >
> > > > >         }
> > > > >
> > > > >         return len;
> > > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h
> > > > > b/drivers/pinctrl/mediatek/pinctrl-paris.h
> > > > > index afb7650fd25b..681267c0e1a4 100644
> > > > > --- a/drivers/pinctrl/mediatek/pinctrl-paris.h
> > > > > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
> > > > > @@ -61,7 +61,7 @@ int mtk_paris_pinctrl_probe(struct
> > > > > platform_device *pdev,
> > > > >                             const struct mtk_pin_soc *soc);
> > > > >
> > > > >  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> > > > > -       unsigned int gpio, char *buf, unsigned int bufLen);
> > > > > +       unsigned int gpio, char *buf, unsigned int buf_len);
> > > >
> > > > Unrelated change.
> > > >
> > >
> > > sparate it in next version.
> > >
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > > >
> > > > >  extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
> > > > >
> > > > > --
> > > > > 2.18.0
> > > > > _______________________________________________
> > > > > Linux-mediatek mailing list
> > > > > Linux-mediatek@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatekwe
> > > > > will
> > >
> > >
> > >
