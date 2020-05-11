Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629EB1CD64A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 12:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgEKKSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 06:18:38 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41077 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729294AbgEKKSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 06:18:35 -0400
Received: by mail-oi1-f193.google.com with SMTP id 19so14615110oiy.8;
        Mon, 11 May 2020 03:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhHEh+pNrtrDrMKnU82n0ghqaec/6dzj+ojpD1sC6tU=;
        b=un/cVaLel2W3SxT+qj0wyFwQaFU2JAXahi2YRif47BWsQx0bZ5ArA8gTAbv7/oBil2
         v1UfMY/4kmadVoy6sxrt6aP8Ke0rrALV+44qXqdf0Zki8kNsNcT2+lxmX3YWRPXmcuQR
         BbjOpXkghxF5BGXgJ8eYTyh3OkF6gXD58PeFaqfeaG0s3WQ25+ZRK1q8jPuiSNggzEB3
         LGVzFHxNSSX1yaVsnphUiwGP7+c7hjJlko6A1P0teryGZs7Gj0+CyMfn11yGb51O5c9F
         IkOnlSM7nJpbnoAleIaC7/fFre+NnZzsZlrNHcB7rn1IgmYqS5dUNYWcz7U/V/t8iDiE
         V30g==
X-Gm-Message-State: AGi0PuZzEGSVXZswo2XR8GgvRyEetPbFC2O2M2PcNWkZ+0W/6piuD4GL
        ZvqDgs5aczx+AUvKeWIiu1N3sxOs+xDWArX15LY=
X-Google-Smtp-Source: APiQypLbjyTZbvqRLGoc90pFkCHUbFvz5HgFxZ0FoH+dKrKDX/RlQwLNKA9fzQii+Qv4ryb+mU1sZeCNokwWcDCIukA=
X-Received: by 2002:aca:f541:: with SMTP id t62mr18420359oih.148.1589192313970;
 Mon, 11 May 2020 03:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-4-geert+renesas@glider.be>
 <CACRpkdbN82n3B+Q-QVjB1jLpJAYS19fKukkDXQm3gZsuFFFM_w@mail.gmail.com>
In-Reply-To: <CACRpkdbN82n3B+Q-QVjB1jLpJAYS19fKukkDXQm3gZsuFFFM_w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 12:18:22 +0200
Message-ID: <CAMuHMdXskE8_A4gbFVWfPVdcxBO-CfaMDEehSxGAK_aC0MQ7=A@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] gpiolib: Add support for GPIO lookup by line name
To:     Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Thu, Mar 26, 2020 at 10:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently a GPIO lookup table can only refer to a specific GPIO by a
> > tuple, consisting of a GPIO controller label and a GPIO offset inside
> > the controller.
> >
> > However, a GPIO may also carry a line name, defined by DT or ACPI.
> > If present, the line name is the most use-centric way to refer to a
> > GPIO.  Hence add support for looking up GPIOs by line name.
> >
> > Implement this by reusing the existing gpiod_lookup infrastructure.
> > Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> > that this field can have two meanings, and update the kerneldoc and
> > GPIO_LOOKUP*() macros.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> I kind of like this approach, however there are things here that
> need to be considered: the line name is in no way globally unique,
> and I think there are already quite a few GPIO chips that
> have the same line names assigned for every instance of that
> chip.
>
> gpiochip_set_desc_names() only warns if there is a line with
> the same name on the same gpio_chip.

on a _different_ gpio chip.

> I suppose we need to document that the line name look-up
> will be on a first-come-first-served basis: whatever line
> we find first with this name is what you will get a reference
> to, no matter what chip it is on, and it is possible albeit
> not recommended that some other chip has a line with the
> same name.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
