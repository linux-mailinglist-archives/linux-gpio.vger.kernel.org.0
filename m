Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6A621856E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgGHLCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:02:22 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:35043 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgGHLCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:02:22 -0400
Received: by mail-ej1-f66.google.com with SMTP id rk21so49926447ejb.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 04:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bpW/NDEG/6JxUM/CgxVwp6wEyVPS9lCqLo7hWQjdp4g=;
        b=HWbQanmRTPakl4k/9GJrs9H/fK+dxTuMqcgnjKwfrZaPF0zV3Y1xz7fghkE+g7dFUt
         SP1S24BsUUWRSGxnPrRe0xRATEeC8WOx9fz6RPRRM4RNby69JGNFvMy1IWUzSQD/3qcH
         Xa8Q/TM8YvhMK58T+5fbePzK0e7eLjyea+Y+glt5xSarWRIo65IKTr7QRsDCcbNPHhYl
         tea45Zr6iLLE6C6IyD4cTEaUzBKPfgegEJOPbVOWbgsrEC9AAlLaPnDc9DMI4v2530lC
         0fUKs2VnCJhKqk7F5zB1Oy+3UWqLa4rWpODAxTBSLh+pjwpewq045IpdhhgIUAOtS2y7
         ig6A==
X-Gm-Message-State: AOAM530TBgXhWJH3YQtDGValNz+Kt8phtbw+vGOOUP6icQvPwEdzhzz2
        TIeOdrNW2U5EmhuX9IyTRXKF/+b3
X-Google-Smtp-Source: ABdhPJxx+h4YgztQumDCZvbYgnr1WteDtIfjbrODarwnY4n+Y+anzbdWdsQTeIQR8I+q/XbkitDAGA==
X-Received: by 2002:a17:906:1986:: with SMTP id g6mr40432921ejd.404.1594206138936;
        Wed, 08 Jul 2020 04:02:18 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id z8sm1751930eju.106.2020.07.08.04.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:02:18 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
Date:   Wed, 8 Jul 2020 13:02:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08. 07. 20, 12:15, Hans de Goede wrote:
> Hi,
> 
> On 7/8/20 10:52 AM, Jiri Slaby wrote:
>> On 08. 07. 20, 10:23, Hans de Goede wrote:
>>> Hi all,
>>>
>>> On 7/8/20 9:47 AM, Linus Walleij wrote:
>>>> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>>>
>>>>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>>>>> even then it encounters lags, soft lockups:
>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>>
>>>> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
>>>> so he might have some ideas here.
>>>
>>> Thank you for looping me in Linus. I've read up on the rest of the
>>> thread in the archives.
>>>
>>> So looking at this:
>>> https://www.umax.cz/umax-visionbook-10wi/
>>>
>>> This device appears to be a pretty standard Cherry Trail based 2-in-1
>>> with detachable keyboard. Which usually means (with all the
>>> hw-enablement
>>> I've been doing the last 2 years for these) that it will just work.
>>> But no such luck this time it seems.
...
>>> What I find interesting / weird is that you (Jiri) get an active
>>> (/sys/bus/acpi/devices/INT3496\:00/status != 0) INT3496 device at
>>> all. That typically only happens when the BIOS thinks you are booting
>>> Android.
>>
>> 15 that is.
> 
> Right, that is normal for an enabled device the ACPI method
> implementing the status attribute for your tablet looks like this:
> 
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 If (((BDID == One) && (OSID != One)))
>                 {
>                     Return (0x0F)
>                 }
> 
>                 Return (Zero)
>             }
> 
> So now we know that BDID == One and OSID != One, OSID == One
> typically is Windows...
> 
> Looking at the buttons next, can you do:
> 
> cat /sys/bus/acpi/devices/ACPI0011:00/status

Gives 0

> and:
> 
> cat /sys/bus/acpi/devices/INTCFD9:00/status

Gives 15

> 
> If the BIOS thinks you are booting normal Windows the first
> one should output 15  (0xf) aka present and the second one
> should output 0, but I suspect it is the other way around...

Right.

