Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2880B9603B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 15:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbfHTNh0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 20 Aug 2019 09:37:26 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43263 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbfHTNh0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 09:37:26 -0400
Received: by mail-oi1-f193.google.com with SMTP id y8so4078118oih.10
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 06:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F8wgQZDQ7nQe7Avd9albRvvJ4o0QOSca6pjakzqcSWM=;
        b=ks8y3XeDDLQiChpwCphcRr6r5hkrVyGQ0zXSHgsITdFFdtvoA/pT7o7WXyHCcfqt7p
         qmcrnf2UySTzHPnrUb5h+dYKFTx+eSXDkZKIrBRwk8+oKQVPCvTVTiq15P/301HwQKiG
         +AsKZeiiPVes7u00X7r5+u8zBu0wWPsLGM/d+6xH7yMn5ilWwQimk4C4DiLb2oZsJqOR
         D/DSkgbD6hNoC2quMr9NNHHzo225FzzrH4vxhikGCzepF7eeRKReqQBB2OHEs6rYO27W
         x0LXnaWZby7cyQs/aWu+xH1M0UezmjM8y06IGsVwMjPxcRjseBMCRt6CL/iQ35Fr+Ppx
         q/Bw==
X-Gm-Message-State: APjAAAWZ6KRpDiXGehLIDe0bTvKUUslslMrEgPQEVtUIUev9DW++ByOQ
        iCwVu7EvPYt/tliLGG4yumF5s7cfQX08ym78XbM=
X-Google-Smtp-Source: APXvYqxnMCjJMv7c+x6OqDOeo+bOKNRCkFplUGFdsK2PFNQCnYhQMgClDbC9Q2uor994aRL9cOL+mfl2u40rECwKX7s=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr1276oih.131.1566308245100;
 Tue, 20 Aug 2019 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190820132548.4012-1-linus.walleij@linaro.org>
In-Reply-To: <20190820132548.4012-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 15:37:13 +0200
Message-ID: <CAMuHMdVYw=BLwkbpCStUXWHqy+aHs0-awfvbERaathLvZ8Ua8w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: rza2: Include the appropriate headers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Aug 20, 2019 at 3:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> This driver is implementing a GPIO driver so include
> <linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
> When testing it turns out it also relies on implicit
> inclusion of <linux/io.h> (readw etc) so make sure to
> include that as well.
>
> The GPIOF_* flags used in the driver is not for driver use,
> these are consumer flags. Replace these with literal 0/1.

Perhaps this should be extracted into a separate patch?

> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Remove the use of GPIOF_* consumer flags in the driver.

Thanks for the update!

> --- a/drivers/pinctrl/pinctrl-rza2.c
> +++ b/drivers/pinctrl/pinctrl-rza2.c

> @@ -145,7 +146,7 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
>          */
>         rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_IN);

Oops:

    drivers/pinctrl/pinctrl-rza2.c: In function ‘rza2_chip_get_direction’:
    drivers/pinctrl/pinctrl-rza2.c:147:39: error: ‘GPIOF_DIR_IN’
undeclared (first use in this function); did you mean ‘_IOC_DIRBITS’?

What happened to your arm cross-compiler? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
