Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F224A67B874
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 18:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjAYRX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 12:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbjAYRXR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 12:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDA35B595
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 09:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674667348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nONdUYNqevuZ0XFlmdyCGVPRjt3qy0DDt2ILzgCTe6M=;
        b=bYcUUYN4SquHzo62tgxgLGr71pjt0cwKDKV35i/UMxKI84baWNTivzpQqO65Yj/VTuGfhM
        tliJoHrLPkWwpyKP3FEajZO+BgxigfToQtvd9RHL+aI34SsVQdRjh0/Ii5oXeIobhi3r6E
        vFW44mNquA0+bLCP+th9yaqjEI2ubdw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-DFNa2LiHNbOT1hrh37gZEA-1; Wed, 25 Jan 2023 12:22:26 -0500
X-MC-Unique: DFNa2LiHNbOT1hrh37gZEA-1
Received: by mail-ed1-f69.google.com with SMTP id z20-20020a05640240d400b0049e1b5f6175so13269433edb.8
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 09:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nONdUYNqevuZ0XFlmdyCGVPRjt3qy0DDt2ILzgCTe6M=;
        b=2YnHx1naRnE8voL3twZrmbJ7ld1Nzq/X9ieUwWuamfb9MsEtr4hcBIjPqwEk7TLiQY
         HGfaeW/nTfBg9XHl/S7Bn7TFQUSvIIsC7k14alltoIvDqvB8rDBOQjG86KpGhSiwiPch
         cCiVWUcssUiJmtxne/q1iMsYiJ74CvNQx1tT0U6qq4SVvM6DJomqMh+yy3NMUY5RRCDy
         rgIz5yxV3RarB4DP1+ijjsn8/IWkd1CQUHGbDix7OOBQEErZpDnnnQQDPjaQhlHepLP8
         md8KaYbWiQGbTy+UYadaJHOrGAHOODYLug2xuEw+2zbveWU6SXa3BC+cMNMUfMr1539J
         ZKgw==
X-Gm-Message-State: AFqh2kqKcvTSg9iAhKcY3NDsNDBu05yMSgEVvRYPYHXd4i79UpHqMsX3
        dqBLE34kmE6N5Qf9viVRRzBGB0VqkPbl7p0lm3MbdFeBg0UsLS1tyaYb6rCRk0CPdrDvIet84kC
        t+8XHLonGvsqvI4LPgGhgag==
X-Received: by 2002:a17:907:629c:b0:86e:9345:e701 with SMTP id nd28-20020a170907629c00b0086e9345e701mr44503680ejc.2.1674667345515;
        Wed, 25 Jan 2023 09:22:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSJzzMbBJeIT6x8Nt6QhUQF8IiWHKlirk/RcCcfDRBAltMFyuqjhFAmo6pM69ffkb0OSUWFw==
X-Received: by 2002:a17:907:629c:b0:86e:9345:e701 with SMTP id nd28-20020a170907629c00b0086e9345e701mr44503667ejc.2.1674667345306;
        Wed, 25 Jan 2023 09:22:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w7-20020a1709060a0700b0086faa5b06d4sm2570496ejf.181.2023.01.25.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 09:22:24 -0800 (PST)
Message-ID: <c577b33c-eafe-a2bb-c7a6-667297490dce@redhat.com>
Date:   Wed, 25 Jan 2023 18:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 resend 1/2] gpio: tps68470: Fix tps68470_gpio_get()
 reading from the wrong register
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
References: <20230125110547.18093-1-hdegoede@redhat.com>
 <20230125110547.18093-2-hdegoede@redhat.com>
 <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
 <07a830ec-4cb9-8a02-dfc0-a3b52cc79290@redhat.com>
 <CAHp75VdL0PMKUCm=4TpE96A5eO8a+GA2Lg-76JYL+EKVt6JOwA@mail.gmail.com>
 <201635a8-5af8-7f8a-69cd-666cd3ed8e02@redhat.com>
 <CAHp75Vem+Jytu=10nxxFuOpOf5jPCboUg5q1CVpiRjU8G1ZRCw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vem+Jytu=10nxxFuOpOf5jPCboUg5q1CVpiRjU8G1ZRCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/25/23 15:55, Andy Shevchenko wrote:
> On Wed, Jan 25, 2023 at 1:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/25/23 12:34, Andy Shevchenko wrote:
>>> On Wed, Jan 25, 2023 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 1/25/23 12:23, Andy Shevchenko wrote:
>>>>> On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>>>>>> so that the actual value of the pin is read, rather than the value the pin
>>>>>> would output when put in output mode.
>>>>>
>>>>> It really depends. I think it's a wrong perception and brings nothing
>>>>> to software. If we output, we know what we program, so reading back
>>>>> returns us what we _assume_ should be on the pin under normal
>>>>> circumstances. The difference is OD/OS/OE/OC cases where we output>>> only one possible value.
>>>>>
>>>>>> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
>>>>>
>>>>> Is it really fixing anything? Can we have more?
>>>>>
>>>>> P.S. Before doing this, I would have a clarification in the
>>>>> documentation. Sorry that I have had no time to respond to my series
>>>>> regarding that. But it seems we have a strong disagreement in the
>>>>> area.
>>>>
>>>> I know disagree on some of the semantics of gpiod_get_value() but 99.9%
>>>> of the consumers of gpiod_get_value() are going to deal with pins
>>>> which are either in input mode, or in some non push-pull (e.g.
>>>> open-collector for i2c) mode. And in those cases reading GPDI
>>>> os the right thing to do.
>>>>
>>>> Calling gpiod_get_value() when the pin is in push-pull mode really
>>>> does not make much sense, so there will be very little if any users
>>>> of that. And this patch fixes the 99.9% other (potential) users
>>>> while not breaking the push-pull case since even then reading GPDI
>>>> should still return the right value.
>>>
>>> Some hardware may not even allow what you are doing here.
>>> For example when input and output direction is the same bit in the
>>> register. Another case when the input buffer is simply disabled by the
>>> driver for a reason (power consumption, etc).
>>
>> But we are not talking some hw here, we are talking about this
>> specific driver, which has separate registers for setting
>> the output and reading the pin value.
>>
>> The current behavior of this driver is *totally* broken wrt
>> gpiod_get_value() and this fix actually makes it work!
> 
> I don't see how you can make it work for GPO pins. get() method should
> work for them too. Probably I'm missing this part. At least the choice
> of the registers has to rely on direction, correct?

You mean the special output-only pins which are earmarked
for usage as sensor-reset, etc. ? That is handled already:

static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
{
        struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
        struct regmap *regmap = tps68470_gpio->tps68470_regmap;
        unsigned int reg = TPS68470_REG_GPDI;
        int val, ret;

        if (offset >= TPS68470_N_REGULAR_GPIO) {
                offset -= TPS68470_N_REGULAR_GPIO;
                reg = TPS68470_REG_SGPO;
        }

	ret = regmap_read(regmap, reg, &val);
	... (error handling)

	return !!(val & BIT(offset));
}

Notice the offset >= TPS68470_N_REGULAR_GPIO that checks for
the output only pins.

Regards,

Hans




