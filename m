Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8198D132E1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 19:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfECRJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 13:09:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbfECRJE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 May 2019 13:09:04 -0400
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B71682087F;
        Fri,  3 May 2019 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556903343;
        bh=B6/MSMYbkg+WTWBm94Gih3RB7d5QYsXpBeEAwOIv+D0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DYiblBjocgSq/Lbl+6Cnzwlf09QeF+2q8IFuQwZX3/BLRsXP4Z+XvuCmgRoSCZwG9
         BVB+hH7S5ve0VvNLT7q0V2uKB9P9eBCb9gUh6VoK6y9SGwxlWhn8KIvR1Nyr9X9fiW
         3z73v9x5d5zBCOR6auE/dpxTltqebB2nIcLzY4XM=
Received: by mail-wr1-f50.google.com with SMTP id h4so8746342wre.7;
        Fri, 03 May 2019 10:09:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXvJBnQYm2p1uINlFIzYdiQ8m3w8+1revBWEz93vuZld5kueCRC
        sEi6/RD8qwRnxpUTUpQZ1MUndEEjenMjHOX68cg=
X-Google-Smtp-Source: APXvYqxUYmAOLutHuKkaO6/H+LbNDlFI1Tlxl80gA9Hwuxr9ET8QCNLanMkTbxWvc59Wz2Wn8KG7Ghk5n2dYvn1pPYw=
X-Received: by 2002:adf:f310:: with SMTP id i16mr7641713wro.291.1556903341329;
 Fri, 03 May 2019 10:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190429032551.65975-1-drinkcat@chromium.org> <20190429032551.65975-2-drinkcat@chromium.org>
 <1556804888.28808.6.camel@mtksdaap41> <CANMq1KAugRiL+-bAFijEM7NngLSoOUQtN=rNV5+YYdJ12u+jVQ@mail.gmail.com>
In-Reply-To: <CANMq1KAugRiL+-bAFijEM7NngLSoOUQtN=rNV5+YYdJ12u+jVQ@mail.gmail.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 3 May 2019 10:08:50 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqdYapagHUH1uuuHRR+j5JcphN7hhM2SyZoXQFCP8_fSw@mail.gmail.com>
Message-ID: <CAGp9LzqdYapagHUH1uuuHRR+j5JcphN7hhM2SyZoXQFCP8_fSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Nicolas

On Thu, May 2, 2019 at 5:53 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Thu, May 2, 2019 at 9:48 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> >
> > On Mon, 2019-04-29 at 11:25 +0800, Nicolas Boichat wrote:
> > > pinctrl variants that include pinctrl-mtk-common-v2.h (and not
> > > pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
> > > wake mask properly, so copy over the pm_ops to v2.
> > >
> > > It is not easy to merge the 2 copies (or move
> > > mtk_eint_suspend/resume to mtk-eint.c), as we need to
> > > dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
> > > different structure definition for v1 and v2.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > > ---
> > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
> > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > index 20e1c890e73b30c..7e19b5a4748eafe 100644
> > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > @@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> > >
> > >       return 0;
> > >  }
> > > +
> > > +static int mtk_eint_suspend(struct device *device)
> > > +{
> > > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > > +
> > > +     return mtk_eint_do_suspend(pctl->eint);
> > > +}
> > > +
> > > +static int mtk_eint_resume(struct device *device)
> > > +{
> > > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > > +
> > > +     return mtk_eint_do_resume(pctl->eint);
> > > +}
> > > +
> > > +const struct dev_pm_ops mtk_eint_pm_ops = {
> > > +     .suspend_noirq = mtk_eint_suspend,
> > > +     .resume_noirq = mtk_eint_resume,
> > > +};
> >
> > This is identical to the one in pinctrl-mtk-common.c and will have name
> > clash if both pinctrl-mtk-common.c and pinctrl-mtk-common-v2.c are
> > built.
> >
> > It would be better if we try to merge both version into mtk-eint.c, this
> > way we could also remove some global functions.
>
> Argh, I didn't think about the name clash, you're right. I guess the
> easy way is to rename this one mtk_eint_pm_ops_v2 ...
>
> As highlighted in the commit message, it's tricky to merge the 2 sets
> of functions, they look identical, but they actually work on struct
> mtk_pinctrl that are defined differently (in
> pinctrl-mtk-common[-v2].h), so the ->eint member is at different
> addresses...
>
> I don't really see a way around this... Unless we want to change
> platform_set_drvdata(pdev, pctl); to pass another type of structure
> that could be shared (but I think that'll make the code fairly
> verbose, with another layer of indirection). Or just assign struct
> mtk_eint to that, since that contains pctl so we could get back the
> struct mtk_pinctrl from that, but that feels ugly as well...
>

I agree on renaming would make the thing simple. but I wouldn't like
to rename to mtk_eint_pm_ops_v2 since this would make people
misunderstand that is mtk_eint_v2.

How about renaming to mtk_paris_pinctrl_pm_ops and then place related
logic you added into pinctrl-paris.c? Because I prefer to keep pure
pinctrl hardware operations in pinctrl-mtk-common-v2.c, and for
relevant to other modules (mtk eint) or others subsystem (device tree
binding, GPIO subsytem, PM something like that) they should be moved
to pinctrl-paris.c or pinctrl-moore.c

     Sean

> >
> > Joe.C
> >
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
