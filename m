Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD171022AA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 12:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKSLMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 06:12:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40565 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726555AbfKSLMm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 06:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574161960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+OTVnn9C7P9z7t5FD5iiq/Mxos59Dn3KJUNRl67qyj4=;
        b=XiH+zhavIukxLWicTcuRgVzIIF/t1sifK7ZyzABs5A69UIGm4Ndykji6eukDr607yG4bmi
        Z5iZUDOIrsg2f0N+FRFXC9AqMzAIbrXZvkzjazGqWcskGLKC9h1JxbpMSgww5oflFZF9KJ
        gfSg43N8IDjKb6DeCP+4Yjt72UtI4Zo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-WJcyx1RTNIeFFHPSGSnzag-1; Tue, 19 Nov 2019 06:12:39 -0500
Received: by mail-wm1-f72.google.com with SMTP id b10so2073424wmh.6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 03:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3vER5CozwZkgM9jvJ1TU9AON1VWTjnv4rjEYWRxx1OQ=;
        b=ltHEz/krx0X+YCKWtnBaP3nPf5p2Vwz0ar5uzyFgr3l5CevifmayBS9m5/wzA9RLY5
         8chooKZIbYxa8zkcIkUgQAhGyF6tvL7MrpeXcjG3zfar1V0oYRC0L9a+WuTVw1tehG03
         cRG1q8tmphFFsXh7u4oP5iaUTkZ65Qcm9mWsZ5KKpHdAFOM2O5xZnbuj53cFslsf6qZk
         jIpIjutB+PeKBx8BAj4vMtEaFVKURtLb0w8hZzu9MsJ9VtK3kWZZvH43ovU0u5b83Jjf
         eJLkVuLe+9NNyR+axR/dQTmnZZB7wx1PDZG9AOuNSsasm7jL/CNaWqhSO2No6HIH35Aa
         2PeA==
X-Gm-Message-State: APjAAAUBaPOAmNktp4zAs1CMO213evsjhUdwVdxYEoJ1tmvOg7huvAyf
        xUqKaulGGLphMeapF88U4slliIF09gADyJu21CSQycRDckAoftzGaKEk8ggJf6M0CdAJGR0yjiD
        N+JPTNesZOGft5irpaqPV5A==
X-Received: by 2002:a05:600c:2102:: with SMTP id u2mr4860653wml.49.1574161957248;
        Tue, 19 Nov 2019 03:12:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9XZr2EwsVsrFXnlKeaUzA+AEKw6T6pl5s/YfpywbQec+znZDsB2pXAQgxCSHigwvbkUB+RQ==
X-Received: by 2002:a05:600c:2102:: with SMTP id u2mr4860618wml.49.1574161956951;
        Tue, 19 Nov 2019 03:12:36 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w4sm2590558wmi.39.2019.11.19.03.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 03:12:36 -0800 (PST)
Subject: Re: [PATCH] ACPI / button: Add DMI quirk for Acer Switch 10 SW5-032
 lid-switch
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191118153556.28751-1-hdegoede@redhat.com>
 <20191119082642.GF11621@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7a2ac981-1c28-5abb-0599-68da44675bdc@redhat.com>
