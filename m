Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A828E5AD581
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 16:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbiIEOvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 10:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiIEOvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 10:51:15 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752494DB6A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 07:51:14 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id j1so6524995qvv.8
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iyTWUBiH4KvR7pcKXS2jPADeIeoeEXr3QQvuHDkri7U=;
        b=d/MoG+AXkcmyInH51BA8iEehVDmRIfMMWN8w0fhSfmZ0zhOUKSdhev4PCHtUZAetzK
         Mhu48meRhI3mhARmOCQiOO9TZNxJiqpsP365fSP+9CTO3XwBHl3JTz6euXZQojYMJ6BT
         yS9W/vCxuEpQHSNo+cBeyR2h6p2FDhaHzKgOVYfbqJaq/2UUKJgCDsmZXHfB0Ykry2J1
         MZMRcuYq3FVbWf4x9kF73RrmzBR772zfBBqtuVB4DP2evGP7tYBAKeL0E/oaf+I/P9ZS
         C7LDehO/Rm1daP5JBpaGycRfUsdt6OXJKT+w7ZgUlwuUSikxRZWUZrvf+GTCIuEyVIar
         nS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iyTWUBiH4KvR7pcKXS2jPADeIeoeEXr3QQvuHDkri7U=;
        b=jKweBd9LmKmkhyuE2A263a0TpDNyK84CXC8+P63oJLcExLtzNp4imq/pLV4gboJr/b
         WFHGLt3lllyw9TL0zyoCBriA7HcNNtXt92n8GmWpT3aHN9tZ9VnUe+6wRN7j/Ql9kIQQ
         Xxx0jE+rN7oNBMmPVW6CzFTGUA7INiQVRW99Jy+BznDu6c6LS7IKO4wHmNjsogT8mGgy
         q/DxdMpSlBd7xTV3VgkykAEdEr0wiLW50qq+vMg/Ww4wrekFcN0/k+j3z54PqoowuJ0z
         flKsmfsKsP86LXCPfjMDgixenEVmJogOJOJsQqh6A6/oxvLuUg7Nrw+Ig6rS+hdcePjW
         ni4w==
X-Gm-Message-State: ACgBeo38IJpDyGrlaPbeqNIjUeyKNTGWtzSvZMukHG3LEhVqpeodm+rg
        aAlyBbdyDjY3bldetNgp+jbKg4XCiyVc1UTna14=
X-Google-Smtp-Source: AA6agR6JYjzY5gmBrhsug4WwP1RtoTU/ZC7d4148p42CCnEcxUqFT3FMueTBtOVrGNADgeSFtQ+mTvKvJQFz4jWjaC0=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr1963529qvc.64.1662389473434; Mon, 05
 Sep 2022 07:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
In-Reply-To: <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 17:50:37 +0300
Message-ID: <CAHp75VcLJ4ZuMFUw23PDJEDUNYfvzitXSaE5aWvxE9-u3TAVoA@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 5:01 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 04:16:27PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:

...

> > > Let me say again: I am not changing this. That's for Asahi people to
> > > do if they wish. I am the just middle-man here.
> >
> > While I agree on technical aspects, this mythical "they" is
> > frustrating me. They haven't participated in this discussion (yet?) so
> > they do not care, why should we (as a community of upstream)?
>
> That's strange. I wonder. If they don't exist, then I wonder how Linus
> is running Linux on aarch64 apple hardware. Maybe it's not me with a
> problem here?

You mentioned them several times in the thread and no response from them.

> Hector has been promising to get involved in this discussion for a few
> days now, his latest comment on IRC yesterday:

IRC is not an email discussion and if he is not alone in the team, who
else can answer the queries?

But it's good that there is an interest from their side.

> 16:23 <@marcan> I'm going to allocate tuesday to playing the merge game (rmk:
>                 haven't forgotten about you either, IRQs today, but I'll get to
>                 it before tuesday):
>
> So he is aware that he needs to respond - but like any central project
> lead developer, he's probably exceedingly busy with other issues.

> So, how about you stop insisting on changes until Hector can respond
> to some of the questions raised; as I've said many times, you are
> asking for stuff to be changed that is quite clearly in the realm of
> decisions that the Asahi developer(s) have taken, and I have no right
> to change them without reference to them - because I do not know this
> platform well enough to make the decisions you're asking of me.
>
> I'm not going to say that again; I'm going to start ignoring you if
> you persist in demanding that I make these kinds of decisions, because
> *you* leave me no other option but to do that... because *you* just
> don't seem to be willing to accept that I need others to be involved
> in these decisions.

If I spoke like this for all contributions, from our side to the
upstream, I would become a crazy guy, because upstream almost always
insists on some changes here and there in the patches which are longer
than a couple of dozens of LoCs and more than a single in a series.
It's normal practice to follow the latest available APIs in the
kernel. Nevertheless, I told *you*, that technically I have no more
issues. Let's wait for the technical response from them.

-- 
With Best Regards,
Andy Shevchenko
