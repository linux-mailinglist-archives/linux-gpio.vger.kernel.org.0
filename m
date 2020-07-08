Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF5A218625
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgGHLat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:30:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56962 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728385AbgGHLat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594207846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CQWOEnm4u/DSLEg4Bn+PR70HqdA13bmpcTi1+ayfA6M=;
        b=cXKd6MlL2VYmiJ8H5v0J9juXiIVIUFPnZ/EOHUVCvpn0Pbfw2X8iTbXvXOhZOWFo8fAoDe
        SF6gU66092+HX8k8BZe7LzjHJPXKjKBT7OpdIXa9iQtlY/GHjgq03pVYbxX5+wpBAysV0Q
        +rCRYmSIFcxe5y8MiF9L5IFEcahyrNI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-ZDgNUlTfPgiGJwnXRY2TUA-1; Wed, 08 Jul 2020 07:30:44 -0400
X-MC-Unique: ZDgNUlTfPgiGJwnXRY2TUA-1
Received: by mail-ed1-f71.google.com with SMTP id y66so51479054ede.19
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 04:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQWOEnm4u/DSLEg4Bn+PR70HqdA13bmpcTi1+ayfA6M=;
        b=lD8e0SjBRAxHB7TGSMzSaP1A5ix+bOgfYT63P5N4lbOyndm4WsphikWJCGCpsJs9yB
         y0iNvBo62LUQZvSCQZQoOjGG7bn8yRefAUTleKw0KI7xbs7Okk8IfYlDBabwaVS0ABhD
         zmqVYjgHMxtgEucfCLXIHCPmeczaceu4OH23J/wP7utWRxgkxjhnNgsteNUYm8F/k8uC
         goX7upmb9mNGiX2Pp3WTW9y/sxGQsKYC4SgZwc/B/dtDYovSeqMzQt35pccJfxXPkFBf
         HTeQF6t2/ylina2bw90ZNcVYFOPJk1Uuk8YipKMY59K6zEUXJV4Wsvptd4b106O6v0wn
         J8bQ==
X-Gm-Message-State: AOAM531yUgQve7Hkm5uQApOBRTYMdieZd7Y5NO5SrtSTNwh84gDPmqCB
        LnvLfg0Xgp3Oh/YxdE7CE89pZFSfOGeC0LdyNvj3g4HU0kPc6JVwwXW6X62aC4ge0tgZPZmjhJ+
        0lhj72oXOGqg6Y2IOgd6s1A==
X-Received: by 2002:aa7:d446:: with SMTP id q6mr66858028edr.218.1594207843210;
        Wed, 08 Jul 2020 04:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd2D5Htvi6CbOghLMOAtd6LI4ir+WsAJMBbhaLTBop6hO62OXWFwf3RqXGGfy0xCOc/bm8nA==
X-Received: by 2002:aa7:d446:: with SMTP id q6mr66858011edr.218.1594207843028;
        Wed, 08 Jul 2020 04:30:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u1sm28696045edl.17.2020.07.08.04.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:30:42 -0700 (PDT)
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
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7af963cb-4994-d4ea-1172-de7fd5db2f4a@redhat.com>
Date:   Wed, 8 Jul 2020 13:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/8/20 1:02 PM, Jiri Slaby wrote:
> Hi,
> 
> On 08. 07. 20, 12:15, Hans de Goede wrote:
>> Hi,
>>
>> On 7/8/20 10:52 AM, Jiri Slaby wrote:
>>> On 08. 07. 20, 10:23, Hans de Goede wrote:
>>>> Hi all,
>>>>
>>>> On 7/8/20 9:47 AM, Linus Walleij wrote:
>>>>> On Wed, Jul 8, 2020 at 9:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>>>>
>>>>>> I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
>>>>>> even then it encounters lags, soft lockups:
>>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
>>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
>>>>>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
>>>>>
>>>>> Adding Hans de Goede to Cc, he often deals with this kind of weirdness
>>>>> so he might have some ideas here.
>>>>
>>>> Thank you for looping me in Linus. I've read up on the rest of the
>>>> thread in the archives.
>>>>
>>>> So looking at this:
>>>> https://www.umax.cz/umax-visionbook-10wi/
>>>>
>>>> This device appears to be a pretty standard Cherry Trail based 2-in-1
>>>> with detachable keyboard. Which usually means (with all the
>>>> hw-enablement
>>>> I've been doing the last 2 years for these) that it will just work.
>>>> But no such luck this time it seems.
> ...
>>>> What I find interesting / weird is that you (Jiri) get an active
>>>> (/sys/bus/acpi/devices/INT3496\:00/status != 0) INT3496 device at
>>>> all. That typically only happens when the BIOS thinks you are booting
>>>> Android.
>>>
>>> 15 that is.
>>
>> Right, that is normal for an enabled device the ACPI method
>> implementing the status attribute for your tablet looks like this:
>>
>>              Method (_STA, 0, NotSerialized)  // _STA: Status
>>              {
>>                  If (((BDID == One) && (OSID != One)))
>>                  {
>>                      Return (0x0F)
>>                  }
>>
>>                  Return (Zero)
>>              }
>>
>> So now we know that BDID == One and OSID != One, OSID == One
>> typically is Windows...
>>
>> Looking at the buttons next, can you do:
>>
>> cat /sys/bus/acpi/devices/ACPI0011:00/status
> 
> Gives 0
> 
>> and:
>>
>> cat /sys/bus/acpi/devices/INTCFD9:00/status
> 
> Gives 15
> 
>>
>> If the BIOS thinks you are booting normal Windows the first
>> one should output 15  (0xf) aka present and the second one
>> should output 0, but I suspect it is the other way around...
> 
> Right.
> 
>> So looking at the GPIO resource definitions for BDID == One
>> for the ACPI0011 device we have:
>>
>>                  Name (PBUF, ResourceTemplate ()
>>                  {
>>                      GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp,
>> 0x0BB8,
>>                          "\\_SB.GPO2", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0008
>>                          }
>>                      GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
>> 0x0BB8,
>>                          "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x004E
>>                          }
>>                      GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
>> 0x0BB8,
>>                          "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0050
>>                          }
>>                  })
>>
>> With a mapping of first resource to KEY_POWER, second resource to
>> KEY_VOLUMEUP and third resource to KEY_VOLUMEDOWN
>>
>> The INTCFD9 device OTOH has the following resource definitions for BDID
>> == One
>>
>>                  Name (PBUF, ResourceTemplate ()
>>                  {
>>                      GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullUp,
>> 0x0BB8,
>>                          "\\_SB.GPO2", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0008
>>                          }
>>                      GpioInt (Edge, ActiveBoth, ExclusiveAndWake,
>> PullDefault, 0x
>>                          "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0008
>>                          }
>>                      GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
>> 0x0BB8,
>>                          "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x004E
>>                          }
>>                      GpioInt (Edge, ActiveBoth, Exclusive, PullDefault,
>> 0x0BB8,
>>                          "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0050
>>                          }
>>                  })
>>
>> With a mapping of resource1: power, resource2: home, resource3: volume_up,
>> resource4: volume_down.
>>
>> So what we see here is that the "Android" style INTCFD9 device has
>> an extra entry for the home-button and I guess (hard to see on the
>> pictures) that there is no physical home-button.
> 
> I don't know what it should look like, but there is no button with
> house-like painting. There is only a standard "Home" button -- Fn+PgUp.
> And that works even without that module.

I just realized I did not reply to this bit. I meant a home button on
the tablet part of the 2-in-1, so next to the power and volume buttons
on the tablet's edge.

Regards,

Hans