> So looking at the GPIO resource definitions for BDID == One
> for the ACPI0011 device we have:
> 
>                 Name (PBUF, ResourceTemplate ()
>                 {
>                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp,
> 0x0BB8,
>                         "\\_SB.GPO2", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0008
>                         }
>                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
> 0x0BB8,
>                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x004E
>                         }
>                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
> 0x0BB8,
>                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0050
>                         }
>                 })
> 
> With a mapping of first resource to KEY_POWER, second resource to
> KEY_VOLUMEUP and third resource to KEY_VOLUMEDOWN
> 
> The INTCFD9 device OTOH has the following resource definitions for BDID
> == One
> 
>                 Name (PBUF, ResourceTemplate ()
>                 {
>                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp,
> 0x0BB8,
>                         "\\_SB.GPO2", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0008
>                         }
>                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake,
> PullDefault, 0x
>                         "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0008
>                         }
>                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
> 0x0BB8,
>                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x004E
>                         }
>                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
> 0x0BB8,
>                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0050
>                         }
>                 })
> 
> With a mapping of resource1: power, resource2: home, resource3: volume_up,
> resource4: volume_down.
> 
> So what we see here is that the "Android" style INTCFD9 device has
> an extra entry for the home-button and I guess (hard to see on the
> pictures) that there is no physical home-button.

I don't know what it should look like, but there is no button with
house-like painting. There is only a standard "Home" button -- Fn+PgUp.
And that works even without that module.

> Since the IRQ storm you are seeing on the home button is happening on
> GPO1 pin 8 which is only listed as a button on the "Android" style
> INTCFD9 device. I guess that the manufacturer started with a standard
> ACPI DSDT for these devices and then hacked up the Windows entries until
> they work.
> 
> Likewise the INT3496 entry likely is non-sense too. So you are seeing
> a storm from some floating GPIOs which are close enough to some
> other signals to pick up interference from them.
> 
> Conclusion: we need to get your BIOS to stop setting OSID to 0
> (Android) and get it to set it to 1 (Windows).
> 
>>> Now you may think that Android == Linux so that should be good,
>>> but Intel did a real frankenstein solution for Android X86, see:
>>> https://github.com/intel/ProductionKernelQuilts
>>> for all the 5000 downstream patches in al their glory (hint your
>>> life will be better if you don't take a look).
>>>
>>> The much saner support for these devices which eventually got added
>>> to the mainline kernel actually works much better with the "Windows"
>>> profile of the BIOS, since the mainline code expects sane ACPI tables
>>> and the Android targetting ACPI tables are a bit of a mess.
>>>
>>> So the first thing to do is to go into the BIOS setup and see if
>>> there is a setting for this (this depends on if the BIOS is
>>> unlocked and has like a gazillion settings, or if it is locked
>>> to only show a few settings).
>>>
>>> I just checked on one of own CHT devices and there the option is
>>> under Advanced -> System Component -> OS IMAGE ID
>>
>> I had/have:
>> Advanced
>>    -> Droid boot = disabled
>>    -> Android boot = disabled
>>    -> OS selection = Windows 8.x (there is also GMIN and Android to
>> select)
>>
>> So there seems nothing I should change?
> 
> Ok, so some of these devices have some multi-boot code inside for
> dualbooting both Android and Windows and they automatically override
> the "OS selection" on every boot.
> 
> Since your device has only 1G of RAM it likely shipped with a 32
> bit Windows to save RAM and thus has either a 32 bit only UEFI,
> or a dual-mode UEFI. I'm guessing that it is the latter and when
> you inserted the boot-medium you used to install, the BIOS saw a
> EFI/BOOT/bootx64.efi binary on the boot-medium and switches to
> 64 bit mode which it associates with Android.

No, it has 2G of RAM.
# free -h
              total        used        free      shared  buff/cache
available
Mem:          1,8Gi       497Mi       786Mi       108Mi       567Mi
  1,1Gi
Swap:         2,0Gi          0B       2,0Gi

It also has only 32 but EFI. It doesn't recognize 64-bit binaries. I had
to load 32-bit grub first to load the installer from a USB. So this is
EFI-mixed mode as it is called.

> If you run:
> efibootmgr -v
> 
> You will likely see your current active boot entry point to
> something with x64 in the name, e.g. I have:
> 
> Boot0000* Fedora       
> HD(1,GPT,a662134d-b40c-48de-8811-e43fee1adfa3,0x800,0x82000)/File(\EFI\fedora\shimx64.efi)

As I wrote above:
Boot0001* opensuse
HD(1,GPT,3f7cc368-0736-45a3-b23e-e1c0eda840be,0x800,0xfa000)/File(\EFI\opensuse\grub32.efi)

I've tried your patches now, but it crashes the kernel due to omitted
chv_padreg(), so rebuilding with that fixed...

thanks,
-- 
js
