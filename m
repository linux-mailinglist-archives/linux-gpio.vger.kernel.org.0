Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7028627F19B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 20:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgI3SuW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 14:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgI3SuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 14:50:22 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5844BC061755;
        Wed, 30 Sep 2020 11:50:22 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t16so2996676edw.7;
        Wed, 30 Sep 2020 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sg3JdskTv/baC1RIHHUI9THUReq0qsRlNzLxJycYwpY=;
        b=iAx2GEEtJ4eZu+wgiOzIuHUkDDjjYQtWB9JgMtllCOLUZM+wluabzrKEe/ivOUx6yY
         kgsCdXTtEWLEivK0FGWvR4KXAgbP1bL6imaFIsLRm7RAoJIpVG0tK83kUAj02duPE5+C
         FUvSKv8SSLHKQ+rJ7EKpAAZMXxWTMcrh0JPWXskB6xF8v1Unq8iJEgrjuUB8Md5twErC
         1k9NCBsjb/Sge1F+3mva4jSWHVgPAm0edgdwfmjGmTPwoA6GsMSwdS8wMHzjZmBJER+Y
         Ix0x1Be1RXa6Gn9P4pjnt9xPo046R6dYJ6U8gYafZ6gU4UqAD9Kw5KFZDxd7eNRuszJR
         wESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sg3JdskTv/baC1RIHHUI9THUReq0qsRlNzLxJycYwpY=;
        b=XPl0gp7ZS8taOauBLsjVyJTExh1cma8hbgs02Fjpsf8UoHUfyXfaueGz4BfqeRuuBi
         j7KmueRN+Yj47KR1icf/GV8/ED0+AS3H7gd5yGBdS+On78aV2VmiTHYHlHTAxGKRf25z
         ekQi/myK3w+Z2hcbFCns/w0wJvaz5KD1Za676/XcpE0kqhkIzlmgc6rNUhEZf9kn5axR
         6L8jWaxJ7NZXVlc6BtY9vuPv3YT24OSwbEB3yZbxuMCCOeHjLDeEDW+imsiJLVXDFRQN
         o1ueR6tSUNoAyKEE5CI/S5y7lFu8oM3OHDdBH8ZPxvr4wqERuSINQCpsH2kPmT04EMe7
         NOIA==
X-Gm-Message-State: AOAM533B76s4JZ6VltGuRsWiWek1EuNvYdTrpd64R8EFj0IG4ewdaUK/
        7+Mg1ZDuzKo1+R3RgwsYed6vn2jEKtoEGLsGDofxNjPc89rTujGB
X-Google-Smtp-Source: ABdhPJwHY8Mt2cRi5DRYkuaDFjWn86zSncMMNn3sSdiwsWjgOGvvgfbLuzwcM4ocTjmoS32nnkGdtCx6MDoxuzB/NYc=
X-Received: by 2002:aa7:c1d0:: with SMTP id d16mr4106617edp.209.1601491820999;
 Wed, 30 Sep 2020 11:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200924054324.GB9471@atomide.com> <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com> <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com> <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
 <20200930051521.GN9471@atomide.com> <CA+7tXig=3hbFXfmYMC5Hd1Zc2n-6uGXbMePPw_Cr4bOsyt7QQA@mail.gmail.com>
 <20200930091526.GQ9471@atomide.com> <CA+7tXihYb6AHrQLpO9UDHV7YFbzo_Pm8EdXNJXX+tJXX-L6UYA@mail.gmail.com>
 <20200930094714.GR9471@atomide.com>
In-Reply-To: <20200930094714.GR9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 30 Sep 2020 11:50:10 -0700
Message-ID: <CA+7tXijZJnJ-=erFq+XQCrwwV7tv+6PsmO5T8XSR3p1Jb6qjkg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 2:47 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Trent Piepho <tpiepho@gmail.com> [200930 09:34]:

> >
> > Where do these flags go?  In pinctrl-single,pins?  Like:
> >
> > pinctrl-single,pins =3D <AM335X_PIN_MDC MUX_MODE7 PIN_INPUT_PULLUP>;
> >
> > But PIN_INPUT_PULLUP is a generic flag?  Which is translated into the
> > proper value by??
>
> Yes that's what I was thinking, something like this with generic flags:
>
> pinctrl-single,pins =3D <AM335X_PIN_MDC (PIN_INPUT | PIN_PULLUP) MUX_MODE=
7>;

It doesn't seem like these patches help achieve that, since they
create device tree binaries with a property that has the same name and
number of cells, but the cells have a different meaning than above,
and must be handled differently by the driver.  So you either drop
compatibility or need to forever deal with supporting an interim
format that is being created by these patches.

The conf and max are already split in (all but one) of the device tree
SOURCE files via the macro with multiple fields.  That does seem like
a good step if you wanted to transition into something like the above.
But splitting it in the binary too doesn't help.  Is there a way the
dtb now being created can turn into the above via a driver change?
Absolutely not.  So what's the point of an interim binary format?  All
that matters is what the source looks like, and since that doesn't
change, nothing is accomplished.

I'll also point out that the current generic pinconf, done not via
flags but with multiple properties for each configurable parameter,
has a drive strength properties with strength in mA or =C2=B5A as a
parameter.  How would you do that with generic bit flags?  I don't
think you can fit everything in pinconf-generic.h into one 32 bit
cell.

> > Or are you talking about replacing the existing pinctrl-0,
> > pinctrl-names properties with a totally different system that looks
> > more like gpio and interrupt handles?
>
> That would be even better :) Might be just too much to deal with..
>
> In any case the parser code could already be generic if we had generic
> flags based on #pinctrl-cells.

But the pinctrl-single,pins isn't parsed.  It just uses the values as
they are.  You'd have to write something to parse the cells and add
more data to the dts that told the parser how to turn them into device
specific values.  It seems like that could eventually achieve
basically what is happening already with the dts preprocessor
converting symbolic constants into device specific values.
