Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC6F219CE4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 12:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgGIKCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 06:02:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41806 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726140AbgGIKBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 06:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594288904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nkIOQ2vm7ob9ahgK3cBcyxSEnbupkn5P7GmmdydYdvQ=;
        b=aI4xlaDfaSixv2eXVQTsbtgW78XhVurGDijJXOsUkVBIELsqZT72eRAj7ivvu0gLhLLAKa
        Ilyx8ZBkiWNMA70ffDMJ3bogvh6jVit+Mw8Bk62nMYI+k1qK2H+H71DynL3YysUxXBfUDP
        Ij+CK2V6j6K/JZuu7pyOx7zFLXzHL7w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-jcQK93k9PPeSOgS-k4qgpg-1; Thu, 09 Jul 2020 06:01:43 -0400
X-MC-Unique: jcQK93k9PPeSOgS-k4qgpg-1
Received: by mail-ej1-f69.google.com with SMTP id do21so2115148ejc.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 03:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nkIOQ2vm7ob9ahgK3cBcyxSEnbupkn5P7GmmdydYdvQ=;
        b=LmK/vJrLZZfmq7sYkaCMobNE09r3zEnaLrdQjfdy4Xh3wMAPR/GXaSf/e3W67uqrr/
         AN2/6fA7qSrlBto33Q+7KlD/O0+4quhAtrYo3sfqbAvG+v2gjbyKNppUCNiSj33TCdQH
         s04lm6VXjTb0xGcVxPF/jGVv+wkfVUhzSXGSpzGEGVNkRq47F4ihDYMnKFhbpESI6M8M
         PdV8gUrqPYYGfBpMN3Y9T7dHOBxA46hYZjNZbA0T9Nx/jlvyuCnoFBQc6vDC8CCZBakV
         HAUMuxrmyRtzMXWmTvk0x1MPKzAMLZGP6BetoOMPgFH5JXZvBkMhp2fPsGyoEGmozCV4
         tvmg==
X-Gm-Message-State: AOAM5329Hu8tzws+GBrMKX+2N3d2RTZHwT/E8BzIKr0Z3ReiPW78T87N
        1M47aCMZftUbbgA11a5/Jd3XVXZgB+N6C1QOdcv0wQqiwkmP5G0h/gSRFKjnelfg0Psj9GFGmXd
        GhdcZhqO7EjQfg7goArK1xw==
X-Received: by 2002:a17:906:8588:: with SMTP id v8mr57994118ejx.211.1594288901869;
        Thu, 09 Jul 2020 03:01:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKVkRINyueZ3aFur3FuE/Z3W54Eto/+BE+VvFQ9m3g54qt//WhoLogyYgJHLmBn8Qi8qE/KA==
X-Received: by 2002:a17:906:8588:: with SMTP id v8mr57994097ejx.211.1594288901604;
        Thu, 09 Jul 2020 03:01:41 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id dt22sm1532969ejc.104.2020.07.09.03.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:01:41 -0700 (PDT)
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
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
 <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ca4dfb41-843c-d859-2128-c985aec97a99@redhat.com>
Date:   Thu, 9 Jul 2020 12:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/9/20 10:30 AM, Jiri Slaby wrote:
> Hi,
> 
> On 08. 07. 20, 13:47, Hans de Goede wrote:
>>> Unfortunately, there is nothing like that. It's discussed on the net,
>>> that these UMAXes have only 32bit EFI.
>>
>> Which is not a problem by itself, mixed-mode support works well,
>> in Fedora we even support it out of the box.
>>
>> What is a problem is the OSID thing. So one last silly idea,
>> can you try on your EFI system partition, creating a dir called:
>>
>> EFI/Microsoft/Boot
>>
>> So the Linux path of that likely is:
>>
>> /boot/efi/EFI/Microsoft/Boot
>>
>> And then copy your grub.efi to:
>>
>> /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi
>>
>> And then with efibootmgr create an entry
>> titled Windows pointing to that and try booting
>> that boot entry?
> 
> Ugh, there is indeed some magic, but it doesn't help.
> 
> I created that entry and dubbed it "opensuse_MS2". BIOS renamed it to
> "Windows Boot Manager". But still
> /sys/bus/acpi/devices/INTCFD9:00/status shows 15 and storms.
> 
> I created also EFI/Boot/bootia32.efi. Now BIOS thinks I am android! I.e.
> wifi disappeared, the boot option in BIOS says "Android legacy". And it
> always switches "Windows 8.x" to "Android legacy". If I delete
> EFI/Boot/bootia32.efi (deleting or adding an entry to efibootmgr makes
> no difference, the presence of the file matters), I can set "Windows
> 8.x" and it persists booting, but still storms and things (but wifi is
> back).
> 
> Any other idea what file/volume I should create in EFI fs?

No I'm afraid not. The ACPI subsystem will execute the DSDT's
_INI method (line 21712 in the disassembled DSDT) pretty early on.

I think the best way to workaround this is to use a DSDT override
where you set OSID=1 in that _INI method.

This is far from ideal, but so are the other options. Unfortunately
this will not help any other users with the same device, but it at
least should get it working for you.

Regards,

Hans

