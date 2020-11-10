Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2512E2AD852
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgKJOLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJOLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:11:05 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46600C0613CF;
        Tue, 10 Nov 2020 06:11:05 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id v12so11514668pfm.13;
        Tue, 10 Nov 2020 06:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZrP1XAHiZ90F1ruflFERIhIFX48as5H9Y+mX9mtoFcI=;
        b=LU7+l0lCOB5cVkiaUP7L7/vVWtsAaImpMjSoTbWcRgNgrJU0nFzf8Dc0bWhmkW3yTr
         MUKgGrPpa8mLmDZqMarXRnyF+LXEy5lvvSWJX2pyuJUNd+DWPCWjyyepQj77VbBB0+6j
         cfBzYo5HJ0Wt6WoI85fxynGxDNkymOPjpBftxy8dFPcLxpSTEpwN0M1biaOYf2mUqqgJ
         gbP9PaYNCie+irVjuQC21WLpzcmYZ+/71NG2neBZjrS66hjK/XNJ+tzlrW9muTageeiW
         6gek6S0V6loyLS4IsayfdkBqy2jTaoVIn2FHYzfaPFc5sf37RsLJWy008G2rmf99pXbE
         DXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrP1XAHiZ90F1ruflFERIhIFX48as5H9Y+mX9mtoFcI=;
        b=GojTOhLs6mX5yx+zIzGnMlaKV6jgNG9+RfNV0xHTJU3Q5sOaIcuCO2uOvFrxO/X0mC
         oo+4XfUUXCLIirvxOL2dcH7u1afDSr4B/rhBsA0cwag2pmzHejWI4ObLWTNiTCsmKFtv
         kmaRZdkS0b4ExWsAT7WF6LkD+c/cXbhYcrncpnFNgpdMi/XZ3Dh75m9bb+zxuB5B2TAk
         bWaUCX9NOSwbh+18ZXatzwSCYpodGXxkvb4OZ8BZu/mvlO+Gaz/VB1nLkQSKn6vqaJFL
         GhzTLsRCqgS0KiriHW3YK3F33uYRorfvcacV1OaKdWga1+hP0hxjm4LyiEUNR72zUJo1
         dnNQ==
X-Gm-Message-State: AOAM530KkSa2wcXwgeRYbEh2PlcvbANHCM2BaM23sBi6nU9lD0/rdQsi
        bfzRr+kqPcIClkXL+CUdOj3Bvj95jn3KlEvOWMU=
X-Google-Smtp-Source: ABdhPJylcT+YGM5oCMXr+QrH4yI4b+m92nokWWdmSmnRsuzPjjfauIIfa5h/Nc/3t2pZPijarnO0ErHrYRu1Utx1K5U=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr1125363pfd.73.1605017464647; Tue, 10
 Nov 2020 06:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20201110123406.3261-1-brgl@bgdev.pl> <20201110123406.3261-7-brgl@bgdev.pl>
In-Reply-To: <20201110123406.3261-7-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 16:11:53 +0200
Message-ID: <CAHp75VekgB1ch4QjHkvvgbE2_KRWG-AynBMP=aLmoM8jBGRmTQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 2:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

>  struct exar_gpio_chip {
>         struct gpio_chip gpio_chip;
> -       struct mutex lock;

> +       struct regmap *regs;

Leaving the same name is a call for potential troubles.

>         int index;
> -       void __iomem *regs;
>         char name[20];
>         unsigned int first_pin;
>  };

...

> +static const struct regmap_config exar_regmap_config = {
> +       .name           = "exar-gpio",
> +       .reg_bits       = 8,
> +       .val_bits       = 8,
> +};

Looking at the crash, are you sure this is a comprehensive description?
Maybe it requires something like stride or so?

-- 
With Best Regards,
Andy Shevchenko
