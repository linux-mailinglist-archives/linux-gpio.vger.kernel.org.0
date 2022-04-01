Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA794EEBA2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 12:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiDAKjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 06:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344795AbiDAKjl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 06:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65CEB27383E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648809423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+e04MHXKz94DY1KD9WiyeJfS3wZp3ZxoeCoDh0+766c=;
        b=PpFEtgjbMxhCN/IlQMQRufq/J8HegzfSRlrQBjGABSO/HF/4uyxRqrdIfha8dxjVstyTgS
        XdObj6sPgWsCHS93OpCUEuAt+zN4ut1xRFUNVLKU1kit0hwAcIyok/E+xBf51T84jO30S1
        7tpS+9B2HtIOeue7Dd6LEl4m9uGJ+N4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-ws4jFMAKMTePIY0aOr7VnA-1; Fri, 01 Apr 2022 06:37:00 -0400
X-MC-Unique: ws4jFMAKMTePIY0aOr7VnA-1
Received: by mail-ed1-f72.google.com with SMTP id i22-20020a508716000000b0041908045af3so1299629edb.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2022 03:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+e04MHXKz94DY1KD9WiyeJfS3wZp3ZxoeCoDh0+766c=;
        b=3FknMcEqupa9uJaiJGG6CIvk80lZDdihv0ErwvhWPWzOmXFvB/ZqRR5+9RHDz68Fwb
         cuOnpxQ0FeOiU2DWpW1rPffxKR2Y0u10ShAWCH+nLQFeGE025dssgCkeamT2UcVMan89
         TER1dEOuAyDxgLjoPPJZkEO6J+elKN8rtTKpDPLA3nXn3Mg0snXHv5Lyl8uggjf9jzyS
         hsfYz8phWl8v8DVChWcx6v2p5e0EEJoPBfzOJFPD3j5lYPF96SuAB3nufLCmNs1fenPt
         r0F1AsEJt/u4zLUZwtZVnx9WyHSFgU9xXs4hq+Kd/rAW5fNf32r0DMpUGFCIPd0gAncM
         V10g==
X-Gm-Message-State: AOAM532heqXBVRf6r8lD4TuXDPLJUTya0tHbVELGTJb0mOnKsNV3wDl/
        LRK9jm6U+IuN786U+Pgpijs4Yo3wDSpDiIbzK4qvgGs7um3dvYYw2kj/ICnUt4n7hxiJDqLikvn
        GS6c4WM4PtXczPySNOSo2Mg==
X-Received: by 2002:a05:6402:5186:b0:419:49af:428f with SMTP id q6-20020a056402518600b0041949af428fmr20631305edd.177.1648809419107;
        Fri, 01 Apr 2022 03:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxndwBzVCU2HTcw/aQHcmAbjH/RynQzZjHO1UpIM8kf7f5Ef5mcVaM9g99qrEIk6xTTmzYoA==
X-Received: by 2002:a05:6402:5186:b0:419:49af:428f with SMTP id q6-20020a056402518600b0041949af428fmr20631285edd.177.1648809418769;
        Fri, 01 Apr 2022 03:36:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id u25-20020a170906b11900b006e08588afedsm865347ejy.132.2022.04.01.03.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 03:36:58 -0700 (PDT)
Message-ID: <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
Date:   Fri, 1 Apr 2022 12:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        thomas.petazzoni@bootlin.com, linus.walleij@linaro.org
References: <20220331025203.GA53907@sol> <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220331141524.GA93836@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

