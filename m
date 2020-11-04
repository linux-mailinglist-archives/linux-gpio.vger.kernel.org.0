Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2BF42A69D6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgKDQdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730877AbgKDQc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:32:58 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D12C0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 08:32:57 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id u62so22820753iod.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 08:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W89f9FhGl3ZmVVNh0IHsLhIBpTCURVceMfMaDhwTtHw=;
        b=wOXbh51kkIYJs16L1wH3zkeCtTYv8T3jVyI9PcksX4T2ZXuxqC5XvQwkRVBbymWcyG
         TYU5UXvAznrnKFiD+OFfz9pYVb7HHC3ZPM/DWvFTIt6TSN6dEuGo4JkCT1eI10I4TxGm
         fdN5ynsz/tQLW95cF1DdBCu/iV/HEMG4pwV4CcKwVe1+DYxQIJnZb63+MfhDX5n9Xt4J
         jd4K66pXpTidg9covNMepxicSh9d7ohLlI/UlvSDxmsI5XwbnVhcJsfXZSYc29zSLfI0
         BsExRvy8tvEYvHhJldBW/hCWGxlOwl2cUai165/ViBT29XXai5mqfZ00DdKAlaU5auwY
         R4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W89f9FhGl3ZmVVNh0IHsLhIBpTCURVceMfMaDhwTtHw=;
        b=RxGieNk6gN9815XixIf0eWX6b9rVuoi6u9qKCHTqEq8iMCbp+avhWWG68pQ+PWT2jc
         l+aFTISzfGKKTdQh+9/p19mSufIlnxBFQyfhV3tWJQ+VVdsH1shKjtF89K5wa85VCVem
         eXCbXMmCVeiQp89mi7BszLs6coTyuEsDflJ83wImzuDoIF1BElkRQXozaF9K/gGQqDQD
         MWdnkEbmzjqXYwV58jAPfqiomlYKkpAtdyfAUMTCTyr49wzSBxkYoQpYVHHqnNUaBjqY
         5bHUHA7f5v+4bthM9h2EWg6mSDg84TNCwrmgP/4INXVr7K86oAtgNW8r1bxGf2zZEhtj
         Q18A==
X-Gm-Message-State: AOAM532zuXoW+fpsEPjuBmn5Ne5XD2S0tTs2WRPURk0qzpFr59AUGhTF
        P3b9OvJqC5pfirhxWZbqw2F4WQcxZGurW+jPDSzACg==
X-Google-Smtp-Source: ABdhPJzI+uzUtU73vm0s4A7AvEp9YID3FbNdalzqjNgFJmq5wpaL01y5gHvbqYCy2dkgoW+bhhed0RJ5Umd2Q8NVm7A=
X-Received: by 2002:a02:65cf:: with SMTP id u198mr20169169jab.24.1604507577178;
 Wed, 04 Nov 2020 08:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-7-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-7-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Nov 2020 17:32:46 +0100
Message-ID: <CAMRc=Mfin3Rp9cFky4MKAc0cEtKU3LW3=R4nWE-Eeok7ypVVOQ@mail.gmail.com>
Subject: Re: [RFT PATCH 6/7] gpio: exar: switch to using regmap
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 3:18 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We can simplify the code in gpio-exar by using regmap. This allows us to
> drop the mutex (regmap provides its own locking) and we can also reuse
> regmap's bit operations instead of implementing our own update function.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

[snip]

>
>  static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
>                                  int value)
>  {
> -       exar_set_value(chip, offset, value);
> -       return exar_set_direction(chip, 0, offset);
> +       struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> +       unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> +
> +       regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));
> +
> +       return 0;
>  }
>

Upon closer look I noticed this now ignores the value argument. I
doubt however it's the culprit of the crash Jan reported.

[snip]

Bartosz
