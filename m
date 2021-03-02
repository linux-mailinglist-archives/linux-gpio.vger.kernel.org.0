Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55A532AD28
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382137AbhCBV0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446557AbhCBRaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 12:30:25 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C89C061222;
        Tue,  2 Mar 2021 08:53:59 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u16so2619486wrt.1;
        Tue, 02 Mar 2021 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kfPm/MmuHPyrXBT7pNFqsbQwaiDlFHhCn7fgYFeu560=;
        b=hctPdJW/dPVgJ1xsTxJMTvAmcnNlhUGPfqNozV8+fE1LtQNVt1cRtFpPCPEu+6jwNH
         K3jepAkAnz6keN5HcMJzFUdReqiJJhG+6/hqaoxsiGThlmB7/ofnfMZLBWvRuZts6Lda
         Gcx5L6W79retykYR6Fa7uGVGu9HqDkxGPwhRhnaZy0GR1bu82botLt5GEYGdjO3g09Gc
         ogRvtqFoUh/x6msYMc3pyCHc4lP5jC4tVSun7QhDh4cQM5s6xisILE+oseG2liqL4xlP
         /rO+apF6MH0+kGNILspQVlL/dOsIp6jBamTzOQrC5d1kQ6VchuL66eoEGVtURFYUwoT1
         dbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kfPm/MmuHPyrXBT7pNFqsbQwaiDlFHhCn7fgYFeu560=;
        b=hqV8XW7kVQhhMhBv2ENjyyST0p5RvOlb3jSZy0Dfz+BDZM3DTi4PrNpZMZ5eLcbjF5
         mRGe+/68pwzqcbrjL1Bp6ytlPfMXTXT7eJR/o/ddLhDprgzrfcpJEzKqvZNiurgjJ5K7
         /pyB/pgofzSm5v0kZST+XaAK0Im/UABsU8+Pe1z7IUwUFV0bRXCEGBeXMQwRnXRE7n1o
         OgbOix10Fl1vG+Zfk4wk6osY3uViV3PR/jpwUUgqYucvbp7NYsyF7I/+ltlSS6wyeyXn
         vtzWH8FO/p6KXegrZkAdCPFVuhXfBD226dnjRCKJXQUcPLC465gaApfn4vGKQl8jOZKh
         v5dw==
X-Gm-Message-State: AOAM530993iGVMUBwNZl9xs4nAtw9EuxaTyCWJOnNK3VJSlmDJGrwiYI
        jxWmsREgDXI+ozhlHH0jXBDo7PHlILhy0Q==
X-Google-Smtp-Source: ABdhPJxXElj6RcrAJn+xaBwYo7URkz5TdLX+KTvayClag0RjH5JFA0HXEoGf5v9LMODPagMEoQnqOg==
X-Received: by 2002:a5d:6810:: with SMTP id w16mr9328385wru.333.1614704037903;
        Tue, 02 Mar 2021 08:53:57 -0800 (PST)
Received: from [192.168.1.10] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id v6sm29753390wrx.32.2021.03.02.08.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 08:53:57 -0800 (PST)
Subject: Re: [PATCH 01/12] Documentation: add BCM6328 pincontroller binding
 documentation
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210225164216.21124-1-noltari@gmail.com>
 <20210225164216.21124-2-noltari@gmail.com>
 <CACRpkdbjhTfQ4EcjndgE_Y7_uCT2ohadTjj-rrQAFNm+c0whRg@mail.gmail.com>
 <CACRpkdaN3pYMDiPkk109SwOKF56Oxe14_bC5edftGGG0PL7VsA@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <418daebd-b35b-2edc-6f33-591bd97ba1f9@gmail.com>
Date:   Tue, 2 Mar 2021 17:53:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaN3pYMDiPkk109SwOKF56Oxe14_bC5edftGGG0PL7VsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

I think it's better if we leave the interrupts out for now.
It's not critical and it can be added later.

Best regards,
Álvaro.

El 02/03/2021 a las 16:23, Linus Walleij escribió:
> On Tue, Mar 2, 2021 at 3:57 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 25, 2021 at 5:42 PM Álvaro Fernández Rojas
>> <noltari@gmail.com> wrote:
>>
>>> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
>>>
>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> (...)
>>> +  interrupts-extended:
>>> +    description:
>>> +      One interrupt per each of the 4 GPIO ports supported by the controller,
>>> +      sorted by port number ascending order.
>>> +    minItems: 4
>>> +    maxItems: 4
>>
>> I don't know if this is advisable, there are different ways
>> of specifying interrupts so this may become ambiguous,
>> I think Rob will know how/if to do this though.
> 
> After reading the code I conclude this gpiochip is hierarchical so this should
> just be dropped, and we only need interrupt-parent assigned. The
> driver will know the hardware offsets between the interrupt parent
> and the GPIO block, this is generally the case for
> hierarchical interrupt controllers.
> 
> Yours,
> Linus Walleij
> 
