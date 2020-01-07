Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B597B1320B7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 08:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgAGHvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 02:51:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40154 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgAGHvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 02:51:25 -0500
Received: by mail-ot1-f66.google.com with SMTP id w21so67504781otj.7;
        Mon, 06 Jan 2020 23:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IhDjpeV2ZD5b67TQjXpRRWA8ieXAlI0j5cPvLS0Mz9w=;
        b=LNVH4hNZ2mzsBrhmRO//uoQK+g/C5YSHWasMW1Fg2PwcclJMLQmNcVguQwtoStWmQO
         6VxeFVM0qDT3f2GRe2XMsXrKca9P7nXNAUCKa9Noe/LM3JQdvPGfsHA1Zrv9vBdlGVbi
         MOd4bQTZcpKup/5hQIRMdsNzDDB4fG1bmlGANMbuhnA6GIZHtWhZQfSC7oKx5mcmfhJl
         Rw0q+m8PjTIW7xhO61F4FKIDPVCQNr+U0iqgOtiFURn+H4uGgOMkM1JG4KffrR1suv+P
         JM/XgvPmx7ZuQnl12RP/yE0s9V6MJjkMHCGaGhlVRpV5gIbO2P3QTKHDIcpvZdn/l62M
         dpcw==
X-Gm-Message-State: APjAAAUGG8+4Or23tijj77lKmB2NNzSmPqjIKNd7P/sy0O1tC0jRuaeA
        EL9w+pgxnWb0+LaWVFT3e0PZ1d4Ku98wNclqvxE6SA==
X-Google-Smtp-Source: APXvYqyJZroCNEtajEIJCodckxBdAdM83feZCCmglDsINwRAXWGxOmnY7X7wSdV+Bv1DzlQMRl4MuLaQp3hEH4oIys8=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr112915400otf.107.1578383484352;
 Mon, 06 Jan 2020 23:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be> <db13664e-f01a-5492-942b-f021f1bbe4e2@gmail.com>
In-Reply-To: <db13664e-f01a-5492-942b-f021f1bbe4e2@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 08:51:13 +0100
Message-ID: <CAMuHMdXuGf71whvtRsaDfoaCnCj+CrTWhhsQ0H3sGsQu7hMtfg@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Frank,

On Tue, Jan 7, 2020 at 12:34 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
> > As GPIO hogs are configured at GPIO controller initialization time,
> > adding/removing GPIO hogs in Device Tree overlays currently does not
> > work.  Hence this patch series adds support for that, by registering an
> > of_reconfig notifier, as is already done for platform, i2c, and SPI
> > devices.
> >
> > Perhaps this would be better served through a pinctrl-gpio driver?
> > Pinctrl is already working fine with DT overlays, as the pinctrl-*
> > properties are part of the slave device node, and thus looked up at
> > slave device node attachment time, not at pin controller initialization
> > time.
> >
> > In my particular use case (talking to SPI devices connected to a PMOD
> > connector on the RSK+RZA1 development board), the GPIO performs board
> > level muxing of a.o. the SPI MOSI/MISO/SCK signals.  Hence the hog
> > really needs to be active only while talking to the SPI device, so the
> > muxing could (in theory) be done upon demand.
> > But how to describe that in DT, and implement it (using Runtime PM?)?
>
> I'm trying to understand the use case.  I can easily imagine two cases:
>
>   (1) want to configure the GPIO to be able to use the SPI bus sometimes,
>       but configure the GPIO differently when not using the SPI bus
>
>   (2) want to describe a device on the SPI bus in an overlay, thus
>       also needing to describe the associate gpio hog node in the
>       same overlay
>
> For use case (2), the proposed patch seems to be a good solution.
>
> For use case (1), this is a case of trying to use devicetree as a
> way to control configuration instead of describing the hardware.
> In this case, Bartosz' reply may indicate the way forward.
>
> I'll assume use case (2) for patch comments.

Yes, my main interest is use case (2).
I have no plans to pursue use case (1).

However, I have some more comments and questions for use case (1).
Before you can control configuration, you have to describe the hardware.
Hence isn't that a job for DT?
Furthermore, I'd like you to step back and answer the following question:
what is the difference between a GPIO serving as a chip select for an
SPI slave, and a GPIO controlling board level muxing?  In both cases the
GPIO controls to which hardware other signals are routed, and both may
be changed at runtime.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
