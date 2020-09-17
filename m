Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9040526DD32
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 15:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgIQNyp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 09:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgIQNxu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 09:53:50 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975B2C06121E
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:45:30 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x8so1731491ybm.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m9wrm0ivTeu97MoLKUf0LyXXyEbshxDC4fS59Xl/P0M=;
        b=OgPJ+jTGuu6Yvz9xiJ+2Q28Ia5wrU9vuQOfBKoftKQxVEhTFtV9ObjwdMk6XMweVbE
         aCVoGeKUM0E7ynl9XW822i1NCr981+aW5RE+UP0O/pPo77qGIg82bsVEw3X/We98YSY6
         vXg0CS6xZzcJSgu7a/Kg1HwVbPMlbGqJzmesYcLEyoyCJAhtsVDs0Ntv40ivq3uiXkns
         S67qAq8mmj/Rnvq0Gvniz0ulZoOB7+6yXz6LZP2zrv6J4pPBechSm19MZXyLxwQq1pKY
         +hwyzOV3MNjZyjuEIM6uA0/kt4ownbHlrtqOBI/eY16ws12mqo2hROSNHeivg+2kx0pD
         YHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m9wrm0ivTeu97MoLKUf0LyXXyEbshxDC4fS59Xl/P0M=;
        b=UITwCw2n9x4PVwMria2GXo8c0+Nljqs0tA+e3goKQbds8D9UAv5es2kMmaDhrw8ArJ
         EOEi/SIUhv9WYG+Ibvgz2FHEJi2o94qvoQXLUuImMV3jxbO4mn3osS/i35mrNWqIBevJ
         gXzMlBG8GPGJeqQaOKd1dvMRHcCbVVPeUPp8HiPX4XY2g49LFP3WeerasLbstMa5M0UX
         yHKCdAGPJ94X4iT/nk8bk/Ss5DAgvNCukU6VK3OgoK0OY2C9WUly+sDzHlZXkJfUiVnd
         bbsBhNM45GO9pOarY15xEX3dO/IaofeMExukG8g1V4yGeoIbckC/BJBIWxulracyGWvq
         UZlQ==
X-Gm-Message-State: AOAM531tEANL3IQ/TdPfJ6BV4z2Fdd5h1wcHff/ketR8s9pHwz9zrPzc
        EBi0K0m2Ybp1/bwQ/+uZjvf28uBsNooGFMS5+70=
X-Google-Smtp-Source: ABdhPJyX1O0sD6tzOhjrKJd3AeryP7HXrnvwe0f5ux27QsnY7wuR6yU7q90MaWM0iiBzJjhxGQ7EfdH2M+FNcyB3Wvs=
X-Received: by 2002:a25:41d5:: with SMTP id o204mr42056291yba.284.1600350329914;
 Thu, 17 Sep 2020 06:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol> <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
 <20200916095734.GA32888@sol> <CAM4ZDbCvTsQ9QyW9bF2n-noF1+kArZpCb216W9tf7X=tqSHhwg@mail.gmail.com>
 <CAHp75Vf0vwgxC9=3n+GjW+26cMjUHO-9JnrMYg_i8Tn8MMZK7Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf0vwgxC9=3n+GjW+26cMjUHO-9JnrMYg_i8Tn8MMZK7Q@mail.gmail.com>
From:   Maxim Devaev <mdevaev@gmail.com>
Date:   Thu, 17 Sep 2020 16:45:18 +0300
Message-ID: <CAM4ZDbAQsUL2V+bvyAkBxxAmk2MPYrzM+MV10_o1vX6rKYdynw@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> As a workaround can you simply read the state separately (yes, I
> understand that is not ideal but may help a bit to mitigate the
> current situation)?
> I.o.w. if you haven't got a new event during certain period of time,
> read the pin state to actualise it.

Yes, that's what I'm doing now. In principle, I am satisfied with this
decision. Not perfect, but okay. The only thing I think is worth
documenting this situation. Suddenly someone else will face similar
problems.

=D1=87=D1=82, 17 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 16:41, Andy =
Shevchenko <andy.shevchenko@gmail.com>:
>
> On Thu, Sep 17, 2020 at 1:37 PM Maxim Devaev <mdevaev@gmail.com> wrote:
>
> > > I already applied the patch to the master branch and backported it to
> > > v1.5.x[1]. Please give it a try. I will make a bugfix release soon
> > > too.
> >
> > Everything seems to be working fine now. In any case, I plan to use
> > event_read_multiple (), just for reasons of paranoia (and for older
> > versions) :)
> >
> > > If you are losing events then this is what you will get.
> > > No attempt is made in the kernel or libgpiod to keep rising and falli=
ng
> > > events paired (until debounce support in GPIO CDEV uAPI v2 arrives).
> >
> > Okay, thanks. I will take this into account.
> >
> > > What is your use case?  Are you seeing these problems in practice or
> > > only because you are generating events faster than you service them
> > > for testing?
> >
> > I make an IP-KVM and use GPIO to read the status of the HDD led on the
> > managed server's motherboard. This led operates in PWM mode, and if
> > the frequency is high enough and then the activity is stopped, then
> > there is a chance that the actual state of the led will be 0, while
> > the last state received from the library will be 1.
>
> As a workaround can you simply read the state separately (yes, I
> understand that is not ideal but may help a bit to mitigate the
> current situation)?
> I.o.w. if you haven't got a new event during certain period of time,
> read the pin state to actualise it.
>
>
> --
> With Best Regards,
> Andy Shevchenko
