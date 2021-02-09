Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFEE31512F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 15:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhBIODx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 09:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhBIOD1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 09:03:27 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98B7C061786;
        Tue,  9 Feb 2021 06:02:46 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id w18so11955474pfu.9;
        Tue, 09 Feb 2021 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7fwo48BR7BGL4KzBqbK9xjqhYe8q/AqPBmEuMWxDm0=;
        b=Tb4S5V12uFYeUtuGWpVkw3S6swm/1gPr3h2RgGxw1J+DWaFOD0vW8ed+VCOqJWE7Bv
         6t/uE0FULjP8nUXRnKZTYz4677hYCvTCFT5QWNoPRKX4OnJ6tH6qKdNNYg1X27zgWww8
         7IiR1HbosYhMmHxPDqSrSrfLCdbl4jFBraQ0J4pfTqF6bZewduwzZIVi5x479FaXK8HE
         DfMItTsVRClu1S50pFnWVNiFfV3W6k3fYa/ffQyu9rVV7v1XayBm5G36DvuM+kM2qDo/
         9GeF/8lBSRJV2lK7EQ1zYxW+XNMltCYrT6ImKUOBhAW3pcOPcZJKbHmDrg5yAdk/lcaw
         a78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7fwo48BR7BGL4KzBqbK9xjqhYe8q/AqPBmEuMWxDm0=;
        b=WvGyS+n2NvLRRasauM3jXHeaJ+inVhVYqd8eocnSSUTIZ8aXs2Pwp7hKecRvWc5PmI
         kLAykrgCXZiGd8vQpEt+XUS+V4blLdZ9lCVeUVp9GGnmg/KDHapy7r2bo0pq+IdWSsJ5
         9nSW0pXWJjmXOhq56b1zpK9HeT7N9zFbBtMW1JFvVyBECvQVwMz1qcG7ylRpFuu6vbQZ
         xcZ8fya5E7RAlzKQ173i/zTXkw7O/JHaBvbHlfQTpzEeya4M8OvG9Sc+P7GjT8fdf3Ld
         /Ku25Av84ktJJoB/WoD13tMfpZivNMhcGwZYke7ws8796UAaDIL/BiZBO6+IVG6GN6/P
         Z+WA==
X-Gm-Message-State: AOAM530ViycgkE8f6x+B8ZD9BIxmov5whncFFTeyJuBSudXWI1ZpAcZd
        hkYIB8DeBvKZrN4MNzovs7Tq7Mv7deP/vDrZp48=
X-Google-Smtp-Source: ABdhPJw4E9l8wZjcvKJN7wYBkJNAWGHaL31GoddgBws/Hck0l6YSTZXTTt0kyOmkayPOjgiCoFnjVZbP7QQol5JG73o=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr8572065pgt.74.1612879366390;
 Tue, 09 Feb 2021 06:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Feb 2021 16:02:30 +0200
Message-ID: <CAHp75VfVZLU_4+-=XQjPRhktJTTyeGaUOZnJmNPryp028VnFrA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 3:31 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> v2:
> https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/
>
> v3:
> https://lore.kernel.org/linux-gpio/20210128122123.25341-1-nikita.shubin@maquefel.me/
>
> v4:
> https://lore.kernel.org/linux-gpio/20210205080507.16007-1-nikita.shubin@maquefel.me/
>
> v5:
> https://lore.kernel.org/linux-gpio/20210208085954.30050-1-nikita.shubin@maquefel.me/
>
> v5->v6 changes
>
> [PATCH v6 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
> Andy Shevchenko:
> - add devm_kasprintf() return value check and move it out from
>   ep93xx_init_irq_chip()
> - removed ep93xx_gpio_irq_chip
> - pass girq->chip instead of removed ep93xx_gpio_irq_chip to
>   irq_set_chip_and_handler for port F
>
> Tested all patches on ts7250 board.

Thanks!
For the entire series:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
