Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A68619C1A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 16:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiKDPvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 11:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiKDPvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 11:51:20 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6CA2D76F
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 08:51:19 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id r13so983045vkf.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bqmSTCOdiCvfbgpzZn+pfDZRQ4gDb7114O5UHyr/s0=;
        b=w/9tMYiwZerS8Da4PUf/fyy0dDSlqkEAiDsa5AQGeHKbl8qptdBdKJhtM6wI6WBJe5
         QUvIAAMgffTVX71nRzXSH+z3j6v0lXXSytMN44JCDPtP+Imdg+FFLnEFd9voCIrj9wzJ
         JksgTOOQjbKVp/Xtl2i5JuWAr0+38/Q8vFCbubs1PB1h6Qc6u5azoESSbbwoS7SCNSZv
         8qpxQmu4SgXquLQAy1kr0pBnb28biE+CTFmFagdI0aPSr7j3y013LgElA1xP4ErI09F4
         +dw92pUiWr7Y8uvEwK9PvHE8vdZdaqYc5lUh/pklr+EtOudlcCixGuC22P1L1cDE2lLd
         IA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bqmSTCOdiCvfbgpzZn+pfDZRQ4gDb7114O5UHyr/s0=;
        b=ufRBtMowNhQUyQ5h4pkB5B9RDfkfFgrOzi45/GS5KlKIyBRIR/GtMiwdt+hj6SFq8q
         b5+IZAW0YGk/8n30+E+34ZXPM4Uz1aM8U9HnpKIF82yMbvxt14HFnRsQEv/Ba2GRoQdZ
         qiDyd1a9lpVT7pi3VIyY9ZhgTY6owKXhq0AnIbfivF0IEKNlKTP7XR0WDhi3X1i6JBRY
         E5VyaFCc559YH58Su3o8f9dOxKC/401B9O6Nr10TT4Z6vuDlnX8yqwoNzPjjDzVYHoBC
         VCtKi+hIEfhNfnpYJ6ihy8x7287bqv1pYKQgLWagI1njicdefb0d4Gll9KYukrOWBGoz
         muiw==
X-Gm-Message-State: ACrzQf2PmaNiaHzndHWFNTIZP9TQG/ybFC+4gLN9cOIPLsEnAA2gMiom
        cH2awIBzR6IsGcpUCtxM6g4OAlouaBtoMyODzU8bhw==
X-Google-Smtp-Source: AMsMyM65wjyFB3T+odhlXz824p/tDA0Fbyaf1AiBNs6kDPVX0QgXVN6pBRLmoXUcGfhvd/eYkURRr14qp3QfZVlaYyA=
X-Received: by 2002:a05:6122:92a:b0:3b8:ae77:6927 with SMTP id
 j42-20020a056122092a00b003b8ae776927mr1333137vka.33.1667577078097; Fri, 04
 Nov 2022 08:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221021112238.teqz25pn3hz5d4cs@vireshk-i7> <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol> <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
 <Y2JrywE5RB0Mdrqo@sol> <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
 <Y2MNd0Y27hZ164i2@sol> <CAMRc=McT1RFNdqdNJJYEXad4kcSpj4MgrKL9emcsiaJoO5YvrA@mail.gmail.com>
 <Y2O0LRbTvzCsbDKK@sol>
In-Reply-To: <Y2O0LRbTvzCsbDKK@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 4 Nov 2022 16:51:07 +0100
Message-ID: <CAMRc=Mf0fQPFJDTvii2Sm0hkQDshXHm1BOXT6oPQwagNHj9zuw@mail.gmail.com>
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

On Thu, Nov 3, 2022 at 1:29 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Nov 03, 2022 at 09:35:33AM +0100, Bartosz Golaszewski wrote:
> > On Thu, Nov 3, 2022 at 1:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Wed, Nov 02, 2022 at 05:34:20PM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Nov 2, 2022 at 2:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> > > > > > On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > > >
> > > > > > > On 31-10-22, 20:33, Kent Gibson wrote:
> > > > > > > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > > > > > > support, or as his work appears to be on behalf of Linaro that they
> > > > > > > > would have an interest in maintaining it.
> > > > > > >
> > > > > > > I will surely help in maintaining the Rust part. Not an issue.
> > > > > > >
> > > > > >
> > > > > > Sounds like a plan. I'm going through Kent's gpio-tools patches and
> > > > > > rust bindings are next in line.
> > > > > >
> > > > >
> > > > > The rust bindings might make it in before they do - you may find that
> > > > > they are a bit more different from the old tools than you were expecting.
> > > > >
> > > >
> > > > Yeah, I can tell that. :)
> > > >
> > > > I have lots of non-functional minor things to point out - mostly
> > > > coding style etc. - that I will probably just fix locally when
> > > > applying.
> > > >
> > >
> > > Looks like there will be a v5 for the optional interactive set, if
> > > nothing else, so let me know and I can fix them as well.
> > >
> > > > One thing that stands out though is the dependency on libedit - do you
> > > > think we could make the gpioset interactive mode a configurable
> > > > feature with its own configure switch that could be left out if we
> > > > don't want to depend on any external libraries?
> > >
> > > Well, libedit was your preferred choice.
> >
> > It's still is - it's not about the choice of the library but about
> > keeping it possible to build a set of command-line tools with no
> > dependencies other than libc.
> >
> > > But, yeah, making the interactive mode optional is a good idea.
> > >
> > > Any preference on the name for the config flag?
> > > --enable-gpioset-interactive ?
> > >
> >
> > Sounds great.
> >
> > > One other major thing I had been considering, and implemented in my Rust
> > > version[1], is renaming the tools, since it isn't intuitively obvious,
> > > to me anyway, what gpiodetect, gpioinfo, gpiomon, and gpiowatch do.
> > >
> > > I went with:
> > >  gpiodetect -> gpiochip
> > >  gpioinfo   -> gpioline
> > >  gpiomon    -> gpioedges
> > >  gpiowatch  -> gpionotify
> > >
> > > where the names try to indicate the information returned, rather than
> > > how it is collected.
> > > And yeah, I got stuck with gpiowatch/gpionotify as I couldn't come up
> > > with a short meaningful name for line info changed events.
> > > Suggestions welcome.  And lice is not an option.
> > >
> > > gpioget and gpioset remain unchanged as they are already as clear as can
> > > be.
> > >
> > > Would that work for you, or would you prefer to stick with the existing
> > > names?
> >
> > I don't know if it is because I'm used to the previous names but none
> > of the first three make much sense to me. I think it's better for the
> > names to indicate what the program is doing, not what it's returning.
> >
> > On the other hand - gpionotify is great, go for it!
> >
>
> Ok, now I'm confused - only rename gpiowatch?

Yes, gpiowatch -> gpionotify.

>
> Anyway, we probably should pick this conversation up as part of the
> tools review, not the Rust bindings, so let me know there.
>

Makes sense. I'm off most of this week, but I will get there, I promise. :)

Bartosz
