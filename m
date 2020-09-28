Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783DE27AD23
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 13:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgI1LqQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 07:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1LqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 07:46:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE55C061755;
        Mon, 28 Sep 2020 04:46:15 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so734348pfg.13;
        Mon, 28 Sep 2020 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwMUcY3XkwfnX4NVH144ezfRaJEZAmC6LlLKw8bGZ/0=;
        b=qL0R40R1HA602EvKkHEmXf7m4tvAZFldTIc1GF5GjGaILZ9rOwkQ/I2iO8MnXWgx0I
         yhiAYRaD040/rpIuPM8UOeQkWh7pzR0jtEP/eTDnMEcbaut/MA1MxVWPuSKP4UEx5f9+
         dHRx+5nr77YrIx1s4z5YRXPz/8+VDYwNuXI+PQp02/c5vA5KhqkOnvQhJzNE4mBdEGPL
         wGUm5UMzS7W22UOBoQy2mtU9lsPHwh5u96uR0aYW7HCYRCWqc3W1DzMuYit6q3rJ/SVi
         Y9jB2M38jp3EkO61YysrX8v1Jy8THQe3KwBVk+qbIxiaNK10kF17IFWeL43+7Xa4Jhrd
         xOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwMUcY3XkwfnX4NVH144ezfRaJEZAmC6LlLKw8bGZ/0=;
        b=PUekF+CkylkXUZh6MM/kM/1rfIrOT+TCylJZAAKCu2YH+hwuKaCOGzxzbbST++4pgI
         ffgHJ57FvJviQa3ZcmuqWaEIYur1ChY4qv3bq7IOpfds0fdJcsDUaZoFd5vALbPE3s8e
         XpPyC6IWPFr6kxZv8VHZcPPZNRKEcUMQ7zedouV/vJtldScDYlZK+5m+sJk82nNUUHcw
         bVKy9iPYOiepuW207PYYfN2f9Ad67woVy4CtXV8StEIOQXIUUqKlPrfjlPlxHJ1aJJRA
         9Ms0NJ0FS7LpodZx7bfaImEx8eHRg01+n/NAjGerrew4/pQtYKsiWioWfDwRAWZVKYSM
         VnkA==
X-Gm-Message-State: AOAM533hqagputjN49JzGSqPjou3WDO2p0Nl+Y1LoF8q0GYky3oM3rF0
        hkgUZhn5CHYp1SVOajGHFR9xCBtI78nD0hSzzMI=
X-Google-Smtp-Source: ABdhPJyUK9sQZdERJKWj0DrjCJzQEXyYhxrOw3onM62jepqc/OVjaSZ54eluYPtAuTIVOkjj9OpKTrmRm2nqMq0iQHk=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr841807pgj.74.1601293575223;
 Mon, 28 Sep 2020 04:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200920203207.25696-1-lists@wildgooses.com> <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
 <deb07bad-2d84-723a-7237-2b625a3c4de8@wildgooses.com> <815ff3a6-8941-573d-36c0-36639f47dc04@wildgooses.com>
In-Reply-To: <815ff3a6-8941-573d-36c0-36639f47dc04@wildgooses.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 28 Sep 2020 14:45:56 +0300
Message-ID: <CAHp75Ve3APYLKzH9KvmTueEcTP-CZJS9MmLC+ZsHRT9brOxsEQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-amd-fch: Fix typo on define of AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
To:     Ed W <lists@wildgooses.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Eckert <fe@dev.tdt.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 1:33 PM Ed W <lists@wildgooses.com> wrote:
>
> Hi
>
> Could I get a final opinion (or signoff) on this patch please?
>
> The significant typo is the reference to "59", when the GPIO is actually 55
>
> According to the PCEngines schematic the names of two similar GPIOs are
>     G59/DEVSLP1
>     G55/DEVSLP
>
> The original developer named the second GPIO with a trailing 0, which doesn't seem unreasonable,
> hence I just corrected the name to:
>     AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> However another acceptable name could be:
>     AMD_FCH_GPIO_REG_GPIO55_DEVSLP
>
> If I could ask for some guidance and if necessary I will resubmit this patch? Enrico, do you have an
> opinion?
>
> However, perhaps it's already acceptable as is?

It's being accepted, and will be sent later to Linus.

>
> Kind regards
>
> Ed W
>
>
> On 21/09/2020 09:40, Ed W wrote:
> > On 21/09/2020 08:55, Andy Shevchenko wrote:
> >> On Sun, Sep 20, 2020 at 11:33 PM Ed Wildgoose <lists@wildgooses.com> wrote:
> >>> Schematics show that the GPIO number is 55 (not 59). Trivial typo.
> >> Does it still DEVSLP0? Perhaps you need to drop that part as well.
> >>
> >> ...
> >
> >
> > In the PCEngines schematic it's labelled as "G55/DEVSLP" (no 0)
> >
> > (In contrast G59 is labelled "G59/DEVSLP1")
> >
> > What is the quorum opinion on name?
> >
> > Thanks
> >
> > Ed W
> >
> >
> >>
> >>>   #define APU2_GPIO_REG_LED3             AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
> >>>   #define APU2_GPIO_REG_MODESW           AMD_FCH_GPIO_REG_GPIO32_GE1
> >>>   #define APU2_GPIO_REG_SIMSWAP          AMD_FCH_GPIO_REG_GPIO33_GE2
> >>> -#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
> >>> +#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
> >>>   #define APU2_GPIO_REG_MPCIE3           AMD_FCH_GPIO_REG_GPIO51
> >>>
> >>>   /* Order in which the GPIO lines are defined in the register list */
> >>> diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h
> >>> b/include/linux/platform_data/gpio/gpio-amd-fch.h
> >>> index 9e46678ed..255d51c9d 100644
> >>> --- a/include/linux/platform_data/gpio/gpio-amd-fch.h
> >>> +++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
> >>> @@ -19,7 +19,7 @@
> >>>   #define AMD_FCH_GPIO_REG_GPIO49                0x40
> >>>   #define AMD_FCH_GPIO_REG_GPIO50                0x41
> >>>   #define AMD_FCH_GPIO_REG_GPIO51                0x42
> >>> -#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP0        0x43
> >>> +#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
> >>>   #define AMD_FCH_GPIO_REG_GPIO57                0x44
> >>>   #define AMD_FCH_GPIO_REG_GPIO58                0x45
> >>>   #define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46
> >>
> >
>


-- 
With Best Regards,
Andy Shevchenko
