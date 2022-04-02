Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727E74F0004
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 11:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244053AbiDBJNd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Apr 2022 05:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbiDBJNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Apr 2022 05:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D871C31374
        for <linux-gpio@vger.kernel.org>; Sat,  2 Apr 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648890697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hdYYYw2Bwu1tlZ9upbRt1lVqbBiz/tTX6P5x7gBMpWQ=;
        b=WfMcN35w/Zru/kdAQpU671ZMEDmPi0CICzVj2FVaH2Esh6zKJCB+rsj0uTzPqzyKDDokfW
        5kurk6Apk1eHuJCMTWjW5I/psvJa/c59T/LdOpM4rh7wwzl6pS7AUhNuYI1ZdbWsmaMXeb
        w7ILTPSMmq1RSegqnSTG33/3Pe+8JbY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636--nzufWuZMZacQg3tGM-dIQ-1; Sat, 02 Apr 2022 05:11:35 -0400
X-MC-Unique: -nzufWuZMZacQg3tGM-dIQ-1
Received: by mail-ej1-f69.google.com with SMTP id gn11-20020a1709070d0b00b006e6e59438f8so214943ejc.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 Apr 2022 02:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hdYYYw2Bwu1tlZ9upbRt1lVqbBiz/tTX6P5x7gBMpWQ=;
        b=gDtdxWfJBOuByOvYsUeHRf90cysPFibHqLZqHlbH4pAg17//MfP6w2OP383B8VXxBF
         +eBxb3tV+GY/1vW/NjuURKrjIJorwjPaCmvTsUSKX/axfD2JXDLilixw9gw60Ruied3R
         CATHO7NQ8+yelacEShSlyj9XnkoDosVZggT3SaKTug0F90pldbuEb7m6ZRWNnX1XjZpn
         2d5JToCE8A399S/vNuWg96Z0vgy9qRtYI3MtG4TtwlQqsxblhblAiVVakAY1/ZIiDSq9
         LIBhi5OWr2WzMWTg7Y5ktkF/MnEEhUBaSucaZ4MLo4vqMJc0tY22N+Hfhd74IvK5ofwA
         C3Aw==
X-Gm-Message-State: AOAM533vMT1oPqbUE/6hb0G9RhUaXOJ+nWDfnYEUSgSTo7XTcWgLlqHY
        Sw7PSmp1JyaZR1FlU6C6QKwwFC3RK3qS68s9iBiTBHtekc9ohYRl1nidVRMyzeJrOfiiniyeswe
        F4rni2Btj24iE++TXBuXdnQ==
X-Received: by 2002:a50:9f64:0:b0:410:801c:4e2f with SMTP id b91-20020a509f64000000b00410801c4e2fmr24251355edf.179.1648890694008;
        Sat, 02 Apr 2022 02:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa1+qSoqVTsU6yGwkBllkrc+DliBYdxIM3SN+mqODcuGAzBGk/8IRHLejoEZ6DF8H4uXJBJA==
X-Received: by 2002:a50:9f64:0:b0:410:801c:4e2f with SMTP id b91-20020a509f64000000b00410801c4e2fmr24251342edf.179.1648890693652;
        Sat, 02 Apr 2022 02:11:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906380a00b006a68610908asm1895616ejc.24.2022.04.02.02.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 02:11:33 -0700 (PDT)
Message-ID: <90f7d9eb-935b-3803-1531-65bd20418bc3@redhat.com>
Date:   Sat, 2 Apr 2022 11:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        thomas.petazzoni@bootlin.com, linus.walleij@linaro.org
References: <20220331025203.GA53907@sol> <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com> <20220402014510.GA7939@sol>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220402014510.GA7939@sol>
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

Hi,

