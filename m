Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E5D51760F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350790AbiEBRpk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 13:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239075AbiEBRpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 13:45:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7A22196
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 10:42:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id m20so29051100ejj.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hYt/aDB09SWRC5RVnOs7h1bdc/ipsHDUHat14jCreYE=;
        b=e0mk6SwYBS07CQN12R7ExjW5GVNZaS/UGRA0rlI3wwnousdmdEn3Wf8iN1ShHhkiwG
         rnVtTGuHz0bwqSiONBzlxT7YL1WSc8UoFvU5sYiMvMWblZYufmZVaOoE2LRFeDDYrfS8
         U3cW/0aqmrFS8czjhjNcY16Ir+QI+Pq9RqpTrDZSkabdUhsbf/Vp8mxPpkqvp06dux4h
         B1jF69kNyS6YbdNvsumNofMhzNaGtAYMGmesM//ZComvZ0Nh/T3p89d+on/cpFSlb0nW
         iax3Dybp5HGmEDW16HxqF7QG/it5d2l/16Nn6DkVR424+e7yev/XJ6BpK9NSVh+qRu2+
         kVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hYt/aDB09SWRC5RVnOs7h1bdc/ipsHDUHat14jCreYE=;
        b=qIVW4q/HvS6dnmieXmNqyZA9N45mPnkR//lj8ZdgjnMkY/j+YC/8kLQ+N8GacWRoqr
         8+8nn20S6YyglubkuYKsY3LIQ7BsgOmThMERdBlAobTce3wI3N/BJMJRzFYS8yOasos4
         /UJEFfxhS0IhRg0FzB5qBPTdtOvjhk6dBCCRtYgnpPtqgW5YLBlyhyS6GAmazjJc8Qml
         Mt6Z0Rsi65P9GiHemAw9/lzL6HCrD4hMs4b6csj0/VMz1jJKfwtXRRy9wrMjxGj+TDsx
         4lE2Trb8fyJ3gVs8XVUoSokf+HpPtE8RdN/t9Qvmvx4BOB7jrUlgcCH+GPGqc7m9Kp8s
         vXgA==
X-Gm-Message-State: AOAM533wQXUzWip+LxJ5hgHJdqj/dADnztkbT8UsjdAX5SNOCGdbYE6G
        qfr+G4sBWMkh9+dq54qLlDu6tzeKt/n6kFGdSRlkvHvaBB79+Q==
X-Google-Smtp-Source: ABdhPJwaEl4hLsxg8sOz4cwwLXDVIqp3rEZcrrJ36V7cNY4SBbA+8B7cPxUx+cXkI/OfeBwCQVVngyLcjEkJEYBK4t0=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr12040301ejc.286.1651513327472; Mon, 02
 May 2022 10:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125023.2664623-1-brgl@bgdev.pl> <20220426125023.2664623-6-brgl@bgdev.pl>
 <20220427060153.GB118500@sol> <CAMRc=McZirBT_sdWxrhVomUoODTb-tz-og86Zf6KY4BBMXOw7Q@mail.gmail.com>
 <20220502135412.GA16365@sol>
In-Reply-To: <20220502135412.GA16365@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 19:41:56 +0200
Message-ID: <CAMRc=MdtE+bJ=2suVvYH3VmyBWjZbG+Ob=fMxPh=um2FeSgWhw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v6 5/5] bindings: cxx: add implementation
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 2, 2022 at 3:54 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, May 02, 2022 at 02:34:34PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 27, 2022 at 8:02 AM Kent Gibson <warthog618@gmail.com> wrot=
e:
> > >
> > > On Tue, Apr 26, 2022 at 02:50:23PM +0200, Bartosz Golaszewski wrote:
> > > > This contains the actual implementation of the v2 C++ bindings.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > >
> > > [snip]
> > >
> > > > +
> > > > +GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
> > > > +{
> > > > +     this->_m_priv->throw_if_released();
> > > > +
> > > > +     return ::gpiod_line_request_get_num_lines(this->_m_priv->requ=
est.get());
> > > > +}
> > > > +
> > > > +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> > > > +{
> > > > +     this->_m_priv->throw_if_released();
> > > > +
> > > > +     ::std::vector<unsigned int> buf(this->num_lines());
> > > > +     line::offsets offsets(this->num_lines());
> > > > +
> > > > +     ::gpiod_line_request_get_offsets(this->_m_priv->request.get()=
, buf.data());
> > > > +
> > > > +     auto num_lines =3D this->num_lines();
> > > > +     for (unsigned int i =3D 0; i < num_lines; i++)
> > > > +             offsets[i] =3D buf[i];
> > > > +
> > > > +     return offsets;
> > > > +}
> > > > +
> > >
> > > My previous comment was "Cache num_lines locally rather than calling
> > > num_lines() several times."
> > >
> > > You cached it in the wrong place - it should be first thing in the
> > > function, so you only call it once, not three times.
> > >
> >
> > I fixed it when applying.
> >
> > > And the throw_if_released() is still "redundant as this->num_lines()
> > > also does it", and it is the first thing called here - after the
> > > throw_if_released().
> > >
> >
> > I think it's still worth having it here because at least the code
> > makes it clear, we need to have a valid request here. It's not like
> > it's a hot path where this additional function call would matter IMO.
> >
>
> So add a comment?
> Pointless work is pointless work, hot path or not.
>
> > > And I would've made this patch 3/5, not 5/5.
> > >
> > > But I'm fine with this set going in either way - in fact give its siz=
e
> > > I'd rather see minor tweaks applied later than go through another rou=
nd
> > > of review.
> > >
> > > For the series:
> > >
> > > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> >
> > Thanks I applied it for now as it is, let's get it into master with
> > the Python bindings and then polish it some more there.
> >
> > >
> > > I really would also like to see some feedback from C++ developers tha=
t
> > > will actually be using it, as they have a bigger stake in it than I d=
o.
> > > But that is up to them.
> > >
> >
> > Indeed, any idea where to post that to get some free code reviews from
> > C++ devs? :)
> >
>
> That does raise the issue of whether libgpiod should have a forum other
> than this mailing list.
>
> I was hoping to at least nudge the others on the CC list =C2=AF\_(=E3=83=
=84)_/=C2=AF.
> If no one is sufficiently interested to bother reviewing, or even acking,
> the C++ bindings, perhaps deprecate them instead ;-)?
>

Well, I've received enough emails over the years with questions about
C++ bindings to assume they are being used (although Python bindings
seem to be preferred indeed). I think it's just a significant amount
of work to go through 10000 LOC just for fun, hence the lack of
reviews. :)

Anyway, I'm pretty happy with how they turned out and I intend to keep
them. Hopefully nothing is too broken to require an incompatible fix.
I'll try to find some reviewers outside the list in the meantime.

Bart
