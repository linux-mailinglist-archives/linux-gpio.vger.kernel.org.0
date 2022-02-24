Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022B04C31BD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 17:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiBXQnu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 11:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiBXQnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 11:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B9D814076B
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645720998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IjkZhGzKSvbLhlEUtM24hRkXnGsRdzxiWu7wlvpAAFc=;
        b=MfKW/98oO3ijLnYg/3dU3hXx021zmloJujgssXfNY0DeGpg5MWwgqkJEt/gkk+itlG5iL4
        /n2md6D3Yax5s9OvvHpZnhd0uJk3h0pCFkLt7ClKfXBNJAJpwgOvCWkcYmWbv6r/ka0HVx
        p6CHim67fZz2u8RuWljNqxPrNxEnoW0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-3-e83xdpO7aMFbW98nSrLQ-1; Thu, 24 Feb 2022 11:43:17 -0500
X-MC-Unique: 3-e83xdpO7aMFbW98nSrLQ-1
Received: by mail-ed1-f71.google.com with SMTP id l24-20020a056402231800b00410f19a3103so982283eda.5
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IjkZhGzKSvbLhlEUtM24hRkXnGsRdzxiWu7wlvpAAFc=;
        b=i62NB7f5Ew6tn/tJFcAsehSvAT0TaxDlSi+6kxFxAmJyIztKqjR83altX6O2A2t8rT
         gLIZdnqg3z+mmEOH0X2EGZ8BJLIJrKv3euclUCmXfyRX5ppxdhFCBrtRH4HrcUr2tlaS
         oEUDMju6eAj9cak9J5Q10k0DRKh46XR2blVIp8NW8/htltVKop4SY1Q+Nezlh2jkoY2C
         ohw80Q/Ubck/EerckrfGxcNHdAxOpkNSGp1ofUrMUXeNDfi8oidWUL/HGxSBv0ukKGuF
         zh2vIo4zRl+6/R0L9fNMz6CJw4Gzh3qKIVi00sFCglneo0afKCzX3r6fHcmOKLN/D7P1
         dJPA==
X-Gm-Message-State: AOAM533DwyLhHQgcZSWm8TF3gtB1FzBudvS70dyigX0sFw5z7qUMc1lz
        iLA7m8S3jtDCNhUZloMn/SatjXJo5MPBNRy0BcRpECe50143l4dcnMAZeUhwXGi4d9KeVusJVmE
        Ee5VicyAUL7KMsR2iW6bNvg==
X-Received: by 2002:a17:906:646:b0:6ce:a6fb:2854 with SMTP id t6-20020a170906064600b006cea6fb2854mr2855756ejb.675.1645720995998;
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdKBIqpxp81Whr2YWyGGKRxrr/oCgPvaWV3pnV7BAfebmTEUVfyQQUGHR8jgmPEk00PYll2Q==
X-Received: by 2002:a17:906:646:b0:6ce:a6fb:2854 with SMTP id t6-20020a170906064600b006cea6fb2854mr2855749ejb.675.1645720995815;
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y22sm1597246ejm.225.2022.02.24.08.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
Message-ID: <298ee896-9bc4-9030-c2dd-21b6d541acb7@redhat.com>
Date:   Thu, 24 Feb 2022 17:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/5] pinctrl/baytrail platform/x86: SUS6 mux / Lenovo Yoga
 Tablet 2 support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <YhZK0VPc2tg6upYg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZK0VPc2tg6upYg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2/23/22 15:55, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:48PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> This series consists of 2 parts:
>>
>> Patch 1   : pinctrl: baytrail: Add pinconf group + function for the pmu_clk
>> Patch 2-5 : platform/x86: x86-android-tablets: Add Lenovo Yoga Tab2 support
>>
>> Patch 5 has a runtime dependency on patch 1, but this is only  runtime and
>> there are some other patches in flight to other subsystems which are also
>> needed for the Lenovo Yoga Tab2 support.
>>
>> As such I believe that patch 1 can be merged independently through the
>> pinctrl-intel tree and then I'll merge patches 2-5 through the pdx86 tree.
>>
>> The only reason for sending this out as a series is because patch 5
>> uses the new pmu_clk pinconf added by patch 1.
> 
> You may route via PDx86 and provide an IB to me, thanks!

Ok, I've just created an immutable-branch + signed tag for this,
with your 2 small nitpicks fixed.

I'll send you a pull-req for this right away.

Regards,

Hans


> 
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (5):
>>   pinctrl: baytrail: Add pinconf group + function for the pmu_clk
>>   platform/x86: x86-android-tablets: Fix EBUSY error when requesting
>>     IOAPIC IRQs
>>   platform/x86: x86-android-tablets: Add Lenovo Yoga Tablet 2 830 / 1050
>>     data
>>   platform/x86: x86-android-tablets: Workaround Lenovo Yoga Tablet 2
>>     830/1050 poweroff hang
>>   platform/x86: x86-android-tablets: Lenovo Yoga Tablet 2 830/1050 sound
>>     support
>>
>>  drivers/pinctrl/intel/pinctrl-baytrail.c   |   9 +
>>  drivers/platform/x86/x86-android-tablets.c | 280 +++++++++++++++++++++
>>  2 files changed, 289 insertions(+)
>>
>> -- 
>> 2.35.1
>>
> 

