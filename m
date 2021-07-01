Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1169B3B8EBA
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 10:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbhGAITw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 04:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234684AbhGAITw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 04:19:52 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3386EC0617A8
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jul 2021 01:17:22 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id i13so5589858ilu.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jul 2021 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPJEazgT8i7Ze/1+I4QL68xCucF/zfMT9D/43T7Sq7I=;
        b=eIuw41F0BAJ8wZkYA7NmWG/a8NvDrb5h9iqkfqcjmpGkl/23FMw8J7Ddj9eVatEvys
         AoP58ePyZW3f0WQGlVP7tZ+GTN1aMpG5o6+yWSvSyM6xCrylQ4c2APXO+83w5VAPBAam
         D3eJF2DxiH9OAojoqbOikr6m89a2MkLHFh8SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPJEazgT8i7Ze/1+I4QL68xCucF/zfMT9D/43T7Sq7I=;
        b=lUJ5IfSKHO+2Kz5NDMnZeL+Y3S0wEq3MpC59V3yE3RkI39UHjfA6LsCu44Bxbecig3
         PxRe35gJMi4yyl9g4Sv0bxxD7PseQdlCy8CvOYpjEJxSkNuUkzBcbres2FaisfcQfj7h
         PnBvRwAHhvaJfzSInxbhfgb77m509kjCibdtF+HCMg8c5WQ4N763sCaRwbBlp658F990
         hDB5+SwT94Q0H98bd2bL/xeBWyizXpNPQyw/x2vXUCkl5IZxNz638UJDEtDmJM0ADpvq
         /4S0+i3sDoeWY2Vz2csNkK3ym98NU4kBXArYqh0oOuMhLEsQ6XclLTh/vOqTp+KHW9xF
         fwfA==
X-Gm-Message-State: AOAM531+KFB9dZcoK+KfOxdbkDt+2MNht4iBtaygjjn9xNkzQHpHrF/+
        bksDmGjdXbBVFBQ43fKvuiqaXzl86bdTZr2Z0TlGAQ==
X-Google-Smtp-Source: ABdhPJwmnKoA/8qGsvpQQRjfODUVGXnl9M4fCr7IxwXSfSMzbjrRBsW5KWu1USnvrPEASRrj8N2+BmSLssdrm+61XM8=
X-Received: by 2002:a92:7b07:: with SMTP id w7mr29093529ilc.308.1625127441220;
 Thu, 01 Jul 2021 01:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210701065439.2527790-1-hsinyi@chromium.org> <CAGXv+5GNkqHOxv9zXoa3yLh5_FXGUARqXd82W00CBTnHS_BFPw@mail.gmail.com>
In-Reply-To: <CAGXv+5GNkqHOxv9zXoa3yLh5_FXGUARqXd82W00CBTnHS_BFPw@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 1 Jul 2021 16:16:55 +0800
Message-ID: <CAJMQK-gsJRwBGg7DBwWbozpmj-oZ1RsETQtwarRpeFkk2qjGJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback behavior for bias_set_combo
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        zhiyong.tao@mediatek.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-gpio@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 1, 2021 at 3:21 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Jul 1, 2021 at 2:55 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Some pin doesn't support PUPD register, if it fails and fallbacks with
> > bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> > modify the PUPD pin again.
> >
> > Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> > bias_set or bias_set_rev1 for this fallback case.
> >
> > Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 5b3b048725cc8..0cdff487836fa 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -926,9 +926,12 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >                         if (err)
> >                                 return err;
> >                 } else if (hw->soc->bias_set_combo) {
> > -                       err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
> > -                       if (err)
> > -                               return err;
> > +                       err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
> > +                       if (err) {
> > +                               err = mtk_pinconf_bias_set(hw, desc, pullup);
> > +                               if (err)
> > +                                       return err;
>
> You don't need to nest this. If mtk_pinconf_bias_set_rev1() succeeds,
> err would be 0 and the following if blocks would all be skipped. So:
>
> err = mtk_pinconf_bias_set_rev1();
> if (err)
>         err = mtk_pinconf_bias_set();
> if (err)
>         return err;
>
> Moreover, maybe you should rework the test for hw->soc->bias_set_combo,
> as it is no longer relevant to the code within the if block?
>

Thanks for the comments. It's addressed in v2.

We can try PU/PD and PULLSEL/PULLEN even for pins that don't support
them (eg. mt6797). They will return -ENOTSUPP in
mtk_hw_pin_field_lookup() so won't break current testing logic.

>
> ChenYu
>
> > +                       }
> >                 } else {
> >                         return -ENOTSUPP;
> >                 }
> > --
> > 2.32.0.93.g670b81a890-goog
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
