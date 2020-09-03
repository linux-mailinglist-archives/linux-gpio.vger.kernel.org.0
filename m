Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FEE25BBD8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 09:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgICHlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 03:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgICHlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 03:41:47 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A88C061244;
        Thu,  3 Sep 2020 00:41:45 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t4so1671763iln.1;
        Thu, 03 Sep 2020 00:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CIADU2SGu37VuCHKz6d1E1PsPEKQc7xCc3sLi9A42/E=;
        b=FngE6bFBUKDj9tP3egcx0spkVyOqlh4ENFgUCTfcVwGmiZgwu0q02sceL1B9EZtaUC
         jU51K4eP32s5BB/1UAtGT7bOUyPSa+yLLVsdb49GXmy1mkPzDURHqZo1I7/uXXnfLVrA
         yE+xsj2n5T/AtWYlw1s/+kvHWPvv4gKVNn3MLtxMx1/OCvecEGuMk3hvygYA/C+2JhPq
         x5naMed3dEoPLDS5rrNsguWlo6Z6ssi/KFwR8njpVY74sZfmiZdNhgz590AQ2Q0NxvwQ
         tw2IpIwutYRrg7wYCDAMe+soTf1EDiMjMwM71fjQIi+eng/zJQWD4zDYmGpsfcADsu1D
         f5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CIADU2SGu37VuCHKz6d1E1PsPEKQc7xCc3sLi9A42/E=;
        b=UaVS+b8W8SWotq/RkdesRSnEdnZeCzvdSNJMILgLXYARXpaml/hE4o2ptUx6+vcV79
         WlHPcNNh06VLeJjyXTiMTB0nivaLvi07x6BA1v7gDlED6orkBcKP5rWWZisiiRWXVMIY
         PXd1WkFBjVXT28f0ZI7II1bTdf/reQprahh1RuiZYJ7ZOsVlQbAqB6Qss56G0p05S9jX
         rScg2WoOBYDYNik+cbJIpttM4zcHqWrkaJHQxDyUBRb4yAGAqVJM59rFUctaLrfRq23U
         wx3itKoY1DtCS66nrp7RX+z6NZa9oDH6t5oTqAE4iMOZjXnr5jYdc8TgUsvcxsTx6f+I
         ZWLg==
X-Gm-Message-State: AOAM530Uirj6/ZheEOLJqAnSD5akTgHwqpqZ0K6elIirh+EepoX8Meya
        ROufvrG2dIl5Xv+bEt0zzGTahYfUmpNr/u/dVm0=
X-Google-Smtp-Source: ABdhPJyJMq1fmS5eCzv5hMgu/lfU/CsuPAw60H8QxVdAZGw1pW87cOeyuQoxj3fs69yxpBEHmj39txImAnhERLjOIEY=
X-Received: by 2002:a92:dd8c:: with SMTP id g12mr1980528iln.184.1599118905190;
 Thu, 03 Sep 2020 00:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
 <1598858073-5285-2-git-send-email-dillon.minfei@gmail.com> <CAMpxmJW9iMVJgm6czSz5fPpRVHFnnp4=6x_7fTcJxGL1f10RGA@mail.gmail.com>
In-Reply-To: <CAMpxmJW9iMVJgm6czSz5fPpRVHFnnp4=6x_7fTcJxGL1f10RGA@mail.gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Thu, 3 Sep 2020 15:41:07 +0800
Message-ID: <CAL9mu0Ki7fkaydaBR2t==jgn5k6r6T_Xc8NykKxnhwGgGqyCjg@mail.gmail.com>
Subject: Re: [PATCH: 1/2] gpio: tc35894: fix up tc35894 interrupt configuration
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

Thanks for reviewing.

On Tue, Sep 1, 2020 at 11:46 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Aug 31, 2020 at 9:14 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > The offset of regmap is incorrect, j * 8 is move to the
> > wrong register.
> >
> > for example:
> >
> > asume i = 0, j = 1. we want to set KPY5 as interrupt
> > falling edge mode, regmap[0][1] should be TC3589x_GPIOIBE1 0xcd
> > but, regmap[i] + j * 8 = TC3589x_GPIOIBE0 + 8 ,point to 0xd4,
> > this is TC3589x_GPIOIE2 not TC3589x_GPIOIBE1.
> >
> > Fixes: c103de240439 ("gpio: reorganize drivers")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  drivers/gpio/gpio-tc3589x.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
> > index 58b0da9eb76f..ea3f68a28fea 100644
> > --- a/drivers/gpio/gpio-tc3589x.c
> > +++ b/drivers/gpio/gpio-tc3589x.c
> > @@ -212,7 +212,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
> >                                 continue;
> >
> >                         tc3589x_gpio->oldregs[i][j] = new;
> > -                       tc3589x_reg_write(tc3589x, regmap[i] + j * 8, new);
> > +                       tc3589x_reg_write(tc3589x, regmap[i] + j, new);
> >                 }
> >         }
> >
> > --
> > 2.7.4
> >
>
> I suppose this patch may be correct but I don't see how commit
> c103de240439 ("gpio: reorganize drivers") could be the culprit. It's
> been like this since the original driver implementation from commit
> d88b25be3584 ("gpio: Add TC35892 GPIO driver").

Sorry, i didn't check the original code file, yes, I should use this fixes tag.

>
> It's been over a decade since this driver was merged and nobody ever
> reported this. Either nobody ever used the GPIO module with interrupts
> (unless the bug's impact is not significant) for this chip or this is
> a quirk of some specific model you're using. Could you double-check
> this?

I used tc35894xbg, and searched https://toshiba.semicon-storage.com/ ,
but no tc35892 found, it seems was replaced by tc35894x series.
from the git history Linus Walleij has some submittes about the interrupt part.
maybe he can give us some feedback.

post tc35894 datasheet here for you
https://toshiba.semicon-storage.com/info/docget.jsp?did=30200&prodName=TC35894XBG

>
> Bartosz
