Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C222281C37
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 21:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgJBTpB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 15:45:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34010 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725991AbgJBTpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 15:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601667899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jgMa0/la5acn2bgv6JrmNlXcDw7ZYgonZFi8exdF+5s=;
        b=igcLUva2UpFaC5qUksJ6zrp3GuFiYk0K8Yw/m2fn0rcFnSoDOZMAAuCm1KK3qOKz9j6IHd
        CHr0pchQbuiCHA+MatIgthQgrPS5JBNexcQKNzT51vghJHOET6Pln5uvQga2RcfMj/oq7Q
        KpLKISxEgxrW4RAuG5Wud33lIElKxgw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-aqDpPGbqOEq2tNsrHXIWmQ-1; Fri, 02 Oct 2020 15:44:58 -0400
X-MC-Unique: aqDpPGbqOEq2tNsrHXIWmQ-1
Received: by mail-ej1-f69.google.com with SMTP id k23so1023457ejx.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 12:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jgMa0/la5acn2bgv6JrmNlXcDw7ZYgonZFi8exdF+5s=;
        b=PdTY2xFFdsmplMc0XYVQ/rOPTqTxFW0/wthCiWhH2MAA2xYrg1ql8ZV6y9hcW5HFRH
         oF3cO0mUJIt+G1u3wTVKYBrioi9HsC6NIa8OOr8uiDo7npo0c5ia2lZYrsdJg/LO1Zvl
         E40WcfcMAaIUofoaGVqrh0p/PoJwAe1nGDLurr2yz4AN3RGlhZYPFOe5kNZpq3Ekbx0q
         4QBZzJNjAMzRkeUMut3FMfHohTJ83vWtgkywUrp1wyCRziSrGbrcGX4cDm1UvzII+ysi
         Oh6KqN0HNtAQZE0alvpWtZ+UNE1LbcMtbc7duLCMXqP5lFc/X2Cv/H4nOP02RUdNImf0
         fIUQ==
X-Gm-Message-State: AOAM531c2YeGsg83YR3xJv+BQrV3m/FPzyL3+4xHQGGMap776sFNCYXC
        zLhcq9Wdsm9Lid/UNJJas9Lk9fWOFdvpt0bu30TipJAWIj6hKfGnZYezBcqUVNGech0K+663tdV
        RnKEpePQX4wdAhspT+LbmLw==
X-Received: by 2002:a17:906:edc4:: with SMTP id sb4mr3792258ejb.144.1601667896609;
        Fri, 02 Oct 2020 12:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3ULDQuLHZRT7PJRaf61qpeFeNYqfn7LcmWcfwC+3dwuZARh6VNIbmSTUW+1EGrFVv5B6ODw==
X-Received: by 2002:a17:906:edc4:: with SMTP id sb4mr3792251ejb.144.1601667896456;
        Fri, 02 Oct 2020 12:44:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j18sm829161ejc.111.2020.10.02.12.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 12:44:55 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
Date:   Fri, 2 Oct 2020 21:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002145133.a43ypm2z7ofgtt7u@Rk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/2/20 4:51 PM, Coiby Xu wrote:
> On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:

<snip>

>>>> So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>> the GPIO controllers parent irq ?
>>>>
>>>> Also to these 7 interrupts/sec stop happening when you do not touch the
>>>> touchpad ?
>>>>
>>> I see these 7 interrupts / second for the GPIO controller's parent irq.
>>> And they stop happening when I don't touch the touchpad.
>>
>> Only from the parent irq, or also on the touchpad irq itself ?
>>
>> If this only happens on the parent irq, then I would start looking at the
>> amd-pinctrl code which determines which of its "child" irqs to fire.
> 
> This only happens on the parent irq. The input's pin#130 of the GIPO
> chip is low most of the time and pin#130.

Right, but it is a low-level triggered IRQ, so when it is low it should
be executing the i2c-hid interrupt-handler. If it is not executing that
then it is time to look at amd-pinctrl's irq-handler and figure out why
that is not triggering the child irq handler for the touchpad.

Regards,

Hans

