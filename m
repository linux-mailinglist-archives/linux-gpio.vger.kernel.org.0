Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA03B7AFEC9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 10:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjI0Il7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjI0Il6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 04:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663EFB3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695804070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dRjpHatXMpLPR28RDuixweakSgTj14YOtfkxYl7i+lQ=;
        b=KQ5k5EkJCseJgInAWsZbFeMA7Ie7bwV3f/cXopU5YQXDI0DC1Acbrui7yXzyW9h1ci/y1S
        RGG73L90HZ74MUI/YEs93NYtyraz3Ry+UUfJb9hVyHMyPUoxZTwVxmeaT4SB2qvONpTLpS
        l0JhcI5qH8sBv6QszmV0kStMSLc+CP8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-ClCUunq5MF-bcrGSTQohKA-1; Wed, 27 Sep 2023 04:41:08 -0400
X-MC-Unique: ClCUunq5MF-bcrGSTQohKA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a9e3f703dfso886581666b.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804068; x=1696408868;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRjpHatXMpLPR28RDuixweakSgTj14YOtfkxYl7i+lQ=;
        b=qI1W+SUq6UAjfzfxo670aLNAkpmgmTD09D0JpAfadmhu+9fiPoNizLPJi5oHOQIVzW
         oPBl95qJEQngo6bCSkAn8RuG4xzon31rjPvY+sTVsu4lMIMRyVn2vRdp18QGECsAQOy0
         geUX0tkaoYKkqgbGCKcR7S1X6Ihs/vbGceHA25UPkWUdsjW6orFT5Da7wrHPvf0dZSAP
         Tj6RmYNP1DI8YslCug+UfpaDAn+7YLncUrUwyTsecyIxkS9dui25kdzsmxLxKzAaRvU9
         z82Dudj+5cnr0PQK2ishgp1I+0lKBQRnAzBxZs/kaaEbxrQp1xsOLD71mvn9k1N3cFvq
         cIAA==
X-Gm-Message-State: AOJu0YzZnD0pKvB8m4jpMLPvQIWvvCdeadUpETkUpcXgRXUvrqNlVmFk
        rx37JvKEimvXrHGIMwOrmiVEAOV9EfnmJjXnALt9GNIEo5N9RYE17mhpHu0yy49NZbLJv7K9LhE
        fZsa1Ld65vNWoj3U067/Wvg==
X-Received: by 2002:a17:906:d6:b0:9ae:2f33:4ad0 with SMTP id 22-20020a17090600d600b009ae2f334ad0mr1286241eji.71.1695804067900;
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGe2pqu6JcAU51HEq3OLEnrMnL9FsmxkzqYCWJwkknNkJZo4Yj9H1+Hni85bBZ+QOsKjJLXQ==
X-Received: by 2002:a17:906:d6:b0:9ae:2f33:4ad0 with SMTP id 22-20020a17090600d600b009ae2f334ad0mr1286224eji.71.1695804067504;
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b009b299529709sm2262486ejc.132.2023.09.27.01.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
Message-ID: <5e127422-1e09-816c-d956-d7afd7ed1c6d@redhat.com>
Date:   Wed, 27 Sep 2023 10:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 0/4] platform/x86: int3472: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
In-Reply-To: <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/27/23 10:38, Hans de Goede wrote:
> Hi Bartosz,
> 
> On 9/26/23 16:59, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> gpiod_toggle_active_low() is a badly designed API that should have never
>> been used elsewhere then in the MMC code. And even there we should find
>> a better solution.
>>
>> Replace the uses of it in the int3472 driver with the good old temporary
>> lookup table trick. This is not very pretty either but it's the lesser
>> evil.
> 
> I saw your previous proposal which added a new api to directly set
> the active_low flag, rather then toggle it.
> 
> I intended to reply to that thread to say that I liked that approach,
> but I don't remember if I actually did reply.
> 
> I wonder what made you abandon the new function to directly set
> the active-low flag on a gpio_desc?
> 
> For the int3472 code that would work pretty well and it would
> be much cleaner then the temp gpio-lookup approach.

I missed that 4/4 removes acpi_get_and_request_gpiod(),
so I guess that this is not just only about removing gpiod_toggle_active_low()
but also about removing gpiod_toggle_active_low() ?

Regards,

Hans



>>
>> Bartosz Golaszewski (4):
>>   platform/x86: int3472: provide a helper for getting GPIOs from lookups
>>   platform/x86: int3472: led: don't use gpiod_toggle_active_low()
>>   platform/x86: int3472: clk_and_regulator: use GPIO lookup tables
>>   gpio: acpi: remove acpi_get_and_request_gpiod()
>>
>>  drivers/gpio/gpiolib-acpi.c                   | 28 ------------------
>>  .../x86/intel/int3472/clk_and_regulator.c     | 22 ++++++--------
>>  drivers/platform/x86/intel/int3472/common.c   | 29 +++++++++++++++++++
>>  drivers/platform/x86/intel/int3472/common.h   |  9 ++++++
>>  drivers/platform/x86/intel/int3472/led.c      | 12 +++-----
>>  include/linux/gpio/consumer.h                 |  8 -----
>>  6 files changed, 51 insertions(+), 57 deletions(-)
>>

