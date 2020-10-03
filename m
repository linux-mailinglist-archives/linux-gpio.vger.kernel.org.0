Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C309228244C
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 15:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgJCNWx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Oct 2020 09:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40626 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgJCNWw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Oct 2020 09:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601731370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T3Ex71Qk2HCNdVCQ44hohYZBNu63lw9VTn3OMjB5RaI=;
        b=IbucwGOU6vu1qxhX3Cd0dgNIj3MunlPI/D0WKkmv1OM9+JMPluMvcppqvEkYsSbVu0IX53
        HBII0EcS1SaeiEzOXufsA9Tt6ii/Oz2OaHrs8TS/b5BBvTT7ju3bAsl9laPEFk8knv3CBB
        zSoPWBfaRY6JcvfhkfCX1UEXLMrwib8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-roIyyvLyO_qMv_37n6XGHg-1; Sat, 03 Oct 2020 09:22:49 -0400
X-MC-Unique: roIyyvLyO_qMv_37n6XGHg-1
Received: by mail-ed1-f70.google.com with SMTP id x23so2257766eds.5
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2020 06:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T3Ex71Qk2HCNdVCQ44hohYZBNu63lw9VTn3OMjB5RaI=;
        b=U1UDHDEDGn4i9Lg+GoLjWiRYZnileHuJ6l3cdaYofU5Ptbeu2+6CiC3nXfxc7D8KES
         bv8Hw8+Zj9437F3ljOWbxSuWsjecsb94U+UTgprLnuHlZtb9Ill/5y44KImgorM4bHEE
         ckuyjDvbTIQDY/+r+n5ZvcTFQpV0SdLWB/c75iTBnhVpb99xZvHPajLTFNj0g2LmK0vJ
         3rUKEBMTKndCyRQzkFgPvwWNuzsC1+C6edLslFAVkTndJ5YsU2NawwE8tXM9eT+RhMjE
         3pGV3vG1+lkAe8nTmVL4tqMNfNEu4YhOJ1ZV3OAjBJz4chDk+8YnNmxsVx/5KBvWe9ws
         9swg==
X-Gm-Message-State: AOAM530QgMS7ewgwtelTX9Y147g3o8D3ohld6/RhDW3Y+WK81GxagZUr
        Ig5T7/MYJUARWD31rR3imQ/5Cmh0iz5+Fzz6RkbU9hMXhbbUpc3NgmISCObEDjAYYd2uIBN1TRl
        +CgEj3Y5E7NaJDDRJlK5bHQ==
X-Received: by 2002:a17:906:453:: with SMTP id e19mr6769684eja.391.1601731368017;
        Sat, 03 Oct 2020 06:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzzs+SnF3Q3lDtXMYbYCNurYPVrOc7TH9P7/VWpDPpXgZJC52X1HLfdrWRXDlyY4QF8WZrAA==
X-Received: by 2002:a17:906:453:: with SMTP id e19mr6769671eja.391.1601731367760;
        Sat, 03 Oct 2020 06:22:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q22sm4383550edi.41.2020.10.03.06.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 06:22:47 -0700 (PDT)
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
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
Date:   Sat, 3 Oct 2020 15:22:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002224502.vn3ooodrxrblwauu@Rk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/3/20 12:45 AM, Coiby Xu wrote:
> On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/2/20 4:51 PM, Coiby Xu wrote:
>>> On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>
>> <snip>
>>
>>>>>> So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>>>> the GPIO controllers parent irq ?
>>>>>>
>>>>>> Also to these 7 interrupts/sec stop happening when you do not touch the
>>>>>> touchpad ?
>>>>>>
>>>>> I see these 7 interrupts / second for the GPIO controller's parent irq.
>>>>> And they stop happening when I don't touch the touchpad.
>>>>
>>>> Only from the parent irq, or also on the touchpad irq itself ?
>>>>
>>>> If this only happens on the parent irq, then I would start looking at the
>>>> amd-pinctrl code which determines which of its "child" irqs to fire.
>>>
>>> This only happens on the parent irq. The input's pin#130 of the GIPO
>>> chip is low most of the time and pin#130.
>>
>> Right, but it is a low-level triggered IRQ, so when it is low it should
>> be executing the i2c-hid interrupt-handler. If it is not executing that
>> then it is time to look at amd-pinctrl's irq-handler and figure out why
>> that is not triggering the child irq handler for the touchpad.
>>
> I'm not sure if I have some incorrect understandings about GPIO
> interrupt controller because I don't quite follow your reasoning.
> What I actually suspect is there's something wrong with amd-pinctrl
> which makes the GPIO chip fail to assert its common interrupt output
> line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
> I learn about this low-level triggered IRQ is that the i2c-hid
> interrupt-handler will be woken up by amd-pinctrl's irq-handler which
> is executed when the parent IRQ#7 fires. The code path is as follows,
> 
>      <IRQ>
>      dump_stack+0x64/0x88
>      __irq_wake_thread.cold+0x9/0x12
>      __handle_irq_event_percpu+0x80/0x1c0
>      handle_irq_event+0x58/0xb0
>      handle_level_irq+0xb7/0x1a0
>      generic_handle_irq+0x4a/0x60
>      amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>      __handle_irq_event_percpu+0x45/0x1c0
>      handle_irq_event+0x58/0xb0
>      handle_fasteoi_irq+0xa2/0x210
>      do_IRQ+0x70/0x120
>      common_interrupt+0xf/0xf
>      </IRQ>
> 
> But the problem is somehow IRQ#7 doesn't even fire when the input's
> pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
> irq-handler wouldn't be executed in the first place, let alone
> triggering the child irq handler. Btw, amd-pinctrl's irq-handler
> simply iterate over all pins. If there is mapped irq found for this
> hwirq (yes, it won't even check if this pin triggers the interrupt),
> then it will call generic_handle_irq. So there's nothing wrong about
> this part of code.

Ok, so the i2c-hid irq does fire, but only 7 times a second just
like the GPIO controller's parent irq.

The only thing I can think of then is to add printk-s to check how
long the i2c-hid interrupt handler takes to complete. It could be
there is a subtle bug somewhere causing the i2c transfers to take
longer when run from a (threaded) irq handler. That would be weird
though, so I don't expect this to result in any useful findings.

Other then that I'm all out of ideas I'm afraid.

Regards,

Hans

