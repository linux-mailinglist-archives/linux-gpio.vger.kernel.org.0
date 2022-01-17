Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB134909B6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jan 2022 14:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbiAQNpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 08:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiAQNp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jan 2022 08:45:29 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011B5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:45:29 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id d3so14777042ilr.10
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Snw5TY3PEx+mMOgfakZCXG38izFVSIB9NWx2Hb7g2eQ=;
        b=DuD4klDkC9SobMs2QrJhXeoZAebSc+YR7kNwAGgVcjBtdjs2l01869l3TMguCtkhZh
         EbZPckuzTcBf2SafWYxnKV2xvQroqzVdwUpzI1h7Mvo7QFeUPVnG1shqY1/3+biv90yT
         pUsD2o0JkXH+DUWA62J3qUcAYz2aLZIerqLAeRUqE8ZkJes+dLExq8U18NlZpDA9+MJN
         Cd4c5OkzLX4UwiRS5WHlbDTGuMBUq27dl0tvtwycvJBamfGpWs7hCu3B8ZBTM6Cs3Abf
         WEydXjDbUokTsWRb/izcKEq3EIuvm/dVqrutN9euDoBnysazJDlP9o2UGiqG0rq6pc4i
         E/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Snw5TY3PEx+mMOgfakZCXG38izFVSIB9NWx2Hb7g2eQ=;
        b=MMDEM2ZOWxsyc+PVzCNsm04dQIYbd4RjOjdl4EMLGcvYVc0RK5ZZEnT8EcGhxwS+kK
         eJCaz6yrxGrAX0RqOuukHwHWtW0vGz5FNuzVMogTeUvBM2wPma6uh40IwCk80HfpIzFk
         N4xq1fVrca4YPE4BZkxRYl5jS5QfZo+Y65mXZKCs2yzIrprQNtzJG6NY6ddr7dQJdmiu
         oycE/hUdwVrhHW2Hw6GYWQOnyuVngT48xzuZV3V9eTELgb3vJV7DjKG2WBNmgcyMU9ND
         Gui9Iyweo45TxW7xofN+w+zckm02cmu3xX856Hb7Y1GogYLGWtJ78gY62+yPEV0/WvFU
         k2EA==
X-Gm-Message-State: AOAM532ZfFt360vZicoxwS5bRB6igrOqb7GeCLsQb6KnqfWP1dz3cogW
        Mgs0H0AZ0wwo+yfMJfSXzI0XQuPV6Jdkx+ro0V7I
X-Google-Smtp-Source: ABdhPJxH+9S8cV7VdcjoWpz/bPhi+qlD+FPQ20Bywe1HOjg90+teY72jV+ZyEapQ0yG2Uzz3q+PbUxVw4qcd1yDOJzo=
X-Received: by 2002:a92:da81:: with SMTP id u1mr3518341iln.115.1642427128361;
 Mon, 17 Jan 2022 05:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20220114200138.28254-1-lukasz.bartosik@semihalf.com> <CAHp75VdTU8nf3GTwnv0W=pZ6WqWGnpn=8tg9GtygVU8DipxaKg@mail.gmail.com>
In-Reply-To: <CAHp75VdTU8nf3GTwnv0W=pZ6WqWGnpn=8tg9GtygVU8DipxaKg@mail.gmail.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Mon, 17 Jan 2022 14:45:17 +0100
Message-ID: <CAK8ByeJN5uqeUQigZZwhS5iUPFGYfJ_3koMdycuo5osYL3-Lsg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: fix unexpected interrupt
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "upstream@semihalf.com" <upstream@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 15 sty 2022 o 09:57 Andy Shevchenko <andy.shevchenko@gmail.com>
napisa=C5=82(a):
>
>
>
> On Friday, January 14, 2022, Lukasz Bartosik <lb@semihalf.com> wrote:
>>
>> From: =C5=81ukasz Bartosik <lb@semihalf.com>
>>
>> ASUS Chromebook C223 with Celeron N3350 crashes sometimes during
>> cold booot. Inspection of the kernel log showed that it gets into
>> an inifite loop logging the following message:
>>
>> ->handle_irq():  000000009cdb51e8, handle_bad_irq+0x0/0x251
>> ->irq_data.chip(): 000000005ec212a7, 0xffffa043009d8e7
>> ->action(): 00000
>>    IRQ_NOPROBE set
>> unexpected IRQ trap at vector 7c
>>
>> The issue happens during cold boot but only if cold boot happens
>> at most several dozen seconds after Chromebook is powered off. For
>> longer intervals between power off and power on (cold boot) the issue
>> does not reproduce. The unexpected interrupt is sourced from INT3452
>> GPIO pin which is used for SD card detect. Investigation relevealed
>> that when the interval between power off and power on (cold boot)
>> is less than several dozen seconds then values of INT3452 GPIO interrupt
>> enable and interrupt pending registers survive power off and power
>> on sequence and interrupt for SD card detect pin is enabled and pending
>> during probe of SD controller which causes the unexpected IRQ message.
>> "Intel Pentium and Celeron Processor N- and J- Series" volume 3 doc
>> mentions that GPIO interrupt enable and status registers default
>> value is 0x0.
>> The fix clears INT3452 GPIO interrupt enabled and interrupt pending
>> registers in its probe function.
>>
>
>
> Thanks for the report and patch!
>
>
> What I am afraid of is that we may lost an events from important sources,=
 I.e. GPE and touchpad which may be crucial.