On 4/2/22 03:45, Kent Gibson wrote:
> On Fri, Apr 01, 2022 at 12:36:57PM +0200, Hans de Goede wrote:
>> Hi Kent,
>>
>> On 3/31/22 16:15, Kent Gibson wrote:
>>> On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
>>>> On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
>>>>> Hi all,
>>>>
>>>> +Cc: Hans
>>>>
>>>>> It has recently come to my attention that the setting of bias by the
>>>>> cdev uAPI is a best effort operation that quietly succeeds if bias is
>>>>> not supported by the hardware. That strikes me as being a bug.
>>>>> It seems I was aware of this when adding bias to the uAPI and intended
>>>>> to fix it, as shown in the comments of v4 of the corrsponding patch
>>>>> series[1]:
>>>>
>>>>>>> The setting of bias is performed by gpio_set_bias, which is hooked into
>>>>>>> gpiod_direction_input and gpiod_direction_output.  It extends the setting
>>>>>>> of bias that was already present in gpiod_direction_input.
>>>>>>> In keeping with the existing behaviour, the bias is set on a best-effort
>>>>>>> basis - no error is returned to the user if an error is returned by the
>>>>>>> pinctrl driver.  Returning an error makes sense to me, particularly for
>>>>>>> the uAPI, but that conflicts with the existing gpiod_direction_input
>>>>>>> behaviour. So leave as best-effort, change gpiod_direction_input
>>>>>>> behaviour, or restructure to support both behaviours?
>>>>>
>>>>>> Thomas: is there any reason not to check the return value of these
>>>>>> calls for errors other than -EOPNOTSUPP?
>>>>>
>>>>> that being my comment, and Bart's followup question to Thomas.
>>>>>
>>>>> That went unanswered AFAICT and the issue subsequently fell through the
>>>>> cracks.
>>>>
>>>> My understanding that all constraints we have in kernel is due to
>>>> in-kernel use and possible (non-critical) issues.
>>>>
>>>> For example, driver can set only selected values of bias. What to do when
>>>> the given value is not supported by hardware?
>>>>
>>>> Followup question: Why do you think your choice is any better than another
>>>> one?
>>>>
>>>
>>> I'm probably missing your point here.
>>>
>>> What makes gpiolib best placed to decide that bias not being supported
>>> by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
>>> caller and let them decide?
>>>
>>> Is it because setting bias is piggy-backed onto
>>> gpiod_direction_input() rather than being separate, so then you can't
>>> tell whether it is input or bias that is not supported?
>>
>> Right, gpiod_direction_input() check if there is a bias described for
>> the pin in the firmware description of the pin (devicetree or ACPI) and
>> those might contain a bias setting even if the pinctrl/gpio chip is not
>> capable of it (and instead it is actually e.g. applied by external
>> resistors on the PCB).
>>
> 
> So the pin description may extend beyond the gpio chip itself, and
> describe part of the external circuit?

It is not necessary / really supposed to, but copy and paste from
previous platforms may lead to this. Also something like the
active low/high bit of the pin description may take the presence
of an external (inverting) buffer/level-convertor into account.

So yes it is somewhat tied to the external circuit too. Because
it e.g. also tells the kernel if the pin should be driven
electrically low/high to make it logically high which may
depend on external circuitry.

> Ok, hadn't considered that a possibility.
> 
>> The idea behind this is to make things just work for most
>> drivers using/consuming GPIOS without the drivers needing to know
>> about the firmware description details.
>>
>> To make sure this actually just works and does not cause drivers
>> to see unexpected (and usually not a problem) errors the ENOTSUPP
>> error from the set bias call is not propagated from
>> gpiod_direction_input().
>>
> 
> Ok, just to make sure I have this straight:
> 
> The drivers get their pin description from devicetree or ACPI and
> then apply it using gpiod_direction_input() or gpiod_direction_output(),
> as appropriate.

Yes, but note that it is not the drivers which interpret the firmware
data, this is all done in the core code. A driver basically says
give me my <label> (e.g. "reset") pin and initially configure it
as output with a logical low value. Many drivers never call
gpiod_direction_input() or gpiod_direction_output() they pass the
direction they want initially (+ value when direction is output)
when calling gpiod_get() and then never have to change the direction.

> The gpiod_direction_input() was leveraged to do that, rather than having
> to extend the gpiolib API and change all the drivers, as drivers were
> already using it.

Right, except that this mostly relies on gpiod_get() calling
gpiod_direction_input() when called with the GPIOD_IN flag for
setting the initial direction.

> The application of the pin description, specifically the bias aspect,
> is best-effort as the pin description may not match the capabilities of
> the hardware, or more precisely the pinctrl.  The driver is acting as
> the middleman between the source of the pin description and
> gpiolib/pinctrl, and so wouldn't know how to deal with any inconsistency,
> so gpiod_direction_input() suppresses the error.

Right that pretty much sums it up.