On 3/31/22 16:15, Kent Gibson wrote:
> On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
>> On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
>>> Hi all,
>>
>> +Cc: Hans
>>
>>> It has recently come to my attention that the setting of bias by the
>>> cdev uAPI is a best effort operation that quietly succeeds if bias is
>>> not supported by the hardware. That strikes me as being a bug.
>>> It seems I was aware of this when adding bias to the uAPI and intended
>>> to fix it, as shown in the comments of v4 of the corrsponding patch
>>> series[1]:
>>
>>>>> The setting of bias is performed by gpio_set_bias, which is hooked into
>>>>> gpiod_direction_input and gpiod_direction_output.  It extends the setting
>>>>> of bias that was already present in gpiod_direction_input.
>>>>> In keeping with the existing behaviour, the bias is set on a best-effort
>>>>> basis - no error is returned to the user if an error is returned by the
>>>>> pinctrl driver.  Returning an error makes sense to me, particularly for
>>>>> the uAPI, but that conflicts with the existing gpiod_direction_input
>>>>> behaviour. So leave as best-effort, change gpiod_direction_input
>>>>> behaviour, or restructure to support both behaviours?
>>>
>>>> Thomas: is there any reason not to check the return value of these
>>>> calls for errors other than -EOPNOTSUPP?
>>>
>>> that being my comment, and Bart's followup question to Thomas.
>>>
>>> That went unanswered AFAICT and the issue subsequently fell through the
>>> cracks.
>>
>> My understanding that all constraints we have in kernel is due to
>> in-kernel use and possible (non-critical) issues.
>>
>> For example, driver can set only selected values of bias. What to do when
>> the given value is not supported by hardware?
>>
>> Followup question: Why do you think your choice is any better than another
>> one?
>>
> 
> I'm probably missing your point here.
> 
> What makes gpiolib best placed to decide that bias not being supported
> by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> caller and let them decide?
> 
> Is it because setting bias is piggy-backed onto
> gpiod_direction_input() rather than being separate, so then you can't
> tell whether it is input or bias that is not supported?

Right, gpiod_direction_input() check if there is a bias described for
the pin in the firmware description of the pin (devicetree or ACPI) and
those might contain a bias setting even if the pinctrl/gpio chip is not
capable of it (and instead it is actually e.g. applied by external
resistors on the PCB).

The idea behind this is to make things just work for most
drivers using/consuming GPIOS without the drivers needing to know
about the firmware description details.

To make sure this actually just works and does not cause drivers
to see unexpected (and usually not a problem) errors the ENOTSUPP
error from the set bias call is not propagated from
gpiod_direction_input().


> Anyway, if that interface is required for internal use then there is no
> option but to refactor gpiod_direction_input() and provide an alternate
> interface so that cdev can determine if bias is supported or not.

I'm not very familiar with the cdev userspace API, but I think
that that is correct.

Assuming the cdev userspace API has separate set-direction and set-bias
calls then I would expect the set-direction calls to work as the in
kernel one does, so try to apply any bias from the firmware pin
description, but ignore ENOTSUPP errors.

Although I guess in most (all probably even?) cases since we just
get a GPIO-chip + hw-index there is no firmware pin-description in
the cdev uapi case.

Where as explicit set_bias calls should indeed probably not ignore
the ENOTSUPP error.

I do wonder though if such a change would not consider
breakage of existing userspace, esp. on popular boards like
the raspberry pi where there is a lot of existing code
poking the GPIOs from userspace.

As long as you don't actually change the function prototype
of gpiod_direction_input() making changes for this should be
fine. You can rename the original function to something else
and give it an extra flag, or split it in 2 functions or some
such + use a wrapper with the old name. But having to modify
all callers for this would be bad IMHO.

Regards,

Hans







> 
> Cheers,
> Kent.
> 
>>> I would like to fix the uAPI such that if the hardware does not support
>>> the requested configuration, or if it can't be emulated in the kernel,
>>> that fact is returned to userspace - bias being the sole counter example
>>> as far as I am aware.
>>>
>>> The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
>>> rather than gpio_set_config_with_argument_optional(), but as mentioned in
>>> my comment above, that would impact any existing users of
>>> gpiod_direction_input() that assume the best-effort behaviour.
>>
>> Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
>> the best form the hardware driver.
>>
>>> I haven't been able to find any such usage, but that could just be proof
>>> that I'm not looking in the right place.
>>> Any input on that front would be greatly appreciated.
>>>
>>> Also, fixing this as mentioned could be considered an uAPI ABI change.
>>> Is this a bug, so that is ok, or do I need to consider adding a strict
>>> mode flag or somesuch to the API?
>>>
>>> Bart, I'm also hoping to extend the gpiosim to optionally not support
>>> bias in gc->set_config() to test this case.
>>> Any suggstions on a configfs interface extension to do that?
>>>
>>> My apologies for the verbage rather than proffering a patch, but the
>>> different paths have vastly different costs, and the simplest solution
>>> has the potential to introduce breakage.
>>
>>> [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>
> 

