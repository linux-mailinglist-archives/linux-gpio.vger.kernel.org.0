Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 386B163EC6A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 10:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiLAJ1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 04:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiLAJ1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 04:27:12 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E86718D
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 01:27:10 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d1so1653056wrs.12
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ax4tAPjYkuPMpifWcVY86LKu9914GZBJOujI+JnS+M=;
        b=ZIXuEZMH9Z9O4jc373ZD3+uPD2YhVavlOaqdP6zCfUMAxXw3OyhyioDfZnywV2TUCM
         7BYtq9ATc6Wj5kmWE5uE84/q6/Q4ODBo4/l7vYLhYc8MYjaP1lM0WAEzaWyLdlm4zpUM
         wcKPPvcm7Y0xOqXVWFUCeTaTq2vMaRfX5NA1mKOPtLpWpUsEJOFbYKP7Td7DdAAYLNfF
         D8W7okJaOS0BdLiPunIuqd/WIhofX+/Ba6B6VxYeni1y93bpoUwY/nlCa6RDoGeEPCXY
         OvBD2av/MbdUBGo7jbvJ7/T+B1kpTSeVGS17ePQRA4LQnwSrMr047sVjTqP6Nb4SANhe
         fDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ax4tAPjYkuPMpifWcVY86LKu9914GZBJOujI+JnS+M=;
        b=tl011GZGvosYGIZfCdO30ooNFjZuGr8J/3SOoZM48e2AWEc1PJ8ySpmdn1cDzT4ZP8
         O2G+Wbsf7qBSlC4OJcCjxF2LnuLVsDb8D1c4Lm9Ab7DoO/9svE9j0njyTYGVmodqWz+U
         T0o7Wl0OIAsnGdmI103qc9WZ86aille7dcLaasmahCGXbJEmFE2/GpVftdjz4mDvbekG
         e4dpIIB3mdIz4XCIKSqFXjbq3iKF6SagMaRp9DKXCVXH3/1mueGOS1kcpzD9Bzxtrepo
         e9GNNvihx/9pYDXfA+H6KhP9CLvW2wj2qA0eLPp2RMGdWXl4krf223bi/HUEsgEkER/0
         J0jg==
X-Gm-Message-State: ANoB5plrx+on+HsN2LieawWqPuRLCvNvuTCzqUovGrzRl3l2lDQhtDCX
        cUXkil6VRRP2QY2OehLrhgZpkQ==
X-Google-Smtp-Source: AA0mqf5yOFCI2c4479saQkRLytwewXlqsFO3oNTlct7wnWzpajWakg0YFHcoy9+/x+19zdSlavNKAw==
X-Received: by 2002:a5d:6b46:0:b0:236:56a6:823e with SMTP id x6-20020a5d6b46000000b0023656a6823emr39828882wrw.495.1669886829069;
        Thu, 01 Dec 2022 01:27:09 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm9417737wms.42.2022.12.01.01.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:27:08 -0800 (PST)
Message-ID: <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
Date:   Thu, 1 Dec 2022 09:27:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 >>>> +++ b/Documentation/driver-api/pin-control-acpi.rst
 >>>
 >>> We have Documentation/firmware-guide/acpi/, but I'm not sure
 >>> which one suits better for this.
 >>
 >> I started with firmware-guide but then moved to driver-api as I 
wanted to
 >> cover driver related bits as well. Let me know if it is better at
 >> firmware-guide.
 >
 > My point is that I don't know. If it's more about ACPI tables and 
properties
 > there, it's related to firmware-guide, if it's about Linux kernel pin 
control
 > subsystem (programming, etc) it's better to have it under its own 
documentation
 > subfolder.

In that case, we probably should also move existing 
Documentation/driver-api/pin-control.rst to the new subfolder ?

...

>>>> +Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
>>>> +pin resources.
>>>
>>> Why? What use case requires this?
>>> ACPI specification is more stricter in this than DT if I understand correctly
>>> the state of affairs.  So, can't we parse the tables in the same way for all?
>>>
>>> ...
>>>
>>>> +		case PINCTRL_ACPI_PIN_FUNCTION:
>>>
>>>> +		case PINCTRL_ACPI_PIN_CONFIG:
>>>
>>> These are definitely what we do not want to see in the individual drivers.
>>> (I understand that it might be that some OEMs will screw up and we would
>>>    need quirks, but not now)
>>
>> Hm. Please correct me if I am wrong here. My understanding is that we need
>> to do few mapping which only pin controller drivers can do such as ACPI
>> function number to internal functional name or selector.
> 
> Not sure I understand the use case here. The PinFunction() selects the mode for
> the pins in the list. But naming is hardware specific, indeed. And it seems
> there is no name field for the PinFunction().
> 
>> I could define
>> bindings to do those specific mappings rather than providing the current
>> general mapping interface. Would that be better ?
> 
> But that mapping can be provided by the driver at the initialization stage or
> generated automatically.
> 
> For the first we already have pin control APIs. For the second one I don't
> understand why driver should be involved.
> 
Yes ACPI PinFunction() only contains a function number and it is 
hardware specific.

AFAIA,the only way that would work without extra mapping is if drivers 
could populate the pinctrl function tree with the index matching the 
function number from ACPI table. I wasn't sure if that would work in all 
cases. We can start with that if that would be good enough for now. Let 
me know if there are other existing APIs that could help.

>>>> +	status = acpi_get_handle(NULL, pinctrl_acpi, &handle);
>>>> +	if (ACPI_FAILURE(status))
>>>> +		return NULL;
>>>> +
>>>> +	adev = acpi_get_acpi_dev(handle);
>>>> +	if (!adev)
>>>> +		return NULL;
>>>> +
>>>> +	dev_name = acpi_dev_name(adev);
>>>> +	if (!dev_name)
> 
> Resource leak is here (imbalanced reference counting).
> 
>>>> +		return NULL;
>>>> +
>>>> +	return get_pinctrl_dev_from_devname(dev_name);
>>>
>>> Are they all resource leakage-free?
>>
>> I hope so. Do you see something odd ?
> 
> I recommend to read documentation on the above APIs.
> 

Thanks. Got it

-- 
Niyas
