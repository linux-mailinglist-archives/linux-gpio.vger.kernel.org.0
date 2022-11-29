Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7B963BEEB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 12:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiK2L2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 06:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiK2L2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 06:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CC6C30
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669721265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNeN8GPpJrHlbWssIOBz2DcHNIKoFYFW+IzzrdE30Ic=;
        b=h6xlXG/DLOh5TdVxySv7rCwJKYeRRbkOkIkqtquV3zA1tSiOaZg9Dp/qSrmsFr+EFDG0rD
        Zy3Pl0bZnolyGaQ2r13X+uItOYitO7BGyOzXR9TLSgDXf64j+kGlkkdMGomj8KOI5pdBQD
        balEdH4p47k68AbG5ZEthCHrQtNt1dk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-sO2vxGAFM5ar2lvAvWlsOw-1; Tue, 29 Nov 2022 06:27:43 -0500
X-MC-Unique: sO2vxGAFM5ar2lvAvWlsOw-1
Received: by mail-ej1-f69.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so6291010ejc.15
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNeN8GPpJrHlbWssIOBz2DcHNIKoFYFW+IzzrdE30Ic=;
        b=T5KIkarraRx6RSM7MJ8plooad21azeJtFZGhg95mCBkQ94pt+08DK/sGvaY07aq8zL
         ZxGV0V8C3reOeTCR/GOjp17EB1NRk4UA930yO6b3tH36rSG8G64JAGUL2TgoebmQshtf
         UuQyA2Z++XpESyEtDyN0iASskQAdjrI48RfZ42234x6dYjX7QOBvLTcuUWeIwa91g2Ry
         wiPU8hL2yM6zGg3Sk9Blu2bq2gl6qgw+ud50k3PNtF74udUOrvrytQb5g2T4eLkSPKuB
         7b6u4o10hucuGrtsNKJBPszgwbc1lhozp2tS2Rhe2ig+6tZDi/bLi8kCvUewd1QmwaBo
         zNkw==
X-Gm-Message-State: ANoB5pm+ww+ewN+uFj0Xfl9r4nFlSMew3Imgl/lTwGqYxNRyN7ejscnB
        xlaDf+fFP1eNp+a/9QlAU5iipIVeXKZu7qoQj3Xa65CjigtgOhwqyQlCOtpR4SOwVUeB24DCDDy
        qpfTF+Y8/YAr42JnM7QBUfQ==
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr52740582eda.96.1669721262538;
        Tue, 29 Nov 2022 03:27:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40Atovb0T/uPocwF34I4V7PN+Lzr4d20b7/Ii4B2B97qox/i3YuuKF9f/Z0Ewh2ohVjnBEBg==
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr52740565eda.96.1669721262322;
        Tue, 29 Nov 2022 03:27:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v3-20020a056402174300b004691de0e25bsm6171213edx.54.2022.11.29.03.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 03:27:41 -0800 (PST)
Message-ID: <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
Date:   Tue, 29 Nov 2022 12:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/29/22 11:22, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>> so that the actual value of the pin is read, rather then the value the pin
> 
> than

Ack.

>> would output when put in output mode.
> 
> I don't see it here and haven't checked the context, but the idea is
> to check the direction and return either input (if pin is in input
> mode) or [cached] output.If it's the case, the patch looks good to me.

No the idea is to always actually use the input register when reading
the pins, independent of the input/output mode. Instead of always
reading the [cached] output register value.

The input buffer will still work when the device is in output mode
and if somehow an external force is pushing the pin low/high against
the output value then the input buffer will correctly reflect this
(assuming the output is current limited and thus the magic smoke
stays inside the chip).

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpio/gpio-tps68470.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
>> index aaddcabe9b35..778a72cf800c 100644
>> --- a/drivers/gpio/gpio-tps68470.c
>> +++ b/drivers/gpio/gpio-tps68470.c
>> @@ -30,7 +30,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
>>  {
>>         struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>>         struct regmap *regmap = tps68470_gpio->tps68470_regmap;
>> -       unsigned int reg = TPS68470_REG_GPDO;
>> +       unsigned int reg = TPS68470_REG_GPDI;
>>         int val, ret;
>>
>>         if (offset >= TPS68470_N_REGULAR_GPIO) {
>> --
>> 2.38.1
>>
> 
> 

