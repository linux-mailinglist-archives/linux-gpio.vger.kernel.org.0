Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23ACF7AFF9C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjI0JO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjI0JO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C0EB3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695806051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/bCjD93zGx7k6DS0sd/nFhrwYQMV95Gpv7IoiMJVN0=;
        b=etuxdj4ICwxAGabm39B0Roqb6V2gWvmfGJxublkuWQ0tM9zwpx2y3xl6r2mzOkLORcJ5No
        G/O0w+GfEJUP6P1i3NVpYGZoxanNHQdKGnFEADGNz9zU9z8svyuzXhc4fAjW0Jqjy2+cIH
        on37CfhZgC9E8+kDGrpZYmhiY66XEO8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-dqOxBIIIPVe_a9oqNkRPEA-1; Wed, 27 Sep 2023 05:14:09 -0400
X-MC-Unique: dqOxBIIIPVe_a9oqNkRPEA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993c2d9e496so905541566b.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806048; x=1696410848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/bCjD93zGx7k6DS0sd/nFhrwYQMV95Gpv7IoiMJVN0=;
        b=gY5CmMTV2tLA/fFdYFgxZvCs3iiT9fHhnJdpnv8M+82Ako655i12dF89F9+2bSJExk
         SGqNwNpA0hzzLTASorgQC5TicGNm7qiCajrJfLzKnZPWcNN3NZ8wDDRI9zho17nsMUYn
         1YlOLFoCVZsJn3sAAODPOhjL2F0wRet3/uqcBqk6QlVu0IiyijSLJ2jjGpOfsARN3Qzl
         Y8QN/Ccs04R4zqgdbzFi2LKjl4zvj67w+zrOcniAGtyDvWXPm9eUr/UoSxXkifCRFzCl
         X+rZjLKLVXK2JfcnLJeCDW/NeHtE+LdayFaokRcAWzmpLUK3AvitJru+rSqRfQ1gB53H
         nhhg==
X-Gm-Message-State: AOJu0YzYP8LofmE+nwNZNdSKZE1APUYKC1llL31wOgAQ5SRBW1Fl3jAa
        TITi8dmR/XlFu/g0CFA3iAq9oV+65wz4Gl3JDCT5tApTbBGikzZbPRGvNY4qYMxac9lxIKGSShf
        Ri/iqBJb7kXnSJb8eZkIZ4Q==
X-Received: by 2002:a17:907:1ca1:b0:9a1:bd33:4389 with SMTP id nb33-20020a1709071ca100b009a1bd334389mr1744706ejc.74.1695806048727;
        Wed, 27 Sep 2023 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBja2h6H4iNhc0j95Q0ZZoVn1HywvIdObcsejBA4MbQ5G7O+fTuE/uCPp8hyYYFBBIWF65Tg==
X-Received: by 2002:a17:907:1ca1:b0:9a1:bd33:4389 with SMTP id nb33-20020a1709071ca100b009a1bd334389mr1744683ejc.74.1695806048395;
        Wed, 27 Sep 2023 02:14:08 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b009920e9a3a73sm8972076ejc.115.2023.09.27.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:14:06 -0700 (PDT)
Message-ID: <adf04176-273d-e365-f765-f84c4e4f6a11@redhat.com>
Date:   Wed, 27 Sep 2023 11:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <20230926145943.42814-3-brgl@bgdev.pl> <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
 <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

HI,

On 9/27/23 09:02, Bartosz Golaszewski wrote:
> On Tue, Sep 26, 2023 at 5:27 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> On Tue, Sep 26, 2023 at 04:59:41PM +0200, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
>>> temporary lookup tables with appropriate lookup flags.
>>
>> ...
>>
>>> +     int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
>>> +                             int3472->dev, path, agpio->pin_table[0],
>>> +                             "int3472,privacy-led", polarity,
>>> +                             GPIOD_OUT_LOW);
>>
>> Personally I found this style weird. I prefer to have longer line over
>> the split on the parentheses.
>>
> 
> I in turn prefer this one. Checkpatch doesn't complain either way so
> I'll leave it to the maintainers of this driver to decide.

I'm fine with keeping this as is, using longer lines does not seem to make
things better here.

Regards,

Hans

