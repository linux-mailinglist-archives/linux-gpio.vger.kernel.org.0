Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D511F1320A7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 08:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgAGHqZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 7 Jan 2020 02:46:25 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33706 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgAGHqY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 02:46:24 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so53444588otp.0;
        Mon, 06 Jan 2020 23:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iXV+laPsabNEeQDfZldsT+auKzTRBW/prszvDNqd6Fs=;
        b=pCfKxjODwfC8BwpTtQLuOxyMufZqcfWu/IFOL1cUbBrNEH0RPJZIoQ5W153ODpZoCk
         YNhBce1Hl8T+KdXJvPAoJHo5T1dXph8jBalP7HWaxl5t7ry92vHR9tK7sLOxct+Uz+i/
         rEzBQi8eed9yQr/Zp/HbOj7rX/1c5VZeJVLlx3EYstZMLWvUm7YnUj5a2NH5e2zGwbnL
         GKTgaUj6ruYrmXhIYov0fwfsUg4h/YVqOMmAjH2Ba4269e0usPMZpi8ikcwynFT1F4Ao
         6iQZlpaJWbRvUuZ9InyzmWZ6VRN/eza7S+A8X3AeFnTotDll8fcdX+1Ziq/0XekpODX3
         F4vw==
X-Gm-Message-State: APjAAAXcO1MDvCEr443pIauyvQyud3w0GlI2ESUJj36G6Hb9PLOvhsjS
        6tGgDxn6ZBbofm2Td5mp5UessvcvBrcyD4oZb04=
X-Google-Smtp-Source: APXvYqxU0a7VhTzPmtpX5X6XqCiK0SXFvXf+ZRHJw8LRYdjh88xQQEyQcLP+rietftYXFcA/U5QhyNWsvbdKnO4JDik=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr112896481otf.107.1578383183750;
 Mon, 06 Jan 2020 23:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be> <CAMpxmJVN3f5vWZoUpgsM0kocmBYSO=T0OeoG--5rQi9=jk2t2g@mail.gmail.com>
In-Reply-To: <CAMpxmJVN3f5vWZoUpgsM0kocmBYSO=T0OeoG--5rQi9=jk2t2g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 08:46:12 +0100
Message-ID: <CAMuHMdVo7bvCKjn2-SD4j7EPwDPeTWn2Sh2e-Moj+RkqudZGuQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, Jan 3, 2020 at 10:51 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 30 gru 2019 o 14:38 Geert Uytterhoeven <geert+renesas@glider.be>
> napisał(a):
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
> I may be missing the whole picture, but from your description this
> sounds like a job for the mux framework. Maybe we could make runtime
> PM aware of muxing for this type of use-cases?

I'm happy with a (static) GPIO hog.

BTW, what exactly do you mean with "mux framework"? Pinctrl/pinmux?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
