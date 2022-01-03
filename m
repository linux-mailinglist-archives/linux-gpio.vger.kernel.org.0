Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACAF48348E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 17:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiACQGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 11:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21526 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231648AbiACQGz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 11:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641226013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ftvSdEE1vQYQNtDIjX8enMqUlrXXR+e8zbSbx6jdbHw=;
        b=c6skVOfv8pnOih8WwxwUfTvxxVhaUd+++lP81H1PvvTP34iiI8wSRg3lxkIZ3vXUwy1v74
        CERjT5ZomYiDLd9XWpN4ydykQE4yn1i03XRVcX/2W/4dXXHqfXMmuA4KTBbUDpT4+yD6Bo
        LXu0pA3QIbAl+2vkK5GDC1YjGx8Ec20=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-lyr87FJlN3u4JUv4PWx3SA-1; Mon, 03 Jan 2022 11:06:51 -0500
X-MC-Unique: lyr87FJlN3u4JUv4PWx3SA-1
Received: by mail-ed1-f72.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so23218564edd.11
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 08:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ftvSdEE1vQYQNtDIjX8enMqUlrXXR+e8zbSbx6jdbHw=;
        b=si4gNm/odToRB6R/02oeJaU8rootkeWHxU854kKRCP5nAZw6dzHGAxK59vehXmp9dD
         nQNyyNNuEsGzrbQIQCOvGZgIQn2xOvjnlNMwH+WRko8BaLz1zDfImp+AqiHd83wflIQq
         PPLfz0nMqAFL4yC7biqGjAFixHBSDcKphg4V6EjUApY7fUMskQcRZkubEpB3pOD9IqXZ
         yKYLWvSsnM1L0KquLhl/Rc/ODVO3LtgcMrrcj/7a3A9l8E/97Qz5XPUgB8RfO1UeVUwX
         GYfTWYq4NqmxvmjCiuO9ffXmp57MfYvL0PzY3wOZT7NXvhIyukZu6/gEywis5hvysFxO
         NV4w==
X-Gm-Message-State: AOAM530wWWqiJ4k9Gc03MNRd7grWPdlskTsv8bf0bXGN9wtPtR7A3VR7
        E5Yt3ac2i9uPk502Sb0+Hif9RlhyqeA6Msn1N04BUqIB7b2SFVUZxS2KRSy0kUI7xO9HSeSJ+wa
        kuOK2fiyF019s1fR8Gd+Q7g==
X-Received: by 2002:a17:907:7d86:: with SMTP id oz6mr35117858ejc.312.1641226010419;
        Mon, 03 Jan 2022 08:06:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL+sLi0R/kzh83giaP1ERlHIWcHAFDjEF3wBaQHMlZ9rTUpxehoqUGaBM4wcqCdqzeGp2+Yw==
X-Received: by 2002:a17:907:7d86:: with SMTP id oz6mr35117837ejc.312.1641226010130;
        Mon, 03 Jan 2022 08:06:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a18sm14014997eds.42.2022.01.03.08.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 08:06:49 -0800 (PST)
Message-ID: <65701305-e0b4-c3fa-aca3-ecbb2084038c@redhat.com>
Date:   Mon, 3 Jan 2022 17:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/3/22 13:34, Jarkko Nikula wrote:
> Hi
> 
> On 1/3/22 12:42, Hans de Goede wrote:
>> Hi Jarkko,
>>
>> On 1/3/22 10:42, Jarkko Nikula wrote:
>>> Hi
>>>
>>> We have a Braswell based preproduction HW. I noticed linux-next tag next-20211224 doesn't boot on it due to following error:
>>>
>>> [   34.674271] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> [   34.682476] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> [   34.690681] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>>> ...
>>>
>>> Linux v5.16-rc8 is ok. I found the following commit to be reason for the regression:
>>>
>>> bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
>>
>> Thank you for the timely headsup about this.
>>
>> I assume that you have tried a revert (if necessary including reverting some
>> of the follow ups) and that reverting the patch you point to fixes the
>> issue, right ?
>>
> Yes since linux-next has only these three commits below to pinctrl-cherryview.c that are not in v5.16-rc8 I reverted them one by one. I often try these kind of simple steps before going to more labor git bisect :-)
> 
> db1b2a8caf5b pinctrl: cherryview: Use temporary variable for struct device
> 07199dbf8cae pinctrl: cherryview: Do not allow the same interrupt line to be used by 2 pins
> bdfbef2d29dc pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused
> 
> I also double checked by checking out to bdfbef2d29dc and tested that commit and it reverted.
> 
>> Can you try the 2 attached patches *one at a time* ? :
>>
>> 1. Restores the old behavior of just triggering hwirq 0 of
>> the pincontroller-domain when we don't know the mapping
>>
> Patch 1 does work and here's the output from modified error print:
> 
> [   13.550781] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
> 
> If you want to go with patch 1 you may add my
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
>> 2. Restores the old behavior which allows chv_gpio_irq_startup()
>> to overwrite the interrupt-line to pin mapping if the current
>> mapping points to pin 0
>>
> Patch 2 alone doesn't:
> 
> [   24.977116] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   24.985314] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   24.993513] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> ...

Ok, that is good news actually, I was already hoping that patch 1
would fix things.

>> Both of these restore old behavior caused by a mapping-table
>> entry containing 0 meaning both unset as well as HWIRQ0
>> before the patch in question.
>>
>> If applying them one at a time does not help, please also try with
>> both applied.
>>
>> These 2 patches should apply cleanly on top of linux-next.
>>
>> If patch 2 fixes things it would be interesting if you can grab a
>> dmesg with "pinctrl-cherryview.dyndbg" added to the command line
>> (with the patched kernel).
>>
> With both applied it does work:
> 
> # dmesg |grep cherryview-pinctrl
> [   15.465425] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
> [   16.562282] cherryview-pinctrl INT33FF:03: using interrupt line 0 for pin 81
> [   17.824905] cherryview-pinctrl INT33FF:02: using interrupt line 0 for pin 22
> [   17.835757] cherryview-pinctrl INT33FF:03: using interrupt line 2 for pin 77
> [   17.850170] cherryview-pinctrl INT33FF:00: using interrupt line 0 for pin 76

Oh, that is actually interesting, this is a per gpio controller thing, so if we
filter on the controller then we end up with:

> [   16.562282] cherryview-pinctrl INT33FF:03: using interrupt line 0 for pin 81

