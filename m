Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52DEF3E0F4F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 09:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhHEHfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 03:35:33 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:43900
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230471AbhHEHfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 03:35:30 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 73EA23F346
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628148915;
        bh=kMB7D3FwR8aaeZ7GkcRhY+XNtv5mwLtm+gleHTDDxFM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=EnE+j7w+mzM/GGxTNmzLNvQAECanfEaKQ/M2GY3cMxUPS6+PsGLvMarlG9Ay/6Vnm
         8z5Lb23Xp3+uH3vktxe40uNMmfasCFNH9hxoFbASd3YhHbOdV3PINLef0R+AiXquaB
         yTDaA41ZHdNgdRXKRTTEwVBLdLyteJSuQT7RbzyZGfk+Bz/thNXX6l+RNBEz0fIRnz
         9fnWx9TdoXCzBC4uJPjYVXAUW3BzPOAk1Bh+UJeDd627m2ML/LnSRpxQGSqz1LFAr1
         Vi+gjAISUpEml3WugPvJM8AxRgt4J1I6H09/xC5ke4GW/Wyws3530jkYGfYRwcbxnG
         Kv1QfetpD+3rA==
Received: by mail-ed1-f70.google.com with SMTP id dh21-20020a0564021d35b02903be0aa37025so447617edb.7
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 00:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kMB7D3FwR8aaeZ7GkcRhY+XNtv5mwLtm+gleHTDDxFM=;
        b=IkCMosdyxKfhfQ8VI/x3jn0EjMhxQt5mxN2Y43kakUOWHeiSyKHs9yDU/0yfGL58Hq
         vvaNc4fa37+KXntaaDGHrFxoNx9ccRcfBDD+o6QsQ+oRN2+3sykjEkbX394puIs36ea/
         q0ID7qN6HoE5mhMe5mKYKp6J6vmk/E6EXDAN+X4v7xcOleOezG8ffNseaOxIs0TAlJ/6
         Iy4wjaUuHbfl+PRdWhd3x18d3ihnQp5m0SKAAZnDI+lJzj8lrqB23cVuXPgpRXvh4Xw9
         wvV7Hd7hAE/kJYXAsCDDKBELYETy+7LFC42mgsw0Vetki8BxaDYnvMzPBxjvnrGRjxy2
         ATig==
X-Gm-Message-State: AOAM530DFUp1vQXgJDzISxo5hI4RrBZ159YHU10smXM8yIaNFQXGCm69
        IZ/N0SetdFUGyT7SDFcLZCf2mfojYQnXEr+AJriN+pr8TyiuqW5gv2Qn+gS6OGsiz70gqaZ/Zz2
        Rzjj3fYQ/ZvjgnFJhTsbnsqAGWliHLw20SL9sv8E=
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr3499011ejf.416.1628148915207;
        Thu, 05 Aug 2021 00:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPcQUWoeFo8Oc3RFUk7sBrXe1NGu+OxbWafCL6RAdlu//8RMlDAyb13M9QoYaDGHWGqoadKg==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr3499000ejf.416.1628148915094;
        Thu, 05 Aug 2021 00:35:15 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id r16sm1886421edt.15.2021.08.05.00.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:35:14 -0700 (PDT)
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
 <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
 <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
 <e264f96e-a230-456b-08a5-dbe3a31bdb43@canonical.com>
 <87zgtwbb6x.wl-maz@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f9b233bb-628f-1a0f-468c-8a6c7d2b23a4@canonical.com>
Date:   Thu, 5 Aug 2021 09:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zgtwbb6x.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/08/2021 09:30, Marc Zyngier wrote:
> On Thu, 05 Aug 2021 08:17:14 +0100,
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 04/08/2021 23:30, Sam Protsenko wrote:
>>>>>
>>>>> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
>>>>> that Virtual Interface Control Register starts at 0x3000 offset (from
>>>>> 0x12a00000), where it obviously should be 0x4000, that's probably
>>>>> where this dts error originates from. Btw, I'm also seeing the same
>>>>> error in exynos7.dtsi.
>>>>
>>>> What's the error exactly? The "Virtual interface control register"
>>>> offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
>>>> the Exynos5433 looks correct.
>>>>
>>>
>>> The issue is that 2nd region's size is 0x1000, but it must be 0x2000.
>>> It's defined by GIC-400 architecture, as I understand. Please look at
>>> [1], table 3-1 has very specific offsets and sizes for each functional
>>> block, and each particular SoC must adhere to that spec. So having
>>> 0x1000 for 2nd region can't be correct. And because exynos7.dtsi has
>>> GIC-400 as well, and 0x1000 is specified there for 2nd region size
>>> too, so I presume there is the same mistake there.
>>
>> I understand, the range length has indeed same mistake. However it does
>> not matter that much There are no registers pass 0x10C (so pass 0x1000).
>> This address space is not used.
> 
> I have no idea which spec you are looking at, but the GICv2
> architecture (of which GIC400 is an implementation) definitely has a
> register in the second 4kB page of the CPU interface. It contains the
> GICC_DIR register, which is used to deactivate an interrupt when
> EOIMode==1.
> 
> Linux actively uses it when started at EL2.

I was checking Exynos TRM and it seems it has one more bug... The ARM
datasheet [1] indeed mentions GICC_DIR at 0x1000. I'll add "Fixes" tag
to my fix for Exynos7.

https://developer.arm.com/documentation/ddi0471/b/programmers-model/cpu-interface-register-summary



Best regards,
Krzysztof
