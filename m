Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43165EDDF6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 12:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfKDLsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 06:48:46 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35966 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDLsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 06:48:46 -0500
Received: by mail-oi1-f195.google.com with SMTP id j7so13818121oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O8ZmDZKkoASAsh4aV2Ytwhz0285X4104BbaGTgC+HiQ=;
        b=Zz9f8vNAi50d6GVSXiIPOMVXr/QT/LNkdBudBNO0Vd5hoOZAJBeXutMZS8fS79a85m
         NlDAqxwPeWmRO+6zGWrJKV7xz6jMwWqLUTNfYeGDwYL41BEqZLsIXzUVBpUCa+4w2LLZ
         eXtRSpPetpO1Mf6MGKk2pip2OXnzrB9sPwfkAclxEzpiANIDepF+mdQXmrF0HBCox/tk
         hYgDk7V80g9fdjpFwnUyJjG9yFB5z81ZDHUyl9nZ7RhH22/Mqb65bRyorkZ5BGKtXU5x
         WeiAX7Yj0ov9LYZrOOxTDNsjpx4K+0x2miT8LcuMfgvuz4LyAcaTav9YqW0JXkAZGI0b
         k+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O8ZmDZKkoASAsh4aV2Ytwhz0285X4104BbaGTgC+HiQ=;
        b=ZfYn9VRi5oSjWl6Sk45r5IcXriOJ7vCGQes06JvgU8pZUdkmz5cK9cZWB+GEuaM04t
         1SxXyDH8i15nGAxbX0SvdPag//o5buPfTw0DeM/Xilv27cF13oRXNnaZLXfR2vujaisE
         vMI21k9Hady33LHXTJkqiRWu4AN2gElkJEgCGf9o8yvEaDLOKUvdg/BzzHsPzXIzEpcQ
         qRhbwpZxppt7xlRNrIJsiLsk9eMGgDOLaxBVTqyiYHY2u/Gaa8qfIATLOUpzq9N3NZzj
         d0Z0jU2yffmatxQ1pXJZdk6w79r4xQQjxW+zarK+QRoLdXr3wZmfFVI5FVh6GHrFxByp
         uAbA==
X-Gm-Message-State: APjAAAU/pE8CPkCXSCqc1c6N2afEeerwNt/kk7JhDgdjlx9jRdSCLuNH
        es8rVkhFHCirzrhm1k5/dx72lLQaxDOJQfS7fTMkzA==
X-Google-Smtp-Source: APXvYqxDo6Bm6v8gSamZ/GUoFEomlfON3V8u04JSbiUJykhpwUvSF+WbrWffFNoQru8j5BRCnekFzmBdq0+VKDl73FE=
X-Received: by 2002:aca:d904:: with SMTP id q4mr12246946oig.21.1572868124240;
 Mon, 04 Nov 2019 03:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com> <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
 <20191104010736.GA9134@sol> <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
 <20191104111148.GA3648@firefly>
In-Reply-To: <20191104111148.GA3648@firefly>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 12:48:33 +0100
Message-ID: <CAMpxmJWqsZxK-C7UYz_PbgFA=bNVz6xvbCXEoxgbVZQ7znk86w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 4 lis 2019 o 12:12 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Mon, Nov 04, 2019 at 11:14:56AM +0100, Bartosz Golaszewski wrote:
> > pon., 4 lis 2019 o 02:07 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> > > > On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > >
> > > > > [Kent]
> > > > > > This series adds gross control of pull-up/pull-down to the GPIO=
 uAPI.
> > > > > > Gross control means enabling and disabling of bias functionalit=
y,
> > > > > > not finer grained control such as setting biasing impedances.
> > > >
> > > > Right, excellent and persistent work here, much appreciated!
> > > >
> > >
> > > No problem - hopefully I haven't irritated too many people in the pro=
cess.
> > >
> > > > As long as I get Bartosz's blanket ACK on v5 I think it is ready
> > > > to merge. His consent is required for this.
> > > >
> > >
> > > I'm still waiting on open questions from v4 before submitting v5:
> > >
> > > One, handling of errors when setting bias, Bart has referred to Thoma=
s,
> > > so waiting for feedback on that.
> > >
> >
> > If we can get it merged for v5.5, then I don't want to block it
> > waiting for answers. Looking at the code I think we should only ignore
> > the EOPNOTSUPP error and propagate all other codes. Can you add a
> > patch changing that and then fix the other nits I pointed out? Also:
> > please Cc Thomas Petazzoni so that he gets the chance to yell at us if
> > it breaks something.
> >
>
> Will do.
>
> > > The other, where gpio_set_bias is hooked into gpiod_direction_output,
> > > is fine as is for the UAPI - it can always be relocated subsequently =
if
> > > other APIs need to set bias.  On the other hand, if decoupling settin=
g
> > > direction and bias is in order then that really should be done now.
> > > Can I get an an ACK on that either way?
> > >
> >
> > This is in line with what you did for input. I don't think it should
> > be decoupled (any particular reason for that? There is none mentioned
> > in the cover letter), so I propose to leave it as it is in patch 5/5.
> >
>
> Wrt decoupling, I was thinking of both input and output, not just output,
> though it was the output that got me onto that line of thought as
> gpiod_direction_output sets bias, but gpiod_direction_output_raw doesn't.
> That seemed totally arbitrary.
>
> That lead to thinking that the gpiod_direction_output (and _input) is now
> doing more than implied by the name, and by the documentation for that
> matter.  So perhaps it should be split out and promote gpio_set_bias to
> gpiod_set_bias?  Anyway, that was the line of thought.
> The problem there being some callers of gpiod_direction_input already
> expect it to set bias, at least on a best effort basis, and they would
> have to be updated to call gpiod_set_bias.
>

I see. I think that in this case, the _raw variants should stay as
simple as possible (hence the name) while the bias *should* be set in
the regular gpiod_direction_intput()/output(). For now I don't think
we need an exported gpiod_set_bias(), but if someone should request it
in the future it will be straightforward to add.

> Maybe just update the documentation for exported functions that do set
> bias?

Sure, sounds good. You can even extend the doc to include other flags
these functions handle.

>
> > One more thing - since we all want this to make it for v5.5 - can you
> > make the set config patches part of this series (simply bunch it all
> > together)? This will make it easy to review and merge everything.
> >
>
> May as well - I've got it all in the one branch anyway.
>
> > Thanks in advance and great job!
>
> I was about to start updating libgpiod to add set_config, after adding
> the equivalent to my gpiod library (nearly finished writing the tests
> for that), but I'll put all that on the back burner and get v5,
> including in the set_config patches, out as soon as I can.
>

Let me know if you still want to do it and you'll have patches ready
before v5.5 is released. Otherwise I can do it myself too if needed.

Bart

> Cheers,
> Kent.
>
> > Bartosz
> >
> > > I've also made a couple of minor changes myself while reviewing v4 -
> > > reordering the patches to group the gpiolib.c ones and leaving the
> > > gpio-mockup til last, and removing the "bias requires input mode" che=
ck
> > > from lineevent_create as the line is assumed to be input for events
> > > regardless of the input flag - there is no such thing as as-is for
> > > event requests.
> > > Only mentioning here in case such changes are clearly wrong...
> > >
> > > Cheers,
> > > Kent.
> > >
> > > > It looks pretty much as I imagined it when I discussed it with
> > > > Drew some while back, with some gritty details fixed up.
> > > >
> > > > Yours,
> > > > Linus Walleij