>>> Anyway, if that interface is required for internal use then there is no
>>> option but to refactor gpiod_direction_input() and provide an alternate
>>> interface so that cdev can determine if bias is supported or not.
>>
>> I'm not very familiar with the cdev userspace API, but I think
>> that that is correct.
>>
>> Assuming the cdev userspace API has separate set-direction and set-bias
>> calls then I would expect the set-direction calls to work as the in
>> kernel one does, so try to apply any bias from the firmware pin
>> description, but ignore ENOTSUPP errors.
>>
>> Although I guess in most (all probably even?) cases since we just
>> get a GPIO-chip + hw-index there is no firmware pin-description in
>> the cdev uapi case.
>>
>> Where as explicit set_bias calls should indeed probably not ignore
>> the ENOTSUPP error.
>>
> 
> In fact the uAPI doesn't have separate calls.  The user effectively
> creates their own pin description and that is applied with a single
> ioctl call - which results in a call to gpiod_direction_input().
> 
> The current problem is that users can request bias and then be surprised
> to find that it doesn't work on their platform - despite the uAPI
> accepting the bias setting without complaint.
> 
>> I do wonder though if such a change would not consider
>> breakage of existing userspace, esp. on popular boards like
>> the raspberry pi where there is a lot of existing code
>> poking the GPIOs from userspace.
>>
> 
> I've wondered the same.
> It would only be breakage for cases where platforms don't actually
> support bias, but users were assuming that it does.
> The RPi supports bias (when adding bias to the uAPI I explicitly did
> testing on RPis), so it wouldn't be a problem there.
> OTOH, I can't say how many other platforms it could cause breakage on.

Actually with all the Pi clones, I think that the silent ignore
bias not support behavior makes some sense for the uAPI too,
some of the clones might not support this, while users will
have a tendency to just re-use some python libs to support
peripherals without modifying them.

OTOH getting a bias not supported error might help them
figure out that the pi compatible hat which they are using on
their Pi clone is only going to work if they add some
external pull-ups / -downs...

> Probably best to extend the uAPI to add a strict mode and leave
> existing usage unchanged.

Agreed, adding a strict mode to the uAPI seems best.

And if you do it this way, you should probably also make
the kernel log (using a ratelimited log function) why (e.g.
bias setting not supported)  the call is failing since errno is
not going to tell the user enough here I think.

>> As long as you don't actually change the function prototype
>> of gpiod_direction_input() making changes for this should be
>> fine. You can rename the original function to something else
>> and give it an extra flag, or split it in 2 functions or some
>> such + use a wrapper with the old name. But having to modify
>> all callers for this would be bad IMHO.
>>
> 
> Agreed - refactoring and providing a wrapper for existing usage looks
> the way to go.  I was hoping to avoid that, to avoid having to find a
> name for that new function, as naming is always the hardest part.

Well you need to come up with a name for the uAPI, if you are
going with strict there, you could add a _strict to the
non-wrapped function and give it a strict boolean argument?

Not sure if using strict is good for the uAPI though, what
I'm trying to say if that if you solve the naming issue for
the uAPI you can then mirror that name on the kernel side.

Regards,

Hans



>>>>> I would like to fix the uAPI such that if the hardware does not support
>>>>> the requested configuration, or if it can't be emulated in the kernel,
>>>>> that fact is returned to userspace - bias being the sole counter example
>>>>> as far as I am aware.
>>>>>
>>>>> The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
>>>>> rather than gpio_set_config_with_argument_optional(), but as mentioned in
>>>>> my comment above, that would impact any existing users of
>>>>> gpiod_direction_input() that assume the best-effort behaviour.
>>>>
>>>> Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
>>>> the best form the hardware driver.
>>>>
>>>>> I haven't been able to find any such usage, but that could just be proof
>>>>> that I'm not looking in the right place.
>>>>> Any input on that front would be greatly appreciated.
>>>>>
>>>>> Also, fixing this as mentioned could be considered an uAPI ABI change.
>>>>> Is this a bug, so that is ok, or do I need to consider adding a strict
>>>>> mode flag or somesuch to the API?
>>>>>
>>>>> Bart, I'm also hoping to extend the gpiosim to optionally not support
>>>>> bias in gc->set_config() to test this case.
>>>>> Any suggstions on a configfs interface extension to do that?
>>>>>
>>>>> My apologies for the verbage rather than proffering a patch, but the
>>>>> different paths have vastly different costs, and the simplest solution
>>>>> has the potential to introduce breakage.
>>>>
>>>>> [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
>>>>
>>>> -- 
>>>> With Best Regards,
>>>> Andy Shevchenko
>>>>
>>>>
>>>
>>
> 

