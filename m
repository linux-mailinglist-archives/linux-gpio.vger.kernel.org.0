Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01975340560
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 13:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhCRMUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 08:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCRMTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 08:19:44 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55769C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 05:19:44 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id s21so2833426pjq.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aDG9Bii2Xas8rDgw+X9mgW07mvKzyg5CgIFoPZ/13b0=;
        b=b662D+RxmviRXZPQq9s3lruIsESnW8mg2j4TcKlwZ0IibL71GLt8QiL9CaLqsDK+9w
         MCcF9tFxB9iVnz2n1bp1ofvxWtmHvUXFwJA6oouMYqB7KZWT1cN/NkWVPq1UnduQ82ML
         je+HHz7vpg807luAA7LaEy3P57l0MNA4B8QiWzUF7o0627+eI4f12GtfDEG7eGeEhY8p
         g6CE4go5OFE+m0CLR2805rUw5L33HHYoAGHkUMoBGMdmW35Ij4oy2t+T6ijf6kbBNMoo
         l12Y23UDZbzbk2KcUaRd1x6HqblYoBOiEcfsShrnTUoNf8KeHvTBpCwcM4b3b0vilePM
         AmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aDG9Bii2Xas8rDgw+X9mgW07mvKzyg5CgIFoPZ/13b0=;
        b=PqZHmQ/IbZVMqGcAddS38Yzp0D0ygUgK67pkBloPgIRCi8h8LP8WpsD9/cWTCrsDwN
         ZSKiMSvH1w26dqERL/vguTZaSuPqJysjUM5tkaGiFzlJUs9EcvXwsC2Vo5tjhQeMGuQ9
         EuDhHCjLXTU0tYAJyI231F0f/mree+zIjPGTJ56ctMR8dGwydAFpBrYnOyAEcZ8+jG2I
         iCO1uifuMLf8KYxcuIrArQlGEOhRCGW62aFYyKTnHt0GCwME/5pvVRjHLGVDS47TZUtH
         9aNmJy0gdjypiR1+UipQAoDJlykvyQHgfrG1XALoudr9pIi/sNYLqgwTR4pscmN88oeQ
         /mbQ==
X-Gm-Message-State: AOAM530NPmeK3itd6d6EoSdaT1RD0y4Lcwj6RowXVkk8XgzPQI88kvIC
        Hqow9ePNUaiHwojMJtuBl7hX1trc799ssxKHe9A=
X-Google-Smtp-Source: ABdhPJxM9GYht4w+jqvO6w+nO2+O25K0eRA4WEcjctozmff2u9uRvcMWaprJSSfC3Qf66NUEUXsLfIHp++9fDncLNWw=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr4212531pjr.228.1616069983743;
 Thu, 18 Mar 2021 05:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-3-alexander.sverdlin@nokia.com> <CAHp75Vd-iUzEyo5X5LtKJ+66512i5-tKC+kkpPYJwG7L2qrvdw@mail.gmail.com>
 <23bb681e-1918-e84c-58e5-c4c711f87daa@nokia.com>
In-Reply-To: <23bb681e-1918-e84c-58e5-c4c711f87daa@nokia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Mar 2021 14:19:27 +0200
Message-ID: <CAHp75VeVQ0S36oOOQApw5ZJyiOv2zwRondwiCc3uqVRmLc2DRA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 18, 2021 at 1:12 PM Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:
> On 18/03/2021 11:51, Andy Shevchenko wrote:
> > On Wednesday, March 17, 2021, Alexander A Sverdlin <alexander.sverdlin@nokia.com <mailto:alexander.sverdlin@nokia.com>> wrote:

...

> >     Existing (irq < 0) condition is always false because adev->irq has unsigned
> >     type and contains 0 in case of failed irq_of_parse_and_map(). Up to now all
> >     the mapping errors were silently ignored.
> >
> >     Seems that repairing this check would be backwards-incompatible and might
> >     break the probe() for the implementations without IRQ support. Therefore
> >     warn the user instead.

...

> >     -       if (irq < 0) {
> >     -               dev_err(&adev->dev, "invalid IRQ\n");
> >     -               return -ENODEV;
> >     -       }
> >     +       if (!irq)
> >     +               dev_warn(&adev->dev, "IRQ support disabled\n");
> >
> >
> >
> > I guess you need to preserve bailing out. Seems nobody hit this error path.
>
> Do you mean preserve "return -ENODEV;"?
> This never ever happened, because the "if" is "always false", irqs coming from irq[] cannot be
> negative.
> And there is another use-case actually: there are legal PL061 configurations without IRQs at all,
> which simply work even trying to instantiate irq chip, but as devm_gpiochip_add_data() doesn't
> fail with irq==0, this goes completely unnoticed and such a gpio bank works fine.
>
> The proper way would be not even try to instantiate any irq chip in such case.
> Let me know if I shall rework the patch this way.

Yes, please, rewrite it like
if (irq > 0) {
 ... instantiate an IRQ chip ...
} else {
 // nothing. No warning is needed (as it wasn't ever before), perhaps
just a debug message
}
--
With Best Regards,
Andy Shevchenko
