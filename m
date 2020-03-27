Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E26196088
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgC0Vhh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:37:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45782 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgC0Vhg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:37:36 -0400
Received: by mail-lf1-f66.google.com with SMTP id v4so9063000lfo.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6P/ugUG8QPN1PLqi6CLq7SxjX8NFnDCuavJA3Wde1E=;
        b=lahDEBVq+V7MEitEv24mEfdDx+ECSXtHN+KA62Gf5ItiJ1T+tDT8IWT4Oy22V9BsXC
         6JaUyn62gDbbeAweC22pKUYqIidnovzsnM7DZS/3dAC/3/rSk5L52uSrG8+ZEpNokRoF
         DAcc3GvLOC/ssSMB8MQ5gqL2f74Gp6tRux0EURwEZRovg6fD33++EMNMJHG8TpO81M7J
         Mt83QcXquqLJVR9ORbRpZm1ECFmS406DJdA7rkOGaLuwywkPfYQtd7G56RMATPaHmnNG
         GJdQYRUgmxyx9hZzmpIXWlpouQK7AOtyGExNg/CAyJqJkZU/svLfvM9MdHzKmMqw3M9X
         2vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6P/ugUG8QPN1PLqi6CLq7SxjX8NFnDCuavJA3Wde1E=;
        b=pHlQs6tL+CkvDYUkiw2maXWa5Ge/gOfHTEgEzoVjJeleAG1kTzxmXkT16OwLwWraef
         Fm8fe6fLwzv4baXDBiu03IGIpeykO7ZAucmNSaTWEHnkzZbCjQM8zuCWsCdCn1FQsy85
         kg/ZuvJ/UQspUqVtAGBsxXudNg9HR9BqbY8JPNTA+5qA/2FugTHzMDPEwneuZVmTkMOG
         uKatvesnNYZ91AuP3s2rS+z+ughRMkkUleDGoAAmi5h84Ohqe0IKf9m3E2ongJ+I3re1
         z/EuLCoMC0rGmm9URsJJYi1m1JbzYUkcZNyBAb8oI66iwhGBR80ADKHfq5AhFKGNvTDU
         yp5w==
X-Gm-Message-State: AGi0PuaAeQogBkAi9Huvy1Xe41Zg3FycvNNm5/g/eBhLXoNnoejvUjMZ
        A/6S9QhnF0BkGX4+QhqYP163w626srWFpepnp3UlHQ==
X-Google-Smtp-Source: APiQypLBRjm8m9TRh5E1Wf02gWdM2GuN6ua450wAQk3DBPj55sqZgue9A3EKHJXEe1wTh5T/OQvRR8bY8YYI7pRonwA=
X-Received: by 2002:a05:6512:6c4:: with SMTP id u4mr806577lff.89.1585345054013;
 Fri, 27 Mar 2020 14:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-5-geert+renesas@glider.be>
In-Reply-To: <20200324135653.6676-5-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:37:22 +0100
Message-ID: <CACRpkda8Uc7fDbV8EsG+EpDGw35-k+9-U7njhaaQVvhY5rwmcg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] gpiolib: Introduce gpiod_set_config()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The GPIO Aggregator will need a method to forward a .set_config() call
> to its parent gpiochip.  This requires obtaining the gpio_chip and
> offset for a given gpio_desc.  While gpiod_to_chip() is public,
> gpio_chip_hwgpio() is not, so there is currently no method to obtain the
> needed GPIO offset parameter.
>
> Hence introduce a public gpiod_set_config() helper, which invokes the
> .set_config() callback through a gpio_desc pointer, like is done for
> most other gpio_chip callbacks.
>
> Rewrite the existing gpiod_set_debounce() helper as a wrapper around
> gpiod_set_config(), to avoid duplication.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6:
>   - New.

Patch applied in preparation for the next kernel cycle
so we get Geert's patch stack down.

Yours,
Linus Walleij
