Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC6867B1B5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbjAYLlb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbjAYLla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF5572A4
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674646843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uifBf7bipBHL9qvX9G2ee4YhM4IPLIAsk1+5VK6M5O4=;
        b=bLPZwW+ciDhMXxYOJsV2xMuLBs6XKqOv0EOZdgrftqxT/+bX/kynEB+mWpqnCloc2AfzMD
        50K17Ww7/tYSGyBo3mvIMlfEX4YXoonXmOSDeiXFBGZl/rpyHeQFM5djc3hx5tZNPz7YRj
        l6lyGm+ofvZk4ovqWC9XYKPHxIW3K2o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-MC6fkUk2P9OGROuuoJtaqg-1; Wed, 25 Jan 2023 06:40:39 -0500
X-MC-Unique: MC6fkUk2P9OGROuuoJtaqg-1
Received: by mail-ej1-f70.google.com with SMTP id hq7-20020a1709073f0700b0086fe36ed3d0so11804253ejc.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uifBf7bipBHL9qvX9G2ee4YhM4IPLIAsk1+5VK6M5O4=;
        b=Yfo8kYEjnsIOU4WkIjgC4LM8TTP0zdcVPqFFL2CAizmR7rFRtJT533xAFM+BjK5ZDH
         v2lMFU2omnlb+X1Ubs4RnBzY07IIdJKAr1x9uEn2D3b8Z+oI2EunCF4jhSihVPghEdRY
         1GEaDmhmsQN6pX3MPjtJMx9Y+ckwSFtCZdYC52qYkxcangJ+Lqtjsq2rFMXQjD5c+MpR
         Ljf7Lu7D//4VEeqmWxjTsU8Oj9pkTpobtX0zGtB8EBynJdSoYAzuWobEfTg6C3lqUXLB
         OLU+OOYjqPga0/fXieJ1yHZNTQDZsiZ9LTqm/oa2k4sjB0+WfZjFBC/dFkXu30kH5vDh
         tKog==
X-Gm-Message-State: AFqh2kq5u18gdML3yRxbS3Fzc9yjktl5mSnyvUikf5YBkPCQjgyqWQeH
        rHqimuBkoGU95W427xaChZvFHjSfAp6NNx604vAhkSFa0L14jVNL6SKE+vXIjd8sRW8JArwGKCK
        U1gvp6Li0XJGtrfL9Uooxtg==
X-Received: by 2002:a17:906:4b53:b0:873:3806:be87 with SMTP id j19-20020a1709064b5300b008733806be87mr33850404ejv.71.1674646838559;
        Wed, 25 Jan 2023 03:40:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZngnp53qQ3QLO1KnSmE8mVEzwmvITF8qPPxNvUT3EZZA2+DX7FhioO6DeYUgeTXZwYXYRAw==
X-Received: by 2002:a17:906:4b53:b0:873:3806:be87 with SMTP id j19-20020a1709064b5300b008733806be87mr33850392ejv.71.1674646838354;
        Wed, 25 Jan 2023 03:40:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mh14-20020a170906eb8e00b0084d34eec68esm2210567ejb.213.2023.01.25.03.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:40:37 -0800 (PST)
Message-ID: <201635a8-5af8-7f8a-69cd-666cd3ed8e02@redhat.com>
Date:   Wed, 25 Jan 2023 12:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 resend 1/2] gpio: tps68470: Fix tps68470_gpio_get()
 reading from the wrong register
Content-Language: en-US, nl
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdL0PMKUCm=4TpE96A5eO8a+GA2Lg-76JYL+EKVt6JOwA@mail.gmail.com>
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

On 1/25/23 12:34, Andy Shevchenko wrote:
> On Wed, Jan 25, 2023 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/25/23 12:23, Andy Shevchenko wrote:
>>> On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>>>> so that the actual value of the pin is read, rather than the value the pin
>>>> would output when put in output mode.
>>>
>>> It really depends. I think it's a wrong perception and brings nothing
>>> to software. If we output, we know what we program, so reading back
>>> returns us what we _assume_ should be on the pin under normal
>>> circumstances. The difference is OD/OS/OE/OC cases where we output>>> only one possible value.
>>>
>>>> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
>>>
>>> Is it really fixing anything? Can we have more?
>>>
>>> P.S. Before doing this, I would have a clarification in the
>>> documentation. Sorry that I have had no time to respond to my series
>>> regarding that. But it seems we have a strong disagreement in the
>>> area.
>>
>> I know disagree on some of the semantics of gpiod_get_value() but 99.9%
>> of the consumers of gpiod_get_value() are going to deal with pins
>> which are either in input mode, or in some non push-pull (e.g.
>> open-collector for i2c) mode. And in those cases reading GPDI
>> os the right thing to do.
>>
>> Calling gpiod_get_value() when the pin is in push-pull mode really
>> does not make much sense, so there will be very little if any users
>> of that. And this patch fixes the 99.9% other (potential) users
>> while not breaking the push-pull case since even then reading GPDI
>> should still return the right value.
> 
> Some hardware may not even allow what you are doing here.
> For example when input and output direction is the same bit in the
> register. Another case when the input buffer is simply disabled by the
> driver for a reason (power consumption, etc).

But we are not talking some hw here, we are talking about this
specific driver, which has separate registers for setting
the output and reading the pin value.

The current behavior of this driver is *totally* broken wrt
gpiod_get_value() and this fix actually makes it work!

Regards,

Hans


