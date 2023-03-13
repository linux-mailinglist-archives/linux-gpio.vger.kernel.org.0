Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400BE6B777C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 13:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjCMMaZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 08:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjCMMaW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 08:30:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C787764203
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 05:30:20 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r15so20809221edq.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678710619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xmn2nanx9djz8+cvYSEMDrQgDosVq8taY8kBuZP96dQ=;
        b=Oi4/QA9NHRIFvwt8o68xzUvZ6ZRD3e3g4it/tyEvKJJkr8KURbc4Vo6kqOwolyD1Q5
         8a/P7oZ1IhcOXtQal2xy7BzMCOhAMxj8ki1ai5zsrhvFEHyFteADBfMc2AdNNWeMLM30
         e87z7bdg3YQRybWDaRi4Au7DtUVg5ZYN+V8KzdWXfHIRfy7Pc3NyRQESmiCV6HwunXiz
         umjBmLYJuFwPGsBgfH5KfFfLprUJqMyhxMbC3telhO7S2W6tI5Wjz+M560Xxt2AkerUT
         y5YDikylUGkVaKbZOx+xNc2r1n68p7Z14zP8r8JWMyoBma70M3hzI6xQG5U7TsmBfOxu
         3Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678710619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xmn2nanx9djz8+cvYSEMDrQgDosVq8taY8kBuZP96dQ=;
        b=busmSyC5bxBC6g1CMGDDFR+LR0ibYvr+YqeeKmbrtNI8kT71mBOfF2eFF7tyG+kzkS
         7d8TDmtOY9cTpjVrzxSHp0CPKaARJk1uG/I4ZqxLdbq6+z0wlb2gBuSiTD38ENgktgB1
         LxrZREh0qu1MQtEOEqNvOYB92Lxk1RrhtdiUhqHwdpx61S9+7gBxAqTddJ6VKFSj3VxS
         oYnqm9hnw8sPU0aIILVTB1J1jirjA7kmgraPjf+YqxWjs80NLePcc5RroFle7nKg1KP6
         5qrblE4dm+w/+McjMt0M+KOZ83lE4kfbiO4AYUZNVG+L/D5i1ooHCRaX4fg4J3Z/wG7M
         zWig==
X-Gm-Message-State: AO0yUKXYkNeNSRqWPziuu+InmiSHH6ee8Ol+vRLvp+vakT4+CQW8a7tX
        lHqmdzOPWoV1spuiZ0hItMUo5w==
X-Google-Smtp-Source: AK7set8vWnZvlNjQcq0Vh4v0+v2/D3pvGv7QjKi5Zpb1zXBn6XgfOOuoIqOEDpSc2Xt2IGKJW43YoA==
X-Received: by 2002:a17:907:a602:b0:8b1:76ca:f228 with SMTP id vt2-20020a170907a60200b008b176caf228mr34379930ejc.39.1678710618957;
        Mon, 13 Mar 2023 05:30:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:69db:4882:d071:27c4? ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id hz11-20020a1709072ceb00b008e51a1fd7bfsm3426297ejc.172.2023.03.13.05.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 05:30:18 -0700 (PDT)
Message-ID: <0499e6e7-ab4e-3e7a-d6de-0979bd0d8cc8@linaro.org>
Date:   Mon, 13 Mar 2023 13:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/3] dt-bindings: gpio: add NPCM sgpio driver bindings
To:     Jim Liu <jim.t90615@gmail.com>
Cc:     JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20230110083238.19230-1-jim.t90615@gmail.com>
 <20230110083238.19230-4-jim.t90615@gmail.com>
 <d56c24c2-a017-8468-0b3a-bd93d6024c69@linaro.org>
 <CAKUZ0+HiR+GDG4EP8nxyVVMQrkotvyQP3N3Rs7+3d2aTLEtMoA@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAKUZ0+HiR+GDG4EP8nxyVVMQrkotvyQP3N3Rs7+3d2aTLEtMoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/03/2023 11:38, Jim Liu wrote:
> Hi Krzysztof
> 
> Sorry for the mistake.
> I think I need to explain more details about the clock.

It's still top-posting.

> 
> The NPCM7xx / NPCM8xx  SGPIO feature have 4 pins.
> picture is as below:
> https://drive.google.com/file/d/1E9i_Avh-AZV9IEZO1HLMT4EtgCBe46OV/view?usp=sharing
> 
> The clock is generated from npcm7xx APB.
> The bus frequency is derived from npcm7xx APB not HC595/HC165.
> Users can connect  1~8 HC595 on DOUT pin to decode the serial data for
> HC595 A~H pin
> and can connect  1~8 HC165 on DIN pin to encode the serial data to
> send to NPCM7xx.
> 
> The test device is as below:
> https://pdf1.alldatasheet.com/datasheet-pdf/view/345467/TI/SN74HC595N.html
> https://pdf1.alldatasheet.com/datasheet-pdf/view/27899/TI/SN74HC165N.html
> 
> NPCM7xx/NPCM8xx have two sgpio modules;
> each module can support up to 64 output pins,and up to 64 input pins.
> If the user needs 64 output pins , user needs to connect 8 HC595.
> If the user needs 64 input pins , user needs to connect 8 HC165.
> 
> the HC595 and HC165 connect is as below:
> NPCM7xx_DOUT    ->   HC595  SER pin
> NPCM7xx_SCLK     ->   HC595  SRCLK pin
> NPCM7xx_LDSH    ->    HC595  RCLK pin
> 
> NPCM7xx_SCLK     ->   HC165  CLK pin
> NPCM7xx_LDSH     ->   HC165  SH/LD pin
> NPCM7xx_DIN        ->    HC165  QH pin
> 
> The frequency is not derived from the input clock. so i think maybe
> the yaml needs to describe it.

That's not what your code was saying. It said:
"Directly connected to APB bus and its shift clock is from APB bus clock
divided by a programmable value."

> if yaml file still didn't need please let me know.

Now read the description of bus-frequency:
"Legacy property for fixed bus frequencies"

Don't add legacy properties to new bindings. You have
assigned-clock-rates and clocks properties.

Best regards,
Krzysztof

