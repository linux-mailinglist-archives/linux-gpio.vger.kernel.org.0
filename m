Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A17A3187AE
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 11:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhBKKDk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 05:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhBKJ7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 04:59:38 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD016C06178B;
        Thu, 11 Feb 2021 01:58:57 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e9so3054159plh.3;
        Thu, 11 Feb 2021 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8yLOwNK06k61JVsuPj/t4DRkDw7VF6DC3KbEb5PjTQ=;
        b=Fi8jMmmXt16oxPYsGiHBscD2cBUO84ThSxG1Cxn9+lH4Xh6hWhuGgwmU+FRS8DfQvB
         Ok3wKu9nHdl6QKXkKk3q+npUPmqpDTFUeGjUJT4HqBDHRVPh6i7dRNEWy2QDOkvjQi0H
         /Eovxn7ZbMJzkQjuHoNGstiABQkF65p9CRRTj5GVWKPDF+1k4eCazd66hqOZFX7Iwosw
         oPZ3VJG8RVS5YHqOokaOinMk1JqYx87vtqrWy+PVBGm/+q2RsPixbRKwZ1lRQ+TGZqRA
         OA0HuZZWgIZclz0xEi4v9ksC/40ipOQ3andDmrOYnoJQLxFwZx5pb5h6d8GZWUCQIrY2
         l8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8yLOwNK06k61JVsuPj/t4DRkDw7VF6DC3KbEb5PjTQ=;
        b=uFezRO1iaZSsC91vZm8SFbgnKcKyUNHBRGKcJs/InpA6JLREC5uwleJsH4vWsAUMTd
         +4pNARlNXO/8ysUZJc1qwO5XQ5WD/XH49PBGEDe1x0vyIntPl72656M3c6azqfOtORYT
         yhedljQrz4l1xsAmzaiB9/VCYXNM0pOqS2l9cCpuII7gvlY9eNmOfEd2gJHq4npQyiKB
         oAs1EzQ517M+vyohB+fXs6WOWBOe4mKyVCcIkaq2TJeI08cpaUXvmLpegHSlvGMMMCfl
         jZScvJVpPA6sSxzToSA0nWxQlEoO8LD5je/FF2lYTyfjOD0PmgvjmOWBFdgwkJn9DZKJ
         lz1w==
X-Gm-Message-State: AOAM533Gn7YPbHVat1x5R/kwKCtW5eKxpEo8r1bkhGZG0TKYj0rLZs42
        mVZs1pR1BM8OZu/h5embD7kSAZJInPokMotkYJ4oXRGdWCl6cA==
X-Google-Smtp-Source: ABdhPJyf4xwKLSfFmGwFi/Ojw4dL9aSbjV3MlCCc0chfBi30eCcdMRRoFhrUzLtBCF4gis5whBTqXHqFe+rRWeFkT6I=
X-Received: by 2002:a17:902:be14:b029:e1:bec9:f4a7 with SMTP id
 r20-20020a170902be14b02900e1bec9f4a7mr7221275pls.21.1613037536770; Thu, 11
 Feb 2021 01:58:56 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com> <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com> <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
 <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com> <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
 <947bcef0d56a4d0c82729d6899394f4a@hisilicon.com> <YCP0JeEUcoPp9B/H@smile.fi.intel.com>
 <7d9c4fa854924bfc890e98da2d88ea36@hisilicon.com>
In-Reply-To: <7d9c4fa854924bfc890e98da2d88ea36@hisilicon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Feb 2021 11:58:40 +0200
Message-ID: <CAHp75VfuRT8kFxrCMZfmufVPewjmuDS2adrkQwWmRA-euaMGpw@mail.gmail.com>
Subject: Re: [Linuxarm] Re: [PATCH for next v1 0/2] gpio: few clean up patches
 to replace spin_lock_irqsave with spin_lock
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 10:42 PM Song Bao Hua (Barry Song)
<song.bao.hua@hisilicon.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > Sent: Thursday, February 11, 2021 3:57 AM
> > On Wed, Feb 10, 2021 at 11:50:45AM +0000, Song Bao Hua (Barry Song) wrote:
> > > > -----Original Message-----
> > > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > > Sent: Wednesday, February 10, 2021 11:51 PM
> > > > On Wed, Feb 10, 2021 at 5:43 AM luojiaxing <luojiaxing@huawei.com> wrote:
> > > > > On 2021/2/9 17:42, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > > Between IRQ handler A and IRQ handle A, it's no need for a SLIS.
> > > >
> > > > Right, but it's not the case in the patches you provided.
> > >
> > > The code still holds spin_lock. So if two cpus call same IRQ handler,
> > > spin_lock makes them spin; and if interrupts are threaded, spin_lock
> > > makes two threads run the same handler one by one.
> >
> > If you run on an SMP system and it happens that spin_lock_irqsave() just
> > immediately after spin_unlock(), you will get into the troubles. Am I mistaken?
>
> Hi Andy,
> Thanks for your reply.
>
> But I don't agree spin_lock_irqsave() just immediately after spin_unlock()
> could a problem on SMP.
> When the 1st cpu releases spinlock by spin_unlock, it has completed its section
> of accessing the critical data, then 2nd cpu gets the spin_lock. These two CPUs
> won't have overlap on accessing the same data.
>
> >
> > I think this entire activity is a carefully crafted mine field for the future
> > syzcaller and fuzzers alike. I don't believe there are no side effects in a
> > long
> > term on all possible systems and configurations (including forced threaded IRQ
> > handlers).
>
> Also I don't understand why forced threaded IRQ could be a problem. Since IRQ has
> been a thread, this actually makes the situation much simpler than non-threaded
> IRQ. Since all threads including those IRQ threads want to hold spin_lock,
> they won't access the same critical data at the same time either.
>
> >
> > I would love to see a better explanation in the commit message of such patches
> > which makes it clear that there are *no* side effects.
> >
>
> People had the same questions before, But I guess the discussion in this commit
> has led to a better commit log:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4eb7d0cd59
>
> > For time being, NAK to the all patches of this kind.
>
> Fair enough, if you expect better explanation, I agree the commit log is too
> short.

Yes, my main concern that the commit message style as "I feel it's
wrong" is inappropriate to this kind of patch. The one you pointed out
above is better, you may give it even more thrust by explaining why it
was in the first place and what happened between the driver gained
this type of spinlock and your patch.


-- 
With Best Regards,
Andy Shevchenko
