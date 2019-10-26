Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E968CE5A5C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2019 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfJZMIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Oct 2019 08:08:46 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36780 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfJZMIp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Oct 2019 08:08:45 -0400
Received: by mail-il1-f196.google.com with SMTP id s75so4158883ilc.3
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2019 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qU5RsG9SRhmXJxZ/TH2tRPZyE3CCGzpG3S5xb5efR90=;
        b=DKromX0O6ZmA9cX57GdslYVKPtnj0wxATKHsp5RG5xITD4+f5ww87RClBcL3VYjV3g
         Fxb3GsIVYUuC1LxuBzmfKt5WkZdURNJV1x+68JSBka53sQex56WYDAT2bGwio4TjAdbY
         zCcLW6cor4aNhMYRBWiPZO1/LAAsCLC1xBV6ICxJ/f/cdKHZTioi1I1GzLG9t1EdSEG2
         Fmk4Xhtn37kkyaEe+M8H++xnb5M1Q2udbRsdlng6mxVuJKEHIXhVfE39H/7FebzSFX8H
         hPvSF5pxh9jxBym5jYezfmwmdEriEnw0aPBITI8A6iWEnYsJonMK7DwZHk/stqiuu98J
         RiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qU5RsG9SRhmXJxZ/TH2tRPZyE3CCGzpG3S5xb5efR90=;
        b=jbj+P1Gg6hVfe7RkOjOOZHvFdXRfsOreGQhjtAuKNYw2fpDsHyR71bWoJKfFZZyiCR
         XkfFDzWMOuE8+3yrVvs28oUcJ+WnsPP0O8JfZDGmBFV9sluqv17quzCnuwK2XLLLCb0k
         04VFjym1ZR8e3Fnmhoj2qePvICgsAhaThlThWFlmflDANxjgUGPULjFVv88TTJpmnQNf
         8MeR5wttODaGoYfVSbNlqmqVj+z9X07THDup6eRBRrj1vn10OrtRemTzKIHGQ6fLdvNa
         nZgKRtkvXoKlrQP+eQ0zOcW5iccotbSpsORgwCRe0ZxD9B8MwVBut+ZRrwO9r3yk4OPA
         LAQA==
X-Gm-Message-State: APjAAAVsee4W4fJTkrTaCHcsPPQyissMO3i3CtG2Y7hijng4PzsH3+b4
        c0xYOHdRQvZVEOKZsEaM4yW3HhhXnOwnsdgSfDUu3g==
X-Google-Smtp-Source: APXvYqxTDE3btaAOKG4F5dM/Yfw/0hOeG0Hd/8JTh+BW2U92hL3gWmViQq4lVfRN4h0a6JG+CpELrSmx5PL7PNRmjf0=
X-Received: by 2002:a92:9a17:: with SMTP id t23mr10068334ili.40.1572091723726;
 Sat, 26 Oct 2019 05:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be>
In-Reply-To: <20191024122224.11776-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 26 Oct 2019 14:08:33 +0200
Message-ID: <CAMRc=Me9Cc=O6t_3cLW5Ow=-XgurQ1x_RpfHe4Lxhb2QB6_WgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: renesas: Use proper irq_chip name
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 24 pa=C5=BA 2019 o 14:22 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
>         Hi Linus, Bartosz,
>
> Recently, Marc pointed out some common misconceptions w.r.t. the .name
> and .parent_device fields in struct irq_chip.  This patch series fixes
> the names in the Renesas GPIO controller drivers.
>
> Changes compared to v1[*]:
>   - Drop irqchip patches applied to the irqchip tree.
>
> Thanks for applying!
>
> [*] https://lore.kernel.org/linux-renesas-soc/20190607095858.10028-1-geer=
t+renesas@glider.be/
>
> Geert Uytterhoeven (2):
>   gpio: em: Use proper irq_chip name
>   gpio: rcar: Use proper irq_chip name
>
>  drivers/gpio/gpio-em.c   | 2 +-
>  drivers/gpio/gpio-rcar.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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

Both applied, thanks!

Bartosz
