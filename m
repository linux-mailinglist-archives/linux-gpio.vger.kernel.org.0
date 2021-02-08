Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A28314444
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 00:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhBHXt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 18:49:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:34004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBHXt2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Feb 2021 18:49:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0595A64E9A;
        Mon,  8 Feb 2021 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612828127;
        bh=cmdwZ4a6bUBFmfrZQNo71CTGPOcdnPqfAXXmNEvqVgc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fUWL1mbIkWT79Zn55+uY9X7SN+LOgH+aQgHzr3yZOl6MidpFg73v3bfAWuwyWVI7E
         /64IeyHlICat37I0hlNrJqWqstWfxj/V8v3l+dgjn8VCnZby3hFbAaU+UzZ0wrA8jE
         bEQkKDro5hYjWCSz/X4sAkV+cnIqSTgdyjO5M8H5fZG+czuJttNc3TFwN0F/Zjljzq
         t+wIR9A3hrtwrRclPsdYqKedGeqzTeMXNcd7NHH/JnW0swH3GOUtG9M+5S+SAYDKw2
         +n2B+2N/UoGN4JTlJrnLC/xLCqLgYQN1DKYgEB3EICl09DN69/DzAKOajagrLqCznX
         /oXPi7bZqlTCg==
Received: by mail-qk1-f182.google.com with SMTP id m144so589007qke.10;
        Mon, 08 Feb 2021 15:48:46 -0800 (PST)
X-Gm-Message-State: AOAM533BlyLIxUsugtY+aAdUaAJhqxcLi4jUdyoZoKr/ulkn6VVvRntF
        gEzC+FcZMNbiTmbHyQtJmQN4KxTf37BvBqVB2g==
X-Google-Smtp-Source: ABdhPJz4iZaPmQzqGVOhAKeyDYsJNBMn2bDqkbB6EyKrP7Ns/1yQf1ahrwrNCzJMVdqI8eyffQRaHHDCUmLMybIzC5Y=
X-Received: by 2002:ae9:f20b:: with SMTP id m11mr19942215qkg.464.1612828126133;
 Mon, 08 Feb 2021 15:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net>
In-Reply-To: <20210208222203.22335-1-info@metux.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Feb 2021 17:48:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
Message-ID: <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
Subject: Re: RFC: oftree based setup of composite board devices
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Johan H

On Mon, Feb 8, 2021 at 4:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Hello folks,
>
> here's an RFC for using compiled-in dtb's for initializing board devices
> that can't be probed via bus'es or firmware.

I'm not convinced compiled in is the mechanism we want.

> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
> platform devices can't be directly enumerated via firmware. Traditionally
> we had to write board specific drivers that check for board identification
> (DMI strings, etc), then initialize the actual devices and their links
> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.

This is something I've wanted to see for a while. There's use cases
for DT based systems too. The example I'd like to see supported are
USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
plug more than one of those in.

> This patch queue does a bunch of preparations in oftree code, so we can
> support multiple fully independent DT's (not using DT overlays). And then
> adds a generic driver parses compiled-in fdt blobs, checks for mathing
> DMI strings and initializes the devices. As an example, the last patch
> adds an alternative implementation for the PC engines APU2/3/4 board
> family based on device tree.

I think there's a couple of approaches we could take. Either support
multiple root nodes as you have done or keep a single root and add
child nodes to them. I think the latter would be less invasive. In the
non-DT cases, we'd just always create an empty skeleton DT. A 3rd
variation on a DT system is we could want to create parent nodes if
they don't exist to attach this DT to so we have a full hierarchy.

I'm not saying which one we should do, just laying out some of the options.

> The approach can be easily be extended to other kinds of composite devices,
> eg. PCI cards or USB dongles.
>
>
> Yet some drawbacks of the current implementation:
>
>  * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
>    modprobing anyways)

I think we need to use either firmware loading or udev mechanisms to
load the FDTs.

>  * can't reconfigure or attach to devices outside the individual DT's
>    (eg. probed by PCI, etc)

Not sure I follow.

Rob
