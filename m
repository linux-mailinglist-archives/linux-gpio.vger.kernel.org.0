Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0317762A1B3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 20:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKOTPe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 14:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKOTPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 14:15:30 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CB1AE45
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 11:15:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id o4so25904490wrq.6
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 11:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7jsfqGfzSEt3A/BmKnudav/v37qvj+6kpbxgVEOqco=;
        b=RJnbMuHRHiOAOuPQMqyAnyg4IFjyPXfvg99fjqJrMAoIkwE5hSH3FDhlBb+d5wSzQF
         LP75d2tolRs+1l4uDg8q1VSIUMYzbin1w/I72WmxGvQcUfwZIrrxrWyYb+Ts5K9r/U7u
         tyK/iTWT4iGvZIYhfpT4z/n8SwGxugRaZI4GkiowyJ+BE5cwCUI6gQ6IfAX4cxZR0zH9
         p/MvAWPbkDthuAp1W26p4Hipp9QyNremND4Y6IVms0jHg4r8PnKNiqC8yw3yevee0EXV
         Qfb+qVwGaRClhQ+MQsoBkri56byZTxVgd1JY+Y/ION3zd55cZK0kqHxudhxO9AZ4FmTN
         R00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7jsfqGfzSEt3A/BmKnudav/v37qvj+6kpbxgVEOqco=;
        b=r2VOL8z0+GupDKuWR9L8DIbmtE9q2Ovo8eeJBQwQFGWvGrGEmgIm98NpTd23nFmEaQ
         Uj863f9ZZ7yYxP0KMMOmM2ERKLKNIHA6P+7vS/ldles+o8VVUufwsxbOYCQnagcijLcy
         I9t5Ar07tB5iTfoUZBoL2rcH/C26yB9BgdHC76qdoXPXBnLqFVQXdf87fmncgxFLIowV
         GxKfXzs6EeHSOrcre2vJfzb6xNzY/EWGjFz1m921HcVx0HMyQuiELXAN9SnpwTjauj91
         SNk8SCbWA4gkwmLkOMW6VPV4X7+FgagaG2JWNcP2uAMLvJZop0OYQ03t1TSiuKPOzC+0
         1Vog==
X-Gm-Message-State: ANoB5pkMYFS6oIbcCtRVIDK81u5+4PlHR26bamxnHFFW+3DhGHUH8A6h
        my5EUVA9RfxJpsJKPObhf9sembejp7zBdwyd
X-Google-Smtp-Source: AA0mqf7hxQ0adwUEJ9W+rqhkSxjkbCKP1aXDPB9Nz/qKk+5341t2xKK2PZemxhznaWvG9DJqcUHSbA==
X-Received: by 2002:a5d:4ecf:0:b0:236:5655:1393 with SMTP id s15-20020a5d4ecf000000b0023656551393mr11836301wrv.626.1668539728201;
        Tue, 15 Nov 2022 11:15:28 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c5441000000b003b4868eb71bsm21332337wmi.25.2022.11.15.11.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 11:15:27 -0800 (PST)
Message-ID: <35760f9d-e491-4014-96f3-b13657c1c523@linaro.org>
Date:   Tue, 15 Nov 2022 19:15:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 >>> 1) why do you need specific _DSD() for the pin mappings?
 >>
 >> _DSD is required to pass the GPIO number to Pin mapping. Is there a 
better
 >> way to do it ?
 >
 > Don't you have your pins sequential? Doesn't driver know the pin list?
 > Where are the device tree bindings for those properties? Are they already
 > present there?

They are not sequential. There are multiple GPIO controllers and GPIO 
pins are mapped to different pin ranges.

Please checkout arch/arm64/boot/dts/freescale/imx8mp.dtsi for device 
tree binding.

Yes I think it can be done in the driver.

 >>> 2) wgy you need vendor data for some of Pin*() resources?
 >>
 >> Vendor data contains platform specific mux, config and input selection
 >> register for the pin group.
 >
 > Why can't this be in the driver?
 >

Yes I think it can be done in driver. But I think we still have to pass 
the vendor data from the ACPI resources to the drivers in case if any 
implementation wants to pass vendor specific data for the driver.

--
Niyas

On 15/11/2022 18:47, Andy Shevchenko wrote:
> On Tue, Nov 15, 2022 at 06:29:28PM +0000, Niyas Sait wrote:
>>> Cover letter doesn't point to the ASL code you are using.
>>
>> I've built this patch with a prototype ACPI implementation for NXP I.MX8MP
>> platform.
>>
>> You can see the code here: https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch.
> 
> Yes, my point that you have to create a cover letter
> 
>>> 1) why do you need specific _DSD() for the pin mappings?
>>
>> _DSD is required to pass the GPIO number to Pin mapping. Is there a better
>> way to do it ?
> 
> Don't you have your pins sequential? Doesn't driver know the pin list?
> Where are the device tree bindings for those properties? Are they already
> present there?
> 
>>> 2) wgy you need vendor data for some of Pin*() resources?
>>
>> Vendor data contains platform specific mux, config and input selection
>> register for the pin group.
> 
> Why can't this be in the driver?
> 
> ...
> 
> On top of that, how other hardware can utilize what you are doing without
> adding redundancy to the ACPI?
> 
