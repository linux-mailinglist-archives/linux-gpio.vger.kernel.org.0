Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15FD7E5064
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395521AbfJYPsM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 11:48:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395419AbfJYPsL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 11:48:11 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71EA3206DD;
        Fri, 25 Oct 2019 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572018490;
        bh=3iAASSy+lZ90ERSlhjhVjKuBzFsrzimEoOU4y0Rrsf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fCmctIaKRt1tPFbEFPsb8c1it1ktzrOXsAQqLq7lSONFQQNlya7Yqzgosb0gV2ZKZ
         aDYa8A9PF/Xd481OU0MioMO7ruGkwP3/kz7ZBtV4fOP4fr0Zw3Jg9eWMDvxYhAwU3c
         8FQgL9/Rm7MvdTOP2Hcz9lgD06AukuvaKjVQ/ELQ=
Received: by mail-qk1-f173.google.com with SMTP id u184so2192920qkd.4;
        Fri, 25 Oct 2019 08:48:10 -0700 (PDT)
X-Gm-Message-State: APjAAAVfiBPYgCeeci77qjVBy98tNFklNEPekBm4pbrfqGmeCWgfSZP7
        y3wedcO0KR+TS/ByKcx7r9Id4eXE2F7Tozw+4Q==
X-Google-Smtp-Source: APXvYqysvjptChaLFfLF0sa7vWALwkacSeg0QojTdUR0ZCZdRgXGcI6FMohz8x0bf7U1RoHPx4nHPpSv9uBwIJnjMvs=
X-Received: by 2002:a05:620a:12b4:: with SMTP id x20mr3674151qki.254.1572018489448;
 Fri, 25 Oct 2019 08:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com> <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
 <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com> <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
 <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com> <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
 <e9d1c529-90ef-34bf-d893-02a109ba19ba@gmail.com> <c35a2bca83c711bd7b19c8a99798374388705bfc.camel@fi.rohmeurope.com>
 <06b3909a-b3ff-2c0e-d1df-a475a69951ed@gmail.com> <d43d06dbaa0df204fff0194be57d6cd3b832addd.camel@fi.rohmeurope.com>
 <CAL_JsqK7fYYdobOrgxFaMOy+uONCV-i0aOiBQ9oOc4OOPLR8cw@mail.gmail.com> <4fcea7213ae9b3c0de775d1854f8e160ea0b178a.camel@fi.rohmeurope.com>
