Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E6E31A5FD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 21:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhBLUY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 15:24:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:52516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231293AbhBLUYU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 15:24:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0A7B64E95;
        Fri, 12 Feb 2021 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613161419;
        bh=SgpeauIjBEYBb19bzKlcu3o1aZnQbA7DQQyuDGnV+uw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bgpPQyf79qdr95if+5Dmg8ElIx9DuTNkhPqEWCY8ykckc5CIjK6dnlop9hrIluch8
         DKhZL6ZTZNmP05P+g2Zf+Kl2bTeTmmfFjEH/RYKDC5C4SacpQIeq7nbwD5Yq8Vefwi
         AVuAgmifzPrYjUp/fvJsYXTv8g/pTHVxFAtx/Ru605wde12aZtW5srazgdj/R9UJjR
         ukh4jqCH+m4tljEHjSGbXoYp2k1CEUVqKUTDATxLgMLsWqE+0pTA067gadqaclshbx
         ZkWzPB86j/7fx3VmtF97IDcKTrH5JqWZT4TCIf4FUwqo3kJRVwv62Jx2N1E9rRcrg3
         0AhPRQx7BUNSQ==
Received: by mail-oo1-f45.google.com with SMTP id i11so135158oov.13;
        Fri, 12 Feb 2021 12:23:39 -0800 (PST)
X-Gm-Message-State: AOAM531PJwx9yJ/nJJWdnJAjn0+rqfA27ZodRd9a7fxxk8b+dTuO36l/
        bI4hOUsWK/i3lIy+VnLDHoeURLXxa4aPvQBlVDk=
X-Google-Smtp-Source: ABdhPJwMNy7Be51JAAzOcVXxyMadWUxZgfu2ogN/4Rpg2m9kmLt37KCPrT5+zVNmI6BrFLJtsLdm+NGVC0q+89FH2u4=
X-Received: by 2002:a4a:88c9:: with SMTP id q9mr3261535ooh.26.1613161418961;
 Fri, 12 Feb 2021 12:23:38 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com> <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com> <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com> <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
 <YCZfBMPwmzD2U/4c@smile.fi.intel.com> <c4a07bef5dd24fd2af0aa7fe4c78b903@hisilicon.com>
 <33720e72-a438-8ffe-1b5f-38756738ad9b@ti.com>
In-Reply-To: <33720e72-a438-8ffe-1b5f-38756738ad9b@ti.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 12 Feb 2021 21:23:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0JEhhw4vB=YgUJj5_ywds=sVuzPd4Zf0iiRwX4Mgsk3g@mail.gmail.com>
Message-ID: <CAK8P3a0JEhhw4vB=YgUJj5_ywds=sVuzPd4Zf0iiRwX4Mgsk3g@mail.gmail.com>
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 12:53 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> The worst RT case I can imagine is when gpio API is still called from hard IRQ context by some
> other device driver - some toggling for example.
> Note. RT or "threadirqs" does not mean gpiochip become sleepable.
>
> In this case:
>   threaded handler
>     raw_spin_lock
>         IRQ from other device
>            hard_irq handler
>              gpiod_x()
>                 raw_spin_lock_irqsave() -- oops
>

Good point, I had missed the fact that drivers can call gpio functions from
hardirq context when I replied earlier, gpio is clearly special here.

          Arnd
