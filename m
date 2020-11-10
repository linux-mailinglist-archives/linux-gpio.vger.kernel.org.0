Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71DE2AD848
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbgKJOJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32540 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730097AbgKJOJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 09:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605017341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KNNeJktoCupRZnbWNdZmCX11UaFWeBjfPw5eQ2DFxjg=;
        b=h430o/X73jOj50fHV+STcjT4CraN+YtzNQFKhceipNUq7ZIN2XW01QUcZRW8zMOh1w5Jdw
        TtML0CZw7LVXjqWOVjzJNU5PJ3JA10i9mnvSVs1DdzhDONHPpllFOg6PBold0Jgq0Gvq1U
        3tPCnSj4AhTvOy/wAdALlSm2x0wI1nM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-8y2FKeEKMeK9CDhPPByBpQ-1; Tue, 10 Nov 2020 09:08:59 -0500
X-MC-Unique: 8y2FKeEKMeK9CDhPPByBpQ-1
Received: by mail-ed1-f69.google.com with SMTP id c24so4276011edx.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KNNeJktoCupRZnbWNdZmCX11UaFWeBjfPw5eQ2DFxjg=;
        b=pO9UNbps8en34KSdOYaAZsxOGUjDa0zrvqA29c6uBXTczg0UJulyo2dBw/iA7dPgiD
         edJRI1ID+N3xjHDDgXUzZPPM3T+kfxbBYd/mX6Rv+qGks1Va1ltfijzMxZQQEG29A8NU
         cjhtfBauMF7dMbmrIEWW3DjdsnDIoqEAHUnpBkoMThnRYQg5aDX0jr7JZl5QCFUDYj0W
         Ox3IkcWakR7J81qggPjw0Ut8TKg5lq86/6LqrBQOLBcDCcqvZy4ci/QW0LfjKAFsPULK
         R+akUzKRuoaKg+pfoElFsJqo6LkdB82/4E4yN8OJZK7bl7frxhsQ14b6L8tkI+STuFtn
         4JYA==
X-Gm-Message-State: AOAM530mo0ljTvOvqEOioOMb5TRuAJNSeBhYml6grH3RahpjQyAs++Cy
        +GrPEeiRslMtKWtQvf+KxNTYESie1LbZUcqDddK6Uo03CqFIA7cHMKq5KRso6kYbKW12m8DEfgz
        RGzrk7sWxR/TrnRQLibMv7A==
X-Received: by 2002:aa7:cb4a:: with SMTP id w10mr21384289edt.343.1605017338245;
        Tue, 10 Nov 2020 06:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmOOgQFt/yNYiEdWAZu0w9+LnLGekbUfeiC2j1fTyR8ptvJMfcpSlmQLQKkH/LtnHF/bCBWw==
X-Received: by 2002:aa7:cb4a:: with SMTP id w10mr21384267edt.343.1605017338001;
        Tue, 10 Nov 2020 06:08:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id q7sm10500498ejc.28.2020.11.10.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 06:08:56 -0800 (PST)
Subject: Re: [PATCH v5 00/17] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2baa55ec-d2f0-fb76-6e83-614e899ab752@redhat.com>
Date:   Tue, 10 Nov 2020 15:08:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/9/20 9:53 PM, Andy Shevchenko wrote:
> There are fixes (and plenty cleanups) that allow to take into consideration
> more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
> for Operation Regions, Events and GpioInt() resources.
> 
> During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
> the cases when feature is not supported either by driver or a controller.
> 
> It appears that we have slightly messy API here:
> 
>   FUNC			Relation with ENOTSUPP
> 
>   gpiod_set_config()	 returns if not supported
>   gpiod_set_debounce()	 as gpiod_set_config() above
>   gpio_set_debounce()	 legacy wrapper on top of gpiod_set_debounce()
>   gpiod_set_transitory() skips it (returns okay) with debug message
>   gpio_set_config()	 returns if not supported
>   gpio_set_bias()	 skips it (returns okay)
> 
> Last two functions are internal to GPIO library, while the rest is
> exported API. In order to be consistent with both naming schemas
> the series introduces gpio_set_debounce_timeout() that considers
> the feature optional. New API is only for internal use.
> 
> While at it, the few first patches do clean up the current GPIO library
> code to unify it to some extend.
> 
> The above is followed by changes made in ACPI GPIO library part.
> 
> The bias patch highly depends on Intel pin control driver changes
> (they are material for v5.10 [1]), due to this and amount of the
> prerequisite changes this series is probably not supposed to be
> backported (at least right now).

The entire series looks good to me, feel free to add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to patches 1-16 (patch 17 makes sense to me, but I do not feel
I'm the right person to ack it).

Regards,

Hans




> 
> The last patch adds Intel GPIO tree as official one for ACPI GPIO
> changes.
> 
> Assuming [1] makes v5.10 this series can be sent as PR to Linus
> for v5.11 cycle.
> 
> Note, some patches are also depend to the code from GPIO fixes / for-next
> repositories. Unfortunately there is no one repository which contains all
> up to date for-next changes against GPIO subsystem. That's why I have merged
> Bart's for-current followed by Linus' fixes followed by Bart's for-next
> followed by Linus' for-next branches as prerequisites to the series.
> 
> Cc: Jamie McClymont <jamie@kwiius.com>
> 
> [1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/
> 
> Changelog v5:
> - introduced gpio_set_debounce_timeout()
> - made a prerequisite refactoring in GPIO library code
> - updated the rest accordingly
> 
> Changelog v4:
> - extended debounce setting to ACPI events and Operation Regions
> - added Ack (Linus)
> - added few more cleanup patches, including MAINTAINERS update
> 
> Changelog v3:
> - dropped upstreamed OF patch
> - added debounce fix
> 
> Andy Shevchenko (17):
>   gpiolib: Replace unsigned by unsigned int
>   gpiolib: add missed break statement
>   gpiolib: use proper API to pack pin configuration parameters
>   gpiolib: Add temporary variable to gpiod_set_transitory() for cleaner
>     code
>   gpiolib: Extract gpio_set_config_with_argument() for future use
>   gpiolib: move bias related code from gpio_set_config() to
>     gpio_set_bias()
>   gpiolib: Extract gpio_set_config_with_argument_optional() helper
>   gpiolib: Extract gpio_set_debounce_timeout() for internal use
>   gpiolib: acpi: Respect bias settings for GpioInt() resource
>   gpiolib: acpi: Use named item for enum gpiod_flags variable
>   gpiolib: acpi: Take into account debounce settings
>   gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
>   gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
>   gpiolib: acpi: Extract acpi_request_own_gpiod() helper
>   gpiolib: acpi: Convert pin_index to be u16
>   gpiolib: acpi: Use BIT() macro to increase readability
>   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
> 
>  MAINTAINERS                   |   1 +
>  drivers/gpio/gpiolib-acpi.c   | 130 ++++++++++++++++++++--------------
>  drivers/gpio/gpiolib-acpi.h   |   2 +
>  drivers/gpio/gpiolib.c        |  97 ++++++++++++++-----------
>  drivers/gpio/gpiolib.h        |   1 +
>  include/linux/gpio/consumer.h |   4 +-
>  6 files changed, 141 insertions(+), 94 deletions(-)
> 

