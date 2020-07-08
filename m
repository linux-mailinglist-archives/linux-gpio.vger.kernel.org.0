Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA2C2184BC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgGHKQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:16:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46441 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbgGHKQA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594203358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zOMP7E0W97PDDTdNBGEO02xFaNIK2IjPz9+TpsVPcoY=;
        b=Dgs1FrhvDYiKn3wqmpNSRptLf68bELlNz/o200X0WqPWpIOXv7VOpV+0umlBKEf+UQ88IY
        poBFOoltE5ssKeDaIUPj5uILPuLcuXeG2WtAgdnu6zHbQIqayoeEEZP28C6vITvsLf74kA
        VsFzDh19EFQ+a70t2VyzmMnjLo2tKn4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-hjv4qr99NjOZOZVNzg1yyA-1; Wed, 08 Jul 2020 06:15:50 -0400
X-MC-Unique: hjv4qr99NjOZOZVNzg1yyA-1
Received: by mail-ej1-f69.google.com with SMTP id q11so43037387eja.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 03:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zOMP7E0W97PDDTdNBGEO02xFaNIK2IjPz9+TpsVPcoY=;
        b=iGJ5Iy4khQf0AB69gWd5WyNleDh/TPDsLjeB9FVY77iEv/wXqP3doB6+HCOqJT2QcZ
         Dq3LJGrQEWUbvIpT6mljbxYc58W9/btjhXtcHoJZ0VIqxunAEZDehQkgrZU4KR1MHbNx
         bPDNBWnnXbE7vfVlccQdkjkcib9WFuwP0/TDs9Qmv6FbNoR+eMqzcURyIKUzSGc5T6rK
         PiEkdaMo5NysYGiylAcjnrUxWAC52bIB3KL4wyS6LjjVPrM0GgOMhOAzoMSnDfey2ApY
         V3Po0M5lzQnHRDTq2OGzBhiKd9+do1RxLhSkweFj5iNrJco3ZBxa0Ux5elA0Kub0Rbhs
         KoHw==
X-Gm-Message-State: AOAM530ulqK0o1NR1xWlT4zDh305tkaiMCc4afHtOYazvREun0n4N02A
        mI+7jlOmvm3ajg49ksdfr/tv6bSg4fcEtllwTPQL2Vxh97eu/VKlzrB1ITGz8Kb35Tvc24fBLBa
        xRHxrQouT1vKW2Gp2EMfasg==
X-Received: by 2002:aa7:d58c:: with SMTP id r12mr69278122edq.160.1594203349165;
        Wed, 08 Jul 2020 03:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpYNcazOdMiCi5P2Qi0Y1aLLvAn5pL7UE0hHG7gNu8MfFQl7KtYP19l+gtC41EK+JLcSLKmg==
X-Received: by 2002:aa7:d58c:: with SMTP id r12mr69278098edq.160.1594203348884;
        Wed, 08 Jul 2020 03:15:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id b14sm1770866ejg.18.2020.07.08.03.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 03:15:48 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Jiri Slaby <jirislaby@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
Date:   Wed, 8 Jul 2020 12:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/8/20 10:52 AM, Jiri Slaby wrote:
> On 08. 07. 20, 10:23, Hans de Goede wrote:
>> Hi all,
>>
>> On 7/8/20 9:47 AM, Linus Walleij wrote:
>>> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>>
>>>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>>>> even then it encounters lags, soft lockups:
>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>
>>> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
>>> so he might have some ideas here.
>>
>> Thank you for looping me in Linus. I've read up on the rest of the
>> thread in the archives.
>>
>> So looking at this:
>> https://www.umax.cz/umax-visionbook-10wi/
>>
>> This device appears to be a pretty standard Cherry Trail based 2-in-1
>> with detachable keyboard. Which usually means (with all the hw-enablement
>> I've been doing the last 2 years for these) that it will just work.
>> But no such luck this time it seems.
> 
> Hi,
> 
> It seems to be Baytrail.

Ah, ok I did not check, I went by the chv-gpio in the subject.

>> What I find interesting / weird is that you (Jiri) get an active
>> (/sys/bus/acpi/devices/INT3496\:00/status != 0) INT3496 device at
>> all. That typically only happens when the BIOS thinks you are booting
>> Android.
> 
> 15 that is.

Right, that is normal for an enabled device the ACPI method
implementing the status attribute for your tablet looks like this:

             Method (_STA, 0, NotSerialized)  // _STA: Status
             {
                 If (((BDID == One) && (OSID != One)))
                 {
                     Return (0x0F)
                 }

                 Return (Zero)
             }

So now we know that BDID == One and OSID != One, OSID == One
typically is Windows...

Looking at the buttons next, can you do:

cat /sys/bus/acpi/devices/ACPI0011:00/status

and:

cat /sys/bus/acpi/devices/INTCFD9:00/status

If the BIOS thinks you are booting normal Windows the first
one should output 15  (0xf) aka present and the second one
should output 0, but I suspect it is the other way around...

So looking at the GPIO resource definitions for BDID == One
for the ACPI0011 device we have:

                 Name (PBUF, ResourceTemplate ()
                 {
                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp, 0x0BB8,
                         "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0008
                         }
                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault, 0x0BB8,
                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x004E
                         }
                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault, 0x0BB8,
                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0050
                         }
                 })

