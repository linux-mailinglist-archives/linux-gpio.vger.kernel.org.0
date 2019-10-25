Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B770E4C02
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 15:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394591AbfJYNYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 09:24:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394578AbfJYNYU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 09:24:20 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E46BF222BD;
        Fri, 25 Oct 2019 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572009859;
        bh=mWAKcl8j7ZnGOrbpPiW78OchysSg/HKo2c9XWvB5EtU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YMIPgc49yX3gYacnLbiWqvug4Q8RWRPmKnZshdGxr5phXajKJn5DxRTt5aAzO5eTo
         hipdnVdMLXV/m1+knse4yLsfK/7ZwgQ7hcwalL44+1/yxnE3P+wtrYeV0/fBz+SJ5X
         ur7b35aj4UvNL7XVjvOu0PG1Fps0K9FG56PNWUdc=
Received: by mail-qk1-f170.google.com with SMTP id u184so1718269qkd.4;
        Fri, 25 Oct 2019 06:24:18 -0700 (PDT)
X-Gm-Message-State: APjAAAV+s4BO2zlbGNDJjc119otuYLo0FcQDc9IrPSvCELAHWY41MXtB
        X7JCjr+eDod8p/eJHTN6OrwpbHFYFBXe9JTVkQ==
X-Google-Smtp-Source: APXvYqzqnjSuL+nQCZRV4ooRoAY+3zZp/h5akD70DbbH7oGFcdnkzZuXx2zJdKpRv9szbVoxI6wymR1ZnJa629mpPss=
X-Received: by 2002:a05:620a:344:: with SMTP id t4mr2680325qkm.393.1572009857854;
 Fri, 25 Oct 2019 06:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com> <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
 <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com> <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
 <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com> <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
 <e9d1c529-90ef-34bf-d893-02a109ba19ba@gmail.com> <c35a2bca83c711bd7b19c8a99798374388705bfc.camel@fi.rohmeurope.com>
 <06b3909a-b3ff-2c0e-d1df-a475a69951ed@gmail.com> <d43d06dbaa0df204fff0194be57d6cd3b832addd.camel@fi.rohmeurope.com>
In-Reply-To: <d43d06dbaa0df204fff0194be57d6cd3b832addd.camel@fi.rohmeurope.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 25 Oct 2019 08:24:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK7fYYdobOrgxFaMOy+uONCV-i0aOiBQ9oOc4OOPLR8cw@mail.gmail.com>
Message-ID: <CAL_JsqK7fYYdobOrgxFaMOy+uONCV-i0aOiBQ9oOc4OOPLR8cw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
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
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 25, 2019 at 2:07 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> Hi Again Jacek,
>
> This has been a nice conversation. I guess I have learned something
> from this all but I think this is no longer going forward too much :)
> I'll cook up second version - where I add LEDs to DT (even if I don't
> see the value for it now). I won't add own compatible for the LED (for
> now) - as it is part of MFD - and I'll add the LEDs also to binding
> docs. I think that will get the attention from Lee/Rob better than the
> LED driver discussion. We can continue discussion there. I hope this is
> Ok to you. (And then just few compulsory notes about my view on your
> replies - after all, I can't let you to have the final say xD - you can
> ignore them or respond just as you like)
>
> On Fri, 2019-10-25 at 00:04 +0200, Jacek Anaszewski wrote:
> > Hi Matti,
> >
> > On 10/24/19 10:15 AM, Vaittinen, Matti wrote:
> > > Hello Jacek,
> > >
> > > On Wed, 2019-10-23 at 23:59 +0200, Jacek Anaszewski wrote:
> > > > On 10/23/19 10:37 AM, Vaittinen, Matti wrote:
> > > > > On Tue, 2019-10-22 at 19:40 +0200, Jacek Anaszewski wrote:
> > > > > > On 10/22/19 2:40 PM, Vaittinen, Matti wrote:
> > > > > > > On Mon, 2019-10-21 at 21:09 +0200, Jacek Anaszewski wrote:
> > > > > > > > On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
> > > > > > > > > Hello Dan,
> > > > > > > > >
> > > > > > > > > Thanks for taking the time to check my driver :) I
> > > > > > > > > truly
> > > > > > > > > appreciate
> > > > > > > > > all
> > > > > > > > > the help!
> > > > > > > > >
> > > > > > > > > A "fundamental question" regarding these review
> > > > > > > > > comments is
> > > > > > > > > whether
> > > > > > > > > I
> > > > > > > > > should add DT entries for these LEDs or not. I thought
> > > > > > > > > I
> > > > > > > > > shouldn't
> > > > > > > > > but
> > > > > > > > > I would like to get a comment from Rob regarding it.
> > > > > > > >
> > > > > > > > If the LED controller is a part of MFD device probed from
> > > > > > > > DT
> > > > > > > > then
> > > > > > > > there is no doubt it should have corresponding DT sub-
> > > > > > > > node.

Agreed.

[...]

> > > Right. Or at first it might be enough (and simplest) to assume that
> > > if
> > > LEDs are used via this driver, then colour for both LEDs is set
> > > explicitly by user-space. I wouldn't try guessing if sibling LED
> > > state
> > > changes to OFF when one LED is turned ON - or if LED states change
> > > to
> > > ON if both are turned OFF. This would require exporting interfaces
> > > from
> > > power-supply driver - and it would still be racy. The thing is that
> > > when both LEDs are on board they are both either under HW or SW
> > > control. So it makes no sense to control only one LED in such case.
> > > Thus I think it is Ok if this LED driver is registering both class
> > > devices at one probe. No need to instantiate own platform devices
> > > for
> > > both of the LEDs.
> >
> > We always register all LEDs originating from the same device in one
> > probe.
> >
>
> Then I see little benefit from of_compatible or leds subnode for MFD
> devices with many LEDs. The driver or core must in any ways parse the
> DT in order to find the sub nodes with information for individual LEDs.
> I don't think that would be much different from just using the MFD node
> as controller node and walking through the MFD child nodes to locate
> LED sub nodes (at least for MFDs with simple LED controller).

The cases for not having child nodes are when you have child nodes
with nothing more than a compatible and possibly provider properties
(e.g. #gpio-cells for gpio providers). If you have other resource
dependencies (e.g. clocks) or data to define (e.g. voltages for
regulators), then child nodes absolutely make sense. Once we have
child nodes, then generally it is easier for every function to be a
child node and not mix the two. I'm sure I have told people
incorrectly to not do child nodes because they define incomplete
bindings.

I would group the led nodes under an led-controller node (with a
compatible). The simple reason is each level only has one
number/address space and you can't mix different ones. You're not
numbering the leds here, but could you (with numbers that correspond
to something in the h/w, not just 0..N)? The other reason is modern
LED bindings define a controller node for the controller and led nodes
for the actual led on the board. While the MFD node could be the
controller node, that gets into mixing.

Rob
