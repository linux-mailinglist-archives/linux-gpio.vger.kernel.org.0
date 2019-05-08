Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C2E172B7
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 09:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfEHHkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 03:40:03 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40453 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEHHkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 03:40:03 -0400
Received: by mail-qk1-f193.google.com with SMTP id w20so244000qka.7
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kdzNGG6w8busuuDVf/UQqEgzyyAeZLA0QEhPPerzhfg=;
        b=mGDwoD4U62ey6G7SruSx83RUQNe+cXi/7VIMvqL9+ahBUlgPNQwS98dYlXxeQxQ8Bk
         IFuhOGwxWtAVuqezODZivYfjrX+e6ntlFVnvGVkxIp8xa9mms3GEcgUcVyeOzSv2/dj5
         /BZw0T/c0G6FkPHM4B0kzgTFXOIZmj9mSHFqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdzNGG6w8busuuDVf/UQqEgzyyAeZLA0QEhPPerzhfg=;
        b=HxHctukMUKG1eV/LgwefqZZx/Pndghv56kK3Y73yB8jj3SlDqQGCxtT6kcf1ESrgGt
         n3HOHEiPmM0DK1TOe7+Q8u+lwJZ+UScidFGz39QqMX/3Nlvlrzcxd1oQSzZP9tLcVYcG
         s+Ty/qpSq6IU3T2gxmLsj2Y8RqSd0FMUSVV3eTZ/WwxjMO1H7+QLWIZY1bomDuZPFbLh
         GqXe5qMl9JcZJNlsFEkIs3R96ENTyvN/zNgF1VSoRH0PRPRFTyFP1TinNZecXBRXX/Lk
         5O+VxobFLm9nK0z3ec0yoS7eX53givC2Bj9G9MVQtjUj0h18jUddRpDteF8pmUFoqgZK
         Hghg==
X-Gm-Message-State: APjAAAXB9Cl08I2Bc6uxv+KBqfsHO8HJwVg+xmWWJFwhn9M3qjb0c51G
        v8Is08sZy8E1X4xVzZxPWheoO+YNsna7G6Z7kJJANg==
X-Google-Smtp-Source: APXvYqysbcDT6bwWGV2HclOY8NZruV58WYxSqPpErYEwFdjc/fTQZKoLsn3w/8kJFVIKm/xaLb0gQ5MJd+XlaYmy6fc=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr15764186qko.288.1557301201879;
 Wed, 08 May 2019 00:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190429032551.65975-1-drinkcat@chromium.org> <20190429032551.65975-2-drinkcat@chromium.org>
 <1556804888.28808.6.camel@mtksdaap41> <CANMq1KAugRiL+-bAFijEM7NngLSoOUQtN=rNV5+YYdJ12u+jVQ@mail.gmail.com>
 <CAGp9LzqdYapagHUH1uuuHRR+j5JcphN7hhM2SyZoXQFCP8_fSw@mail.gmail.com>
In-Reply-To: <CAGp9LzqdYapagHUH1uuuHRR+j5JcphN7hhM2SyZoXQFCP8_fSw@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 May 2019 16:39:50 +0900
Message-ID: <CANMq1KCzy45RYR-8Y6zeCj+xzOk6QUJvTA8aB8LYZ7zmORmiGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
To:     Sean Wang <sean.wang@kernel.org>
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

On Sat, May 4, 2019 at 2:09 AM Sean Wang <sean.wang@kernel.org> wrote:
>
> Hi, Nicolas
>
> On Thu, May 2, 2019 at 5:53 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Thu, May 2, 2019 at 9:48 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> > >
> > > On Mon, 2019-04-29 at 11:25 +0800, Nicolas Boichat wrote:
> > > > pinctrl variants that include pinctrl-mtk-common-v2.h (and not
> > > > pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
> > > > wake mask properly, so copy over the pm_ops to v2.
> > > >
> > > > It is not easy to merge the 2 copies (or move
> > > > mtk_eint_suspend/resume to mtk-eint.c), as we need to
> > > > dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
> > > > different structure definition for v1 and v2.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > > > ---
> > > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
> > > >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
> > > >  2 files changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > index 20e1c890e73b30c..7e19b5a4748eafe 100644
> > > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > > @@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> > > >
> > > >       return 0;
> > > >  }
> > > > +
> > > > +static int mtk_eint_suspend(struct device *device)
> > > > +{
> > > > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > > > +
> > > > +     return mtk_eint_do_suspend(pctl->eint);
> > > > +}
> > > > +
> > > > +static int mtk_eint_resume(struct device *device)
> > > > +{
> > > > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > > > +
> > > > +     return mtk_eint_do_resume(pctl->eint);
> > > > +}
> > > > +
> > > > +const struct dev_pm_ops mtk_eint_pm_ops = {
> > > > +     .suspend_noirq = mtk_eint_suspend,
> > > > +     .resume_noirq = mtk_eint_resume,
> > > > +};
> > >
> > > This is identical to the one in pinctrl-mtk-common.c and will have name
> > > clash if both pinctrl-mtk-common.c and pinctrl-mtk-common-v2.c are
> > > built.
> > >
> > > It would be better if we try to merge both version into mtk-eint.c, this
> > > way we could also remove some global functions.
> >
> > Argh, I didn't think about the name clash, you're right. I guess the
> > easy way is to rename this one mtk_eint_pm_ops_v2 ...
> >
> > As highlighted in the commit message, it's tricky to merge the 2 sets
> > of functions, they look identical, but they actually work on struct
> > mtk_pinctrl that are defined differently (in
> > pinctrl-mtk-common[-v2].h), so the ->eint member is at different
> > addresses...
> >
> > I don't really see a way around this... Unless we want to change
> > platform_set_drvdata(pdev, pctl); to pass another type of structure
> > that could be shared (but I think that'll make the code fairly
> > verbose, with another layer of indirection). Or just assign struct
> > mtk_eint to that, since that contains pctl so we could get back the
> > struct mtk_pinctrl from that, but that feels ugly as well...
> >
>
> I agree on renaming would make the thing simple. but I wouldn't like
> to rename to mtk_eint_pm_ops_v2 since this would make people
> misunderstand that is mtk_eint_v2.
>
> How about renaming to mtk_paris_pinctrl_pm_ops and then place related
> logic you added into pinctrl-paris.c? Because I prefer to keep pure
> pinctrl hardware operations in pinctrl-mtk-common-v2.c, and for
> relevant to other modules (mtk eint) or others subsystem (device tree
> binding, GPIO subsytem, PM something like that) they should be moved
> to pinctrl-paris.c or pinctrl-moore.c

Sounds reasonable. I uploaded a v2 that does just that.

Note that we'd still have to duplicate this code between paris and
moore, if we wanted to implement pm_ops in moore as well, but maybe
that's ok for now.

>      Sean
>
> > >
> > > Joe.C
> > >
> > >
> > >
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
