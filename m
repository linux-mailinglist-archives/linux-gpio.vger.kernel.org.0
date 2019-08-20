Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3381E95A53
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 10:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbfHTIvP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 04:51:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39701 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbfHTIvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 04:51:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so2965637pfn.6;
        Tue, 20 Aug 2019 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8ZkO1elV3VOIo0K30JacS/YJHIWCmxOiyDVl2xJliM=;
        b=eId2nnkAbmSborZ14m9x5Eg3s55XQW5KuqyexFm/5IxvHBsrRv+KWoTfnOtu+EW6r9
         l/IRpKx5z37MdpptvqDXMu/rHXGsNaFsLZ2Aemm4WDxRuya1HGSJYS3rhx8TkQWyJ2zR
         qKQDBlSJLpfITyhCzjSSqK+JdTR8HDNFpX3zgUxRAjs0cvhPMEFHJiHYgcfY8LfjBJKg
         SiHA49PB2jRLP8Ezc3uN2bA1bvtqOO3x0TKu6vVrUbw8kb6eeLFBEguQt21Mhp4Gs5Ac
         DPPgVR9kg0aQJ8UhPnO6Gh+Xl83t/WVwffpkO1LcqkAHNsF/sYGZAwyBPAddpOB9RUqo
         vmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8ZkO1elV3VOIo0K30JacS/YJHIWCmxOiyDVl2xJliM=;
        b=lZ3u8rP5/HV3WXz1rc8/85vjau6QdRCHLZprqGflAYyxjwkn2jH+PWXWh5OZVklMWr
         MwA2dmQybwUJOjTAhvGINi8w1cQHxvZCXnLPYr9vZtB0K47YrjgHNyyUm8tUz4HMiwNi
         ooYRQIyT6lSYsM4AwZfMT6VB5vgP18zzK85hxzPP6D+LbJVr5HVKi5f0sxnoJE33GzWh
         yReWlyNeBhnPNjY/Y+Y+48aD3RsWvF5qIUzUuPsFE8KIVNUBm4kmhs4MGWjD/VPz7YUX
         W+kMMUlEvqzke5L0Iv/7hW/Bz9sa3THPFT0sdDtZSfnrBn3h8C9+P5qkGx+ujuletG+/
         t0gw==
X-Gm-Message-State: APjAAAVXLu18Qg+7MER3XMPlo/ciPhjLkpgdtsw8znUduVcJHALfxPfI
        pXAmhdZqXrPCmKve1pSmKiUMUtWiHvnwps7fADY=
X-Google-Smtp-Source: APXvYqzUg/wVcQbACT0z4VVsJ/hlgqRibUCwwz5eBIC3Ei4+518/wQLbSrJhkxetJKEWr9wqGNsdgSFW1JJnejnvQuc=
X-Received: by 2002:a05:6a00:8e:: with SMTP id c14mr28096166pfj.241.1566291074329;
 Tue, 20 Aug 2019 01:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
 <CAHp75Vct3qtR5bDF6iALmduKEEq+gNL-btmzQVuWq_hYsmxKhw@mail.gmail.com> <CACRpkdbRZ=88+ooW5jb5vu4Dwsaj7Ce+V5Ked2-bGn0JWpTHfQ@mail.gmail.com>
In-Reply-To: <CACRpkdbRZ=88+ooW5jb5vu4Dwsaj7Ce+V5Ked2-bGn0JWpTHfQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Aug 2019 11:51:01 +0300
Message-ID: <CAHp75VcwDZdOwFsT4Gf-1a4tNGQdowK-RKRvSif2m7oTsVQNbw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <treding@nvidia.com>, Wei Xu <xuwei5@hisilicon.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 10:12 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Aug 19, 2019 at 5:07 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > The proper fix is to revert the culprit since we call
> > acpi_gpiochip_request_interrupts() for all controllers.
> > Linus, please re-do the approach with IRQ handling,
>
> Exactly what do you refer to when you want me to
> "re-do the approach for IRQ handling"? Do you mean
> this driver or are you referring to:
>
> commit e0d89728981393b7d694bd3419b7794b9882c92d
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Tue Nov 7 19:15:54 2017 +0100
>
>     gpio: Implement tighter IRQ chip integration
>
>     Currently GPIO drivers are required to add the GPIO chip and its
>     corresponding IRQ chip separately, which can result in a lot of
>     boilerplate. Use the newly introduced struct gpio_irq_chip, embedded in
>     struct gpio_chip, that drivers can fill in if they want the GPIO core
>     to automatically register the IRQ chip associated with a GPIO chip.
>
>     Signed-off-by: Thierry Reding <treding@nvidia.com>
>     Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Yes.

> The new API introduced by this patch is what I am trying to switch
> everything over to, because the forked paths inside of gpiolib
> is causing me a maintenance headache and also increasing
> the footprint of the library.

Yes, I understand.

> >  it seems broadly
> > regress with ACPI enabled platforms.
>
> It only becomes a problem if the platform uses ACPI right?

Unfortunately yes. Though in this case it was working and stopped working.

> But it's a problem if I can't really tell if a driver is using
> ACPI or not, there is no sign in the pl061 driver that it would
> be used on ACPI systems until now, so how do I design
> for it?

It's hidden under amba_driver_register() which works for all
registered thru drivers/acpi/acpi_amba.c.
I agree this is not straightforward.

> The problem comes from the problem/mess I am trying to
> clean up in the first place. So if the new way of registering GPIO
> irqchips is not working for ACPI, then we have to fix that instead
> of reverting all attempts to use the new API IMO.

Sorry for me being impatient and asking for a groundless requests.
I'll help you with cleaning this.

-- 
With Best Regards,
Andy Shevchenko

--
With Best Regards,
Andy Shevchenko
