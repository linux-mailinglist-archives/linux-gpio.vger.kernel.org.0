Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E164B182E01
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 11:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgCLKnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 06:43:13 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38296 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLKnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 06:43:12 -0400
Received: by mail-ua1-f68.google.com with SMTP id y3so1918451uaq.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BgQ1lKYAzrP/ZqvfkvUxViMKhdPH7tv6/C3fxPaFEQY=;
        b=uFc/Rnj7BPhDv4t4FAjhtf6HefM/cUWleVgCwidPMZimPodrl4dJssAP3T3K6129Ms
         X6I248jjt5LmwFQ8caxaAqN1oeFaKo1Ya5dZcoZ3xqA+phWAF1vxDBPkgP2wRUvKtlL6
         L66DL6EanjUby5+HVZ0PScCqDJJwaJ0wr/moWLArnZYtRElQ14X/qJkQKW9+OoW1tm/i
         08Atd1I+leUXC1Dgph8tB7aNcuA+2cZ68rzG3KkpCpRepCoe6dDJa1fn4FYVtnYUsEmj
         Ufg1TYZudMkVkBdxK42xZscarqs2x3+9/FovvHXw4lQwpY50lZsUp6baVvh2k0HznQmr
         4itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BgQ1lKYAzrP/ZqvfkvUxViMKhdPH7tv6/C3fxPaFEQY=;
        b=D3guHsF0rJDL8bxiOrX7u/ndgc4unWUiW6/wso81jthe6rcp+IVMG5wnd+eCly0JtJ
         xRInVWKziqUJgGh2V5YAvMlPi18JlCvaFmqEWaAxYYglyYVjI3PjwKzrW5MNy6JHUj8x
         BHV+wJgJM2e/5W4jD37qFG5mflYKpB5upjdfktWhiiRW2nUVF8tXjLR8qEDvqhNYx55r
         kw0aKDNh9olyE4g9M9qcDVObZs30PllGUkHucOsAIoVEP884SF4ygstjOnxoGBHV2bUI
         wpI/LRxcQuTOmInSCq+vmroLJYud+WEs/KsnEDor5/UN2dn48KLs5jjo2Wb4Q0R9P0yt
         bkOg==
X-Gm-Message-State: ANhLgQ1QLtPpQAVu1Mz5XXlzqu0lcWkZYn11B8plvUNo5KVvORXz5qon
        VQgMKBkWq98HfjEnUsjkczJi/Mh9VCH2KBLpTa80uw==
X-Google-Smtp-Source: ADFU+vteH2YbvQ5WHO+nQE8IL8GqQeob2h6Q9zbcvIMlxnHywyMFpqBtkl374HZeCDIHXJK4gLn7KkvLEmaRcuRp9Rs=
X-Received: by 2002:ab0:5ea9:: with SMTP id y41mr4347432uag.10.1584009791099;
 Thu, 12 Mar 2020 03:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
In-Reply-To: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 11:43:00 +0100
Message-ID: <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Drew Fustini <drew@pdp7.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Drew Fustini <drew@beagleboard.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Sun, Mar 8, 2020 at 2:07 PM Drew Fustini <drew@pdp7.com> wrote:

> I would like the BeagleBone, which has the TI AM3358 SoC, to be able
> to use the bias flags as well.   The AM3358 uses the gpio-omap GPIO
> driver.  However, gpio-omap does not support these flags [8].
>
> Do you have any feedback on whether this is possible to implement?

Do we have a datasheet for this GPIO block somewhere? Should
be the datasheet for the ASIC.

We already have the required .set_config() callback on the OMAP
driver, it's just that it only uses it for debounce.

The driver is a bit convoluted with register offsets in a struct
omap_gpio_reg_offs depending on variant, but if they have
a register for this I'd say just get hacking.

If the GPIO driver is using pin control as back-end you are
looking at something more complex similar to what Intel is
doing inside drivers/pinctrl/intel/pinctrl-intel.c: this driver
is just calling up to gpiochip_generic_config() which will
try to configure the lines behind the GPIO using pin config,
which works if the proper ranges are defined so the
framework can map a GPIO line to a pin control pin.

Yours,
Linus Walleij
