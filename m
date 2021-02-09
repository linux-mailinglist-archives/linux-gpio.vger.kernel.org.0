Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFDE3150EA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhBINxD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:53:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:48398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231874AbhBINvp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 08:51:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 803FA64EEE;
        Tue,  9 Feb 2021 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612878664;
        bh=0hwOj+12J6Ypx4B1kz3p1bMsshTrMiayq1kwo7nbC/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g7dSUvxHkI1WtzkIAld7dHXvKRwNM7+FHpKAmh6lYzPA3tO+HOUiHbcpzcxIeTDrS
         L+5NgY/jdBdWAKzXCO/yXREpKTE3WNEomuVGDwiodUXjk0t5O8cmUJL5UA54INj4Mr
         AMAJF+ItKme5LuMeGL3kge+WmebMFjs+kyhCrq60N1PRSwuDc4Xcn7dL//O9ltygfy
         YKo+8ne4Vga1D8ZknDOs2IMYn1CRwTRuD1O3MYl6xb0VkICr8kWpw8vtBmnAL2Tf65
         ktTUQJRG5//S32rgiEKJkPNiuGSTTL74RrXehZw8iVbUXLNcfwerPJbXrerFUOvuR6
         o2L2J/j7NGSWA==
Received: by mail-qt1-f171.google.com with SMTP id w20so12953588qta.0;
        Tue, 09 Feb 2021 05:51:04 -0800 (PST)
X-Gm-Message-State: AOAM530MgceseAO1bmMKoPvRLXX6KOvHADgbQr2upVHZjwyToOB/fV2q
        mAG+CpcLhlMU5me/s1Yu5yz7v0Kq4uA9XYRQYA==
X-Google-Smtp-Source: ABdhPJzpsae26OkwoIy2nrHJJjzyWoEWmigexX9s/QckxKzoVk7hJ7rWxROznLXeo2XbpJpy6FKj2O+gZWrofmFQYy8=
X-Received: by 2002:a05:622a:488:: with SMTP id p8mr19368445qtx.137.1612878663486;
 Tue, 09 Feb 2021 05:51:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <950a87e680822ab6457ff95bba96730fed93e14d.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <20210209022450.GA2546257@robh.at.kernel.org> <0534345fdba452baefed4ad740a51d394b2ac423.camel@fi.rohmeurope.com>
In-Reply-To: <0534345fdba452baefed4ad740a51d394b2ac423.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 9 Feb 2021 07:50:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJXWkBJKPYm0SwWp03pYbwXUBziBF5B5nZ1tX8TnK7W7g@mail.gmail.com>
Message-ID: <CAL_JsqJXWkBJKPYm0SwWp03pYbwXUBziBF5B5nZ1tX8TnK7W7g@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 7:10 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> Hello Again Rob,
>
> And thanks for reviewing the bindings!
>
> On Mon, 2021-02-08 at 20:24 -0600, Rob Herring wrote:
> > On Tue, Jan 19, 2021 at 09:17:09AM +0200, Matti Vaittinen wrote:
> > > Add binding documentation for regulators on ROHM BD71815 PMIC.
> > > 5 bucks, 7 LDOs and a boost for LED.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
>
> snip
>
> > > +
> > > +      rohm,dvs-run-voltage:
> >
> > Use standard unit suffix.
> >
> > > +        description:
> > > +          PMIC "RUN" state voltage in uV when PMIC HW states are
> > > used. See
> > > +          comments below for bucks/LDOs which support this. 0
> > > means
> > > +          regulator should be disabled at RUN state.
> > > +        $ref: "/schemas/types.yaml#/definitions/uint32"
> >
> > And then drop this.
>
> Quote from v1 review:
>
> > > > > > > +      rohm,dvs-run-voltage:
> > > > > >
> > > > > > These should have a unit suffix.
> > > > >
> > > > > I know but these are existing properties. I'd like to re-use
> them
> > > > > as
> > > > > they have exported parser helpers - and I am unsure what kind
> of
> > > > > breakages changing them would cause. (The BD71837/BD71847 which
> > > > > introduced these properties are one of the PMICs which are
> pretty
> > > > > widely used.)
> > > >
> > > > Okay. Hopefully I remember next time I see this...
> > >
> > > Actually, I think I can add support for rohm,dvs-run-microvolt and
> > > fellows to these same helpers so new devices can use appropriately
> > > named properties. That would mean there is duplicate properties for
> > > same purpose - but maybe it allows us to eventually deprecate the
> old
> > > ones... Which of these options would you prefer?
> >
> > Just keep the existing ones.
>
> Seem you predicted this XD If you still think it's Ok to keep the
> existing ones, then I'll take this an ack, Ok?

Ah right,

Reviewed-by: Rob Herring <robh@kernel.org>
