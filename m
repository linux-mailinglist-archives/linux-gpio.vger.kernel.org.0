Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA194223DA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 12:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbhJEKtp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 06:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhJEKto (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 06:49:44 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB44C06161C
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 03:47:54 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id f126so8398335vke.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ajhii6MqyMqiNy3NMVTNUWTmPZ2TONfmQBcXYc18nyc=;
        b=PpzwZjEfvQAR3wdvh4Ija1IGRc3TlM01l3CXiOjkA6gUR+9N7mXPhSJ5ZVOmjYskAI
         oGpkFxkHhENoInGxbffpGnHR9xJvRWh8r3XSDRPf958u49kHv+rPrZn01SDSdcA6zW0x
         0xt1dm14mCPA3T2tuml4XkzmLGpP4PUpDnWcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ajhii6MqyMqiNy3NMVTNUWTmPZ2TONfmQBcXYc18nyc=;
        b=lOTx+fCvxOmNAMX6ExsT77jliHjY6DewYCtAnLmCBPJMns5i058/qS23SLiSld53xX
         9gpsX56GMvLvttA9xshekkamxx6f2zxsHwLbCkHuAzAHhdq8ncgdO2FwxT2svvY/Ib/M
         iCTWZc9e3BeJ1MxvdXgnT0sNKQR26lc1ErQb+xaWPl2KIKfpr/j+Dw16Zq7RGkVJu4Es
         B8dV4soG7tUnHd2cTNcenJggGfngq6QJQthqOR/4wqtMjP0mU+Vv+GBYQZup/nmxqNQM
         JVe8Pw/D1ckJVME81Hrf/aCWMwX23SVS7Wol9aOQ816ZQf6o+t4TdI0R+zIoPkHtAhG/
         EM+w==
X-Gm-Message-State: AOAM531qWknp4C50TIFLl0l6MtNFZU7+DSWF5JfkALR6WbajXODPQ6Zs
        ykmuwhWzmRa3mvbH+MU/scuYUqAvrPHNP1QFCiMRtA==
X-Google-Smtp-Source: ABdhPJzrr1gphAURiwAOr78gd2UxAKGfYkpKe904wdrPrtgn839ZDhW9w9OyN0iTp5RtYFWzwl6zMp9ZwVYo8J/nBVs=
X-Received: by 2002:ac5:c198:: with SMTP id z24mr5801681vkb.22.1633430873517;
 Tue, 05 Oct 2021 03:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211002162000.3708238-1-daniel@0x0f.com> <CACRpkdZmhZcGXi2Xg=r1BGaf8-QLPDawY_7Kp3d-xmvHuDe0xQ@mail.gmail.com>
In-Reply-To: <CACRpkdZmhZcGXi2Xg=r1BGaf8-QLPDawY_7Kp3d-xmvHuDe0xQ@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 5 Oct 2021 19:47:42 +0900
Message-ID: <CAFr9PX=hkVu4PxEuw81=3wcM0ob5s=THXXrkwERj+WRWUEGCyw@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: Move setting the flow handler and don't set
 it at all if there is a parent domain
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 4 Oct 2021 at 07:16, Linus Walleij <linus.walleij@linaro.org> wrote:
> If Marc says this is the way to go I think it is the way to go!

To be completely transparent, moving irq_domain_set_info() is from Marc.
Not setting the handler is from me.

>
> >         kfree(parent_arg);
> > +
> > +       if (!ret) {
>
> Please just exit on error so invert this.

Ok.

> if (ret)
>   return ret;
>
> and just de-indent the below code (easier to follow)
>
> > +               /* If there is a parent domain leave the flow handler alone */
> > +               if (d->parent)
>
> Should we print an error if girq->handler is not NULL and we find
> a parent domain, like
> if (d->parent && girq->handler)
>   dev_err(dev, "parent domain and flow handler both specified\n");

I think that would help catch situations where these changes would
break stuff. I want to avoid breaking other people's stuff for my
hobby project.

However, I've noticed we can't get to the "if (d->parent)" if there is
no parent as irq_domain_alloc_irqs_parent() will return -ENOSYS if
d->parent is null.
So the logic isn't right there. I think the idea is right but now I
can't figure out what we should actually check to know whether we need
to set the handler or not.
I'm hoping Marc will chip in when he has some time. :)

Cheers,

Daniel
