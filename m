Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F091E28C1CF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgJLT7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 15:59:14 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52841 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgJLT7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 15:59:13 -0400
Received: from [192.168.1.155] ([77.2.5.48]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOQyE-1kplnT1Rb4-00PuLl; Mon, 12 Oct 2020 21:58:57 +0200
Subject: Re: [PATCH] gpio: gpio-amd-fch: Fix typo on define of
 AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ed W <lists@wildgooses.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Eckert <fe@dev.tdt.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200920203207.25696-1-lists@wildgooses.com>
 <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
 <deb07bad-2d84-723a-7237-2b625a3c4de8@wildgooses.com>
 <815ff3a6-8941-573d-36c0-36639f47dc04@wildgooses.com>
 <CAHp75Ve3APYLKzH9KvmTueEcTP-CZJS9MmLC+ZsHRT9brOxsEQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <8e28d798-c429-fb1c-8b6f-f271f694cfd3@metux.net>
Date:   Mon, 12 Oct 2020 21:58:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve3APYLKzH9KvmTueEcTP-CZJS9MmLC+ZsHRT9brOxsEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1OCHnEmxT6HKaEDcG9/t/pkL4s0iEx2M7MzJ6h97VAOPM4VLsGv
 nc2Fsb2Ub+37My/omxUVmCbR70skZpbnRNOz1IuZKaf1Zwws4xx1XwlACISvC5PD+Xkgx5M
 RrMIfaGkfICDMKYno37ekMSMIFR0856HJzq8bSeUZPyESNag52KUsH8htGqLl/pAXUTL13f
 QZrODSor/RmgbbXGIgEhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lc9Xpg21jmM=:6w8wQGrHdkVxzAaoQj+Ufz
 bhfCSKSdYY5kexwZpoVd/V5vxMJxI7yVx3BIjQrxGVYrZQho/Sw+321jOHMst2n0Vy7TOnebR
 bHtwVpb9yiU9yHHZ+3bfik9OkORGoyL1Xy+lD/i7wDPpqt87weu6hQHokNjKIPcL0aBtQohDH
 wadpY9wpKV2cfMcSvLqXgeOkCSPYC3VyQnY8JPgbrx+/BpVv9wYq1d+Ox+QJlY2Y0H7Vya9Lq
 R+1zXwh8DZkFsgQ+1T97fkH+V8w8ZD+EA8XvBdjhpewlaZzs52uHHyLKP6WihNZjZxmtacuMd
 Nb5T/gUbiDwbRjG1BSzo7/YJcWlMR8yrpgPBMEFyLVzLGn0VBkvhuj0vGTvGWHiheJpFL7ov/
 Lu0eHo3nUvnUzFfil7oHpa1m4tHUwDJ7GVapxKvi43nT5J9pzbXVID6R6Sw4FR/eoHxrUk5TX
 W5M9IHj94SfrEJr13MpBTtafZdE46xXedsys1YAt2fdxkWiyGELLWqjia6eSUqTX3YPi9VmdD
 I0cLF98orMukhgX7aqPJr+EWZ7QVfGXeKYJpnmZk91m4NaSNzylbOPimSa31W47te/RsVXxiy
 SZQv8D/26O0yY/hjcNS4wwLz/vWAFROUD6iQ0izHBc/lp7xJQMjc5xhgt9jJmYcWSGA1mDbwI
 y4HJTrxlunkGXzFZuK+y+2FKRl9rwWq4GT3LI+SZo9G57EBDrtl6ucHB1iTPaSQwculBjZ1o7
 JSBFicKdsVw2d2WZ5BHdM/T7HJ80uWUibN1aWW9GdhtE75AkJ7wTmFjdjizIYoFujOIioH0Kr
 SW9kcjb43CthbxbZkSB0XC9wJ8MIa5Qde28e4P4TWKodpMhj0V/TgTxrZUG+cGKh83mihWW
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Acked-by: Enrico Weigelt <info@metux.net>


--mtx

On 28.09.20 13:45, Andy Shevchenko wrote:
> On Mon, Sep 28, 2020 at 1:33 PM Ed W <lists@wildgooses.com> wrote:
>>
>> Hi
>>
>> Could I get a final opinion (or signoff) on this patch please?
>>
>> The significant typo is the reference to "59", when the GPIO is actually 55
>>
>> According to the PCEngines schematic the names of two similar GPIOs are
>>     G59/DEVSLP1
>>     G55/DEVSLP
>>
>> The original developer named the second GPIO with a trailing 0, which doesn't seem unreasonable,
>> hence I just corrected the name to:
>>     AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>> However another acceptable name could be:
>>     AMD_FCH_GPIO_REG_GPIO55_DEVSLP
>>
>> If I could ask for some guidance and if necessary I will resubmit this patch? Enrico, do you have an
>> opinion?
>>
>> However, perhaps it's already acceptable as is?
> 
> It's being accepted, and will be sent later to Linus.
> 
>>
>> Kind regards
>>
>> Ed W
>>
>>
>> On 21/09/2020 09:40, Ed W wrote:
>>> On 21/09/2020 08:55, Andy Shevchenko wrote:
>>>> On Sun, Sep 20, 2020 at 11:33 PM Ed Wildgoose <lists@wildgooses.com> wrote:
>>>>> Schematics show that the GPIO number is 55 (not 59). Trivial typo.
>>>> Does it still DEVSLP0? Perhaps you need to drop that part as well.
>>>>
>>>> ...
>>>
>>>
>>> In the PCEngines schematic it's labelled as "G55/DEVSLP" (no 0)
>>>
>>> (In contrast G59 is labelled "G59/DEVSLP1")
>>>
>>> What is the quorum opinion on name?
>>>
>>> Thanks
>>>
>>> Ed W
>>>
>>>
>>>>
>>>>>   #define APU2_GPIO_REG_LED3             AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>>>>>   #define APU2_GPIO_REG_MODESW           AMD_FCH_GPIO_REG_GPIO32_GE1
>>>>>   #define APU2_GPIO_REG_SIMSWAP          AMD_FCH_GPIO_REG_GPIO33_GE2
>>>>> -#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
>>>>> +#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>>>>>   #define APU2_GPIO_REG_MPCIE3           AMD_FCH_GPIO_REG_GPIO51
>>>>>
>>>>>   /* Order in which the GPIO lines are defined in the register list */
>>>>> diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h
>>>>> b/include/linux/platform_data/gpio/gpio-amd-fch.h
>>>>> index 9e46678ed..255d51c9d 100644
>>>>> --- a/include/linux/platform_data/gpio/gpio-amd-fch.h
>>>>> +++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
>>>>> @@ -19,7 +19,7 @@
>>>>>   #define AMD_FCH_GPIO_REG_GPIO49                0x40
>>>>>   #define AMD_FCH_GPIO_REG_GPIO50                0x41
>>>>>   #define AMD_FCH_GPIO_REG_GPIO51                0x42
>>>>> -#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP0        0x43
>>>>> +#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
>>>>>   #define AMD_FCH_GPIO_REG_GPIO57                0x44
>>>>>   #define AMD_FCH_GPIO_REG_GPIO58                0x45
>>>>>   #define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46
>>>>
>>>
>>
> 
> 

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
