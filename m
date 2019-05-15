Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE3E1F481
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2019 14:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfEOMfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 May 2019 08:35:38 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:45843 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEOMfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 May 2019 08:35:38 -0400
Received: by mail-ua1-f65.google.com with SMTP id n7so940327uap.12;
        Wed, 15 May 2019 05:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9o/mkjgpJyJBqQ6fjK8kXNYBqmzbn4iRPPC3NTr2Azw=;
        b=kRMGIozTQ7P8X6tgaWcO+4EfLDhFA6u22xzplRfxClzXoL/FfIXbqKrCgKaW2szIdf
         Qs5ttT8PDmGMEgKtDZYFNAfSWvSJCwcARKDfEy3akLGspZdVwajkOYf9WyiS7ERX3kKI
         Y3Wv+e0+nCy97OMal1yU9VPSHnMlijp7YaD+SyoJw6UOaKL01zYDpRYFQd+M8iUkO3v3
         mUi0/+XHoN6hk/gF4hThtq+/b4S2LIdFWwrA5XxABAJtlDB52Mp/FhSh21nEBZQzAwHd
         dIG4uTq2jNGNIcsYh2PAywKmPJvX29qGzs4gbRAitXc8VdqstKF6DTcQQZpGIPKEEUQC
         gmJQ==
X-Gm-Message-State: APjAAAUI6dWmYV8JsVF5AOHeBgL/nOEdMrUNR6IIxmQvPcnqubJr9EKF
        pAd1ORvkWfpen0X9bZdT4vkGtHgCU4LreCfuDleHih78
X-Google-Smtp-Source: APXvYqx/xNXPI3O0J1KWOes/ITJhx1jTJcVpltBi4rT0EG9QNdiAAdMYSN/IA5rS6OiLGAGjy1LhQtcoEklOi/zbZJs=
X-Received: by 2002:ab0:45e9:: with SMTP id u96mr1824377uau.75.1557923736935;
 Wed, 15 May 2019 05:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190513152857.13122-1-geert+renesas@glider.be>
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 14:35:24 +0200
Message-ID: <CAMuHMdW4spsWmcJCpjBHWbKgds-XVo==KWSPvLmrS83-S2aR3Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: sh-pfc: Convert to new non-GPIO helper macros
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

Due to popular demand, I've pushed this (and its dependencies) to
branch topic/sh-pfc-nogp-v1 of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