With a mapping of first resource to KEY_POWER, second resource to
KEY_VOLUMEUP and third resource to KEY_VOLUMEDOWN

The INTCFD9 device OTOH has the following resource definitions for BDID == One

                 Name (PBUF, ResourceTemplate ()
                 {
                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp, 0x0BB8,
                         "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0008
                         }
                     GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDefault, 0x
                         "\\_SB.GPO1", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0008
                         }
                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault, 0x0BB8,
                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x004E
                         }
                     GpioInt (Edge, ActiveBoth, Exclusive, PullDefault, 0x0BB8,
                         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0050
                         }
                 })

With a mapping of resource1: power, resource2: home, resource3: volume_up,
resource4: volume_down.

So what we see here is that the "Android" style INTCFD9 device has
an extra entry for the home-button and I guess (hard to see on the
pictures) that there is no physical home-button.

Since the IRQ storm you are seeing on the home button is happening on
GPO1 pin 8 which is only listed as a button on the "Android" style
INTCFD9 device. I guess that the manufacturer started with a standard
ACPI DSDT for these devices and then hacked up the Windows entries until
they work.

Likewise the INT3496 entry likely is non-sense too. So you are seeing
a storm from some floating GPIOs which are close enough to some
other signals to pick up interference from them.

Conclusion: we need to get your BIOS to stop setting OSID to 0
(Android) and get it to set it to 1 (Windows).

>> Now you may think that Android == Linux so that should be good,
>> but Intel did a real frankenstein solution for Android X86, see:
>> https://github.com/intel/ProductionKernelQuilts
>> for all the 5000 downstream patches in al their glory (hint your
>> life will be better if you don't take a look).
>>
>> The much saner support for these devices which eventually got added
>> to the mainline kernel actually works much better with the "Windows"
>> profile of the BIOS, since the mainline code expects sane ACPI tables
>> and the Android targetting ACPI tables are a bit of a mess.
>>
>> So the first thing to do is to go into the BIOS setup and see if
>> there is a setting for this (this depends on if the BIOS is
>> unlocked and has like a gazillion settings, or if it is locked
>> to only show a few settings).
>>
>> I just checked on one of own CHT devices and there the option is
>> under Advanced -> System Component -> OS IMAGE ID
> 
> I had/have:
> Advanced
>    -> Droid boot = disabled
>    -> Android boot = disabled
>    -> OS selection = Windows 8.x (there is also GMIN and Android to select)
> 
> So there seems nothing I should change?

Ok, so some of these devices have some multi-boot code inside for
dualbooting both Android and Windows and they automatically override
the "OS selection" on every boot.

Since your device has only 1G of RAM it likely shipped with a 32
bit Windows to save RAM and thus has either a 32 bit only UEFI,
or a dual-mode UEFI. I'm guessing that it is the latter and when
you inserted the boot-medium you used to install, the BIOS saw a
EFI/BOOT/bootx64.efi binary on the boot-medium and switches to
64 bit mode which it associates with Android.

If you run:
efibootmgr -v

You will likely see your current active boot entry point to
something with x64 in the name, e.g. I have:

Boot0000* Fedora        HD(1,GPT,a662134d-b40c-48de-8811-e43fee1adfa3,0x800,0x82000)/File(\EFI\fedora\shimx64.efi)

I guess you run Suse on there? Assuming the setup is similar
as we use on Fedora you should also have both of these files:

/boot/efi/EFI/Boot/bootx64.efi
/boot/efi/EFI/Boot/bootia32.efi

(note the caps may differ, because of vfat)

These are fallback boot files which the BIOS will use when
there are no valid boot entries.

If you are missing the bootia32 variant you should be able
to install it, e.g. I have:

[root@x1 ~]# rpm -qf /boot/efi/EFI/BOOT/BOOTX64.EFI
shim-x64-15-8.x86_64

So I can add the ia32 variant by doing:

dnf install shim-ia32

Once you have the bootia32.efi (and grub 32 bit too!)
you should be able to get the BIOS to switch to 32 bit
UEFI aka Windows mode by removing the
/boot/efi/EFI/BOOT/BOOTX64.EFI file
(I would just mv it to .bak for now)

And also removing all boot entries in
efibootmgr pointing to x64 efi binaries (or just remove
them all).

Then the BIOS should do a fallback boot, see there is
no bootx64.efi and switch to 32 bit mode.

I say should, you probably want to have a livecd or
some such at hand to rescue the system if I'm wrong
and it only supports 64 bit EFI.

Note that your 64 bit kernel will be fine with running on
top of the 32 bit UEFI, it will thunk any firmware calls to
32 bits as necessary.

Regards,

Hans

