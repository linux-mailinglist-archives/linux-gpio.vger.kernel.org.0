Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBF75AD033
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 12:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237214AbiIEKdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 06:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237521AbiIEKdH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 06:33:07 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C07D3AE69
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 03:33:06 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id cb8so5893160qtb.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1qDAhY9gtu7if1byi4qyoH5HE+QBW+rQwg+8jfZuHM4=;
        b=HbLUJRdVs3kRvFtbJd2/gROjHbI1BIW0ZEzU1/nCO32KfmnZtBXp9uTc8/0MSne3lx
         +2CP7Xpnl71ZcIowISUMLZlrVykE4VbQkF26rAwO69nbtc0IrolL6GBRxlovRPay9RP4
         ZG4DxvN+NuQelmi6RjzwMlemPUItK4fZbVzau8D3HLcQCMCFsDLO0VK9kkCeDpDJ0pB9
         3znITDbH6o9As1ZN8DSSUpsHj761q0EypH4JWEmNtMEdtiHNCY7+Hn/Mi+zqCPtvFE4I
         lr8Dl8OHUScs6YCjGDzAi+cYOzvI0qxW/SUuP1L1H208pY0AMy6vE6Mmq0CQ/dcEPLK0
         0mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1qDAhY9gtu7if1byi4qyoH5HE+QBW+rQwg+8jfZuHM4=;
        b=TInWzQyqUHqCzlgjYA4UwKYXR2ED8Pwb2LLIme26yMdSeLW2THAF8iH12q3xHEB1fz
         cDf0bp29Uqu2Z4XSED99W0kHLwj1kUfp2PMXm1UIelm3cVi2aU+vOGLKVHidtDeqf1AN
         eud3jdLgo4zUe9bXkeeysFy9CEDdGDRKUtuToA9FXJVQ6Zgvoa+/DnyuhALRdqNtPypN
         uvYfBXP+qazdma5sNzeJA8EIY3LwHRIDuLDffCsixRkyetqWzZ6eOd+8UhF6j5PoRtIV
         pLZNDquA+2o6ilUEFPPTQ9eE2QiNBhd4aj/IzNGKt3BV8LUc6CWw77cSB8HMIj5uCLoz
         VpEw==
X-Gm-Message-State: ACgBeo3Pb1tvv+rlbvyMhZNE/8sx7Hgqn+EQF8Y7xcs9fKB8gbwwrUzb
        3H7vOLpKn2Wvt7bKryyGYMWgM2MSqQzEvKF3whA=
X-Google-Smtp-Source: AA6agR62JwdcSmIkYS6PaavsmhTwv0VPiTDFO5bIPZ9hE2wF7e/Lqq7JR9n49cpGYbN6ZEtIe6ijljGQfBlq+GWwZf8=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr37920340qte.195.1662373985157; Mon, 05
 Sep 2022 03:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk> <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
In-Reply-To: <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 13:32:29 +0300
Message-ID: <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 1:20 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 06:43:36PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 6:34 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Sep 02, 2022 at 05:53:25PM +0300, Andy Shevchenko wrote:

...

> > > static int macsmc_gpio_nr(smc_key key)
> > > {
> > >          __le16 foo = cpu_to_le16(key);
> > >          u8 result;
> > >          int ret;
> > >
> > >          ret = hex2bin(&result, (char *)&foo, 1);
> > >          if (ret < 0)
> > >                  return ret;
> > >
> > >          return result;
> > > }
> > >
> > > which you also didn't like,
> >
> > ...based on the wrong suggestion below. That said, the above is fine to me.
>
> To be honest, using the endian conversion macro there doesn't feel
> right and is more prone to programming errors. I can't tell just by
> looking at it that either cpu_to_le16() or cpu_to_le32() would be the
> right thing here - and if it's not obvious then it's a bug waiting to
> happen.
>
> As if to prove the point, the above suggestions turn out to *all* be
> buggy.
>
> The initial suggestion gets the k[0] and k[1] assignment round the
> wrong way. The second, le16() is definitely not the right conversion.
> If we start using the endian conversion macros, then this is going to
> screw up if someone runs a BE kernel against the SMC (since the
> _SMC_KEY() macro will still be doing its conversion.)
>
> This seems utterly counter-productive, and I've spent quite a long
> time trying to work out what would be correct.
>
> At this point, I'm not sure that changing what has already been
> established in the Asahi Linux tree for something entirely different
> in mainline is going to be practical - it's a recipe for repeated
> mistakes converting keys from the Asahi kernel to the mainline
> kernel.
>
> It's not _just_ the GPIO driver. There are multiple other drivers
> that will be impacted by changing the scheme here.
>
> Any change to the scheme for these SMC keys  needs to happen in the
> Asahi kernel tree by the Asahi Linux maintainers, not by someone
> pushing the code upstream - doing so would be a recipe for repeated
> trainwrecks.
>
> So, I'm going with my first suggestion for the hex2bin() conversion
> above, and adding a comment thusly:
>
>         /*
>          * The most significant nibble comes from k[0] and key bits 15..8
>          * The least significant nibble comes from k[1] and key bits 7..0
>          */
>         k[0] = key >> 8;
>         k[1] = key;
>
> because I needed the comment to prove to myself that I wasn't breaking
> this code. Maybe it's obvious to you, but it isn't obvious to everyone.

And how is it different to the key being __be16 and all operations
against it be correct with the endianness helpers? Adding redundant
comments when the bitwise type exists seems just like being afraid of
the unknown. Ah, I see that in one of your long letters the proposal
somehow switched from (implicit) be16 to (explicit) le16... Still to
me it's not enough justification for the comment, but since it has no
effect on the code generation, add it if you think it would be better.

-- 
With Best Regards,
Andy Shevchenko
