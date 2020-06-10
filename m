Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216EF1F530C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 13:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgFJLVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 07:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgFJLVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 07:21:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50ECC03E96F
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:21:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c17so1951186lji.11
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=34s/UudA0g6sy/PuF5ij0UDHJHHlXUeLJ0XZZpZwUj0=;
        b=Zw/UUAncdZrCkVzxyRRfOD0pd964ijRbrOUynobbqQjw8BvJ91e7KKj0W9Lcluz1j6
         nr5OFK6KCmfGtdLyZ2FrVIYIHPeOpvTWfQhhF0nrIcJMQL/NPWALdu81+iA6CYQClraH
         x0A3SZ24rsEHfXtN7dJD4CHfJCoNrNxOoaarWuZeKIyRgk8u4k9Pg0Cux46/usK3J37I
         7F89OLKoyTnHK+j7yoX4YNn2HCByaACA3WDSX4romXYwHWPYJ+oGKiIEG8Gu5x9Vz/OD
         LxSjmAdn4iU6zA4qEHurICrDVvcHKiPSyLjgMowv297XHmuRShhUxFw/1M0etc79yfCB
         cEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=34s/UudA0g6sy/PuF5ij0UDHJHHlXUeLJ0XZZpZwUj0=;
        b=YNLa1mNi2EHeanw7kjl4Co1SjuWU6ZLKtEjHOwKBIl1cK+A1YrsGQ6mcfFIW6xakhY
         Bzce7huRZ8aB5EkvnKYLOJlW147woHNCHZXV7gUXqidYlXYXUaNOfCKNJmh3bMT0NR5B
         jeqmjw6oAKSxxkLjxzHEJhVVYmJIBBBJ8HWhbhXnkjO5v//LN/UEmp6/OUWIFuXf1Axv
         eaFbhPLjgU8ETGTAsGFYG7psovPRzGn7b8LN1inKYUcbz0Kwh36i7GmETwePFkijHXu+
         p4PXqmV0yRgVi/iZ9mZ2uavjul4H3Sk+Aw04Bp4qedhhJ72k8fU8ffdeu8R6NedD+V8Z
         HVVA==
X-Gm-Message-State: AOAM533DpzBR61lKKKAsC6IjYHiprmKezpQJBRdurOFuMdo/6DnZ2IGN
        +Xh7Qvo8CUPFRr2bbUNYlb3xadEdc0MyF87vKj2hTw==
X-Google-Smtp-Source: ABdhPJyW5H491HGWKGgiLem4FyZKdKKobr76+yfSy+ZTJl5n3Dav1PkDAFK/SXUuZP3anXqMXmrnBOWiguThBzu7Gd8=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr1502554ljz.144.1591788108186;
 Wed, 10 Jun 2020 04:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200606093150.32882-1-hdegoede@redhat.com>
In-Reply-To: <20200606093150.32882-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 13:21:37 +0200
Message-ID: <CACRpkdaTJ9hW+GTnTVWK1UxHYxgD_c8G=Eq-3=iEN=YJrYLhKg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: baytrail: Fix pin being driven low for a
 while on gpiod_get(..., GPIOD_OUT_HIGH)
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 6, 2020 at 11:31 AM Hans de Goede <hdegoede@redhat.com> wrote:

> The pins on the Bay Trail SoC have separate input-buffer and output-buffer
> enable bits and a read of the level bit of the value register will always
> return the value from the input-buffer.
>
> The BIOS of a device may configure a pin in output-only mode, only enabling
> the output buffer, and write 1 to the level bit to drive the pin high.
> This 1 written to the level bit will be stored inside the data-latch of the
> output buffer.
>
> But a subsequent read of the value register will return 0 for the level bit
> because the input-buffer is disabled. This causes a read-modify-write as
> done by byt_gpio_set_direction() to write 0 to the level bit, driving the
> pin low!
>
> Before this commit byt_gpio_direction_output() relied on
> pinctrl_gpio_direction_output() to set the direction, followed by a call
> to byt_gpio_set() to apply the selected value. This causes the pin to
> go low between the pinctrl_gpio_direction_output() and byt_gpio_set()
> calls.
>
> Change byt_gpio_direction_output() to directly make the register
> modifications itself instead. Replacing the 2 subsequent writes to the
> value register with a single write.
>
> Note that the pinctrl code does not keep track internally of the direction,
> so not going through pinctrl_gpio_direction_output() is not an issue.
>
> This issue was noticed on a Trekstor SurfTab Twin 10.1. When the panel is
> already on at boot (no external monitor connected), then the i915 driver
> does a gpiod_get(..., GPIOD_OUT_HIGH) for the panel-enable GPIO. The
> temporarily going low of that GPIO was causing the panel to reset itself
> after which it would not show an image until it was turned off and back on
> again (until a full modeset was done on it). This commit fixes this.
>
> This commit also updates the byt_gpio_direction_input() to use direct
> register accesses instead of going through pinctrl_gpio_direction_input(),
> to keep it consistent with byt_gpio_direction_output().
>
> Note for backporting, this commit depends on:
> commit e2b74419e5cc ("pinctrl: baytrail: Replace WARN with dev_info_once
> when setting direct-irq pin to output")
>
> Cc: stable@vger.kernel.org
> Fixes: 86e3ef812fe3 ("pinctrl: baytrail: Update gpio chip operations")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note the factoring out of the direct IRQ mode warning is deliberately not
> split into a separate patch to make backporting this easier.

Looks good to me, I expect this in a pull request from Andy for
fixes, alternatively I can apply it directly for fixes if Andy prefers
this.

Yours,
Linus Walleij
