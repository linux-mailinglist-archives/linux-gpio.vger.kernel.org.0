Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0FBEA407
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 20:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfJ3TXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 15:23:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:52394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbfJ3TXG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 15:23:06 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBF7920717;
        Wed, 30 Oct 2019 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572463384;
        bh=3WRdeiCcdfBEmx67tyODlRo3e+fKiyYtZaygD2WUis0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PuXZamAdL9mn1R6N0GRMg7D8L81skP3COiCXcHjjmvhAHyJsR6XxrvxUgnl6HvYqE
         syF5m1wa6/UyZFG6kUTbFdAAuFGKB0z44xaHMNGvlgwWfBqu+XyqQzc1lj6v9CzmLb
         HTSpjk6pvc3UnD355m/bVbsDEBX+XmUCKluSZvwg=
Received: by mail-qt1-f172.google.com with SMTP id u22so4773711qtq.13;
        Wed, 30 Oct 2019 12:23:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWcjldIlvWHfpxFL0bkoM4TLCeJq2o6Xy5OiZ8ur3FQ2R5oibOj
        g/EHKrUxjRHDaeMW3vprnUyGibG/zDRcAWfXKQ==
X-Google-Smtp-Source: APXvYqx54IxM1TwLGqZyjBl3C0NL1bTbORjQfhO/0scZK3ajveG/FOedjTVq2/EVa6f6Wdngzmvh6f2uKQuw21LJqXI=
X-Received: by 2002:a0c:eed0:: with SMTP id h16mr728589qvs.85.1572463383841;
 Wed, 30 Oct 2019 12:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com> <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
 <20191029193440.GA1812@bogus> <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
In-Reply-To: <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 14:22:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJgnYqv1q=wf++5FOX-niRWQ=H9wWYgUKy+z=H933Qraw@mail.gmail.com>
Message-ID: <CAL_JsqJgnYqv1q=wf++5FOX-niRWQ=H9wWYgUKy+z=H933Qraw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828 bindings
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 3:27 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Tue, 2019-10-29 at 14:34 -0500, Rob Herring wrote:
> > On Fri, Oct 25, 2019 at 05:49:17AM +0000, Vaittinen, Matti wrote:
> > > Hello Dan,
> > >
> > > Thanks again for checking this :)
> > >
> > > On Thu, 2019-10-24 at 14:35 -0500, Dan Murphy wrote:
> > > > Matti
> > > >
> > > > On 10/24/19 6:41 AM, Matti Vaittinen wrote:
> > > > > ROHM BD71828 Power management IC integrates 7 buck converters,
> > > > > 7
> > > > > LDOs,
> > > > > a real-time clock (RTC), 3 GPO/regulator control pins, HALL
> > > > > input
> > > > > and a 32.768 kHz clock gate.
> > > > >
> > > > > Document the dt bindings drivers are using.
> > > > >
> > > > > Signed-off-by: Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > ---
> > > > >
> > > > > No changes since v1
> > > > >
> > > > >   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180
> > > > > ++++++++++++++++++
> > > > >   1 file changed, 180 insertions(+)
> > > > >   create mode 100644
> > > > > Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> > > >
> > > > I will let maintainers weigh in here but if this is new this
> > > > should
> > > > probably be in the yaml format to avoid conversion in the future
> > >
> > > Oh... This is new to me. I guess there are reasons for this - but I
> > > must say I am not excited as I have never used yaml for anything.
> > > I'll
> > > do as you suggest and wait for what others have to say :) Thanks
> > > for
> > > pointing this out though.
> >
> > Sorry for your lack of excitement. It could be XML...
>
> Thanks, I appreciate that, apology accepted X-D
>
> > There aren't many MFD examples yet, but there is max77650 in my tree
> > and
> > linux-next.
>
> I looked at the max77650 MFD binding from linux-next. After that I also
> looked some of the generic documents for DT bindings (I know - I should
> have done that earlier and your job had been easier). But all that left
> me "slightly" puzzled. After some further wandering in the virtual
> world I spotted this:
> https://elinux.org/images/6/6b/LPC2018_json-schema_for_Devicetree.pdf
>
> I think this link in some dt-yaml-binding-readme might be helpful.

Presentations bit rot, so I'd rather not. I'd hope that
writing-schema.rst and example-schema.yaml capture what's in the
presentation. What do you think is missing?

> So if I understand this correctly, idea is to convert the dts sources
> to use yaml (right?). This is seen better because more people know
> JSON/YAML than dts format(?) Fair enough. Although some of us know dts
> format decently well but have never used JSON or yaml. I guess dts
> support is not going away though and yaml examples do not seem terribly
> hard at first sight.

No, nothing is changing for .dts files (other than fixing errors the
schemas find). The free form, human readable only prose called binding
documentation is changing to YAML formatted, json-schema vocabulary
binding schema which can be used to validate dts files.

> What comes to binding docs - well, in my eyes (which may be biased)
> writing documentation in anything intended to be interpreted by a
> machine is still a step backwards for a human document reader. Sure
> syntax validation or reviewing is easier if format is machine readable
> - but free text info is more, well, informative (form me at least). I
> for example wouldn't like reading a book written in any script or
> markup language. Nor writing one. It is difficult for me to understand
> the documentation change to yaml, maybe because I am more often using
> the binding docs for composing DT for a device than reviewing them ;)

ICYMI, all the kernel docs are in a markup language now...

Free form descriptions are easier to use because you can put in dts
whatever you want. Nothing is going to check. There's been no shortage
of errors and inconsistencies that we've already found.

You can have as much description and comments as you like (though I'm
trying to cut down on the copy-n-paste genericish 'clock for the
module' type comments).

> Anyways, I guess I'd better either try learning the yaml, figure out
> what are schemas and see how to convert yaml docs to text for nicer
> reading (I assume this is doable) and how to verify yaml binding docs
> are Ok - or quit contributing. No one is forcing me to do this.
> Continuing complaining on this is probably not getting us anywhere so I
> might as well shut up now :/

There is some notion to convert the DT spec to schema and then
generate the spec from the schema. Take properties, their type, and
descriptions and put that back into tables for example. Would love to
have someone work on that. :)

> And Sorry Rob. I am seeing you have been really close to this yaml/JSON
> change so my wondering may be frustrating. I don't intend to be
> disrespectful - I see that you have done huge work with this. I am
> just... ...Slightly set in my ways. Little bit pig-headed and somewhat
> a smart-arse - so I couldn't just let it go without giving out an
> opinion.

Everyone is welcome to their opinion.

Rob
