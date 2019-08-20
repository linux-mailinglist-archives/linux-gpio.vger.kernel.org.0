Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D48BB95994
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 10:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbfHTI3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 04:29:38 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34885 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbfHTI3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 04:29:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn20so2390116plb.2;
        Tue, 20 Aug 2019 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89TWE76G7HmT9xAoVwVI29PCwJL0d5XIbmYkxr69FI8=;
        b=t3hXiMlkVt2zJaCYzY3mwYAXvkxRkUd4IvETXXxhkKsfipfJvPz4EarBK/OHJtQQIV
         13b93tyXyy2kyraWIoH9SktPh4GrDhWJHNon3rGOf3HPVAmR9ATe29AzLkq/RKXa7uwc
         iGp0SyOpS2QkotJUPbElXObHvdM2674Yz67VdAA4bVEHtZqRvyosUcA7+0N0JV38apLd
         c1CKOnB9iVA3xMfyIckwphcO+EMY95NwZ6vWVs/9Cojk2zxVr5Gn3XOw0FVVEYhPCB2N
         oV6XMWV0DkYS/Ak4LmoFKqqMJF1lCkU6CuXvwX+X4We/kYkF5FKcQXKIR8yn68+KJAA7
         ICrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89TWE76G7HmT9xAoVwVI29PCwJL0d5XIbmYkxr69FI8=;
        b=k9bsHaGeTFA+Ksw8+FEE6kq+6/u3R9CNbIfPSBJMxEjFpKNshxyPH8VSjogTlvexup
         6ooEe6FaonFAsnTnc+99KcPPNVMh6YlQjLAVNviKcc4I9u8y2p1AS4SC2xNjMSth6PTS
         UYhsVVUbFHyOa7rNHkFgOA/2K5PLb8eNPbcdbs8Tdhpj+f9y2tN3q9pICrXndcoLYfwj
         BqBPgVfMnC/hRoFpdwDsXA2/Ec2/815a+3Sffm1AzYrmaWaTXIvWdeNmZytAzxZrTpSt
         8mem52z/QkkFH94a+BPbL5gefSsXzjSRnS6NzxeVzTuWlFqSRwmpM7ljNpzcy7mrUTY6
         wpmw==
X-Gm-Message-State: APjAAAWyzwGiiH2azy+ScmWd48dsgj8zbjkP0T4uuc2UZjB7oiA5Ct2b
        o/yryKd2vVV2aVKDZTyUFcI37rCCpZKVdHzM6uA=
X-Google-Smtp-Source: APXvYqygm5yiRH3vpF8T5W/PhygCjGZrGfGYrWM5PLTXTvTufF0Xj6dS4Xvx5Zx33oWjUK8S+Fud3s41GC9hvsxlGgI=
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr26677775plp.262.1566289777626;
 Tue, 20 Aug 2019 01:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
 <CAHp75Vct3qtR5bDF6iALmduKEEq+gNL-btmzQVuWq_hYsmxKhw@mail.gmail.com> <CACRpkdbRZ=88+ooW5jb5vu4Dwsaj7Ce+V5Ked2-bGn0JWpTHfQ@mail.gmail.com>
In-Reply-To: <CACRpkdbRZ=88+ooW5jb5vu4Dwsaj7Ce+V5Ked2-bGn0JWpTHfQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Aug 2019 11:29:25 +0300
Message-ID: <CAHp75VdZk5F2RTyLbtnD57hNYG3i=Grxd-mBTVOS6yckjr9XbQ@mail.gmail.com>
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
>
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
>
> The new API introduced by this patch is what I am trying to switch
> everything over to, because the forked paths inside of gpiolib
> is causing me a maintenance headache and also increasing
> the footprint of the library.
>
> >  it seems broadly
> > regress with ACPI enabled platforms.
>
> It only becomes a problem if the platform uses ACPI right?
> But it's a problem if I can't really tell if a driver is using
> ACPI or not, there is no sign in the pl061 driver that it would
> be used on ACPI systems until now, so how do I design
> for it?
>
> The problem comes from the problem/mess I am trying to
> clean up in the first place. So if the new way of registering GPIO
> irqchips is not working for ACPI, then we have to fix that instead
> of reverting all attempts to use the new API IMO.
>
> Yours,
> Linus Walleij



-- 
With Best Regards,
Andy Shevchenko
