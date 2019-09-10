Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE0FAE60B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 10:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfIJIvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 04:51:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44774 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfIJIvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 04:51:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so17253189otj.11
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TORtZiXw+gviBY1uqojNwtzUG5Du45WnPV4wu8nw43A=;
        b=FP63dxnYbqidnXC5M+glimtjNBKD/siLT23X23yuuOER2/9MRjpqdmr17EYxW/s6p0
         E+BlJ699H7VMsfwq2N1wqcggLYV4SabdWzY7R+9yPxtI/5t3nmNf5ca2zAEhu1LnVkuB
         djYTbLY1JIMnBRApHzAxKwnWqjP+nN1qESTU3SbZUvPgE9If19AaeeYRC/e77mGKGlHs
         Z8ZBwXsPYqqQJgcLf6S0grCdZJQsRslVL3vSrRDO2qTE8+rlRH1udar3q0c+ncpOXXIv
         4GVPY8w0RyJ4klXWtdtrKObo3MRhX8E73WYW7kEYXbu2xbXOjxHEltwsAL090sa9hSiJ
         ROuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TORtZiXw+gviBY1uqojNwtzUG5Du45WnPV4wu8nw43A=;
        b=EdPxXNe9ao/PBzIOXlUSzRdwDhiZsg6dKSgoGyngVdQeB0FHQwvs5/J90z4+iL4gFZ
         S1FgNFbHZYpNtnURVMmDxW7diW0LsbFv/YUWhL3dDZALv4O2WC3bbZS7fWMg74V93pU1
         5F7IdD0Y3ST/UCmO7KbyiZiLCgzqDWHQJ5wyXU1qoveB4EA90BMj7dkTcka850lQW9x8
         n6Jr3pd4DYRABicf9bVU0AfSO4pxH22erIiRgQsdHZ19tEtajtiq41ejvujH50aMpWuB
         BxA6gUqEgWDagR6Jt9FS9qxe76z7rylibYE2vH+ny8IqdAosOoyosXgNfxyYpCQ7xjIq
         JfTg==
X-Gm-Message-State: APjAAAW1jiYbfpwXhO1O5/S19qUaTpmzy77O6aDSnvLaN6G2zL8HBg4i
        w8q+MrrgnyRe0NE9R7vpSpJCYQeNHC5vBKSjE1WITg==
X-Google-Smtp-Source: APXvYqxAsq9CF/Si2rdwo5vSZgIzEMUPMsKHEsRblYndhdS59/hlsoR7x+5MiowCWiAhLmrRORnRA4H2pVT8BZGTtxI=
X-Received: by 2002:a05:6830:1d4e:: with SMTP id p14mr1451146oth.292.1568105466197;
 Tue, 10 Sep 2019 01:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Sep 2019 10:50:55 +0200
Message-ID: <CAMpxmJVrQ92+ULRrzyN52LwEcdPTuK7OZssZjUcRPRSTBQ=fwg@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: API boundary cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 6 wrz 2019 o 10:45 Geert Uytterhoeven <geert+renesas@glider.be> napisa=
=C5=82(a):
>
>         Hi Linus, Bartosz,
>
> This patch series contains various API boundary cleanups for gpiolib:
>   - The first two patches make two functions private,
>   - The last two patches switch the remaining gpiolib exported functions
>     from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().
>
> After this there is only a single GPIO driver function exported with
> EXPORT_SYMBOL();
>
>     drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq)=
;
>
> I believe this symbol was never used upstream, and may be a relic of the
> original out-of-tree code the htc-egpio was based on.  I don't know if
> there (still) exist out-of-tree users of the symbol.
>
> Thanks for your comments!

All looks good to me. Are you fine with this being picked up after the
v5.4 merge window?

Bart

>
> Geert Uytterhoeven (4):
>   gpio: of: Make of_get_named_gpiod_flags() private
>   gpio: of: Make of_gpio_simple_xlate() private
>   gpio: of: Switch to EXPORT_SYMBOL_GPL()
>   gpio: devres: Switch to EXPORT_SYMBOL_GPL()
>
>  drivers/gpio/gpiolib-devres.c | 28 ++++++++++++++--------------
>  drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
>  drivers/gpio/gpiolib-of.h     |  7 -------
>  include/linux/of_gpio.h       | 11 -----------
>  4 files changed, 22 insertions(+), 40 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
