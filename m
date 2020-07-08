Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E9621865D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgGHLrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:47:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51495 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728592AbgGHLra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594208849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FqbhTRihUFarm3+P1+qCP/9XcCwPJT9y37kmk3veGWE=;
        b=XAIG8sElM39zlfNL6+VjL5b46XESvJjh3FWrIcj1tDrNgNG/1y1lJYMiRYr/yklHD04bww
        e4JvE+1eoJSqN/bjZ8d8Uasul0pRziqAnyayk/ShNJcPn3N/k7v0D1d81o6tPS7NBiHHuB
        6def0hB/qWQS2QUkxft1YLN4g7hgV44=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-L2EwXf9GOziNuMhyq-eVmg-1; Wed, 08 Jul 2020 07:47:27 -0400
X-MC-Unique: L2EwXf9GOziNuMhyq-eVmg-1
Received: by mail-ej1-f72.google.com with SMTP id m21so43408858eji.19
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 04:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FqbhTRihUFarm3+P1+qCP/9XcCwPJT9y37kmk3veGWE=;
        b=Izd+LE1dDye2Y/BzSHDn80++TI9NQEOGWhU/tAc0HxafwtDOYMioFkT1K8kcXYkIDP
         TzX4a37JWc8bmHJPKJLyxLusgRL+t212nrrEUOizq9xnHcjiQ1SFzb2h4ApWH3thlFJQ
         D3cVYF/qdES5J/BPDQESf5VRphnCDnGGozlY2op6WJAvdFghahLYrvKAbP7mtj+tmLPh
         LEZcYTYnu7tKFw/Damp/lCJmraTGYti9sUTGdo4qiQz5UxSSpVDjLETszqh5iKDLN84T
         r/uVh17EyOqHVsSnM8BLHEabX++98cwOgympCpa/BdTOWq6re7ZO0qBq9DvXA+86INfE
         gWtw==
X-Gm-Message-State: AOAM533Oip/ql6ScBP/A3NSXQmzKsL7RKGWyeXHde770CoUie1GF0ZZ5
        jWPxM21EBVtGlh6yppdbWp7eqxE2uhhqhwrCS+lLVqJB4MY9ipfXEplQjtEb1MLWMpMG0xXkhMX
        oYi/677H2p/phBl6fJ/0FBw==
X-Received: by 2002:aa7:c314:: with SMTP id l20mr69170699edq.150.1594208846360;
        Wed, 08 Jul 2020 04:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfZkEPOcUx+rmYz2zj/XtPSj6kXkM3IZrwYxzC1c4p0xhaXsQOkHN00/MEFuQbZ3JNzQbsHw==
X-Received: by 2002:aa7:c314:: with SMTP id l20mr69170687edq.150.1594208846173;
        Wed, 08 Jul 2020 04:47:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dm1sm1945336ejc.99.2020.07.08.04.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:47:25 -0700 (PDT)
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
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
 <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
Date:   Wed, 8 Jul 2020 13:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/8/20 1:36 PM, Jiri Slaby wrote:
> Hi,
> 
> On 08. 07. 20, 13:24, Hans de Goede wrote:
>>> It also has only 32 but EFI. It doesn't recognize 64-bit binaries. I had
>>> to load 32-bit grub first to load the installer from a USB. So this is
>>> EFI-mixed mode as it is called.
>>
>> Hmm, ok, with CHT I would really expect there to be a 64 bit UEFI and
>> your DSDT and the fact that my untested patch broke your boot, all do
>> show that this is Cherry Trail / Cherryview and not a Bay Trail.
>>
>> I guess that doing:
>>
>> cat /proc/cpuinfo  | grep "model name"
>>
>> Will output something like this:
>>
>> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
>> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
>> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
>> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
>>
>> Note the model bould be some other Z8xxx nummer, likely it is a
>> Z8350, and if not a Z8300 but any Z8xxx number is CHT.
> 
> Yes, correct:
> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
> 
>> Further confirming that this really is Cherry Trail. Which
>> at least means that my patches might help a bit.
> 
> They do not :(. The interrupts are still storming.
> 
> FWIW I tried the acpi_osi="Windows 2015" kernel parameter. No success too.
> 
>> But ideally we would still be able to get the BIOS to see
>> us as Windows and set its OSID variable to 1. So we don't
>> try to use the wrong GPIOs as IRQ at all. Can you try loading
>> the BIOS setup-defaults / optimal defaults?
> 
> Loaded the optimal values. Still the same
> 
>> If that does not get rid of the IN3496 device (changes its
>> status to 0), then try this:
>>
>> Maybe you have a "Boot Architecture" option under the "Boot"
>> menu in the BIOS? I know you are already at 32 bits, but
>> maybe changing it to 64 bits helps? (after installing a 64 bit
>> shim + grub)
> 
> Unfortunately, there is nothing like that. It's discussed on the net,
> that these UMAXes have only 32bit EFI.

Which is not a problem by itself, mixed-mode support works well,
in Fedora we even support it out of the box.

What is a problem is the OSID thing. So one last silly idea,
can you try on your EFI system partition, creating a dir called:

EFI/Microsoft/Boot

So the Linux path of that likely is:

/boot/efi/EFI/Microsoft/Boot

And then copy your grub.efi to:

/boot/efi/EFI/Microsoft/Boot/bootmgfw.efi

And then with efibootmgr create an entry
titled Windows pointing to that and try booting
that boot entry?

If that does not help and you cannot find any other helpful
options in the BIOS, the only thing I can think of is to
use a DSDT overlay with the OSID checks in the _STA method
of the INT3496, ACPI0011 and INTCFD9 ACPI objects
inverted (or removed).

That should get rid of the interrupt storm, but there are
a lot of other OSID checks and chances are some of those
will cause other issues.

Regards,

Hans


