Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709C36178C7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Nov 2022 09:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiKCIfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Nov 2022 04:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiKCIfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2022 04:35:46 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E29B864
        for <linux-gpio@vger.kernel.org>; Thu,  3 Nov 2022 01:35:45 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id 128so1230597vse.6
        for <linux-gpio@vger.kernel.org>; Thu, 03 Nov 2022 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VqNhLg4LoSIvuFwFTU2LQMNqlQvVB84x1VFKWZS+bQI=;
        b=sB0BWvKL0E3dFHIe6erMCgC4lwpcBp00rvu8lAEAbk7ljZAe+UZFsr162OXL0wxb/3
         2vCkwHlkK9GOBv0breeFBysWK+mLsJ/B1BM7gheNyNJmusqJVxxYHjMAo9EBbPNR4hY6
         u/dputX87DMLhG/Biy9dVlDF/jtjHWiUmjJJ0mUc6MrOIVYTb9xRwVFQ4TyohJ15mPg2
         r5gfIMZSxq89guFrrU0ah3Zgy5NtQROmWjREWkoybnQy0gVvZiqvP1vGFatWKg8vWMwu
         O5JOPbdhIN/EQMUEZRG1491tUijDIHMZwlO4E8RPrvRLF4wVRbOjlT+KOj4bd8CWZx9j
         c7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqNhLg4LoSIvuFwFTU2LQMNqlQvVB84x1VFKWZS+bQI=;
        b=SASg9NdFCWLoiXVm1QXzGMJsMt2sNfixvmECatnuF3qfpRkA4e4KaVjJxmhJ4CvlGR
         yW7DjfRA7gQx3XB+sCT5wQesZ0ziY5z4vH6y9eZsSR8r9zpwRfaWeVj2YyCh5qXqBqg2
         OxRTCPC/0chsfjQBiXi/ZC5zc9vG510MzcIk/36RMo53dUoXGp+6J8Gn5m63ZHCLQ17u
         F1JRllr3kToSB4JBr9UWP0VIycZJq4rMBTyufzlst7jy9CH5owgnoPgVa6s7Zu0svEfv
         lRpQtjR0ghdUkJl22E/8iVZZE7hoogRudF+vpJ8oAEvcIBtWwGsMZepXPQsJ7lieFAA2
         M9rg==
X-Gm-Message-State: ACrzQf2bRizWRcRTAFKKiBvjdUo/b2g18DN1xTSKDyu/IkXonABi1YLs
        pgPHDUPtyDf3X7fuh0NmTJcLVEnE/5CmX1hI+MngVg==
X-Google-Smtp-Source: AMsMyM5NQM//TZIEQn8zDOakkPZbdwT0ojVW9A9IpMpeHZjclSqZ2aZRFov7J1Hk/PN9/jYJLJrkVJ5U+llFFwbGypQ=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr15892923vse.9.1667464544308; Thu, 03
 Nov 2022 01:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol> <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol> <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol> <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
 <Y2JrywE5RB0Mdrqo@sol> <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
 <Y2MNd0Y27hZ164i2@sol>
In-Reply-To: <Y2MNd0Y27hZ164i2@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Nov 2022 09:35:33 +0100
Message-ID: <CAMRc=McT1RFNdqdNJJYEXad4kcSpj4MgrKL9emcsiaJoO5YvrA@mail.gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 3, 2022 at 1:38 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Nov 02, 2022 at 05:34:20PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 2, 2022 at 2:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > >
> > > > > On 31-10-22, 20:33, Kent Gibson wrote:
> > > > > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > > > > support, or as his work appears to be on behalf of Linaro that they
> > > > > > would have an interest in maintaining it.
> > > > >
> > > > > I will surely help in maintaining the Rust part. Not an issue.
> > > > >
> > > >
> > > > Sounds like a plan. I'm going through Kent's gpio-tools patches and
> > > > rust bindings are next in line.
> > > >
> > >
> > > The rust bindings might make it in before they do - you may find that
> > > they are a bit more different from the old tools than you were expecting.
> > >
> >
> > Yeah, I can tell that. :)
> >
> > I have lots of non-functional minor things to point out - mostly
> > coding style etc. - that I will probably just fix locally when
> > applying.
> >
>
> Looks like there will be a v5 for the optional interactive set, if
> nothing else, so let me know and I can fix them as well.
>
> > One thing that stands out though is the dependency on libedit - do you
> > think we could make the gpioset interactive mode a configurable
> > feature with its own configure switch that could be left out if we
> > don't want to depend on any external libraries?
>
> Well, libedit was your preferred choice.

It's still is - it's not about the choice of the library but about
keeping it possible to build a set of command-line tools with no
dependencies other than libc.

> But, yeah, making the interactive mode optional is a good idea.
>
> Any preference on the name for the config flag?
> --enable-gpioset-interactive ?
>

Sounds great.

> One other major thing I had been considering, and implemented in my Rust
> version[1], is renaming the tools, since it isn't intuitively obvious,
> to me anyway, what gpiodetect, gpioinfo, gpiomon, and gpiowatch do.
>
> I went with:
>  gpiodetect -> gpiochip
>  gpioinfo   -> gpioline
>  gpiomon    -> gpioedges
>  gpiowatch  -> gpionotify
>
> where the names try to indicate the information returned, rather than
> how it is collected.
> And yeah, I got stuck with gpiowatch/gpionotify as I couldn't come up
> with a short meaningful name for line info changed events.
> Suggestions welcome.  And lice is not an option.
>
> gpioget and gpioset remain unchanged as they are already as clear as can
> be.
>
> Would that work for you, or would you prefer to stick with the existing
> names?

I don't know if it is because I'm used to the previous names but none
of the first three make much sense to me. I think it's better for the
names to indicate what the program is doing, not what it's returning.

On the other hand - gpionotify is great, go for it!

Bart

>
> Cheers,
> Kent.
>
> [1] https://crates.io/crates/gpiocdev-cli
