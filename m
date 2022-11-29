Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA5B63BF1D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 12:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbiK2LeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 06:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiK2Ldh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 06:33:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE37319C
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669721557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/d4T5zjZ2/xv0d6C4B2qXDDWBIIfOQ90oEadaEWlU8I=;
        b=Zl6w2h6KnNuBP5zIpcdreIKmCf2aRx7lWfbKj9rnS3VjafcKneBVrzM6/l5vrfGmgstT7a
        ffEcFt5VZLzHeoOIRhF/qzRgdKsZU6efrZAHD1PkDwHu9N3M3mvI6XZr+I+fQHN6eQp5dZ
        8tNNMDLwirfLV/mcFLZNexkkZKlQKbU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-KLQa3LiAMYqLbnM-yVJkxw-1; Tue, 29 Nov 2022 06:32:36 -0500
X-MC-Unique: KLQa3LiAMYqLbnM-yVJkxw-1
Received: by mail-ej1-f71.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso6337347ejb.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d4T5zjZ2/xv0d6C4B2qXDDWBIIfOQ90oEadaEWlU8I=;
        b=ZAqLOR72elxUtfAegnHzC5VOQKdL50yUOSBjQQpQ/zSfHNiVc8MbDfEIA5F4ILSDmK
         Q0OL47dxXSSRoqVUaBSNdD3bIoYEmvPb5E2rfWqaKr5D62Hs/FTXTuD7Kdv8IqWuRTfI
         tF4QljsPqjwNRAU6SGX4+pLOu5WeNK09IYENWC1Uoly9iLafqWI0Md5AUGSPshCFUlNa
         DHAUJX4SRlj5sIkPpQGvvmSxxraYinZ+mqb7kOiHdOZ0+ZtUh8WdSBEWYcxXu18FNRJ7
         haELXXS8W6egf3H6KOCUVYAMfBeTAcxYv31oI3iDLdUz8Y3Lu0BU2ga+zGMi2o25+eZK
         QBFA==
X-Gm-Message-State: ANoB5plB0MUiX7BWCga2miD4hUmQdnGzzbV7qv2DP8sUlqt909+6Nk0v
        C6MJzK75r6MYBAQkB7AtR9qS1AsWa/SuO2c7VcpfrFESEqPav7kLzpRU0ryXpm9KiUxN5Cwg1sO
        l/doMbBmBMBNm765ckXbiUQ==
X-Received: by 2002:aa7:c788:0:b0:458:b9f9:9fba with SMTP id n8-20020aa7c788000000b00458b9f99fbamr35342093eds.305.1669721555247;
        Tue, 29 Nov 2022 03:32:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47O6/boMZ9eapNP4eorwpxZfjoAbJB/XrVKiwje3UMF6/g6R0k8vp0N7qnRMo1p06c2veGNg==
X-Received: by 2002:aa7:c788:0:b0:458:b9f9:9fba with SMTP id n8-20020aa7c788000000b00458b9f99fbamr35342077eds.305.1669721555084;
        Tue, 29 Nov 2022 03:32:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d26-20020a170906305a00b007415f8ffcbbsm6096378ejd.98.2022.11.29.03.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 03:32:34 -0800 (PST)
Message-ID: <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
Date:   Tue, 29 Nov 2022 12:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED
 outputs
Content-Language: en-US, nl
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
 <20221128214408.165726-4-hdegoede@redhat.com>
 <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
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

Hi Andy,

Thank you for the reviews.

On 11/29/22 11:28, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The tps68470 has support for 2 indicator LED outputs called
>> ileda and iledb, at support for these as GPIO pins 10 + 11.
> 
> add ?

This models ileda and iledb outputs *as* GPIO pins 10 + 11
on the linux gpiochip.

But yes it also adds gpio pins 10 + 11 to the gpiochip, so
either one works I guess :)

> 
> ...
> 
>> +static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
>> +                                          unsigned int *reg, int *mask)
> 
> Hmm... Usual way is to put the get/set flag at the end of the list of
> parameters.

For functions returning values by reference I always follow the
pattern of input parameters first, then output parameters.

> Also why not naming it as 'dir' to avoid confusion with the _get in
> the function name?

Because dir is meaningless without an enum to to define what a dir
of 0/false means. Where as get is clear without such an enum.
get is set to true when this function is called from
tps68470_gpio_get() and false when it is called from
tps68470_gpio_set(). It does not get more straight forward then that.

Regards,

Hans




> 
>> +{
>> +       if (offset < TPS68470_N_REGULAR_GPIO) {
>> +               if (get)
>> +                       *reg = TPS68470_REG_GPDI;
>> +               else
>> +                       *reg = TPS68470_REG_GPDO;
>> +               *mask = BIT(offset);
>> +       } else if (offset < (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT)) {
>> +               *reg = TPS68470_REG_SGPO;
>> +               *mask = BIT(offset - TPS68470_N_REGULAR_GPIO);
>> +       } else {
>> +               *reg = TPS68470_REG_ILEDCTL;
>> +               if (offset == (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT))
>> +                       *mask = TPS68470_ILEDCTL_ENA;
>> +               else
>> +                       *mask = TPS68470_ILEDCTL_ENB;
>> +       }
>> +}
> 

