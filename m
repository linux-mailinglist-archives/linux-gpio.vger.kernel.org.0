Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3BE4A9F77
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Feb 2022 19:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377739AbiBDSry (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Feb 2022 13:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377730AbiBDSry (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Feb 2022 13:47:54 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B27C061401
        for <linux-gpio@vger.kernel.org>; Fri,  4 Feb 2022 10:47:53 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id f17so13023726wrx.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Feb 2022 10:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/FXf1cpHah2vNgyPqX7qSvfT47H3XqIl9lhW99Uh6Zg=;
        b=gdWY6AsY87ioUhnUZ7mUhldlGrZUqt7skinL0OJM9wbR11tcWkEb7TNlWlPlRBM/el
         O8hrFtLwwaLpgvTWzAw+OYf5ntp8Oxs6rqDsqBwvlbIHfu/cLKLM0ncE67oN1n6uMzBh
         oKFxIEUF2vX9MnZFkPLqqi7hHBa0ZEW6heyY+DTDeEJe1FPUZj+QMoo8y0ANmNW+sW3M
         vbTkZvhtDZO40U2AcA2rlYQzRihrYsAb+GozKsdq8BfFeXKjYRQO5e9U7VSrswlm3VDo
         AGdMO2dTrlgMajsUDNDiT4wogUYJEKi9tbdnE2Ut77OUW4APjG2/l/9Fg4EwinemWaoy
         TeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/FXf1cpHah2vNgyPqX7qSvfT47H3XqIl9lhW99Uh6Zg=;
        b=SfmidV8XDtiRL4uWBep51D2+9XGSRPTj9KgwyheTu4l+ZIjsEnbpCcscHkHWyZWHs7
         GUnhGsyb+R5Ihm66vKXjk2A6UokpZxkTu51oc0YIk69wf6+kp3RznrQQM4Z58ySVb8L2
         8mms5kPP2wou9NkYt37NbrGNu6ciHBKS3CMoPe1Jz2cYCA1HslueZ59cokGukydLpTim
         hbMrPPARqZeT0LtPwkEcrM9hCk5vdKg8fKNVfmcET11VWmx6+aZYZHiz8H2HubtI8YT+
         tmimKWzSMk0j1mmd2weJZMu/bFhnQ2yOS6ZN6PDD1ahCdaqMz/5dicqsgenw5wAP6Vpz
         E9Ow==
X-Gm-Message-State: AOAM5301Wnxis3R9n760AvimIN8qv5ZOvKWdFIu0gV8Zku5/VMvWVER+
        LNRf5LKYiyTdGSH1t0+51E7iow==
X-Google-Smtp-Source: ABdhPJxnmuuY3lnz4VvgizExRa+6gf19qnjUUQPH5Eht2f/FLLQxG40kaSWgQoDrbzb3/jNcfFxtEA==
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr206334wrg.634.1644000472142;
        Fri, 04 Feb 2022 10:47:52 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
        by smtp.gmail.com with ESMTPSA id y7sm2461881wrr.74.2022.02.04.10.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 10:47:51 -0800 (PST)
Message-ID: <3edb8e95-8be4-5e9f-d66a-5a8a92eafcf0@conchuod.ie>
Date:   Fri, 4 Feb 2022 18:47:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 00/12] Update the Icicle Kit device tree
Content-Language: en-US
To:     Palmer Dabbelt <palmer@dabbelt.com>, conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        Atish Patra <atishp@rivosinc.com>
References: <mhng-2b6f8784-4c0c-432f-a6e7-97052ab900e7@palmer-ri-x1c9>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-2b6f8784-4c0c-432f-a6e7-97052ab900e7@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 04/02/2022 18:09, Palmer Dabbelt wrote:
> On Mon, 31 Jan 2022 03:47:15 PST (-0800), conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This series updates the Microchip Icicle Kit device tree by adding a
>> host of peripherals, and some updates to the memory map. In addition,
>> the device tree has been split into a third part, which contains "soft"
>> peripherals that are in the fpga fabric.
>>
>> Several of the entries are for peripherals that have not get had their
>> drivers upstreamed, so in those cases the dt bindings are included where
>> appropriate in order to avoid the many "DT compatible string <x> appears
>> un-documented" errors.
>>
>> Depends on mpfs clock driver binding (on clk/next) to provide
>> dt-bindings/clock/microchip,mpfs-clock.h
>> and on the other changes to the icicle/mpfs device tree from geert
>> that are already in linux/riscv/for-next.
>>
>> Additionally, the interrupt-extended warnings on the plic/clint are
>> cleared by [1] & [2].
>>
>> [1] 
>> https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/ 
>>
>> [2] 
>> https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/ 
>>
>>
<snip>
> 
> Looks like Rob still has some feedback that still needs to be addressed. 

Still not passing Rob's bot as it depends on a binding in clk-next & I 
also need to reword the descriptions in the PWM binding.

> I'm happy to take these via the RISC-V tree when the bindings are set 

Great

> (assuming the DTs match whatever gets agreed upons), but also fine if 
> someone else wants to take it > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Either way, I'm going to drop this (and the v4, which was at the top of 
> my inbox) as it looks like there'll be at least a v6.
Yup, hopefully v6 on Monday

Thanks,
Conor.
