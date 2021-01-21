Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121AA2FE9B8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 13:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbhAUMON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 07:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730528AbhAUMOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 07:14:08 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA80CC061757
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:13:27 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id e15so917166vsa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74gw7o+OO7Q7aDvPtMEjR/zc2dSGvqCTFDo3Lw0ey7o=;
        b=ZxaoFgCOKpzQNF9P9CAbJRTQX52OYbGya3+y8gRNe7u3+DF/A+gPmS64giuGrYBJCL
         REfPrGABoR1BJKnj2FvpuiJLsahf5ZRb1X5tJe55Ohi+ZQQ34uLvkTI9m2Ro3YEubJPj
         7QKAP1ZQR/5oFIqTwHAvfGJlKfm5dBCwcLe9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74gw7o+OO7Q7aDvPtMEjR/zc2dSGvqCTFDo3Lw0ey7o=;
        b=soZc4kQQMSbemuwGYA7L2RAOfSfFme7aB0p77OmqYxNEC4SrUhrPxgC0RjCTde7+zR
         THNFBuHp2OaN1QsDKpRyUHKWDFKunmpsg/UZg6ONBU0swPi/UhD6lNwY3Zt8Z2GPd7Ie
         JNHQbpO7ybyfkAFCFFqPsxDaRGrbiM8ufaKC4Nvx6w7e8+N/TmXbGBJP2TodDwGKUJPq
         b1gRHdP5yKSgB2G4ZkStgLCznezvZU45OpQaQ5RRAq7m0rYb7QnfoUD1wtl/PS5du+us
         ZNmyG6A4/19ZzlJB0jvH+q3RQWOpvTgE8yAPUF6SqTdvFUtbOyk5DzRo+8eWX4Bx5/dd
         qUDg==
X-Gm-Message-State: AOAM530XXae8nBlcvPW0pKkunG2e7YbPlXqdghKIIESGtiP8VcM+8QgC
        RyyEa3iLZtj4oAFqLGZGDDe508A0oc3dotwddJTqXg==
X-Google-Smtp-Source: ABdhPJymJABAcGavKrbK4gC0YLY9q1kE0CAv498eEeQAGOTIl5L7HsgWnpAyU/aJ7z/O7SDmoNRUPLQWMlGnlmW3E4w=
X-Received: by 2002:a05:6102:34f:: with SMTP id e15mr10011997vsa.21.1611231207046;
 Thu, 21 Jan 2021 04:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20210121075149.1310-1-hailong.fan@mediatek.com>
 <CANMq1KBqKUofLaM+OEaTq6PSeYomNSLvn65c+Wyi1cKsLDNboQ@mail.gmail.com> <1611230975.2493.17.camel@mhfsdcap03>
In-Reply-To: <1611230975.2493.17.camel@mhfsdcap03>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 21 Jan 2021 20:13:16 +0800
Message-ID: <CANMq1KCXrEGrNrOwivrchXyawzKySVzQoxA1goYC-eh-auNFCA@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: mediatek: Fix trigger type setting follow
 for unexpected interrupt
To:     mtk15103 <hailong.fan@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>, youlin.pei@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Chen-Tsung Hsieh <chentsung@chromium.org>,
        gtk_pangao@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 8:09 PM mtk15103 <hailong.fan@mediatek.com> wrote:
>
> On Thu, 2021-01-21 at 16:55 +0800, Nicolas Boichat wrote:
> > On Thu, Jan 21, 2021 at 3:52 PM Hailong Fan <hailong.fan@mediatek.com> wrote:
> > >
> > > When flipping the polarity will be generated interrupt under certain
> > > circumstances, but GPIO external signal has not changed.
> > > Then, mask the interrupt before polarity setting, and clear the
> > > unexpected interrupt after trigger type setting completed.
> > >
> > > Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> > > ---
> > > Resend since some server reject.
> > > ---
> > >  drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > > index 22736f60c16c..3acda6bb401e 100644
> > > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > > @@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
> > >  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > >  {
> > >         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> > > +       unsigned int unmask;
> >
> > bool?
> Yes,thanks.
> >
> > >         u32 mask = BIT(d->hwirq & 0x1f);
> > >         void __iomem *reg;
> > >
> > > @@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > >         else
> > >                 eint->dual_edge[d->hwirq] = 0;
> > >
> > > +       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> > > +               mtk_eint_mask(d);
> > > +               unmask = 1;
> > > +       } else {
> > > +               unmask = 0;
> > > +       }
> > > +
> > >         if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
> > >                 reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
> > >                 writel(mask, reg);
> > > @@ -189,8 +197,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
> > >                 writel(mask, reg);
> > >         }
> > >
> > > -       if (eint->dual_edge[d->hwirq])
> > > -               mtk_eint_flip_edge(eint, d->hwirq);
> >
> > Why are you dropping this? Aren't we at risk to miss the first edge
> > after mtk_eint_set_type is called?
> mtk_eint_unmask() will do it.
> If unmask != 1, user need to call mtk_eint_unmask() to enable the
> interrupt before use it, thanks.

Makes sense, I just have one more worry:
https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek/mtk-eint.c#L122

mtk_eint_unmask unmasks the interrupt _before_ the edge is flipped,
could this cause a spurious interrupt? On any unmask operation -- not
just on mtk_eint_set_type (so this is technically another problem,
that should be fixed as a separate patch)

> > > +       mtk_eint_ack(d);
> > > +       if (unmask == 1)
> >
> > Just `if (unmask)`
> Yes,thanks.
> > > +               mtk_eint_unmask(d);
> > >
> > >         return 0;
> > >  }
> > > --
> > > 2.18.0
>
