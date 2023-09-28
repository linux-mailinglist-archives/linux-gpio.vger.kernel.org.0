Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F3C7B274A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 23:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjI1VQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 17:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjI1VQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 17:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2137F1A1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695935711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=668WRSwzccSSZLdUmHKsncI+ABaAosHC/XXc6je1ZO4=;
        b=Q1InXibYE0BLxyvKRsIe5JHXuej5Juh6E+EC2xq2t/xNwZuwV+W+GKAmZ9QCnn8tXKlGJF
        KN+dYG7UCGGdrRlf+ifJYV43pc143/MkocHqxYTwuaGmKKyuxvc6ZTUEwDC+BVDUUtjuq0
        Fb3C6moNh640zQSro+bCKuhuZfOCpnY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-_9MvT6YzMEi0B7rDn2z2rg-1; Thu, 28 Sep 2023 17:15:09 -0400
X-MC-Unique: _9MvT6YzMEi0B7rDn2z2rg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4054743df06so105843845e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695935708; x=1696540508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=668WRSwzccSSZLdUmHKsncI+ABaAosHC/XXc6je1ZO4=;
        b=Cd8tvvAeIUpYkxWL/d+TrzMd+MM/7GgymuVVkGAufck06r6yBaDXdeM6RKLjNNqBMS
         ShPTG2Lyzm6a6w7yyEATT3hC129R6KT0NmfK3SFTFgOYVnPOkxWCoKES8wqhAEN8QWgG
         r7XqIXW3tBGqGoKJkoV5R16t4oCfBg8CVnbOUMCLFKsuQ6CxpBQHntnq+zaGC2mKyyYY
         u1A0jLKZnHrmK8x88Z/A3q1Xpvr/adZJuphkW20a3x9XiRX+jil0Lj7zW8HZFt77koHV
         fLeA903oB2h/KLpWf954EiEByPkjI17XA3GEDpqIwaAlRc8dLHS0tFeNHzF7ft2AM0hd
         Jatg==
X-Gm-Message-State: AOJu0YycHVNut7msnuih4wy+gNZ7WmOCzvD1kmWEt/nJ3NYGCCSkqHm2
        ML1TNILnazDjKpv4Io4FzU0f9O5g6R9jc2e+ISvlW3Aw6P2bmHgt8PL/hA7hQW/d6t8K6AZqz5i
        1iDf/tzX5mU3LuvdFkPmjLA==
X-Received: by 2002:a05:600c:ad3:b0:402:e68f:888c with SMTP id c19-20020a05600c0ad300b00402e68f888cmr2307039wmr.7.1695935708550;
        Thu, 28 Sep 2023 14:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoLBoBW0RgQfcEdiTRVcDK8Jq1t72S30ZWZt45BMjO2TF/Kz5Taeo5wZ+kqpssbrMB8u+FAg==
X-Received: by 2002:a05:600c:ad3:b0:402:e68f:888c with SMTP id c19-20020a05600c0ad300b00402e68f888cmr2307027wmr.7.1695935708175;
        Thu, 28 Sep 2023 14:15:08 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003fbe4cecc3bsm955wma.16.2023.09.28.14.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 14:15:07 -0700 (PDT)
Message-ID: <6f7530af-a160-620b-f3d4-a56dae1e0b46@redhat.com>
Date:   Thu, 28 Sep 2023 23:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/5] platform/x86: int3472: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
 <CACMJSetWH=Z5ubHb33W0mYvpqkU7vv=nKNBSa9eLmAi94NyrgA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACMJSetWH=Z5ubHb33W0mYvpqkU7vv=nKNBSa9eLmAi94NyrgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/28/23 20:40, Bartosz Golaszewski wrote:
> On Thu, 28 Sept 2023 at 14:40, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is a v2 of Bartosz' "don't use gpiod_toggle_active_low()" series.
>>
>> New in v2:
>> - Rework to deal with ACPI path vs gpiod_lookup.key differences:
>>   acpi_get_handle(path) -> acpi_fetch_acpi_dev(handle) -> acpi_dev_name(adev)
>>
>> Regards,
>>
>> Hans
>>
>>
>> Bartosz Golaszewski (2):
>>   platform/x86: int3472: Add new
>>     skl_int3472_gpiod_get_from_temp_lookup() helper
>>   gpio: acpi: remove acpi_get_and_request_gpiod()
>>
>> Hans de Goede (3):
>>   platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() helper
>>   platform/x86: int3472: Stop using gpiod_toggle_active_low()
>>   platform/x86: int3472: Switch to devm_get_gpiod()
>>
>>  drivers/gpio/gpiolib-acpi.c                   |  28 -----
>>  .../x86/intel/int3472/clk_and_regulator.c     |  54 ++--------
>>  drivers/platform/x86/intel/int3472/common.h   |   7 +-
>>  drivers/platform/x86/intel/int3472/discrete.c | 101 ++++++++++++++----
>>  drivers/platform/x86/intel/int3472/led.c      |  24 +----
>>  include/linux/gpio/consumer.h                 |   8 --
>>  6 files changed, 93 insertions(+), 129 deletions(-)
>>
>> --
>> 2.41.0
>>
> 
> Thanks Hans, this looks good to me. I'd let it sit on the list for a
> week. After that, do you want to take patches 1-4 and provide me with
> another tag?

That sounds like a good plan to me, will do.

Regards,

Hans

