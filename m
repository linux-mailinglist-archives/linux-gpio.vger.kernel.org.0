Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D868125D1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 02:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfECAxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 May 2019 20:53:10 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38523 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfECAxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 May 2019 20:53:10 -0400
Received: by mail-qt1-f194.google.com with SMTP id d13so4953988qth.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2019 17:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVq/ptxRQpcNDoBImsMtflPpiDxEADD8mGoV5ENJygU=;
        b=c6dGu3TEKj7g9svDOCStGyjCeqPcYYKRwURWSifIP+8gqyQCF49EtCmn9GEIMJmvZ+
         +XlleJDV98oHyazbTc1/pyV8Pq4dFtZ0dXMHf2HV25jqI1ggdC+Tm5bjGkgw5SeCL3pQ
         Lh6mBgMi6wK06jeVD64CwMDTA4fi9ClwjcUHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVq/ptxRQpcNDoBImsMtflPpiDxEADD8mGoV5ENJygU=;
        b=jLy4x/iD2YJZFJvIjIgtnV9zbI+wqvntOyUq4Ab/nLUVDmIpYaDAPvISHKikLesraX
         MTf7x0R7VXx1oMFd/u16Qk9yviP+kz5s7VTLyZM+mNUZGvZ5oVTolSXnU4/jClE5+P8D
         RJESseoL10wUOrG12CNBN4pcS7arRel+HR7x7FR/I+aMPZuAGILsjcaq08vUqArBUGLg
         YC4LWw2OV7x/MsNSersVO2PKH78gqdtQd9PKBmfbOsxjtk70P6+vXKpbFNFIzpaQK9NV
         heLEo3+uKscIcnAczx6rmlWgsWNJRMfkDeDy5nJVv65H68V6KKcHDhoBxW+JWHna3aNG
         LfeQ==
X-Gm-Message-State: APjAAAVVJAEM119MoTx6xy6CMyvO+dbKdKWo+DqGlzb/6XQWWZm3tX7t
        qGCMlIrA6CFU7uehmIRgrZAfvumHecWeswENfDlWAA==
X-Google-Smtp-Source: APXvYqyjWk4rmPJKNPpzClFQHuSGSaFCyCx4/b9+Xa9XJSK/iVmucGfYdCZ/C43Ww7mdO1NyQQxlzSgGtf4xZ3HO9bM=
X-Received: by 2002:ac8:1607:: with SMTP id p7mr6149088qtj.75.1556844788925;
 Thu, 02 May 2019 17:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190429032551.65975-1-drinkcat@chromium.org> <20190429032551.65975-2-drinkcat@chromium.org>
 <1556804888.28808.6.camel@mtksdaap41>
In-Reply-To: <1556804888.28808.6.camel@mtksdaap41>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 3 May 2019 08:52:58 +0800
Message-ID: <CANMq1KAugRiL+-bAFijEM7NngLSoOUQtN=rNV5+YYdJ12u+jVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
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

On Thu, May 2, 2019 at 9:48 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Mon, 2019-04-29 at 11:25 +0800, Nicolas Boichat wrote:
> > pinctrl variants that include pinctrl-mtk-common-v2.h (and not
> > pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
> > wake mask properly, so copy over the pm_ops to v2.
> >
> > It is not easy to merge the 2 copies (or move
> > mtk_eint_suspend/resume to mtk-eint.c), as we need to
> > dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
> > different structure definition for v1 and v2.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> > ---
> >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
> >  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 20e1c890e73b30c..7e19b5a4748eafe 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> >
> >       return 0;
> >  }
> > +
> > +static int mtk_eint_suspend(struct device *device)
> > +{
> > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > +
> > +     return mtk_eint_do_suspend(pctl->eint);
> > +}
> > +
> > +static int mtk_eint_resume(struct device *device)
> > +{
> > +     struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> > +
> > +     return mtk_eint_do_resume(pctl->eint);
> > +}
> > +
> > +const struct dev_pm_ops mtk_eint_pm_ops = {
> > +     .suspend_noirq = mtk_eint_suspend,
> > +     .resume_noirq = mtk_eint_resume,
> > +};
>
> This is identical to the one in pinctrl-mtk-common.c and will have name
> clash if both pinctrl-mtk-common.c and pinctrl-mtk-common-v2.c are
> built.
>
> It would be better if we try to merge both version into mtk-eint.c, this
> way we could also remove some global functions.

Argh, I didn't think about the name clash, you're right. I guess the
easy way is to rename this one mtk_eint_pm_ops_v2 ...

As highlighted in the commit message, it's tricky to merge the 2 sets
of functions, they look identical, but they actually work on struct
mtk_pinctrl that are defined differently (in
pinctrl-mtk-common[-v2].h), so the ->eint member is at different
addresses...

I don't really see a way around this... Unless we want to change
platform_set_drvdata(pdev, pctl); to pass another type of structure
that could be shared (but I think that'll make the code fairly
verbose, with another layer of indirection). Or just assign struct
mtk_eint to that, since that contains pctl so we could get back the
struct mtk_pinctrl from that, but that feels ugly as well...

>
> Joe.C
>
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
