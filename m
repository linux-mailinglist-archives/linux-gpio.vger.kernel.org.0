Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A256B43332C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 12:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhJSKHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbhJSKH3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 06:07:29 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD45C06161C;
        Tue, 19 Oct 2021 03:05:17 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y30so9774593edi.0;
        Tue, 19 Oct 2021 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weqn2VVSwGcyXsa0H+TZIaJZQbD+c+j8TTHDHQ3X1gI=;
        b=d4ezrvuUdFBB6wWt1NQAxkXil5Lg+SgXN+f7KJAQMQPKwOn6wsEFR1e/ZwtwAX9k71
         eC6HsCkZRUtIiHHk4UtU/uSyxV7pgYY89B4jS0KMug+qccRe68KFNL4q+/yjlbsktaqm
         QnOtRR8Fu4KNeFdE0aC/LOoHqYEeuVF8IS6iRpFi/m9wg+KtNZ0xzixJUVkVwtDfuvXX
         wR7kYH81AqJunWHDvTsYLrb+w3F1Y0XAGghwqj/nkIz7L6CMB7ra/Oi54oxPFcl3m6Wp
         iNYZkVNcgbzkVBBJUxRuPO0Dcw94VwzzIzw0HXmMaKUCV0ZqZUN5PXLueeQ7SoIp5AUt
         kPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weqn2VVSwGcyXsa0H+TZIaJZQbD+c+j8TTHDHQ3X1gI=;
        b=ULW1EphLuDwk7HJekOGBfYNLJZ2BoRNnc7ZyRNd0vuWew7BaA6A0ryanOTNLInYh79
         P4jvcvoQiA/gnWAhueM7uKk5I1P0g6eGa5oSYA+iD0dmSD/loIlpT37IoNPYUrZo11An
         Vi4bMUSo789lEUId9sGkdpdz/iL7ItYAQN5zV1p1ud6HExVyJWUhZEwwSLOn322B3sMI
         6oscA5ockuif9+tPNsfz0kFeoywSPHZOQCXL07LXEay+99HfcxjYeZLe1PrbwRtYZswX
         TCUgZg6w49K7HmgnCr9+/5J+1GShoXFWDoxMTb/akII6lvWmKBPHcWbv2oikAa36b5mu
         pcdw==
X-Gm-Message-State: AOAM532+GZuNX5r2F5ayzOyZICJWBlv9FKcHbQeO7uAO6YCC/SjJPdg4
        x+B0YAsq0LZvUIctXiEpG/t6yQeq7npwxPd34oLFyW4H0UyvRpon
X-Google-Smtp-Source: ABdhPJz1rktonq3jgZFoXdQzqkmtScwjEv3/nZx2zO05n6Bow3B4vYCxO8AlbBSp28HuUoUw2imT4VJVmb/rrQjQlQ0=
X-Received: by 2002:a17:907:8a27:: with SMTP id sc39mr36338752ejc.567.1634637913069;
 Tue, 19 Oct 2021 03:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211019032648.2208-1-mario.limonciello@amd.com>
In-Reply-To: <20211019032648.2208-1-mario.limonciello@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Oct 2021 13:04:21 +0300
Message-ID: <CAHp75Vexw8P6EcyX=fpoH_SxHTzSahrb82GfUCgzpyK3ePEjhg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Joerie de Gram <j.de.gram@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 6:27 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On some Lenovo AMD Gen2 platforms the IRQ for the SCI and pinctrl drivers
> are shared.  Due to how the s2idle loop handling works, this case needs
> an extra explicit check whether the interrupt was caused by SCI or by
> the GPIO controller.
>
> To fix this rework the existing IRQ handler function to function as a
> checker and an IRQ handler depending on the calling arguments.
>
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1738

Should it have a Fixes tag?

> Reported-by: Joerie de Gram <j.de.gram@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

...

> +#ifdef CONFIG_ACPI

__maybe_unused?

> +static bool amd_gpio_check_wake(void *dev_id)
> +{
> +       return _amd_gpio_irq_handler(-1, dev_id);
> +}
> +#endif

...

> +#ifdef CONFIG_ACPI
> +       acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
> +#endif

Not what I expected.

...

> +#ifdef CONFIG_ACPI
> +       acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
> +#endif

Ditto.

Yes, I see the problem, perhaps you need to add the stubs. If this is
a real regression fix, then probably this patch should follow by two:
adding stubs, removing ugly ifdeffery here. Otherwise, introduce stubs
as patch 1 preceding this one in a series.

-- 
With Best Regards,
Andy Shevchenko
