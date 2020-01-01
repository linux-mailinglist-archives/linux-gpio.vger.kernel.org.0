Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DBC12DEFB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2020 14:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgAANEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jan 2020 08:04:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37562 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725783AbgAANEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jan 2020 08:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577883875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+sMHv/NXk5vFIFavisCvSHG1HZuRuVWu182Z71fT3c=;
        b=aFgysMxRB3I4Q4WwiL7w9mrIKyDDCK3eJIdO1u1oaa4XHl7cwbt1wPLX2qDDf7UEW3Q8nW
        0WqkGFRRBh9tSMBaLSlJRy68KrzHVNj0GU21NIJ1kAFG+FivTsM+uA+lXalxDp7EeAT7IL
        XRq5AN6bPM3IxKew71Ww7SVEXFi/egg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-J7_yfHAANaex0u6i80Jp4w-1; Wed, 01 Jan 2020 08:04:34 -0500
X-MC-Unique: J7_yfHAANaex0u6i80Jp4w-1
Received: by mail-wr1-f72.google.com with SMTP id 90so20274107wrq.6
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2020 05:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3+sMHv/NXk5vFIFavisCvSHG1HZuRuVWu182Z71fT3c=;
        b=OuirAtLoOvua8xE83CbC0fvpUDZfrJJRRlH/ysvvd7phY/YRUb8XiV7ioKGnwS91br
         +la5MCB//t6Sdl3Juhj2tKnthtndysfYheHWOfE3hTeScXrzxwtlhDCIsftumjTm3XE/
         MFKsIL9L2rlx3gPdjqUAE+q9+tjqpxT282i9UMgcssVqfCopKcjAVFlih+4ewiOimRiZ
         AH8fACH1YSYGH4J3NpVstwGhQ4yipoZbJARStRajeoSyQDWj+AWzstDcV3vVP4zpWnWq
         daBnhQhXmanQ6cUpJx429wzwXUKNbHl7197hYSPlE9p/WGqdSsuTBlcUSRS+uyDicqgK
         DIBw==
X-Gm-Message-State: APjAAAUKTfq2p4aStwvNntITDIDR4OnYRhtTjKm8iWI1YlG1hpW2+Jz6
        BfU8UDqPimGhMxYxW1BwUdKO/T5sVrZRuXKaH00pCa+kAuYtNirniVhtzogNdCylSvB9Te7pcW0
        F8NkMmPkTnrEL1BL1F9kmWg==
X-Received: by 2002:a05:600c:2c06:: with SMTP id q6mr9015290wmg.154.1577883870636;
        Wed, 01 Jan 2020 05:04:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzUL1zteKyNuYPDFOsoKQUmzTGSQ9O1XlOn5f8lHIeW+Vbx3bAgicNtKYD8muQPcI6uTqNAg==
X-Received: by 2002:a05:600c:2c06:: with SMTP id q6mr9015274wmg.154.1577883870445;
        Wed, 01 Jan 2020 05:04:30 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id m7sm5349302wma.39.2020.01.01.05.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2020 05:04:29 -0800 (PST)
Subject: Re: [PATCH v2 1/5] pinctrl: Allow modules to use
 pinctrl_[un]register_mappings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191216205122.1850923-1-hdegoede@redhat.com>
 <20191216205122.1850923-2-hdegoede@redhat.com>
 <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <458597d4-5f81-90f5-7f14-aa634e87ddbd@redhat.com>
Date:   Wed, 1 Jan 2020 14:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-12-2019 14:31, Linus Walleij wrote:
> On Mon, Dec 16, 2019 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Currently only the drivers/pinctrl/devicetree.c code allows registering
>> pinctrl-mappings which may later be unregistered, all other mappings
>> are assumed to be permanent.
>>
>> Non-dt platforms may also want to register pinctrl mappings from code which
>> is build as a module, which requires being able to unregister the mapping
>> when the module is unloaded to avoid dangling pointers.
>>
>> To allow unregistering the mappings the devicetree code uses 2 internal
>> functions: pinctrl_register_map and pinctrl_unregister_map.
>>
>> pinctrl_register_map allows the devicetree code to tell the core to
>> not memdup the mappings as it retains ownership of them and
>> pinctrl_unregister_map does the unregistering, note this only works
>> when the mappings where not memdupped.
>>
>> The only code relying on the memdup/shallow-copy done by
>> pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
>> replaces the __initdata with const, so that the shallow-copy is no
>> longer necessary.
>>
>> After that we can get rid of the internal pinctrl_unregister_map function
>> and just use pinctrl_register_mappings directly everywhere.
>>
>> This commit also renames pinctrl_unregister_map to
>> pinctrl_unregister_mappings so that its naming matches its
>> pinctrl_register_mappings counter-part and exports it.
>>
>> Together these 2 changes will allow non-dt platform code to
>> register pinctrl-mappings from modules without breaking things on
>> module unload (as they can now unregister the mapping on unload).
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This v2 works fine for me, I applied it to this immutable branch in the
> pinctrl tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings
> 
> And pulled that into the pinctrl "devel" branch for v5.6.
> 
> Please pull this immutable branch into the Intel DRM tree and apply
> the rest of the stuff on top!

Great, thank you!

Regards,

Hans

p.s.

Happy New year everyone.

