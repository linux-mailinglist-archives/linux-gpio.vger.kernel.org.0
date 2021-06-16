Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8002E3A9DD2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 16:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhFPOnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 10:43:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28107 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234086AbhFPOnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 10:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623854465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/KmdDtuxC4DPMkm/dYQuBivCzYIDXejkNuC0LvGZbxU=;
        b=Y0Vze6X8OtKKMG073i+KGKiox/M7Qi96XHWivqXno2AIcJDGiDgAHxsdOxZAE2aKFrUHrp
        oDBxMqmChNukuiSpmd/etboKrAZsvdEORsR1wQjpejQKWIvu+CsjravTYPAgNYi2hbtVQ3
        mBT6+iIP+Cm3pEf4abfND/nmTuv8koo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-HDRKKwWwPJOdZL1ui-xrGg-1; Wed, 16 Jun 2021 10:41:04 -0400
X-MC-Unique: HDRKKwWwPJOdZL1ui-xrGg-1
Received: by mail-ed1-f72.google.com with SMTP id y7-20020aa7ce870000b029038fd7cdcf3bso1155094edv.15
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KmdDtuxC4DPMkm/dYQuBivCzYIDXejkNuC0LvGZbxU=;
        b=YQISAZ1Fe5JRllgP4swvrlrv0mh3xwaFMCd8gYFG5fH2HWoajeG6tCvYSFPOgTHbpI
         QxoYCjXEmWfDGYKJuNWSuVu8MmlrtsArYJysD6fAnCm8pyGm9Q4sE8yuAvifjw4dayS3
         +TCjVMOMWjkQMCyhe5wxXcovnfDfz34nR9TYim4uzhISDQyGLHNoP+trgn20TLot9O4A
         cURpAC1qjOsGr/J4l6PvY5VwiOtayOV6PzyVE6ZbjEpBSZGaspLu3ZDsTMhPR27ZJjHt
         YKiVpiEazr8oAKAfmrt1ji2rWvqnNMgWdDuHBIW5ovAdvVym+sZwurHbRiKsvT8TrWGB
         yfBQ==
X-Gm-Message-State: AOAM531N4/wLHJVt1degafWEkTsuOgosT9PJ+cTOg5SnSkQwCaXza340
        3cCPYOi8g8Dqfmm/tHmYvLU4vlh1tmbRlm77MyaUQCB9YYDBZmcxHspcLdElPfDjULScKBUm3tK
        wFm++MGDiFpt9SBthZJghjw==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr4598060edd.111.1623854463235;
        Wed, 16 Jun 2021 07:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyczHmLu6t+yCUzUAbMlYbY+WyHHr7hOEQVqmOEk9e7Vkgp3nCAYDNB5ni47dvk6qm1OkL03A==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr4598044edd.111.1623854463136;
        Wed, 16 Jun 2021 07:41:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j22sm1817090ejt.11.2021.06.16.07.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 07:41:02 -0700 (PDT)
Subject: Re: [GIT PULL] intel-gpio for 5.14-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <YL43SrZ8N8H+ZHE9@black.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <66fee594-8e13-5200-f8d9-c71caeb863a7@redhat.com>
Date:   Wed, 16 Jun 2021 16:41:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL43SrZ8N8H+ZHE9@black.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/7/21 5:12 PM, Andy Shevchenko wrote:
> Hi Linux GPIO and TWIMC maintainers,
> 
> This is GPIO material for v5.14 cycle. It contains some stuff that other
> subsystems may take due to dependencies. Consider this tag immutable.
> 
> Thanks,
> 
> With Best Regards,
> Andy Shevchenko

Thank you, I've merged this into the review-hans branch of
platform-drivers-x86 now, because this is a dependency for:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20210603224007.120560-6-djrscally@gmail.com/

After I've run some tests I will push the review-hans branch
to the for-next branch.

Regards,

Hans





> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.14-1
> 
> for you to fetch changes up to 043d7f09bf614809c10c4acbf0695ef731958300:
> 
>   gpiolib: acpi: Add acpi_gpio_get_io_resource() (2021-06-04 16:24:19 +0300)
> 
> ----------------------------------------------------------------
> intel-gpio for v5.14-1
> 
> * Export two functions from GPIO ACPI for wider use
> * Clean up Whiskey Cove and Crystal Cove GPIO drivers
> 
> The following is an automated git shortlog grouped by driver:
> 
> crystalcove:
>  -  remove platform_set_drvdata() + cleanup probe
> 
> gpiolib:
>  -  acpi: Add acpi_gpio_get_io_resource()
>  -  acpi: Introduce acpi_get_and_request_gpiod() helper
> 
> wcove:
>  -  Split error handling for CTRL and IRQ registers
>  -  Unify style of to_reg() with to_ireg()
>  -  Use IRQ hardware number getter instead of direct access
> 
> ----------------------------------------------------------------
> Alexandru Ardelean (1):
>       gpio: crystalcove: remove platform_set_drvdata() + cleanup probe
> 
> Andy Shevchenko (3):
>       gpio: wcove: Use IRQ hardware number getter instead of direct access
>       gpio: wcove: Unify style of to_reg() with to_ireg()
>       gpio: wcove: Split error handling for CTRL and IRQ registers
> 
> Daniel Scally (2):
>       gpiolib: acpi: Introduce acpi_get_and_request_gpiod() helper
>       gpiolib: acpi: Add acpi_gpio_get_io_resource()
> 
>  drivers/gpio/gpio-crystalcove.c | 10 +-------
>  drivers/gpio/gpio-wcove.c       | 39 +++++++++++++++----------------
>  drivers/gpio/gpiolib-acpi.c     | 51 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h            |  7 ++++++
>  include/linux/gpio/consumer.h   |  2 ++
>  5 files changed, 80 insertions(+), 29 deletions(-)
> 

