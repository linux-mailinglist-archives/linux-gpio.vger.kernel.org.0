Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6755D48FF59
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 22:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbiAPVyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 16:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35935 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233774AbiAPVya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 16:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642370070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jcNWsgvUzp2FP5GxzukyX1JBIf9jjWFrW5eQDZ/dypw=;
        b=Zc1Aor0ElRsBhvbvvGS9YMptiQXClSUAs063skh0rP63w3gFLq+gYy6ozOeG7RrLbT/SY2
        v647PfgFo4MLvr3S+hr77bo9tMhRRNliFPtSpRCGUskWWZsokN3yfZsEemy2vn7h5M+ekZ
        TOiWKrGBC62Ax7t9xqg/Yx6PwqqWtOs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-XVFoBNk1MGaFOV6vqYuFWA-1; Sun, 16 Jan 2022 16:54:28 -0500
X-MC-Unique: XVFoBNk1MGaFOV6vqYuFWA-1
Received: by mail-ed1-f70.google.com with SMTP id t5-20020aa7db05000000b00402670daeb9so1529989eds.5
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 13:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jcNWsgvUzp2FP5GxzukyX1JBIf9jjWFrW5eQDZ/dypw=;
        b=DOuPW0xNEW6oYiiyMhDiFXGuHQ824w3O2q1Z4r7nL8ZZkGFltRgO+8iLmqDNZbYnNi
         kwmSlprsWbj3xgbVksOJD0qShLpA7y04hFTTFpyW/O+jFEESGwQOWdieC7N/M1W/FH5V
         ztVkezN2OGE71HTif3njhXLkzGW2EZWa8jBb+00Wx998+SSKw67Ke+cjnWKhQU6otf+p
         eQIW++PUxvn/ZTCQuYawFgNz2FwmYRJcPzYmx3UbkZHtj+z675w7soZCTHUFrB980ov3
         t8WnBpSEyw9Pw3NxgqMJxU2MPAo06vrOQUT2tT8EejT2qEkTdEUPWW34e0C9iXLZq3GN
         SbIA==
X-Gm-Message-State: AOAM532KVqIOdoXzvBxhy7l9rp5qAGgQtpAa1t8I8984+bmW908P6Lzg
        WJdCWGItN2Fvkz08BUV5ZZJlBRqeOV/wMtaKjFK0tZC3NH5d1XOPJR/KaPEsy09KawJFWyE5FSN
        iyH5ILKSx7QTpR+YNgc86ag==
X-Received: by 2002:a05:6402:16c5:: with SMTP id r5mr17794660edx.388.1642370067531;
        Sun, 16 Jan 2022 13:54:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMz1ndIjLee73bJjkMutiaHDkwTyH+NpsLYMIxr/ijYdMdpWS42CESu4WphV4hAKlRQMlVgw==
X-Received: by 2002:a05:6402:16c5:: with SMTP id r5mr17794648edx.388.1642370067332;
        Sun, 16 Jan 2022 13:54:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 20sm3767242ejy.105.2022.01.16.13.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 13:54:26 -0800 (PST)
Message-ID: <d86caedb-4d34-4ded-d02d-a25e5e29072a@redhat.com>
Date:   Sun, 16 Jan 2022 22:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: RFC: pinctrl: baytrail: Need to fixup mux setting due to broken
 BIOS/DSDT
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <e865361a-b75b-5a35-18e1-7136f3094d54@redhat.com>
 <CAHp75VfpyYuB5q+L6P+3RB52mK89=PfpHx4JG-AM=M3HaJ5D3w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfpyYuB5q+L6P+3RB52mK89=PfpHx4JG-AM=M3HaJ5D3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/16/22 22:11, Andy Shevchenko wrote:
> On Sat, Jan 15, 2022 at 6:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Andy, Mika,
>>
>> For one of the x86 Android tablets with broken DSDTs which I'm working on
>> I need to change the mux value of pin 6 of SUS aka INT33FC:02 from 0 to 1,
>> this changes it from a normal GPIO to outputting the PMC's 32KHz clk.
>> This is needed for the jack-detection in the audio codec which needs an
>> external 32KHz clock to work and that is connected to pin 6 of SUS.
>>
>> On the Windows version of the same tablet (which uses slightly different
>> hardware, e.g. there is an embedded controller on the board which the
>> Android version lacks) there is an ACPI call to toggle the mux, since
>> the firmware does not set it for us.
>>
>> So the x86-android-tablets.c code for working around all the firmware
>> challenges on these devices will need a way to toggle the mux and
>> directly poking it itself is a bad idea because of the need
>> to serialize all accesses to the GPIO islands on byt, see:
>>
>> 39ce8150a079 ("pinctrl: baytrail: Serialize all register access")
>>
>> So I see 2 possible options:
>>
>> 1. Add a pingroup for this pin in drivers/pinctrl/intel/pinctrl-baytrail.c
>> and then mimick the pwm0 pinconf setting code from
>> drivers/gpu/drm/i915/display/intel_dsi_vbt.c in x86-android-tablets.c
>> This seems the cleanest, but I'm leaning a bit towards:
> 
> If you meant
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_dsi_vbt.c#L858
> this is definitely the way to go.

Ok, I already figured as much, thank you for your input.

Regards,

Hans

