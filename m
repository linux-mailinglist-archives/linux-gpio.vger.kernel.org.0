Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1F0489C76
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jan 2022 16:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbiAJPot (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jan 2022 10:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236387AbiAJPot (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jan 2022 10:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641829488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7DFKjieAvLZ8maSKpttWdMq4/QMhPE7j+iUqYjYEFXk=;
        b=KOaX+cDtgWJtZcLyhrPq1gCOxpIK0blRiUGweri5A3vhS/wQKkeJTQdUUv4pTT2iThP9Yq
        dkKU6SqXDOguL2QLQ/d1gLEoLaaxzKVH0FLPdHp2BB7UpWhk3P5jRnCNXoxhrVfajmqf8N
        SeSo1vrdmrB9g118gKWh4uEyRtehHSQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-_jAkPDiHOxOXWsnw2AOKlg-1; Mon, 10 Jan 2022 10:44:47 -0500
X-MC-Unique: _jAkPDiHOxOXWsnw2AOKlg-1
Received: by mail-ed1-f69.google.com with SMTP id y10-20020a056402358a00b003f88b132849so10515801edc.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jan 2022 07:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7DFKjieAvLZ8maSKpttWdMq4/QMhPE7j+iUqYjYEFXk=;
        b=d7EYnyvQ5fyBDEtiq0r7IqetRhMfshFP3UTPGB5ONPx2Nqu0mbuFz757Vegu6IZQ61
         hDCs+3bSkdx6NM2bHzWOATDVLipj27SJxyAdiYlr6fIPvs4Oq1u77qXHUF7HP38Bkc5I
         /VqUvvtUo04FA2rqpQozRRet0Pj9TdYluoBkHVvnebi8BE/dc3Gz2YeRdSF1olzQ8Go3
         k4UF9asU6VrHU3zgK6XyhcKMcQs3Z1E37fa4fwI8vubOpyhFPRUSNnThfSX4YfQkfCgK
         d+YMxBO8Y7KXK/OUMgwM0HbGWjv1bCi0eE7KAJ7ENNDeTcEe1xfC6FETs+qSkASgnYhT
         ZVPg==
X-Gm-Message-State: AOAM531eSggzxwJAhUJDUmQb/E/41i0u7h3JD1BLOyuMOy1l33eBLRm/
        30yGtQADqLSzQKRVp+HWrKh5TWM8SGBEWmQ2yOF5BgSGDgcbIu8JkWjthEOGVrtiRR43KxCMEA8
        PwiPAY6EmPkZmBFNRAavPiw==
X-Received: by 2002:a05:6402:120e:: with SMTP id c14mr262207edw.40.1641829486283;
        Mon, 10 Jan 2022 07:44:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaZ+vuk2on5ud7gk/XYf0++YZyi8gqw93qXHu4rXf+DBQW3XmRVwxh94NH+zueaLA4yTHZdg==
X-Received: by 2002:a05:6402:120e:: with SMTP id c14mr262196edw.40.1641829486149;
        Mon, 10 Jan 2022 07:44:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lb11sm2564485ejc.216.2022.01.10.07.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 07:44:45 -0800 (PST)
Message-ID: <9c453f30-484d-9d5a-bfc1-a638158d7e81@redhat.com>
Date:   Mon, 10 Jan 2022 16:44:45 +0100
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
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
 <60adc8c5-3d58-b7bf-6c53-70599118b83f@redhat.com>
 <e3052473-0dba-49b3-c58c-c100742c978d@linux.intel.com>
 <d04b5312-a38f-e7a7-f6cf-35320daade39@redhat.com>
 <0c6900c2-656b-833f-5775-b76a852bc8eb@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0c6900c2-656b-833f-5775-b76a852bc8eb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/5/22 15:23, Jarkko Nikula wrote:
> On 1/4/22 16:47, Hans de Goede wrote:
>> Hi Jarkko,
>>
>> On 1/4/22 15:38, Jarkko Nikula wrote:
>>> That gave me an idea to look at is there anything suspicious in "top" or /proc/interrupts (no and no) but powertop shows CPU 0 is over 90 % in C0 state and max frequency.
>>>
>>> But comparing powertop on v5.16-rc8 it does look sometimes the same and sometimes CPU 0 is less in C0 (but still over 30 %). Hard to say is there difference but obviously v5.16-rc8 either is not good on this machine since CPU 0 and package seems to reach idle only 5 % or less.
>>
>> Hmm, does this happen to with the "hack" patch to initially mask interrupts
>> triggered by all the interrupt-lines of the GPIO-controller ?
>>
>> Ah upon reading your reply a second time I see you already checked
>> /proc/interrupts; and that you are also seeing this with 5.16-rc8.
>>
>> So the load is likely not caused by the pinctrl issue and there also
>> is some other issue I guess...
>>
>> For the high cpu-load issue it would be good to know if this is
>> also present on older kernels.
>>
> Sorry I mean cpu load is near idle according to top and no visible interrupt flood in /proc/interrupts but powertop shows CPU 0 is mostly in C0 or C1 state and doesn't idle or idles very near to 0 %. This is from v5.16-rc8.
> 
> I think on this machine only MMC card detect is using the pincontrol. At least pinctrl_cherryview module usage drops to zero and no users in /sys/kernel/debug/gpio after unbinding all devices from /sys/bus/platform/drivers/sdhci-acpi/.
> 
> MMC looks like to be well behaving since nothing changes after unbinding it and card detect is this one "INT33FF:03: using interrupt line 0 for pin 81".
> 
> However if I blacklist cherryview-pinctrl then CPU 0 and package will reach deeper C states. Perhaps misconfigured pin etc by the firmware?

Weird, I wonder what the root cause of this is...

> But since those issues were here before the regression and your fix makes the machine booting again this case is solved by it.

Ack.

Regards,

Hans

