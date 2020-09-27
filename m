Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D1A27A245
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 20:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgI0SH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 14:07:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgI0SH5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 27 Sep 2020 14:07:57 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F8723A31;
        Sun, 27 Sep 2020 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601230077;
        bh=vsE9X3eOgp7dHrsjtGKh2H/Hys4APfGgXPzjOy78+jo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V+f9PBYVKnfawmN5ojU0YWt7R+WuJrseSZJvMh9s+F98TeQF9x1d+dq6cq+63T0eR
         xGWZED7d1UupRbRs7p8uANEKo3fyKpqG0FFv1CNxJX/l8937FnRJIUeDMliAUp7EAY
         BhszQvEXrh70MsotsMlw2Hqx3iKpfWm3bMUAYa1s=
Received: by mail-il1-f181.google.com with SMTP id m9so2484496ila.10;
        Sun, 27 Sep 2020 11:07:56 -0700 (PDT)
X-Gm-Message-State: AOAM530mdL1OkBFVHaqfA2mn+4FzTQ1SW2oMID4DkCLiqzMozQuWlnSv
        BAzPeYTl8eZvAF9r2JOcUc41GBSnYkXSxkUQpQo=
X-Google-Smtp-Source: ABdhPJx6T9krolcK/30YgUVR5caQAXMJfm/AVPZx6YqMKU9Mlbfb3a9iooHxc2jWt3avTWAWB6bvx8FM+nioWnkZleY=
X-Received: by 2002:a92:d842:: with SMTP id h2mr7981119ilq.176.1601230076381;
 Sun, 27 Sep 2020 11:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com> <1601038258.15065.4.camel@mtkswgap22>
In-Reply-To: <1601038258.15065.4.camel@mtkswgap22>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Sun, 27 Sep 2020 11:07:45 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqOvqm+ewSxyvjuX_D=181+DUu3Lre-oG5FY=Mx8X6Qzw@mail.gmail.com>
Message-ID: <CAGp9LzqOvqm+ewSxyvjuX_D=181+DUu3Lre-oG5FY=Mx8X6Qzw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 5:51 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> Hi Sean & Linux & Matthias,
>
> Please kindly let me know your comments about this fixes patch.
> Thanks
>

Acked-by: Sean Wang <sean.wang@kernel.org>

> Regards,
> Hanks
>
>
> On Thu, 2020-08-20 at 19:22 +0800, Hanks Chen wrote:
> > check mtk_is_virt_gpio input parameter,
> > virtual gpio need to support eint mode.
> >
> > add error handler for the ko case
> > to fix this boot fail:
> > pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> > lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]
> >
> > Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> > Singed-off-by: Jie Yang <sin_jieyang@mediatek.com>
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> >
> > ---
> > Changes since v1:
> > - update Singed-off-by
> > - align with pinctrl/mediatek/pinctrl-mtk-mt*.h
> >
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index c53e2c391e32..a485d79f51a1 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> >
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> >
> > +     /* if the GPIO is not supported for eint mode */
> > +     if (desc->eint.eint_m == NO_EINT_SUPPORT)
> > +             return virt_gpio;
> > +
> >       if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
> >               virt_gpio = true;
> >
>
