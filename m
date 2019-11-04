Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1FD6EE386
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfKDPUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:20:16 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46414 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDPUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:20:15 -0500
Received: by mail-oi1-f193.google.com with SMTP id b19so5133200oib.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m8dvp9dNoNiZSzchvtVJ/oyZO0IfaN20YXZekVGef+Q=;
        b=vcxcYm2d8zqC6BHp595ZnDL7Xyt2e/4EqJIj+XXm6ejyJKjwvZ9HiUkDBq2nLASHO5
         /X4+fRbbi35LeENOWXqju2LEqmd6ueG8OUn1dMeNebo4J1nh/0MPqfaEhb95fsEN1ThI
         nLbWqC7bIVa1fMwSRm7RjP6eh4Ds39qIJ36ii0UHLdwQ4Gyoh6lgdRDzJA7jKCBZPWS+
         dbsh8dayyNejfhfF29UL07H+IM0wSQyTzdbr0KVIR+Svyebdj5rwTnGE1oSDqv+imlNN
         GKLIRQGpoB13X7t90WehnuZZckBGUXFnDvaP77Bq/XTH1pOghPkVcFlbtxLlGO9SFng7
         QVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m8dvp9dNoNiZSzchvtVJ/oyZO0IfaN20YXZekVGef+Q=;
        b=WbjXIKLbINourFZlQ3AepwP74z7gO1fByCcnZCD7+EtlFygWa6opnk5ISKotlgpF0l
         dgEiS5SrjTSFUp/k7bs96KYIxmHQvGmcs8PXkRwIyqVGcQJNb96uDEWYMCcdZB1WDwp7
         KwCPj6tMQAipeuCazfH8iomTGQnCDAkKNl5vHl4lgap2oWCNoEum90pUgNehfKeJcoiK
         YU4WaCz1FwD5Ta/3pK7wVTbRH7ak9oNJsU04v6Lo70SRpiLt458E2gw7wvDb421kG1T+
         egcGDnmgBR6QOefMCiFZZQupSaolBETqsLuNf3MrJecHrdMyB6P/7dTrJOAxXIxhMGI3
         /2dA==
X-Gm-Message-State: APjAAAVFQ1D4veEZmbA4uasAA4x+7wRN8tCMrOZ+CXO1RmjqXU9hCmmW
        Ni6B7NaqkkNeBV0Yz779BZCdIFo6tHvK6QbbVBODMA==
X-Google-Smtp-Source: APXvYqyY/6//Dw0rgI8OO6egcMiL6bSmqmMSznpIn8iS0VLDVpUESYWFR9Jhc32VskhNpzYiufdbmXpem9Cq8QCtgDA=
X-Received: by 2002:aca:451:: with SMTP id 78mr4181812oie.170.1572880814435;
 Mon, 04 Nov 2019 07:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com> <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
 <20191104010736.GA9134@sol> <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
 <20191104111148.GA3648@firefly> <CAMpxmJWqsZxK-C7UYz_PbgFA=bNVz6xvbCXEoxgbVZQ7znk86w@mail.gmail.com>
 <20191104142229.GA13556@sol>
In-Reply-To: <20191104142229.GA13556@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 16:20:03 +0100
Message-ID: <CAMpxmJV7Z0yXAU0xqMLpcJnArGf1hANnoTHDyyKqAX=Ut8zRjQ@mail.gmail.com>
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

pon., 4 lis 2019 o 15:22 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Mon, Nov 04, 2019 at 12:48:33PM +0100, Bartosz Golaszewski wrote:
> > pon., 4 lis 2019 o 12:12 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Mon, Nov 04, 2019 at 11:14:56AM +0100, Bartosz Golaszewski wrote:
> > > > pon., 4 lis 2019 o 02:07 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> > > > > > On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> > > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > >
> > > > > > > [Kent]
> > > > > > > > This series adds gross control of pull-up/pull-down to the =
GPIO uAPI.
> > > > > > > > Gross control means enabling and disabling of bias function=
ality,
> > > > > > > > not finer grained control such as setting biasing impedance=
s.
> > > > > >
> > > > > > Right, excellent and persistent work here, much appreciated!
> > > > > >
> > > > >
> > > > > No problem - hopefully I haven't irritated too many people in the=
 process.
