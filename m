Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888282D5D41
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387850AbgLJOOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387865AbgLJOO0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:14:26 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2918BC0613CF;
        Thu, 10 Dec 2020 06:13:46 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w16so4318145pga.9;
        Thu, 10 Dec 2020 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Hb7CAOESndOw0qmRw9ewVrZoBtsOHUQtrWnjHs0d1U=;
        b=hs49l3MbegHnzNrh0GBjhULW6ig/YFYqX2EM+6DzwB+fRgW9ILpGbafrJWdjTyYMGx
         bg5fZABvSnlI26rFJy5pxWeVo1syaM3lTLnySC+vNijzgwJofGFA4jF8GbP5lw/3bolx
         5MhNjpMMyGnxypq8jozD4tCdXpzAlJfrNhzeBSvLByOHyyXW0qcPmyn2crxwuFCW1NsE
         0Y0LSTXpJzVV+Js+XxpS2wWocBaPoNyqwnIaHiLPRmTujhAnWChx87vID4du1gZxQ4lT
         IO1MhWxII0hyNuc2ufbgv59WCjVSJinhDKlHuXizxWjqOrMl69sU847jQTfSRlqFqumA
         +2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Hb7CAOESndOw0qmRw9ewVrZoBtsOHUQtrWnjHs0d1U=;
        b=kNOP9L8F0BN5IBCE9KrlPyFv/hPFTx8BKcQRvscwo0tcIzd9PBL+RgcTTWAVUIZLm+
         fUBHaypM0m32nwlQFMk3KZsFDEGmZ74ueQAnRHcPaI4fmNTYKV+0veMXVQ3IIWKup9BD
         b2md8enq04Ct5X4xta9G0fKmef0NFjTO+jLjkYtW7t78rPqUziGFTX2dHrx867qPG15J
         Ki2Dy3CA7LA3nDlX3tm0UmT/JVyMdTyBVwpiRl/ffyBQCpx1tQJbxbe+iTSmEdqCrcbL
         oJ7h/r/OQ0otbn7Cm3K660cA51f9WYo7ylxbhUSDmBg0k6glpwHbSGjsvbbz0S3EcdhX
         G1lw==
X-Gm-Message-State: AOAM533u2Ky4GuZviHKv14KoCABiRw9bE6EOMyCiK0WnB1kK0QOyhqJP
        /CdQ6pNQRoc3D2s1JJ5ubkWu+NQvj3zjBv4XxNkOsZ0Ap/w=
X-Google-Smtp-Source: ABdhPJyFNZ9FhSEOIbEkRgpnz977Ot0cuwbUMyrsnC9vlZUdQdfjd+91orjutqMRcuYPE8Fvn6lnet0Z/prPzhCJx2I=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr7847600pjt.228.1607609625632;
 Thu, 10 Dec 2020 06:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210065013.29348-1-troy_lee@aspeedtech.com>
In-Reply-To: <20201210065013.29348-1-troy_lee@aspeedtech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Dec 2020 16:14:33 +0200
Message-ID: <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
To:     Troy Lee <troy_lee@aspeedtech.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
        ryan_chen@aspeedtech.com, chiawei_wang@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 9:36 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> GPIO pins can be used as IRQ indicators. When they do,
> those pins should be flaged with locks to avoid kernel

flagged

> warning message.

...

> @@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)

> +       rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
> +       if (rc) {
> +               dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
> +                       d->hwirq);
> +               return rc;
> +       }

It's a copy'n'paste of generic code. Why do you need it in an unusual
place, i.e. ->irq_set_type() IIUC?
Can you elaborate about an issue, because this seems to be a hack?

-- 
With Best Regards,
Andy Shevchenko
