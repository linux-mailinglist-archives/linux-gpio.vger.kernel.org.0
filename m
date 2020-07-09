Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC2D219F60
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 13:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgGILyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 07:54:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46643 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726433AbgGILyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 07:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594295639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B7jjQV/7atE0zNLCH6im6Xtx5fniwbdJG3WDIYIPd4g=;
        b=WluetiD068osSjtIZ85h/4nfdoGyfXksqv8uwZw38WNPBbSk0hDInPRcTgVFBigjWzgKzn
        D/AzaVk8DQY1yz3TDJ22o4tOYfFsdXxdLtse8B+kQpV1bgLKVS5qiOs44NKx74UHHbNU8j
        Dk0n6/SFxVCyp1O7UG9BTkrUTSM3NL0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-DnlyVMS9NnqJYAw_RpBvxQ-1; Thu, 09 Jul 2020 07:53:57 -0400
X-MC-Unique: DnlyVMS9NnqJYAw_RpBvxQ-1
Received: by mail-ed1-f71.google.com with SMTP id h5so2214489edl.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 04:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B7jjQV/7atE0zNLCH6im6Xtx5fniwbdJG3WDIYIPd4g=;
        b=PkRi2CYf0N3FetNYnxv/QXAPlfZG1lJOQr1Phm4CspK/RxQeAxG/BAQU4d+U9CBxtL
         vGAkNt4PWesJ2co9vYYuVeN32HzKxFgntjs3M7o5MG2ncjwszKIon9Wu825Pm+luxf9S
         nsK0J12kxDDWimzoywuFgKSTJ6fkEYECDCnFqijGW+6Lv3ghUS1AvttumnzjyCqkowbn
         I44rwUZypyMw0CJES3mzxwsd0G4Ryc56ip8WMc1FpB7fUighelE6+/Lnf3asAco/LxLZ
         4sr3LtHti8ByRIXNzxt2nxOuTqe+MmCyHi2vfHm+Ek7mBwAtCUdmeYg9eSsUUX8HKX9x
         DVwA==
X-Gm-Message-State: AOAM532kicP/l7VtK5+PTJpK+DQKSOuinH5zle3CziWeOzNqF+zZCBuv
        Begiacv5/eb57QvuAC1mBj2S44izv4SZlCfLbERW4fZe5aF08TayRl6AZoV8H+7xutRxZPIqRRm
        7Qv/73qlujz6NcjSvAIZ9qA==
X-Received: by 2002:a50:ee84:: with SMTP id f4mr69653058edr.183.1594295636000;
        Thu, 09 Jul 2020 04:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO/M3DbjmMCm/A+FwHLd6P/wM4LiPb32tv/EiKbkGK4zzpzLZ2Sr+nS+uNxlHT+p0zIVM60w==
X-Received: by 2002:a50:ee84:: with SMTP id f4mr69653043edr.183.1594295635781;
        Thu, 09 Jul 2020 04:53:55 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id t21sm1668106ejr.68.2020.07.09.04.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:53:55 -0700 (PDT)
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
 <ca4dfb41-843c-d859-2128-c985aec97a99@redhat.com>
 <032ecb14-e8be-19cd-9150-91c633f28a2c@kernel.org>
 <bf44576d-8371-d30c-9704-ecebf913e7b5@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <744b1c5c-e43a-db92-5fb9-bd25880c2101@redhat.com>
Date:   Thu, 9 Jul 2020 13:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bf44576d-8371-d30c-9704-ecebf913e7b5@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/9/20 1:19 PM, Jiri Slaby wrote:
> On 09. 07. 20, 13:10, Jiri Slaby wrote:
>> Now, I need to find a way how to persuade dracut to automatically pick
>> up the updated DSDT.
> 
> # cat > /etc/dracut.conf.d/dsdt.conf  <<EOF
> acpi_table_dir=/boot/acpi/
> acpi_override=yes
> EOF
> # cp dsdt.aml /boot/acpi/
> # dracut --force
> 
> That is.
> 
> FWIW, now:
> # cat /sys/bus/acpi/devices/ACPI0011:00/status
> 15
> # cat /sys/bus/acpi/devices/INTCFD9:00/status
> 0

And I assume the interrupt storms are gone now too :)   ?

I'm glad that this helps, even if it is not entirely ideal.

Let me know if you need help to e.g. get the touchscreen to
work (if it is a silead / MSSL1680 touchscreen you need to do
some manual config).

Likewise you will probably need some quirks for the audio
to get e.g. the internal mic and/or jack-detect to work, see e.g. :

sound/soc/intel/boards/bytcr_rt5640.c
sound/soc/intel/boards/bytcr_rt5651.c
sound/soc/codecs/rt5645.c

The bringup of different codecs was done by different people,
spo the quirks for the rt5640 and rt5651 live in the machine
driver, where as for the rt5645 they are in the codec driver
itself.

For rt5640 / rt5641 the userspace UCM profile bits should pick
up the changes automatically. For rt5645 the UCM profile will
give you all available options. Once you know the right ones
for your tablet we can add a userspace DMI match to make it
show only the ones which are actually valid for your tablet.

Regards,

Hans

