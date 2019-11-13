Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFD4FB5E9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 18:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfKMRGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 12:06:39 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41946 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbfKMRGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 12:06:38 -0500
Received: by mail-lf1-f66.google.com with SMTP id j14so2560484lfb.8
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 09:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YUGF3lpYgO9cloOjHxsuyc+u/ViuA1RPV0SW81a51p8=;
        b=IJIqQghhZIc7LcLbEwUqf+yG40VtSG/n49YzgeYHcf7KyekEWWFTOKEzfYKUOJc2jD
         R7uC2QjEtNMsARz9qly8kXRt/ZZiKRZFB09TEfOFHt9IlEoDrn52FFpP6VBbDbG9D4a2
         LHO+SENLr3b6C5+rQHvAChig7eek+mhi5Fuems3u5+qAA9QYHjXC7WS4epoVrrna/Bji
         ub9W1mOHkfoJRHXEXleUZSJ5esJCOc553K2wOH6JCmTNsuXdMZsTUuGRkmR++BotgCiZ
         mJVuZY4wwnl2YPBV/LCzRTxSgHTWzoVPnmN126pvhdlBgRGYTDbpG4QZfMuBl4rQYPod
         T/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YUGF3lpYgO9cloOjHxsuyc+u/ViuA1RPV0SW81a51p8=;
        b=Dg+P/cvRVZExjLetsh5mWwy4LuvqqeI8e1OP4W6J8ZGa6dHFTS4iH4Bm0HyRWF/zPV
         Als/EHQv/9/k7DC5UE/EhVrYcdq9yHXyKzsQvetha3cdwvsYOy9BypHCjgj1UT3HopmA
         +R5Eh+i3OF63CVJFl07awYm2A0nAMMUVSMV50VlW3e2wsd8XdLkiL23zykCqS/AqLHka
         nwlxSH8fibfiif54qSj9cIAFb7HeSHSnadLbpCVrTAeel2QD5Tp0VpyEQ+yP1FJwi5I+
         GUn2C+87pyrn/DTYy9JBhFrJggFxnA4+Gjs3OAyTDB6Wnab5NbP06o+xnleHHBJPd0sk
         4GXA==
X-Gm-Message-State: APjAAAXHFbSeuEhkyu4gpZc3EH20pZIZk5EbxhkzNjTpwQsf2RkVWGC7
        PB7OEKEajPw336kUMIHvrrRLhwfO68Btfv1xCI15tQ==
X-Google-Smtp-Source: APXvYqzC+Vh388YW3kxl3FCM93yogKwNCSplmHzAV1zL26+ogaBhxbpWxYMKbiKJu8VyczKRX/qX4SBexvsxIKmXtP4=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr3268410lfn.86.1573664796067;
 Wed, 13 Nov 2019 09:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20191030114530.872-1-peter.ujfalusi@ti.com> <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
 <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com>
In-Reply-To: <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 18:06:23 +0100
Message-ID: <CACRpkdZ-qf3OKAxsoj+36V_N6Y_gFte1LHM+66OqekXBAWxsVA@mail.gmail.com>
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 8, 2019 at 12:20 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:

> To start with I would let GPIO core to allow requesting the same GPIO
> line by multiple consumers all the time.

It already allows that with GPIOD_FLAGS_BIT_NONEXCLUSIVE.

> If the flags for the gpio_request does not contain
> GPIOD_FLAGS_BIT_NONEXCLUSIVE (probably we can have another define for
> BIT(4) as GPIOD_FLAGS_BIT_MIGHT_BE_SHARED?) then print with dev_warn()
> to get the attention of the developer that all users of the shared GPIO
> line must be checked and change the current dev_info() to dev_dbg() when
> the flag is provided.

We already have that. Unless all users request it with the same
GPIOD_FLAGS_BIT_NONEXCLUSIVE they will simply fail,
it is an excellent warning since it creates a strict semantic
requirement for all participating consumer to explicitly specify
if they want to share a line.

Adding a GPIOD_FLAGS_BIT_MIGHT_BE_SHARED with some
soft semantics sort of allowing deviant nonstrict behavior seems
like a real bad idea to me, it will likely create all kind of ambiguities
we cannot foresee.

> When the consumer drivers are checked (and modified if needed) that they
> behave OK in this situation we can snap the
> GPIOD_FLAGS_BIT_MIGHT_BE_SHARED to silence the warning.

