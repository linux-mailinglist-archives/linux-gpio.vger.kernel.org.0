Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35C4419183
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 11:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbhI0J2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 05:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37644 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233693AbhI0J2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Sep 2021 05:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632734825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YlrOZk8y1zMynRshDEkgt0MkHN8FV305szIAzfFZEqo=;
        b=UUBemqZaOg2O7U7l59+K+iNE7TfbbkP/soTL+d+2nZguu8ggy+9zuDEF+GKQH0nnM+yPz1
        IHQaNEeHety6uH4nDH8FcH+p+Z24IzsTlU/rPw63yxIVipU/lt9xIw+G5zY0vv4YOKxDhX
        tk9sT8+zEAzhquvedJEuGlmb7FkIFVk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-FpdUN4pjO9iyWHlvyGWy2g-1; Mon, 27 Sep 2021 05:27:03 -0400
X-MC-Unique: FpdUN4pjO9iyWHlvyGWy2g-1
Received: by mail-ed1-f69.google.com with SMTP id a7-20020a509e87000000b003da71d1b065so3104239edf.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 02:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YlrOZk8y1zMynRshDEkgt0MkHN8FV305szIAzfFZEqo=;
        b=02Y3WySSh8oBcXn/YJDmP721tlUAqrU2n8dpradLmavIxwo+cZ05pzpxXiasnQ8GxD
         UChMmO9Il3jDiRZo282y1N+JSnwJxypAwM9nO14yZ5cDW8TER1mp39JQrfNXa4hHCFyB
         adrQUTqiw4OiynsSzmt+mVIUpRXzICyGaOzNG8Z3ypMHrNiBWA+wAhtE+Gy0P+1cHSAV
         qJhKG+ehP+HIRbulZ8Inc1l9gqj78tcrtfTUQfYahK3D5jpSvkb3rBwrjRiBVA34HZJ4
         fShs0vDwgpk8rMi40lpGmqqjNvWi9goOJejS4HO92y05EnfCbwpH42s03n/N30+tOl0T
         wWhA==
X-Gm-Message-State: AOAM531zMDeq07vclbLakP7VC9XzJBjE4GSwnhuMdVwZwsvQ2yD21Yw0
        wH6AejGhl0aeUfCEUJFlVLfe/U+aHJwZ29NjiB4l0bKH86r8A68J8vsQrBIoH3gewVTguvtREDf
        ihAWCQqPnMfVXWnKUT6zpmQ==
X-Received: by 2002:aa7:d897:: with SMTP id u23mr9598237edq.116.1632734822660;
        Mon, 27 Sep 2021 02:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyis0N+S682n3VVmDEAxIHbM5PwlX3ZpUurHpwkBC8rmtwF8BfwJ166SIUT9RCYOIHBlJjg+g==
X-Received: by 2002:aa7:d897:: with SMTP id u23mr9598226edq.116.1632734822508;
        Mon, 27 Sep 2021 02:27:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w11sm10472960edl.12.2021.09.27.02.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 02:27:02 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sven Peter <sven@svenpeter.dev>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
 <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
 <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
 <79b0a69f-bb30-4f7d-afbd-8d635870f6b3@www.fastmail.com>
 <CAHp75Vc+uA-G2+aT_U10BDo8krhahYgTSWdxQt8iffn9angL_w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7f8e0480-c6af-8a09-86d6-6234429ffa68@redhat.com>
Date:   Mon, 27 Sep 2021 11:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc+uA-G2+aT_U10BDo8krhahYgTSWdxQt8iffn9angL_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/27/21 11:00 AM, Andy Shevchenko wrote:
> +Cc: Hans (just for a bit offtopic comment below)
> 
> On Mon, Sep 27, 2021 at 8:46 AM Sven Peter <sven@svenpeter.dev> wrote:
>> On Sun, Sep 26, 2021, at 18:28, Andy Shevchenko wrote:
>>> On Sun, Sep 26, 2021 at 5:36 PM Sven Peter <sven@svenpeter.dev> wrote:
>>>> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
>>>>> On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
>>>>>> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:
> 
> ...
> 
>>>> I'd prefer to have a single compatible and get the npins from some
>>>> property and I don't think that's necessarily over-generalizing.
>>>> AFAICT Apple has been using the exact same MMIO interface for years
>>>> and I'd expect them to continue using it in the future. The only thing
>>>> that seems to change is the number of pins available and their assignment.
>>>> If we just have a single compatible we can likely support the M1X/2 or
>>>> however Apple calls the next SoCs with just a simple DTB change without
>>>> touching any driver code.
>>>
>>> Hmm... Dunno the details, but at least AOP GPIO is definitely ca[able
>>> of waking a system from a deep sleep (that's what SUS == suspend do on
>>> Intel). Haven't checked if you implemented ->irq_set_wake() callbacks,
>>> though.
>>
>> I don't think Joey implemented the set_wake callback because we didn't
>> even consider that the AOP GPIOs might be able to wake the system from
>> deep sleep. I'll see if I can figure out some details about that though.
> 
> I have checked Intel drivers and above mentioned do not implement
> ->irq_set_wake() callback. Hmm... Maybe Hans can share his thoughts
> why it's so
> (note, the Skylake and newest are all based on pinctrl-intel.c which
> implements it. So does Merrifield) and if we also need to consider
> adding it.

Bay Trail and Cherry Trail always use suspend2idle, which means any
IRQ is a wake IRQ, since the CPU is in a S0ix (deep-idle, rather
then full suspended) state.

Drivers still need to make irq_set_irq_wake() calls
though, to avoid the IRQ code disabling the IRQ on suspend.

To allow those calls to succeed the baytrail and cherryview
pinctrl drivers set IRQCHIP_SKIP_SET_WAKE in their irqchip.flags.

There are also some more standard (non tablet targetting)
CPUs which are using the same GPIO IP block, e.g.
the Celeron N2840 uses the pinctrl-baytrail.c code but
laptops using this will typically use normal S3 suspend.

I assume that in this case configuring which IRQs are wakeup
sources is actually controlled the BIOS, since S3 suspend is
heavily BIOS assisted. I would not even be surprised if the
BIOS even completely reprograms all IRQ settings (including
IRQs left enabled) on suspend.

Regards,

Hans

