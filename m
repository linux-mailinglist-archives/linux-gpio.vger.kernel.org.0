Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F0F70D87C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 11:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbjEWJK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 05:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbjEWJK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 05:10:56 -0400
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7E7FF
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:10:54 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96aae59bbd6so1323920966b.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684832993; x=1687424993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoEso63g+0SKeGzDkD1maNgqaaGX52WJnGRxyXGPsc4=;
        b=FYAUUJhu+cevF0Zg6iafvi/RtW1iniieS1LAaBi9MEVhqlz2zQbYCstnjRu/XTE8Tf
         acH2KyB0IdWo6ugqPyNwIz21e+g2LeWBYqRvA0GOg0lbQzchwHoUQNzoNNAd7QLVWU07
         au1DvBzxTw9kUXKLd2247RVQOQfQHmX9VNs2E56xdNsSNFbNUy4gSKZMclU1/+3cLBAF
         VtMJKIjpxd1kltJ468dOvHZ+pnitvI8oMKRF5I8NcdITJS6SqrFi+DQS62zLPqyvBZjj
         fEjz8degm1IisEbJokZhmTYZ9ScHgDPiSzCLQUMZJFanPMgXE/lf9aSxV3spPupYJzwb
         59qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684832993; x=1687424993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoEso63g+0SKeGzDkD1maNgqaaGX52WJnGRxyXGPsc4=;
        b=K//NjtKCNdAFgo4XqMm6Bmkd5YKYvf6Zzp3WVaPYvQ9xoRlKAyN7T5PFXmRz+adMwY
         nuE1QMK1A1p6jHfU4GYMEtZNMR83iSweooYbaxH3oCO96KE/zP8rywUQW1TWzJb5ZT2M
         +XuYzySPK9xODib1t3hoKcTmJwneWRzvLy75GiJX4N0NuNiFft7t2+cn0aWbgYIG9eNo
         UguQFps0QDYjpUqO0ICVajDEbqF+CaVZOtXqJq1gkmP4jLdEeC3cVUdMakBObXv9kvB2
         kiumpBMPOy3gBvWH0IM+YPOyVcNC7cztlrp3UJt0G8wpA/MuNOdzMSlxS4gKCPw4/s7T
         CZhQ==
X-Gm-Message-State: AC+VfDwAvxU0lgXigxvedFMfeRcMayxKHuvVXC04d8V8imGCYN9n52xV
        UMFhVeyUZOEEQB3nzfcuegVFCQ==
X-Google-Smtp-Source: ACHHUZ5zYnuYGtxhCBEc6UuB0mA8LCTKfqijjVsWcN9D+xkiJ0rEyMKWdCr9Yd6nvdeUbwg/r/Dqxw==
X-Received: by 2002:a17:907:60cc:b0:96a:580e:bf0f with SMTP id hv12-20020a17090760cc00b0096a580ebf0fmr15054349ejc.14.1684832993139;
        Tue, 23 May 2023 02:09:53 -0700 (PDT)
Received: from [10.2.5.18] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id p26-20020a17090664da00b0096f7105b3a6sm4213801ejn.189.2023.05.23.02.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:09:52 -0700 (PDT)
Message-ID: <0cf870f1-8cdb-df74-79d6-a4004cdfcc2f@baylibre.com>
Date:   Tue, 23 May 2023 11:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>
References: <20230511-tps65219-add-gpio-support-v2-0-60feb64d649a@baylibre.com>
 <20230511-tps65219-add-gpio-support-v2-1-60feb64d649a@baylibre.com>
 <CAMRc=Md-CzrG3QPtnh0OxYaHTAYZ2aUfMKhkAOeRm2Zn30qE0A@mail.gmail.com>
 <ZGiWdQcR6Zq6Aw65@surfacebook>
 <9fa1a6e8-368a-3e22-aa84-8cad09f72a32@baylibre.com>
 <CAHp75Vf0hW6sMXeGSVXRVoW1mxFufWmbJNzt7_10xPj_k5SNkA@mail.gmail.com>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <CAHp75Vf0hW6sMXeGSVXRVoW1mxFufWmbJNzt7_10xPj_k5SNkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/05/2023 13:18, Andy Shevchenko wrote:
> On Mon, May 22, 2023 at 10:47 AM jerome Neanne <jneanne@baylibre.com> wrote:
>> On 20/05/2023 11:44, andy.shevchenko@gmail.com wrote:
>>> Mon, May 15, 2023 at 05:36:46PM +0200, Bartosz Golaszewski kirjoitti:
>>>> On Thu, May 11, 2023 at 4:09 PM Jerome Neanne <jneanne@baylibre.com> wrote:
> 
> ...
> 
>>>>> +       gpio->gpio_chip = tps65219_gpio_chip;
>>>>
>>>> Aren't you getting any warnings here about dropping the 'const' from
>>>> the global structure?
>>>
>>> But this is a copy of the contents and not the simple pointer.
> 
> I commented on Bart's question.
> 
>> In many other places where this is done, the struct is declared like:
>>
>> static const struct gpio_chip template_chip = {
>>
>> After internal review, I changed this to:
>>
>> static const struct gpio_chip tps65219_gpio_chip = {
>>
>> This is because I didn't want to have this "template" that sounds to me
>> like "dummy". Maybe I misunderstood and this "template" was used on
>> purpose because this const struct is just copied once to initialize
>> tps65219_gpio->gpio_chip during probe.
>>
>> Introducing tps65219_gpio_chip name is maybe confusing with
>> tps65219_gpio struct.
>>
>> I think the const should not be a problem here but the naming I used
>> might be misleading. If you have a suggestion of what is a good practice
>> to make this piece of code clearer. I'll follow your suggestion (use
>> template? more_explicit name like ???).
> 
> It's up to Bart.
> 
Bart, should I keep the code like this or do you suggest a name change 
so that's it's more appealing?
