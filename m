Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E8E39177B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 14:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhEZMiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 08:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31306 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233605AbhEZMiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 08:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622032602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vo3CFjgMiVFpDxJLQuQQeOIXjZuz9Jnetz8hQXS67No=;
        b=Yy2iOPvOQPOuCUbADZ8BLSpoEZ1Ylrystpzutw1Uo21w8pb2cksBGqBEKTViFzJY02VbV9
        L0wpJD5S4mDh9UiDSfyY0EJR8m5jc5od2nvETuqdaUrkFYMZtxxN721SWcBZwqqElpZLiF
        ELcONW10UgPJmYy1NhStOoxG2gVJYE4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-0YrWAgoMMtWb4QCeInbAxw-1; Wed, 26 May 2021 08:36:40 -0400
X-MC-Unique: 0YrWAgoMMtWb4QCeInbAxw-1
Received: by mail-ej1-f72.google.com with SMTP id n25-20020a170906b319b02903d4dc1bc46cso348060ejz.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 05:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vo3CFjgMiVFpDxJLQuQQeOIXjZuz9Jnetz8hQXS67No=;
        b=qu35Xl4lX9OneatVckS8o94vXud9+qx/A+IqcWhcLcVjlc0Gaesy9qi57/d3ZpOnQ+
         hnDgkaqUzrZm3kMY9Yq0IDr3fFIsMlY2YaEZvcPTfgVZU2+aLW1aQ65isK3s8kusBDxf
         228l/6j8nqJ73ZgzVhht9wcgiRqVdOKCH7WEelmK1suFBXWPl4GILgQpV61wK+XAgRrb
         eE6U5oM/gjXoY4CaUsEMeI61MeMqNdNuO2aecU8kx0uBopwD+v/CkL9uyHYD1mG/opQU
         OSsI/D3Oxeqwc4GqV3mpha+MKkaOOkOUP5gxAopAKtf1uX4yN6UToTz6+UowkbBzPU0L
         2oKw==
X-Gm-Message-State: AOAM533yaEooVeE8cz6GBvbEDpErTBcBabXP11/jgU2iVor70aTQNrZs
        GAbogFPeLujmr+Pwnm8QiymXQnwCHT0OtsJlnqdZNhMy8f7Fsn9UNWBXcnadYZNXVa2QopL9OJP
        NHPywBIh4mtl5jzaubitvmw==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr2036972eja.389.1622032599353;
        Wed, 26 May 2021 05:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCzSG2YLjcyhKgm8r3o/LZqPgFxUK6ylJOFe2YCzql+M/THNIC19JLVSjVDkUJ82LC9sNhuQ==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr2036951eja.389.1622032599157;
        Wed, 26 May 2021 05:36:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y15sm284014ejc.48.2021.05.26.05.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 05:36:38 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Introduce intel_skl_int3472 module
To:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <f2d8e74f-f33b-2489-1b90-b11bf7465d19@redhat.com>
 <f4664310-0975-335d-8dc3-95726f53ab67@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7b7b2ba-d941-7df3-38e6-32dbbba7a36f@redhat.com>
Date:   Wed, 26 May 2021 14:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f4664310-0975-335d-8dc3-95726f53ab67@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/26/21 1:03 AM, Daniel Scally wrote:

<snip>

>> 3/8 and 5/8 seem to be nice cleanups, but not really necessary. IMHO it
>> would be best to park these cleanups for later and for 3/8 add the following
>> where necessary for now:
>>
>> /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
>> #ifndef I2C_DEV_NAME_FORMAT
>> #define I2C_DEV_NAME_FORMAT		"i2c-%s"
>> #endif
>>
>> This is not the prettiest but it reduces all the subsys cross-deps and things
>> like this have been done before for similar reasons.
>>
>> Likewise it would be good if you can add if (foo) as condition before any
>> clkdev_drop(foo) calls in this patch-set and then merge
>> 5/8 "clkdev: Make clkdev_drop() null aware" independently of this and then
>> once both are in Linux tree follow-up with a cleanup patch dropping the if (foo)
>> guards.
> 
> 
> This is fine by me if people are happy for it to go in like that; I'll
> just fix it up later.

I don't expect anyone to object against these 2 small fixes going in later,
if you can drop these 2 for v5 that would greatly help with untangling all the
subsys dependencies. Then I can just merge an ACPI + a gpiolib-acpi immutable
branch and then merge the big drivers/platform/x86 patch.

Regards,

Hans

