Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729792AA634
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Nov 2020 16:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgKGP02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Nov 2020 10:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgKGP01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Nov 2020 10:26:27 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF9EC0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2020 07:26:27 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w14so1691384pfd.7
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2020 07:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BlIzZ9Uulxs1n4nNZR3x98pacNWqJgeDC/n3j6qH4A8=;
        b=QUvV8MXt2qAckac82N/S6cGA1MEwy54Y1adx5uK9mRvLwO78eCLfNi9zfMk6liXcQ2
         U3jTD+BJQfaCPSRQidWZqhselFDiK6O6FMRgrG2lBS8EPYRFKza/riopJF++6Oqav1nh
         8zSiSrjVIsf9kLJ2TU0ftDKkZy+Cp/SwiOsqqFAQb/iB6Gtxv/V0MHgJXRrOFPjL1ht+
         XLlceeNl4Xh+SJB3VYFlLcBTlENNGajKhJl5vmNcpXe3d7uQD/uKGQCvxOYTyn7tm85x
         3ckMvuwRwkk1964ECaAy2zxPyT5pI0y1XLoMl/QnH9rjGreuq2TIrUYAKqMgZR/Gz8b5
         oxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BlIzZ9Uulxs1n4nNZR3x98pacNWqJgeDC/n3j6qH4A8=;
        b=iMsVc9CnPS9Zj1aaq9T3MK2RPzy4y3ua2hiS4YaKFxdimwQz/r7Mv2GcdncqFbUq6O
         vuselz1khefw/KEIbwRqsepnGz6qKeo771qyA4ZjxL5MYaJLbQ02v1xZruVXacnUetwR
         AcO+nhYP6Uhop3bHLDSkhVGHEVdFck0r1w2KEOYOO2zHxihoV0m2plMgLQo9p5QGHjI+
         VoRxkQSYUttv6GJpjpiD2Cfp5tFFZK4bKtfAB3XzuQclSWPS409OaAYXpoa37l1B5D0V
         VqGq3ekad4gD9c4tGiosVHBfQ1bbTK5wbkWKgIrMZbGz0eV6WOyHkqNGvmelPZI7k6Kl
         Rs2w==
X-Gm-Message-State: AOAM531MbArvS0BvPIf1C6zugRCc7rw72UAFqKKzyzDdu1D3uKQrldnm
        3/PDQ47VkeNorehsLb/dZLQQttiJHtMsr0YHaH1Lg9HRlns=
X-Google-Smtp-Source: ABdhPJyi+w1mp2hjLT8uYIHc2O26sdb716CWFeRoI9aemLsPbdm1NLtxRq93ygsCulKOh8z9cgDOt9ei06srCn4ixe4=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr6260446pfd.7.1604762786949; Sat, 07 Nov
 2020 07:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com> <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
In-Reply-To: <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Nov 2020 17:26:10 +0200
Message-ID: <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/6/20 8:22 PM, Andy Shevchenko wrote:

...

> I added an older version of this (which only modified acpi_dev_gpio_irq_get())
> for testing and when booting a kernel with that version applied to it,
> on a Cherry Trail device I noticed that a whole bunch of devices where no
> longer seen by the kernel because of acpi_dev_gpio_irq_get() returning
> errors now (-ENOTSUPP).
>
> Quoting from the gpiod_set_debounce docs:
>
> /**
>  * gpiod_set_debounce - sets @debounce time for a GPIO
>  * @desc: descriptor of the GPIO for which to set debounce time
>  * @debounce: debounce time in microseconds
>  *
>  * Returns:
>  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
>  * debounce time.
>  */
>
> This is expected on GPIO chips where setting the debounce time
> is not supported. So the error handling should be modified to
> ignore -ENOTSUPP errors here.
>
> This certainly MUST NOT be merged as is because it breaks a lot
> of things as is.

Thank you very much for the testing! I remember that I fixed debounce
for BayTrail, but it seems I have yet to fix Cherry Trail pin control
as a prerequisite to this patch.

And like I said this series is definitely not for backporting.

-- 
With Best Regards,
Andy Shevchenko