> > > > >
> > > > > > As long as I get Bartosz's blanket ACK on v5 I think it is read=
y
> > > > > > to merge. His consent is required for this.
> > > > > >
> > > > >
> > > > > I'm still waiting on open questions from v4 before submitting v5:
> > > > >
> > > > > One, handling of errors when setting bias, Bart has referred to T=
homas,
> > > > > so waiting for feedback on that.
> > > > >
> > > >
> > > > If we can get it merged for v5.5, then I don't want to block it
> > > > waiting for answers. Looking at the code I think we should only ign=
ore
> > > > the EOPNOTSUPP error and propagate all other codes. Can you add a
> > > > patch changing that and then fix the other nits I pointed out? Also=
:
> > > > please Cc Thomas Petazzoni so that he gets the chance to yell at us=
 if
> > > > it breaks something.
> > > >
> > >
>
> Can you just confirm if it is EOPNOTSUPP or ENOTSUPP that you want ignore=
d?
>

Oops, it's -ENOTSUPP of course, the error code returned from
gpio_set_config() by this line:

  return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;

> > > Will do.
> > >
> > > > > The other, where gpio_set_bias is hooked into gpiod_direction_out=
put,
> > > > > is fine as is for the UAPI - it can always be relocated subsequen=
tly if
> > > > > other APIs need to set bias.  On the other hand, if decoupling se=
tting
> > > > > direction and bias is in order then that really should be done no=
w.
> > > > > Can I get an an ACK on that either way?
> > > > >
> > > >
> > > > This is in line with what you did for input. I don't think it shoul=
d
> > > > be decoupled (any particular reason for that? There is none mention=
ed
> > > > in the cover letter), so I propose to leave it as it is in patch 5/=
5.
> > > >
> > >
> > > Wrt decoupling, I was thinking of both input and output, not just out=
put,
> > > though it was the output that got me onto that line of thought as
> > > gpiod_direction_output sets bias, but gpiod_direction_output_raw does=
n't.
> > > That seemed totally arbitrary.
> > >
> > > That lead to thinking that the gpiod_direction_output (and _input) is=
 now
> > > doing more than implied by the name, and by the documentation for tha=
t
> > > matter.  So perhaps it should be split out and promote gpio_set_bias =
to
> > > gpiod_set_bias?  Anyway, that was the line of thought.
> > > The problem there being some callers of gpiod_direction_input already
> > > expect it to set bias, at least on a best effort basis, and they woul=
d
> > > have to be updated to call gpiod_set_bias.
> > >
> >
> > I see. I think that in this case, the _raw variants should stay as
> > simple as possible (hence the name) while the bias *should* be set in
> > the regular gpiod_direction_intput()/output(). For now I don't think
> > we need an exported gpiod_set_bias(), but if someone should request it
> > in the future it will be straightforward to add.
> >
>
> OK.
>
> > > Maybe just update the documentation for exported functions that do se=
t
> > > bias?
> >
> > Sure, sounds good. You can even extend the doc to include other flags
> > these functions handle.
> >
>
> OK to add this later, or does it need to be in this series?
>

Yeah, we can do it later.

> > >
> > > > One more thing - since we all want this to make it for v5.5 - can y=
ou
> > > > make the set config patches part of this series (simply bunch it al=
l
> > > > together)? This will make it easy to review and merge everything.
> > > >
> > >
> > > May as well - I've got it all in the one branch anyway.
> > >
> > > > Thanks in advance and great job!
> > >
> > > I was about to start updating libgpiod to add set_config, after addin=
g
> > > the equivalent to my gpiod library (nearly finished writing the tests
> > > for that), but I'll put all that on the back burner and get v5,
> > > including in the set_config patches, out as soon as I can.
> > >
> >
> > Let me know if you still want to do it and you'll have patches ready
> > before v5.5 is released. Otherwise I can do it myself too if needed.
> >
>
> When does the window close for v5.5?
> I've got an updated series ready - other than the doc updates mentioned
> above.
>

Linus mentioned during the ELCE that this release may take 8 release
candidates, so we should be good, but it would be great to have it in
for-next by the end of this week. But I was actually referring to
related libgpiod changes - in this case I'd like to do a release as
soon as v5.5 is out which will be in around 3 months anyway, so we
have time.

Bart

> Cheers,
> Kent.
