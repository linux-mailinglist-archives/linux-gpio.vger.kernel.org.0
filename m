Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC124112B6C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfLDMZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:25:09 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42351 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLDMZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:25:09 -0500
Received: by mail-pg1-f194.google.com with SMTP id i5so3308417pgj.9;
        Wed, 04 Dec 2019 04:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74DpMf6mDc9+B5MlAH6Y1HnnZ4oNYZutTjoMwerFER4=;
        b=Z5d/2aUmDmAiXuIlzS0/rbPqK4K55gOXAdXFRhLm6wZvdbwdN1bAgX71EXM6HXeBOJ
         EIdY0ZQtK3Vst1H2ruzjNOjK0LpXXg9RWYcVK7Y5+5XzFTGkNur4Wp67yzCNpFXn+oA+
         gFr+FyKLp5b2La2502/efx5VLLBTCoAq3s3J4dvpL3zuZybtYc8j6CILkPeKJZJUu8fh
         Mqc0pVBoipofh2fc2XBJPLDIv1VzpxT8KUzHHRNYZXbTCLRcsPn2VbQ7qyBqd66bRDkv
         qQ7TRj31Kb6H2GV2tTeI4UQxDPbjR3lhJG/0IUC0ntJuLMmbTfsm7SKz1jFFOl+ZceF/
         R0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74DpMf6mDc9+B5MlAH6Y1HnnZ4oNYZutTjoMwerFER4=;
        b=bqb+rqgql4O6njq+Pjw8eRvzygqzbxpPiRjV1UykBmue4jKvwC9SDCLbIBnkjFZZZr
         B/do6ayM/G+GJIoRqp/74JCVZ6uG0mD15/QnJwwCDeiNNxYwP+ThieWURk9/LMeBFKZu
         nma+g4Qpz5tlTMoX3wqlOlvgeS5dNaLGwj+t04JChIex8WSJazgYysJ/2rbwdHAgDNRZ
         RyzKyuSKehMrn0k+4MFdhnfb8zJd/Dt93Wp/eM0rM+hdWnhqhS6+EOHydRr8sNG4kmeZ
         nOamT6sizZios0jDq8Kh2t0BPkOU59PgsoqLQxx5PnVw+C7rfpPrLI9O9pR+PqnXPpWz
         q5aQ==
X-Gm-Message-State: APjAAAUj1K9/yGQ1JbolaZTiaju0EdP68svJg4z3NM7IYT0zcR2tRWKK
        8oZq5iZyMJ6kl+SlXJiZ7oNoDncDU8ZIfh0FLuTJHKBX
X-Google-Smtp-Source: APXvYqyCnQkr0xElgusO0C3qIThRUs5uow3MZrryyIUtM3q04ZTsWoj5gxZNNLPWe6eEGnUAUrhluz9fUdcXVcAN8/I=
X-Received: by 2002:a62:1944:: with SMTP id 65mr3279668pfz.151.1575462308225;
 Wed, 04 Dec 2019 04:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-1-cleger@kalray.eu>
In-Reply-To: <20191204101042.4275-1-cleger@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 14:24:58 +0200
Message-ID: <CAHp75VcMm3PPAgfFPLzVwg_RN7_vQfRmufvWiPOkYaErdGiNsw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
To:     Clement Leger <cleger@kalray.eu>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
>
> Synopsys DWAPB IP includes support for pin control. This control is basic
> and allows to switch between a hardware and a software function.
> Software function is when driving GPIOs from IP and hardware is controlled
> by external signals.
> This serie export necessary interface to be able to move the driver to
> pinctrl folder and then implement the pinctrl support which is based on the
> digicolor driver. The idea is to avoid hardcoding pins in driver since
> this IP is a generic one available on multiple SoC.
>

This series misses at least GPIO ACPI maintainers to be Cc'ed to for
the certain changes.
Moreover, I would like to see entire series in the future in my mailbox.

I will look at v1 closer anyway.

> Clement Leger (5):
>   gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
>   pinctrl: dw: move gpio-dwapb.c to pinctrl folder
>   pinctrl: dw: use devm_gpiochip_add_data
>   pinctrl: dw: add pinctrl support for dwapb gpio driver
>   dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl
>
>  .../bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt |  21 +-
>  MAINTAINERS                                        |   6 +-
>  drivers/gpio/Kconfig                               |   8 -
>  drivers/gpio/Makefile                              |   1 -
>  drivers/gpio/gpiolib-acpi.h                        |   4 -
>  drivers/pinctrl/Kconfig                            |   1 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/dw/Kconfig                         |  11 +
>  drivers/pinctrl/dw/Makefile                        |   4 +
>  .../gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c}    | 277 +++++++++++++++++++--
>  include/linux/gpio/driver.h                        |  12 +
>  include/linux/platform_data/gpio-dwapb.h           |   1 +
>  12 files changed, 310 insertions(+), 37 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt (76%)
>  create mode 100644 drivers/pinctrl/dw/Kconfig
>  create mode 100644 drivers/pinctrl/dw/Makefile
>  rename drivers/{gpio/gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c} (77%)
>
> --
> 2.15.0.276.g89ea799
>


-- 
With Best Regards,
Andy Shevchenko