>
> In this case how do we know that no event is pending at this stage?
>

After probe is completed when an interrupt is being enabled for a pin
in intel_gpio_irq_unmask() then
an interrupt pending bit is cleared just before enabling the interrupt.
Would you please elaborate how events may be lost if they are being
explicitly cleared before enabling the interrupts ?

Another approach could be to clear only enable interrupts register and
leave pending interrupts register intact ?

>
>>
>> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin control=
ler and GPIO support")
>> Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
>> ---
>>  drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++------------
>>  1 file changed, 26 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/int=
el/pinctrl-intel.c
>> index b6ef1911c1dd..b8282d5f485e 100644
>> --- a/drivers/pinctrl/intel/pinctrl-intel.c
>> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
>> @@ -1428,6 +1428,26 @@ static int intel_pinctrl_pm_init(struct intel_pin=
ctrl *pctrl)
>>         return 0;
>>  }
>>
>> +static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
>> +{
>> +       size_t i;
>> +
>> +       for (i =3D 0; i < pctrl->ncommunities; i++) {
>> +               const struct intel_community *community;
>> +               void __iomem *base;
>> +               unsigned int gpp;
>> +
>> +               community =3D &pctrl->communities[i];
>> +               base =3D community->regs;
>> +
>> +               for (gpp =3D 0; gpp < community->ngpps; gpp++) {
>> +                       /* Mask and clear all interrupts */
>> +                       writel(0, base + community->ie_offset + gpp * 4)=
;
>> +                       writel(0xffff, base + community->is_offset + gpp=
 * 4);
>> +               }
>> +       }
>> +}
>> +
>>  static int intel_pinctrl_probe(struct platform_device *pdev,
>>                                const struct intel_pinctrl_soc_data *soc_=
data)
>>  {
>> @@ -1488,6 +1508,12 @@ static int intel_pinctrl_probe(struct platform_de=
vice *pdev,
>>                         return ret;
>>         }
>>
>> +       /*
>> +        * Make sure the interrupt lines are in a proper state before
>> +        * further configuration
>> +        */
>> +       intel_gpio_irq_init(pctrl);
>
>
>
> This should go in the corresponding callback in struct gpio_chip. ->irq_h=
w_init() or so.
>

I will move it into gpio_chip->irq->init_hw().

>>
>> +
>>         irq =3D platform_get_irq(pdev, 0);
>>         if (irq < 0)
>>                 return irq;
>> @@ -1640,26 +1666,6 @@ int intel_pinctrl_suspend_noirq(struct device *de=
v)
>>  }
>>  EXPORT_SYMBOL_GPL(intel_pinctrl_suspend_noirq);
>>
>> -static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
>> -{
>> -       size_t i;
>> -
>> -       for (i =3D 0; i < pctrl->ncommunities; i++) {
>> -               const struct intel_community *community;
>> -               void __iomem *base;
>> -               unsigned int gpp;
>> -
>> -               community =3D &pctrl->communities[i];
>> -               base =3D community->regs;
>> -
>> -               for (gpp =3D 0; gpp < community->ngpps; gpp++) {
>> -                       /* Mask and clear all interrupts */
>> -                       writel(0, base + community->ie_offset + gpp * 4)=
;
>> -                       writel(0xffff, base + community->is_offset + gpp=
 * 4);
>> -               }
>> -       }
>> -}
>> -
>>  static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 valu=
e)
>>  {
>>         u32 curr, updated;
>> --
>> 2.34.1.703.g22d0c6ccf7-goog
>>
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best regards,
Lukasz