Date:   Tue, 19 Nov 2019 12:12:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191119082642.GF11621@lahna.fi.intel.com>
Content-Language: en-US
X-MC-Unique: WJcyx1RTNIeFFHPSGSnzag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 19-11-2019 09:26, Mika Westerberg wrote:
> On Mon, Nov 18, 2019 at 04:35:56PM +0100, Hans de Goede wrote:
>> The Acer Switch 10 SW5-032 _LID method is quite broken, it looks like th=
is:
>>
>>              Method (_LID, 0, NotSerialized)  // _LID: Lid Status
>>              {
>>                  If ((STAS & One))
>>                  {
>>                      Local0 =3D One
>>                      PBCG |=3D 0x05000000
>>                      HMCG |=3D 0x05000000
>>                  }
>>                  Else
>>                  {
>>                      Local0 =3D Zero
>>                      PBCG &=3D 0xF0FFFFFF
>>                      HMCG &=3D 0xF0FFFFFF
>>                  }
>>
>>                  ^^PCI0.GFX0.CLID =3D Local0
>>                  Return (Local0)
>>              }
>>
>> The problem here is the accesses to the PBCG and HMCG, these are the
>> pinconf0 registers for the power, resp. the home button GPIO,
>> e.g. PBCG is declared as:
>>
>>              OperationRegion (PWBT, SystemMemory, 0xFED0E080, 0x10)
>>              Field (PWBT, DWordAcc, NoLock, Preserve)
>>              {
>>                  PBCG,   32,
>>                  PBV1,   32,
>>                  PBSA,   32,
>>                  PBV2,   32
>>              }
>>
>> Where 0xFED0E000 is the base address of the GPO2 device and 0x80 is
>> the offset for the pin used for the powerbutton.
>>
>> The problem here is this line in _LID:
>>                      PBCG |=3D 0x05000000
>>
>> This changes the trigger flags of the GPIO, changing when it generates
>> interrupts. Note it does not clear the original flags. Linux uses an
>> edge triggered interrupt on both positive and negative edges. This |=3D
>> adds the BYT_TRIG_LVL flag to this, so now it is turned into a level
>> interrupt which fires both when low and high, iow it simply always
>> fires leading to an interrupt storm, the tablet immediately waking up
>> from suspend again, etc.
>=20
> Hmm, does it work in Windows?

I bought this machine 2nd hand and the Windows install is broken
(the eMMC is dead) so I do not know with 100% certainty.

I guess it does work in Windows, I would assume so at least. I suspect
that the Windows driver for "PNP0C40" GPIO buttons devices uses level
interrupts only listening for presses which would match the "5" in the
mask.  Note that that would very much go against the ACPI description,
which describes the 4 GPIOs for pwrbutton/home/vol+/vol- as follows:

     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
     {
         Name (RBUF, ResourceTemplate ()
         {
             GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDefault, 0x00=
00,
                 "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                 )
                 {   // Pin list
                     0x0010
                 }
             GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDefault, 0x00=
00,
                 "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                 )
                 {   // Pin list
                     0x0015
                 }
             GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDefault, 0x00=
00,
                 "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                 )
                 {   // Pin list
                     0x0001
                 }
             GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDefault, 0x00=
00,
                 "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                 )
                 {   // Pin list
                     0x0000
                 }
         })
         Return (RBUF) /* \_SB_.TBAD._CRS.RBUF */
     }

Notice how all GPIOs are specified as GpioInt's which are active on
both edges and this is what the linux gpio_keys driver uses.

Working around this is not impossible, but it will be quite ugly and given
the age of the machine IMHO not worth it. I've also found out that I need a
DSDT override to be able to control the LCD backlight, this is controlled b=
y
the 1st PWM controller in the SoC LPSS block, which is normally enumerated
through ACPI but the entire Device (PWM1) {} block is missing from the
DSDT :|  Adding it from similar hardware fixes things and makes the backlig=
ht
controllable. TL;DR: it seems that this is one of the rare cased where
people who want to run Linux will need to do a manual DSDT override :|

When they do that override they can also fix the _LID method and
then re-enable LID functionality on the kernel commandline overriding
this DMI quirk.

I will probably do a blog post on this (some people have asked me
to do some blogposts about how to analyze DSDT-s, this will be a nice
example) and add a link to the DSDT override to the blogpost, I believe
that this is the best we can do for users of this device.

In the meantime this quirk at least avoids the interrupt storm making
the device mostly usable even without the DSDT override.

>> There is nothing we can do to fix this, except for a DSDT override,
>> which the user needs to do manually. The only thing we can do is
>> never call _LID, which requires disabling the lid-switch functionality
>> altogether.
>>
>> This commit adds a quirk for this, as no lid-switch function is better
>> then the interrupt storm. A user manually applying a DSDT override can
>> also override the quirk on the kernel cmdline.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks.

Regards,

Hans

