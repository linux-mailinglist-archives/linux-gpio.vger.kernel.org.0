Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E969EC3FC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 14:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKANqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 09:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727296AbfKANqV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Nov 2019 09:46:21 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C43E6217D9;
        Fri,  1 Nov 2019 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572615979;
        bh=lswMlSOEv3IVKL2o6g/0/MZB83V2bKNcQKcLhOteMKY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2VkCgmkJqOKWH5d+9KDukIcRTAHgjVukLo7+WnDE3TtykYaRb7rHNveONlNIa8z7C
         Wvf1s2hGqg8xK0DzjTHvWERd5B6QiJWEpQb02QETpjyRKih31rBLTX7nsrqGZryAfR
         nhqGnY7r7catGAEwdtg/1KASZ0QhIN/rBtzM7asA=
Received: by mail-qt1-f182.google.com with SMTP id g50so13011584qtb.4;
        Fri, 01 Nov 2019 06:46:19 -0700 (PDT)
X-Gm-Message-State: APjAAAWegAhA0MSmZ56hns4n8acGINgkS5bridDXXvlZhRaj0c6Ie/jc
        HWSteslGUTa/Kp8rUhF6fL4v6jMTPkJM0eM0PA==
X-Google-Smtp-Source: APXvYqzSxs3/lKPGNsJo7QmVk87af0sBuK78lFCb7LPwSTyRxmDlUk2yWUVGBizpA0SlPdiVCwhtvME32ugnV3l7tjA=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr84256qtn.300.1572615978901;
 Fri, 01 Nov 2019 06:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191030120440.3699-1-peter.ujfalusi@ti.com> <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com> <20191030141736.GN4568@sirena.org.uk>
 <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com> <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
 <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com>
In-Reply-To: <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 1 Nov 2019 08:46:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
Message-ID: <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 3:00 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrot=
e:
>
>
>
> On 30/10/2019 20.49, Rob Herring wrote:
> > On Wed, Oct 30, 2019 at 9:30 AM Peter Ujfalusi <peter.ujfalusi@ti.com> =
wrote:
> >>
> >>
> >>
> >> On 30/10/2019 16.17, Mark Brown wrote:
> >>> On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
> >>>> On 30/10/2019 15.12, Rob Herring wrote:
> >>>
> >>>>> Why can't we just add a shared flag like we have for interrupts?
> >>>>> Effectively, we have that for resets too, it's just hardcoded in th=
e
> >>>>> the drivers.
> >>>
> >>>> This would be kind of the same thing what the
> >>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
> >>>> fixed-regulators afaik.
> >>>
> >>> The theory with that was that any usage of this would need the
> >>> higher level code using the GPIO to cooperate so they didn't step
> >>> on each other's toes so the GPIO code should just punt to it.
> >>
> >> But from the client driver point of view a GPIO is still GPIO and if t=
he
> >> components are unrelated then it is hard to patch things together from
> >> the top.
> >
> > You can't escape a driver being aware. If a driver depends on that
> > GPIO to actually be set to states the driver says, then it can't be
> > guaranteed to work. For example, maybe the driver assumes the device
> > is in reset state after toggling reset and doesn't work if not in
> > reset state. The driver has to be aware no matter what you do in DT.
>
> That's true for some device, but it is also true that some can not
> tolerate being reset without them knowing it.

You mean a reset when the driver is not loaded would not work? How
could that ever work? I don't think you can have any reset control in
the drivers in that case.

> If all users of the shared GPIO have full control over it then they can
> just toggle it whatever way they want. How would a regulator, codec,
> amplifier would negotiate on what to do with the shared GPIO?
>
> Another not uncommon setup is when the two components needs different lev=
el:
> C1: ENABLE is high active
> C2: RESET is high active
>
> To enable C1, the GPIO should be high. To enable C2 the GPIO must be low.
> In the board one of the branch of the shared GPIO needs (and have) a
> logic inverter.
>
> If they both control the same GPIO then they must have requested it with
> different GPIO_ACTIVE_ since the drivers are written according to chip
> spec, so C1 sets the GPIO to 1, C2 sets it to 0, the inversion for one
> of them must happen in gpio core, right?

No, drivers are written to set the state to active/inactive. The DT
GPIO_ACTIVE_ flags can depend on an inverter being present (BTW, there
was a recent attempt to do an inverter binding).


> It should be possible to add pass-through mode for gpio-shared so that
> all requests would propagate to the root GPIO if that's what needed for
> some setups.
>
> That way the gpio-shared would nicely handle the GPIO inversions, would
> be able to handle cases to avoid unwanted reset/enable of components or
> allow components to be ninja-reset.

What does ninja-reset mean?

> I think it would be possible to add gpiod_is_shared(struct gpio_desc
> *desc) so users can check if the GPIO is shared - it would only return
> true if the gpio-shared is not in pass-through mode so they can know
> that the state they see on their gpio desc is not necessary matching
> with reality.
> Probably another gpiod_shared_get_root_value() to fetch the root's state?
>
> I intentionally not returning that in the driver as clients might skip a
> gpio_set_value() seeing that the GPIO line is already in a state they
> would want it, but that would not register their needs for the level.
>
> - P=C3=A9ter
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