I have burnt myself a bit on "let's poke in this transitional
thing that I promise to remove later" and that later never
happens so I'd say don't do that.

> gpiod_deassert() would be equivalent to Philipp's
> gpiod_politely_suggest_value()

I don't intuitively understand the semantics of these calls.
Consider Rusty Russells API design manifesto:
http://sweng.the-davies.net/Home/rustys-api-design-manifesto

> Not sure how the core would refcount things, but to align with what Rob
> was saying about the misleading API naming:
> gpiod_set_value(priv->en_gpio, 1/0) against the DT's
> GPIO_ACTIVE_HIGH/LOW of the line's active state we might want to have:
> gpiod_assert(priv->en_gpio);
> gpiod_deassert(priv->en_gpio);

This is what gpiod_set_value() already does today in a way
just name
gpiod_set_value() -> gpio_set_asserted() and change
the second argument to a bool named "asserted".

It seems like a totally different and entirely syntactic problem
separate from the reset business you're trying to solve?

We had this discussion before this week and yeah, if we
historically named the logical levels on the line "asserted"
and "deasserted" everywhere it would be great.

It is up to someone driving the change and changing it
everywhere in that case. Preferably with a semantic
coccinelle patch or sed script since it is purely
syntactic, then plan where and when to
run that. Then do that first, wait a kernel cycle and scoop up
any fallout and leftovers and then start the next thing.

> Basically assert would set the level to the active state defined by the
> DT.

Or ACPI. Or machine descriptor tables. I suppose.
Doing APIs becomes generic, the suggestion I had
above was more like doing something like detecting
a shared line *specifically* for device tree and nothing
else and handle it in gpiolib-of.c but maybe that is not
possible.

> Gradually drivers can be moved to this API pair from gpiod_set_value()
> when it makes sense.

The problem I have right now as subsystem maintainer is people
starting things like that and never finishing them.

If you wanna do this I suggest a fix it everywhere in one swift stroke
approach with broad buy-in from everyone-approach or fail totally.
We have too many in-transit API changes.

> The current gpiod_set_* would operate like as it is right now by not
> asking politely a level, whatever it is.
>
> Hrm, probably both gpiod_assert() and gpiod_deassert() should be polite
> when asking for level change?

These APIs really need names that can be understood right off
and they should be compile-time optional (a Kconfig option) so
that drivers that really need them can select to have them
explicitly.

> If all consumers of the shared line is using gpiod_assert/deassert, then
> the core should 'protect' the raw level of the gpiod_assert() calls.
>
> At the end we will see drivers converted to assert/deassert API when a
> developer faces issues that they use shared GPIO line on a board.

> Another thing is that currently gpio core does not have refcounting and
> most of the client drivers treat it like that.

Notably all the drivers specifying GPIOD_FLAGS_BIT_NONEXCLUSIVE
does not treat it like that and that is why they specify that
flag. All regulators, I think.

> It is perfectly fine to
> gpiod_get(priv->en_gpio,1);
> gpiod_get(priv->en_gpio,1);
> gpiod_get(priv->en_gpio,1);
> gpiod_get(priv->en_gpio,0);

I guess you mean gpiod_set()

> at the last call the GPIO value is going to be set to 0 no matter if it
> was set to 1 three times prior, but I guess this can be worked out when
> the driver(s) are converted to assert/deassert.

I don't understand why that would not be allowed?

Again I guess not really related to the original problem,
so if you want to work on that it can be done in isolation.

To the overall question of a refcounting GPIO API:

OK to add a new API like that I would say first convert the
regulators to use them so we have a strong buy-in from a
subsystem that already does this. That way we can get rid of
the existing GPIOD_FLAGS_BIT_NONEXCLUSIVE and pull
the handling of shared GPIO lines into gpiolib using these
new APIs.

I'm all for this.

But the general usability needs to be proven.
It is not a very huge task:
 git grep BIT_NONEXCLUSIVE |wc -l
24

24 occurrences in the whole kernel.

If the suggested API doesn't fit regulators as well it is dead
in the water. Then the usecase is likely specific to resets,
and what you would need to do is rather improve the
available semantics in the reset subsystem.

So begin with creating a way to pull the shared handling of
regulators into gpiolib with these clearly cut semantics
delete the NONEXCLUSIVE thing and then when you are
done with that exploit the same
infrastructure for GPIO reset.

Yours,
Linus Walleij
