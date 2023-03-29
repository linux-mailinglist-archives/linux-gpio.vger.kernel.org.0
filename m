Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27666CD80D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 13:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjC2LDj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 07:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC2LDi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 07:03:38 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C413C1E
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:03:36 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D96263F231
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1680087814;
        bh=jEdWmu+GR4nRdFaIPW4U+q18BhOuvoOjZjznQ6ZNWqQ=;
        h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
         In-Reply-To:Content-Type;
        b=wc7g1aZI4c3PcAQ2Jw6SS3zS3dxraB1PxZAhT4tEviktcjhwbLHI9UCGxSQTnOui4
         orkKHjVdPosYn2w27/uBbHhwmiTRtHzrSae7Vsx5lJTnctoVyBygDoSW2/eMyxObD9
         hLOXmgct5r6bA3arj1L6YlD39LYZKfUYqj8frhw8QUpf669eFEFrsq3rTSSspGpwFU
         pMxppphI83IvbRwCoB1PYwyZDLe8PhqbmVBggtICQ9t4hGlPSN3qudtHmGW82C1W8Q
         yOfFTOcluzzUNVlw4+5p0yCMEifh9BRdL13i77Oemv28wdFbrtbD59g/YB51LrW1Na
         s6G/PmFdT9EAw==
Received: by mail-wm1-f72.google.com with SMTP id m27-20020a05600c3b1b00b003ee502f1b16so7658997wms.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087813;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEdWmu+GR4nRdFaIPW4U+q18BhOuvoOjZjznQ6ZNWqQ=;
        b=BOnkiT7aRjM4mZAKEyd8PvkyVVHobKlSfiynxZFWxYLUXP8mufwtuKr90kVIMYkTfV
         AK5SqhZU9iu8CvG6pm8fTKk52q2m0r9xtM8s34CxFzJ+K4IQ0W5bwV5mZl8Tm3/YqJQn
         D+E68puRtPTBeUBJ1sy4vGXt79DJE56zfGyn5ZjqMEUAvpzrKUDLLUIwfn6U//8uUtnL
         KHy6MvwmFUYGOcJy4J0+7hf4BceQU5QQ4dpj1fFrXCWjZI3E/cT2xe3dAOu/dIoPy9pL
         h8fjMzxlwJwiZbYcLpKTcKeXy2QOsjULriIdKIByKesXRHJFDJXaHV9lr5urwcmhh5ol
         HIvg==
X-Gm-Message-State: AAQBX9epa7YQqrIL5IPkbNeGed9q5bKPePrxaJzuf2vXoaZ3yNRhz3J9
        Cez5cJKsCf2lUzAc1RrECspirCMjDWNWT8AQWvT936BzzKX58xe+QhCcflTvyNBj4I+npN8xBJ4
        DC3Mtt6XjlDa3X5Nwm86PhC5VbW5tmCA9oCn6alfQEL5yX7puAQ==
X-Received: by 2002:a5d:484c:0:b0:2ce:aa63:6dad with SMTP id n12-20020a5d484c000000b002ceaa636dadmr14254419wrs.45.1680087813641;
        Wed, 29 Mar 2023 04:03:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVMCOyXIzsxnNkyZFbz+FOOvr9RopzqbGFmc0QYFJUvOHTnCZ75+4x4OghQfsLtxCN3FA8xA==
X-Received: by 2002:a5d:484c:0:b0:2ce:aa63:6dad with SMTP id n12-20020a5d484c000000b002ceaa636dadmr14254399wrs.45.1680087813225;
        Wed, 29 Mar 2023 04:03:33 -0700 (PDT)
Received: from [192.168.1.110] ([137.220.91.195])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b002cfec8b7f89sm30091703wrd.77.2023.03.29.04.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 04:03:32 -0700 (PDT)
Message-ID: <158fba21-8d5a-ac56-ae02-2694ea9ae388@canonical.com>
Date:   Wed, 29 Mar 2023 12:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To:     linux-gpio@vger.kernel.org
Cc:     brgl@bgdev.pl, Kent Gibson <warthog618@gmail.com>
References: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
 <20220714031036.GA74086@sol>
Content-Language: en-US
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Subject: Re: libgpiod API v2 release
In-Reply-To: <20220714031036.GA74086@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 14/07/2022 04:10, Kent Gibson wrote:
> On Tue, Jul 12, 2022 at 09:48:45AM +0200, Alexandre Ghiti wrote:
>> Hi,
>>
>> Ubuntu kernels do not enable GPIO_CDEV_V1 as it is deprecated, but the
>> libgpiod package that we ship is still based on the latest version
>> 1.6.3 which does not implement the API v2. So I'd like to update
>> libgpiod, do you have any recommendations about what branch/sha1 I
>> should use? Do you plan to make a release that implements the API v2?
>>
> 
> Firstly, libgpiod is Bart's library so he is the authority, but this
> is my understanding...
> 
> TLDR: You should keep GPIO_CDEV_V1 enabled.
> 
> v1 is deprecated from a development perspective, so all new feature
> development will occur on v2, and new applications should target v2.
> Existing apps targetting v1, be that directly or via libgpiod v1.6.3,
> will require GPIO_CDEV_V1 until they migrate to v2.
> The mainline kernel will continue to support v1 while userspace
> transitions.
> 
> libgpiod v2 is in active development, and should reach its first release
> shortly.
> Note that it is NOT a plugin replacement for v1. It has a different API,
> for similar reasons to why we had to switch in the kernel, so apps will
> need to be actively migrated.
> 
> I wouldn't suggest making any effort to package libgpiod v2 until Bart
> makes an official release.
> 
> Cheers,
> Kent.
> 

libgpiod v2 is out now at least upstream, even if it is not yet packaged in most distributions. But this brings newly identified loss of functionality that seems to be impossible to resolve so far.

With the v1 API, it was possible to do fine-grained access and mediation control via LSM. Specifically privileged process would export pins, and then use LSM controls to allow rw access to individual pin path in sysfs to otherwise unpriviledged or confined applications. This is used a lot on Ubuntu Core with snapd and apparmor, to mediate confined applications (such that only one application at time has access to a particular pin, and to ensure they only have access to pins they need).

It doesn't seem to be possible to do such mediation with v2 api, as I don't see any LSM hooks inside the gpiochip ioctl implementation, and the character device is for the full chip, not individual pins. Similarly, mediating ioctl calls requires a lot of gpio ioctl specific knowledge (i.e. introspecting gpio_v2_line_values masks and what not).

Thus right now, I cannot migrate to v2 api, as I would loose confinement capabilities. And there is external pressure to stop using "DEPRECATED" config option in the kernel that "will be removed after 2020" as per comments and Linux documentation.

What is the LSM plan for v2 API, if any?

Ideally, it would be nice to have lsm hook to check/filter operations on allowed pin numbers.

Or for example, can we add ability to create filtered char device that self-limits itself to particular lines only, within a particular chip? As then the usual LSM could mitigate access to that, without specific gpio ioctl knowledge / introspection. (e.g. /dev/gpio/my-gpio-pins that only allows access to gpiochip0 lines 0..100)

Regards,

Dimitri.
