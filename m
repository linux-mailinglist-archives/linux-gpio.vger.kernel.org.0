Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C274B63BFEB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbiK2MVF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiK2MVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDEA5D6A4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669724407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aILfIeJh2IbhSzT4ykEFWlGKoAA+D+qrxr+nW++nHOo=;
        b=bPGuBk+f1EQKXh1O1YkVgTj6HdUrui/O4MMZig6vGPs+L3rx7hAAReC+nJj+MlYCn4qOep
        QYjpBgUsn78ilaBtLqgWbviIkeuNNZlZUZ6TfOb9QpIWbK/SYEH/IbvTaar+ALOolDadTI
        cMON77UlMSfO0RuqVNWmw6FbTNJQoIs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-E1xX9W1qPYmS_BvYzrrr9A-1; Tue, 29 Nov 2022 07:20:05 -0500
X-MC-Unique: E1xX9W1qPYmS_BvYzrrr9A-1
Received: by mail-ed1-f70.google.com with SMTP id x18-20020a05640226d200b00461e027f704so8078038edd.7
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aILfIeJh2IbhSzT4ykEFWlGKoAA+D+qrxr+nW++nHOo=;
        b=UchwLrpWtPsQHea1cDlCkSL4/VlSGXNgpma197YnPIOKi/Wi+rTAMxWiFc28q8mXJj
         S7xyLnnKOEcfJmUkNGli+oGn6TtMzLicrTb0ZgxEUr0dyt3VKYyLxwijzR1+GZhfQl6s
         Enz2mIXkuOIG0pup7fq5VZjCECs4CaPuu35GJuviuvM5hoVSQHGrEx3fJBswbplEWa5U
         UtHJR+iZbLriB93S0nGY0vg/DzJYiMSuNiXLz8b7xDPyXtBs+/nU/EP1EebR9AivVvYI
         WWhrKxptl2R7+UGrdYSbrd4FBUMICKvgyCTegpWzEKF6QjXeprGsQykZ80Fv9Oln5oXS
         Dgiw==
X-Gm-Message-State: ANoB5plxZvksoRSKnwmtqwe80+/zjAOYxSfkHGLEKuD4xDxmMt+KnUhd
        XLziEtDiVxYLH0rlgKFo4LH4eA3oh4WifWhvGmrQtBYEFeGHRvAeGUNkii19MCN1u7b1MKye6PI
        J6/YKdE5w4m9uxLk81R5nKw==
X-Received: by 2002:a17:906:80c2:b0:7c0:7db7:e1af with SMTP id a2-20020a17090680c200b007c07db7e1afmr5864554ejx.596.1669724404521;
        Tue, 29 Nov 2022 04:20:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf56VrueaHBR9k9+/HaNsEPykk2Z0chpmd/g0pjKANnsWA5+giUEo4O5fcuttCFa5uMPhCfR7g==
X-Received: by 2002:a17:906:80c2:b0:7c0:7db7:e1af with SMTP id a2-20020a17090680c200b007c07db7e1afmr5864539ejx.596.1669724404307;
        Tue, 29 Nov 2022 04:20:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906838a00b0078ddb518a90sm4982871ejx.223.2022.11.29.04.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 04:20:03 -0800 (PST)
Message-ID: <1940674f-84fc-e5c9-59c6-0e6389c9d285@redhat.com>
Date:   Tue, 29 Nov 2022 13:20:03 +0100
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
 <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
 <CAHp75VdxRbFmqUzjmMbtmh1tDGMXre+A+2u-hz5H3HSLEBX+OQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdxRbFmqUzjmMbtmh1tDGMXre+A+2u-hz5H3HSLEBX+OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/29/22 12:59, Andy Shevchenko wrote:
> On Tue, Nov 29, 2022 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/29/22 11:28, Andy Shevchenko wrote:
>>> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> The tps68470 has support for 2 indicator LED outputs called
>>>> ileda and iledb, at support for these as GPIO pins 10 + 11.
>>>
>>> add ?
>>
>> This models ileda and iledb outputs *as* GPIO pins 10 + 11
>> on the linux gpiochip.
>>
>> But yes it also adds gpio pins 10 + 11 to the gpiochip, so
>> either one works I guess :)
> 
> I had to be a bit more precise. 'at support'?! Perhaps it should be
> 'add support'?
> 
> ...
> 
>>>> +static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
>>>> +                                          unsigned int *reg, int *mask)
>>>
>>> Hmm... Usual way is to put the get/set flag at the end of the list of
>>> parameters.
>>
>> For functions returning values by reference I always follow the
>> pattern of input parameters first, then output parameters.
>>
>>> Also why not naming it as 'dir' to avoid confusion with the _get in
>>> the function name?
>>
>> Because dir is meaningless without an enum to to define what a dir
>> of 0/false means. Where as get is clear without such an enum.
>> get is set to true when this function is called from
>> tps68470_gpio_get() and false when it is called from
>> tps68470_gpio_set(). It does not get more straight forward then that.
> 
> But it's about the buffer (in hw sense) to read value from. What about
> naming it out_or_in?

"out or in" still does not make clear what a value of true means
does true mean out or does it mean in ? 

I'm sorry, but just like with your comments on patch 1/3
I really don't see the problem here. Unlike "dir" or "out_or_in"
get is a perfectly fine parameter name which is actually clearly
defined by the parameter-name itself.

And the function + the callers are all in the same file, so
anyone reading the code can easily deduce the meaning from
the code.

Regards,

Hans



