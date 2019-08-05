Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9256B817F6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHELPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:15:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44052 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHELPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:15:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so78924952ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGr0xA8JEl2e/6USwmFNKsbHjHR7X1sVgQcCQGWYv8Y=;
        b=YLvziolMR8SFAJYOdNjY7uLutlNMxy1MQStmoDepQBtRstEAvIB3ZqUKy1ukq5a2Ve
         EuqJi4cpQNr89OwB8ZSXqP29QFqMoFr2Zwq/Qbv7H0wcnnpWC5S2kbdDD9WXW/mecKud
         aSRPWiqLJWE6BMhMIBmiUwN14eBGSI/GW7N/hajL4+0K4TAcver+qvEGqk1PT4jWqLDh
         r07GRNqHkjiynrNa85vBmEaeB8THs7oLEH9BYQqOL3WwzOtzcYq452rIsu3gcd9GFpE4
         L/PiqWftKPDdwNWB9+iUV0moER9+5x00cqTpR22JbmlJGnFY4nZ9SEH1LwW1YJjogpzV
         WZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGr0xA8JEl2e/6USwmFNKsbHjHR7X1sVgQcCQGWYv8Y=;
        b=JJxcfHayF9d4OUajDJhy0nvsy2FbANwv8H4zdHm/6hMs4JygLDW47yCYpASaN/E7Tt
         aqpZn8YmG8s+JEa25NnigUFxoyWmT/l8HOFa1szQHVvrMChDXFkJ9/hgG2xzUjX0Qt/i
         ahGAfWlU/JyVbuwoQ0UeH7+WoSf2TPthErmujQeRMaFVhaWIjN9AvNfbuCYuMwiiB2ec
         hxIVgDg7Pt7s7CkSooLc7ieUIOPLKtJopMw8qCR3jUV/IMKuIzHpuqHjXV9m3pBlmHNQ
         KkVBKC8ktXVuclrT70dP2zcouI6RxxcbXrsPxQD76lS5hpH3mPwcMmdzk6tnb5ueDMBy
         oKEw==
X-Gm-Message-State: APjAAAWuxKNGQtoIytuikY0MZEPj8aBdQFJIXi8m2xB3XPc5/OrUPnEr
        DggffaFz0jynunDUiAJaKJce1RvGd37VD18goXKqmw==
X-Google-Smtp-Source: APXvYqwyOHev2kwtKRkTrXonBehoWOpkuhbV4VOfFFqftGkBPMVZ2vUozHklyIOANqaE/5vOTVHN6PvDoLaqeXsq7Jw=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9839259ljg.62.1565003713214;
 Mon, 05 Aug 2019 04:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
 <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com> <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
 <f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com>
In-Reply-To: <f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:15:01 +0200
Message-ID: <CACRpkdZ+vXG-mGjn0Tt5gyGowAuxiCSQNdjEPGTP9qj23CwkSw@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 10, 2019 at 10:28 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
> On 09/07/19 9:38 PM, Rob Herring wrote:

> >> This device tree binding models gpio inverters in the device tree to properly describe the hardware.
> >
> > We already define the active state of GPIOs in the consumers. If
> > there's an inverter in the middle, the consumer active state is simply
> > inverted. I don't agree that that is a hack as Linus said without some
> > reasoning why an inverter needs to be modeled in DT. Anything about
> > what 'userspace' needs is not a reason. That's a Linux thing that has
> > little to do with hardware description.

There is some level of ambition here which is inherently a bit fuzzy
around the edges. ("How long is the coast of Britain?" comes to mind.)

Surely the intention of device tree is not to recreate the schematic
in all detail. What we want is a model of the hardware that will
suffice for the operating system usecases.

But sometimes the DTS files will become confusing: why is this
component using GPIO_ACTIVE_LOW when another system
doesn't have that flag? If there is an explicit inverter, the
DTS gets more readable for a human.

But arguable that is case for adding inverters as syntactic
sugar in the DTS compiler instead...

> Yes we are talking about the hardware level inversions here.
> The usecase is for those without the gpio consumer driver.
> The usecase started with the concept of allowing an abstraction
> of the underlying hardware for the userland controlling program
> such that this program does not care whether the GPIO lines
> are inverted or not physically. In other words, a single userland
> controlling program can work unmodified across a variety of
> hardware platforms with the device tree mapping the logical
> to physical relationship of the GPIO hardware.
> I totally understand anything about what 'userspace' needs is
> not a reason, but this is not restricted to userspace alone as
> kernel drivers may need this just as much. Also we are
> just modelling/describing the hardware state in the device tree.

The kernel also has a need to model inverters and it has come
up from time to time, but I don't remember these instances
right off the top of my head.

I am not sure userspace needs are of zero concerns either.

Sure, for anything reimplementing what I have listed in
Documentation/driver-api/gpio/drivers-on-gpio.rst
it is just abuse of the ABI, but things like industrial control
systems and other one-offs have this need to run the
same binary unmodified for measuring the trigger level
of water in some tank or so, they can't create kernel
drivers for that kind of stuff.

Yours,
Linus Walleij
