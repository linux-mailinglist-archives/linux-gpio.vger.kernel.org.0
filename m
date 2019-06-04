Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6594734309
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 11:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfFDJU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 05:20:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43307 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfFDJU7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 05:20:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so5369947ljv.10;
        Tue, 04 Jun 2019 02:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shrvH0MPTIPtPrvxwpvqufz6jbMn/DgwchiR9AreY8o=;
        b=nF6rw02PaJIMuAaGTQ1fiaYwAWBkgsbWCpidsXryrE76WE3Im+fkLi34GYineEwEno
         n4edIz7TpDbY5Er5hr1WRBoMFZXFOOwcDynpByh9g2Y98YeLSLGvBeMEg5WX+UmpvjR+
         PxSGUCLVz8xFkhxTNqdBP3thyxSdKMyIWef/VRJYtXtRP8NxsAgyhtjCV6OV44uCr03C
         taP+dBE2ZKNnNoVRWIIJOc0cXoDmMLEJB0OwwhsL5ntw1EcA/AmYrebprrjuIcQo3t0m
         NzjEcClOVzseLXKMucdBFh1GEdJnvNaYWi/xGb1udrbQRz4N9n3M67LTUhbD2g6Ae0yT
         VWEA==
X-Gm-Message-State: APjAAAXD7Kry5gHAUQ3LRRZqH2dPkVdc5+hR0m/0By1yNunZtMs2JaBF
        9dp2OxTUb4PF+t7Q+QiII1AiRcDst/DD2QKgDAM=
X-Google-Smtp-Source: APXvYqx+rrWhbvZY30REEmyxt6mT0DUhc5dVnLYolEzZwzRG0rP0nqr10EM5C403HoW3KHZiv/xhq5BKHRFFudFQicc=
X-Received: by 2002:a2e:2b8d:: with SMTP id r13mr3694725ljr.145.1559640056008;
 Tue, 04 Jun 2019 02:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190513152857.13122-1-geert+renesas@glider.be>
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 11:20:44 +0200
Message-ID: <CAMuHMdXRih8xLFC9DWKNPGwL4yB41JnvRvjxh6TggEcG0gR50A@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: sh-pfc: Convert to new non-GPIO helper macros
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 13, 2019 at 5:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> On many Renesas ARM SoCs, there exist pins that are not associated with
> a GPIO port, but still need configuration (e.g. drive strength or
> pull-up).  While pins with GPIO functionality are indexed by their
> GPIO number, no such number exists for non-GPIO pins.  Hence for the
> latter, the pin control driver uses numbers outside the GPIO number
> space, derived from the row and column numbers of the physical pins.
>
> For R-Car H3 (and later M3-W and M3-N), the choice was made to use the
> SiP (System-in-Package, i.e. SoC + RAM + HyperFlash in a BGA package)
> physical pin numbers, as the SiP was what was mounted on the
> Salvator-X(S) and ULCB development boards available at that time.
>
> In hindsight, it would have been better to settle on the SoC physical
> pin numbers, though: the pin control driver for R-Car M3-W was reused
> for the RZ/G2M SoC, which is only available as an SoC, not SiP, thus
> making it hard to match the driver with the documentation.
>
> But even for SoCs there can be confusion: several SoCs are available in
> multiple packages, with the same or different number of pins, leading to
> different pin numberings.
>
> As this numbering is used only internal to the driver, and pin control
> configuration from DT refers to these pins by signal name, not pin
> number (usually, see exceptions below[*]), I started wondering if we
> could get rid of the SoC/SiP pin numbers instead.  As the actual numbers
> don't matter, all that is needed for the driver is a unique number for
> each pin.
>
> Hence this patch series converts the affected drivers to use new macros
> that allow to describe pins without GPIO functionality, and refer to
> them by auto-generated symbolic enum values, similar in spirit to the
> existing scheme for handling pins with GPIO functionality.
>
> This series consists of three parts:
>   - Patch 1 introduces new macros to describe and handle pins without
>     GPIO functionality,
>   - Patches 2-10 convert the pin control drivers for the individual SoCs
>     to use the new macros,
>   - Patch 11 removes the now unused old macros.
>
> There should be no functional changes induced by this patch series,
> which has been tested on Salvator-X(S) (with R-Car H3 ES1.0 and ES2.0,
> M3-W, and M3-N), Ebisu (R-Car E3), and KZM-A9-GT (SH-Mobile AG5).
>
> [*] The user-visible names of pins without GPIO functionality are based
>     on pin numbers (e.g. "B25") instead of signal names ("CLKOUT") on
>     EMMA Mobile EV2, R-Car M1A, R-Car H2, and SH-Mobile AG5.
>     I didn't change these to preserve DT backwards compatibility.

Queueing in sh-pfc-for-v5.3.

> The "name" parameters of the PIN_NOGP_CFG() and PIN_NOGP() macros could
> be removed, if these macros would generate the names from the "pin"
> parameters.  However, that would:
>   1. Require replacing the "#" suffices in pin names for active-low
>      signals by "_N",
>      R-Car H3/M3-W/M3-N use a "#" suffix, R-Car E3 use a "_N" suffix.
>   2. Replace the names based on pin numbers on older SoCs by signal
>      names.
> Both changes could affect DT backwards compatibility.  None of these are
> currently used in (upstream) DTS files, though.
> Do you think it would be worthwhile to make this consistent?

We can still break backwards compatibility later ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
