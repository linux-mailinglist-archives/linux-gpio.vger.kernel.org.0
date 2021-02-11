Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC49319098
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 18:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbhBKRFV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 12:05:21 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57915 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhBKRDw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 12:03:52 -0500
Received: from [192.168.1.155] ([95.114.27.115]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mf0Je-1lqkp01DlC-00gYWj; Thu, 11 Feb 2021 18:01:12 +0100
Subject: Re: RFC: oftree based setup of composite board devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAHp75VdNTenoE0AOmGfndqQ7SrxbuK+SvfFYn3W2GmqhkCSByQ@mail.gmail.com>
 <1b92deea-cf6d-7eca-197f-b12456279890@metux.net>
 <CAHp75Vd39OaGkgi5mSH+o39Js8gDW77fP8LUBx73EAH_mZ-scg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <f9c0af52-2930-7227-7ccb-4780fb1bb159@metux.net>
Date:   Thu, 11 Feb 2021 18:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd39OaGkgi5mSH+o39Js8gDW77fP8LUBx73EAH_mZ-scg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mSMdZII7B/L5K2vNbMMBbOi186sVVNTPZWRXD+rGUPifstgIhqX
 mbp4DOAf3sOPrv/sAJ+eEjU2gs3+wy+1oM23u5HiuahwM5L2TaMX234+swtoM1JUa987js1
 JIY4Kb2XhC0cs9ey6NtNHG+Wl+AbAAVOSupkPNFz2Sbf/FHB3a0RsqHtfWQfQBxIWJJ+CLY
 rrX8IrRMnqWoUh9LSPxDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H6wFMNih/84=:LmtpXXihpqFcKAZQwFPgib
 B2iC6LP7KojdCbUy/la9cRTd/OUQ71mR+mCswI3BIir6CvQ4ANG23f2KRxU6koVRXa2ZsBGQA
 0dvKvoN5M0BvCcQXdoW3GNv1+j6RYspIvfLRrfWRCoA/jVC5TcjB5z4txlFQwCi2cw1DPdqmg
 4ODIwj//TJvRxKJjYgQ3rSpJSr7N/ZpvSUJdOEfEcj6ToguijOV5AL9aT/qkPhz4QplR6Rh3h
 0EcTx8/9W9XTHvLMhkbEekOkCsWjzO0tGxgDx8XtghWtwlCtYheLvrzSifapjF/bwekpiBD7O
 a3VEKtdR9QOC9RQQ3hmELy7vnwBVh6/DvWVF4u6PzaTf9ZCibgRwQ5ESEK88GNE5L7IwaFJBp
 pPToAmyn7DcT36CYkUe9HKDutMqAVpWYYnO8swuh9T1xmt+NhVN4UWHBabhkU
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.02.21 12:41, Andy Shevchenko wrote:

Hi,

> On Thu, Feb 11, 2021 at 1:15 PM Enrico Weigelt, metux IT consult
> <lkml@metux.net> wrote:
>> On 10.02.21 11:30, Andy Shevchenko wrote:
> 
>>>> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
>>>> platform devices can't be directly enumerated via firmware. Traditionally
>>>> we had to write board specific drivers that check for board identification
>>>> (DMI strings, etc), then initialize the actual devices and their links
>>>> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
>>>
>>> In ACPI we support DT compatible strings, and we support overlays for
>>> a long time. Would it work for you?
>>
>> please tell me more, how ACPI and DT can already work together ?
> 
> It's all in documentation.
> 
> https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id

Thanks, but I'm still unsure how this helps me. I'm not intending to
touch any firmware (and expect people in the field flashing new fw).
I have to live with what we find in the field (otherwise I'd just write
omplete DTs for the corresponding boards and throw out ACPI :p)

> https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html

Are you suggesting I should load SSDT overlays at runtime (from
userland ?) instead of using DT ?

> Please, please, read documentation beforehand!

I actually did read that documentation, but unfortunately it doesn't
tell me how to use additional DTs on ACPI systems.

>> You already know my apu board driver - that's my first example usecase.
> 
> Sorry, but I forgot about it. Can you summarize what is your use case
> that really needs so intrusive and hard work?

The current APU2/3/4 driver is pretty much fine (except that possibly
some more bios-version specific quirks might be needed). It basically
just instantiates a bunch of other devices (gpio, led, input, ...)
and connects them.

All of that (except for the DMI match table) already can be easily
expressed in DT, so this calls for a generalization. At that point I
tried to achieve the following goals:

* a generic mechanism for detecting boards (and later pci cards, usb
   dongles, etc) and probing the devices from the corresponding DT
* have everything that makes up an individual board in one DT(S)
* ability to blacklist (kick out) specific devices already probed via
   ACPI, so they don't conflict. (*1)

>> * match rules shall be inside the DTS
>> * future match rules shall also check for bios versions etc
>> * adding new boards shall be possible by just adding another DTS to
>>     the tree (not a whole module)
>> * supporting several board variants (w/ small differences) by one DTS
>> * sometimes existing devices (eg. enumerated by acpi) need to be kicked
>>     out (buggy firmware, ...)
>> * can't rely on any special userland tweaks
> 
> Show an example why either of the above is needed in your case and
> tell what is the exact issue.

In the specific APU case (note that my proposal is a generic mechanism
for a whole class of similar usecases), *some* bios versions already
enumerate *some* gpios, later versions already enumerate some LEDs but
different naming than the driver's, etc., etc. (at time of writing the
driver, apu bios didn't support any of that). For preventing conflicts
and consistency between all bios versions, it's IMHO better to just
remove the conflicting devices if they're enumerated by bios.

> Yes, that driver represents hardware. MFD already has some support for
> composite devices. We have the auxiliary bus for some other
> interesting cases, etc. Depending on the hardware in question you have
> to choose a proper bus and locking (access synchronisation) schema.

Yes, but similar to the apu case, I'd like to be able describe those
devices just by a DT (instead of lots of C code).

>> Those things could be expressed via DTS, so we don't need to write
>> individual drivers anymore.
> 
> It seems you are trying to create something like "universal quirk".
> Brave idea, but from my experience a fiasco is what will be out of it.
> The hardware has a lot of different issues and levels of issues and it
> is close to impossible to describe everything possible and predict the
> future... Good luck!

Dont worry, I don't try create some one-fits-all-solution. It's just for
a specific class of use cases, where we need additional devices that
can't be (reliably) enumerated via firmware or buses.

>> * need to split the information into several places (instead of having
>>     all in one DTS)
>> * need to have one separate module board, or merge the dmi tables.
> 
> Have no idea what you are talking about here, sorry.

Well, for now I have the matching criteria (DMI strings) within the DT -
don't need any additional code per board. For using the existing
mechanisms, I would need to move that out into a separate .c file,
something I'd like to avoid.

>> My goal is having everything that describes a board into one DTS
>> (source) file.
> 
> I'm confused, you are talking about non-DT platforms in the
> cover-letter and now you are talking about DTS. AFAIK DTS allows you
> to put everything in one source.

Nope, I'm using DT *in addition* to firmware data (ACPI), for things
that arent't properly described by firmware. The idea goes like this:

* walk through all available board descriptions (builtin dtbs)
   * check whether board matches critiera given in the DT
   * if match:
     * kick out blacklisted devices
     * populate devices from the DT

The idea is just not having to write lots of C code for cases like the
apu boards anymore, but reuse existing DT infrastructure for that and
also heavily reduce code size this way (for apu case, the dtb is around
2kb, while the existing driver is around 17kb)


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
