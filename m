Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B49CDC5F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 09:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfJGHbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 03:31:04 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42701 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGHbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 03:31:04 -0400
Received: by mail-ot1-f67.google.com with SMTP id c10so10116501otd.9;
        Mon, 07 Oct 2019 00:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TB5Y9SznZoLk3Cl9+KE4TTX9dqxZSiY5fm75Asj4Mjs=;
        b=P4gta6P4DiTi0D3ddufBT0vxKFwMcR0dfH9IXh+Gb4ytZeKNCD3QUKe2LrNubYvIJ8
         CKDafQ/8cEdrzwvqTt/eZoX7JKwBf+/n9ZjD3tBdBqQt/MN1VeKqzJ+rw3smwt7k5glI
         vf/zr6n1D1ho3qG54XMYyVg9spdC581UE1k3GcuxcHHtgF1669HzmM3+k3HLzORR7TBw
         5C1FYOwaYtFn3GDQ2dH2X6nSHwSNNovZoOh0m1wNRwe2Hg1TZMWK+2ielrek3aXgNGwh
         RZKztPePYPY4PhGt2xGkC3CBK/sc3AVbeQI9tiQOcFHQ/l/vJnFWFf4Z8XA+4MxqDrSA
         /G4w==
X-Gm-Message-State: APjAAAX3n6PJhHFSAUkwxuT/wp9StqIkKIdBtPUF8X112CC2YOCSIiyj
        2GWwr03PVrAPjA77RU2PfPtanUTzsOltHaDAh6k=
X-Google-Smtp-Source: APXvYqwRM7uJwnHvbblrxA3GV3XCD3dOkjpVemwi/jQS/PJ9OScfdocl+T1L6ngeL0/ZvC8rlrJgbk3ER8m6c6VW4zk=
X-Received: by 2002:a9d:6642:: with SMTP id q2mr19868047otm.250.1570433462183;
 Mon, 07 Oct 2019 00:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz> <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 09:30:50 +0200
Message-ID: <CAMuHMdV7syxxtnHEcgFBrf5DLo-M_71tZFWHHQ6kTO=2A1eVhg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

CC MarcZ

On Thu, Oct 3, 2019 at 2:03 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
> Use the dev_name(dev) for the irqc->name so that we get unique names
> when we have multiple instances of this driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

A while ago, Marc Zyngier pointed out that the irq_chip .name field
should contain the device's class name, not the instance's name.
Hence the current code is correct?

See also "[PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent"
(https://lore.kernel.org/lkml/20190607095858.10028-1-geert+renesas@glider.be/)
Note that the irqchip patches in that series have been applied; the gpio
patches haven't been applied yet.

> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -858,7 +858,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>                 struct gpio_irq_chip *girq;
>
>                 irqc = &chip->irqchip;
> -               irqc->name = "bcm-iproc-gpio";
> +               irqc->name = dev_name(dev);
>                 irqc->irq_ack = iproc_gpio_irq_ack;
>                 irqc->irq_mask = iproc_gpio_irq_mask;
>                 irqc->irq_unmask = iproc_gpio_irq_unmask;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