In-Reply-To: <4fcea7213ae9b3c0de775d1854f8e160ea0b178a.camel@fi.rohmeurope.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 25 Oct 2019 10:47:57 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_4SaVHqZFXhF_J+yqqcjuzEZpxFvxJfzsNpL1xBQijw@mail.gmail.com>
Message-ID: <CAL_Jsq+_4SaVHqZFXhF_J+yqqcjuzEZpxFvxJfzsNpL1xBQijw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 25, 2019 at 9:37 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> Hello Peeps,
>
> On Fri, 2019-10-25 at 08:24 -0500, Rob Herring wrote:
> > On Fri, Oct 25, 2019 at 2:07 AM Vaittinen, Matti
> > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > > Hi Again Jacek,
> > >
> > > This has been a nice conversation. I guess I have learned something
> > > from this all but I think this is no longer going forward too much
> > > :)
> > > I'll cook up second version - where I add LEDs to DT (even if I
> > > don't
> > > see the value for it now). I won't add own compatible for the LED
> > > (for
> > > now) - as it is part of MFD - and I'll add the LEDs also to binding
> > > docs. I think that will get the attention from Lee/Rob better than
> > > the
> > > LED driver discussion. We can continue discussion there. I hope
> > > this is
> > > Ok to you. (And then just few compulsory notes about my view on
> > > your
> > > replies - after all, I can't let you to have the final say xD - you
> > > can
> > > ignore them or respond just as you like)
> > >
> > > On Fri, 2019-10-25 at 00:04 +0200, Jacek Anaszewski wrote:
> > > > Hi Matti,
> > > >
> > > > On 10/24/19 10:15 AM, Vaittinen, Matti wrote:
> > > > > Hello Jacek,
> > > > >
> > > > > On Wed, 2019-10-23 at 23:59 +0200, Jacek Anaszewski wrote:
> > > > > > On 10/23/19 10:37 AM, Vaittinen, Matti wrote:
> > > > > > > On Tue, 2019-10-22 at 19:40 +0200, Jacek Anaszewski wrote:
> > > > > > > > On 10/22/19 2:40 PM, Vaittinen, Matti wrote:
> > > > > > > > > On Mon, 2019-10-21 at 21:09 +0200, Jacek Anaszewski
> > > > > > > > > wrote:
> > > > > > > > > > On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
> > > > > > > > > > > Hello Dan,
> > > > > > > > > > >
> > > > > > > > > > > Thanks for taking the time to check my driver :) I
> > > > > > > > > > > truly
> > > > > > > > > > > appreciate
> > > > > > > > > > > all
> > > > > > > > > > > the help!
> > > > > > > > > > >
> > > > > > > > > > > A "fundamental question" regarding these review
> > > > > > > > > > > comments is
> > > > > > > > > > > whether
> > > > > > > > > > > I
> > > > > > > > > > > should add DT entries for these LEDs or not. I
> > > > > > > > > > > thought
> > > > > > > > > > > I
> > > > > > > > > > > shouldn't
> > > > > > > > > > > but
> > > > > > > > > > > I would like to get a comment from Rob regarding
> > > > > > > > > > > it.
> > > > > > > > > >
> > > > > > > > > > If the LED controller is a part of MFD device probed
> > > > > > > > > > from
> > > > > > > > > > DT
> > > > > > > > > > then
> > > > > > > > > > there is no doubt it should have corresponding DT
> > > > > > > > > > sub-
> > > > > > > > > > node.
> >
> > Agreed.
>
> Ouch. That annoying feeling when you notice you have been wrong...
>
> > [...]
> >
> > > > > Right. Or at first it might be enough (and simplest) to assume
> > > > > that
> > > > > if
> > > > > LEDs are used via this driver, then colour for both LEDs is set
> > > > > explicitly by user-space. I wouldn't try guessing if sibling
> > > > > LED
> > > > > state
> > > > > changes to OFF when one LED is turned ON - or if LED states
> > > > > change
> > > > > to
> > > > > ON if both are turned OFF. This would require exporting
> > > > > interfaces
> > > > > from
> > > > > power-supply driver - and it would still be racy. The thing is
> > > > > that
> > > > > when both LEDs are on board they are both either under HW or SW
> > > > > control. So it makes no sense to control only one LED in such
> > > > > case.
> > > > > Thus I think it is Ok if this LED driver is registering both
> > > > > class
> > > > > devices at one probe. No need to instantiate own platform
> > > > > devices
> > > > > for
> > > > > both of the LEDs.
> > > >
> > > > We always register all LEDs originating from the same device in
> > > > one
> > > > probe.
> > > >
> > >
> > > Then I see little benefit from of_compatible or leds subnode for
> > > MFD
> > > devices with many LEDs. The driver or core must in any ways parse
> > > the
> > > DT in order to find the sub nodes with information for individual
> > > LEDs.
> > > I don't think that would be much different from just using the MFD
> > > node
> > > as controller node and walking through the MFD child nodes to
> > > locate
> > > LED sub nodes (at least for MFDs with simple LED controller).
> >
> > The cases for not having child nodes are when you have child nodes
> > with nothing more than a compatible and possibly provider properties
> > (e.g. #gpio-cells for gpio providers). If you have other resource
> > dependencies (e.g. clocks) or data to define (e.g. voltages for
> > regulators), then child nodes absolutely make sense.
>
> Thanks for telling the reasoning behind. Makes sense.
>
> > Once we have
> > child nodes, then generally it is easier for every function to be a
> > child node and not mix the two. I'm sure I have told people
> > incorrectly to not do child nodes because they define incomplete
> > bindings.
>
> Does this mean that if I add LED controlled node with LED nodes inside
> - then I should actually add sub nodes for clk and GPIO too? I would
> prefer still having the clk provider information in MFD node as adding
> a sub-node for clk would probably require changes in the bd718x7_clk
> driver. (Not big ones but avoidable if clk provider information can
> still dwell in MFD node).

Probably not, if there's an existing structure to follow, then
continue doing that.

> > I would group the led nodes under an led-controller node (with a
> > compatible). The simple reason is each level only has one
> > number/address space and you can't mix different ones. You're not
> > numbering the leds here, but could you (with numbers that correspond
> > to something in the h/w, not just 0..N)?
>
> I don't know what that would be. The LED controller resides in MFD
> device in I2C bus and has no meaningful numbers I can think of. The
> actual LEDs (on my board) are dummy devices and I really don't know how
> to invent meaningfull numbers for them either.

If you have something like "led control registers 1, 2, 3" where 1,2,3
is each LED channel, then use that. Or if the LED supplies (or supply
pins) have some numbering, use that. If there's none of that, then
following standard node names kind of falls apart. '<generic name>-N'
is what I've been defining for some schema.

Rob
