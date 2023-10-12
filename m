Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF887C7018
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 16:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbjJLOLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 10:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235745AbjJLOLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 10:11:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FCEE4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 07:10:55 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406650da82bso10266265e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697119854; x=1697724654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WdWXO3v81gFOR0I0u+bCx1qFS/JFt5Xcnj4fLc9gJA=;
        b=QWaAmuT3vJGjQr178KaTDDnFhXJIrQ2IfD1rmuRj6S9bq7Jmc3d4do2g+diOSdD9Tg
         ntAMrPMcDQo1V+fSDuNveKgRfa/fUNo1+GUc/n6Hzog47o1w+W6+I2m6hhK7+bQ4uLVm
         +gMiAfbgz0/LKpyVWzfbrhMD+F9QlUDywhZ5e7eoe3R2TNEPTLkaJrEtVgfIqQJRF1xI
         bsEgI5WmEUhW7oIBDfY/bp3nYwoIoF34e5hEQm0NgP8Ujch23H0d74A/jqr0yKIC+dxN
         nFwPToKkyO0cT4StKvdz9gbW5E8xb/5CuF5qrM4IyzXeslRYlmDzJXcnAmn1VCCU+s4y
         2NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119854; x=1697724654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WdWXO3v81gFOR0I0u+bCx1qFS/JFt5Xcnj4fLc9gJA=;
        b=eAjcfe710zBjaCCXoJ16q5YAh1tQbthvbIX/qqfpLtumN7IBHYPUjAVEU884Jvqk1I
         LRQE48lTS1+5QdCMeHSFFd2hBq0n0YgeBbeYonhlVFmoyn2a1zHrwWgGmYL1vDXlm01l
         e+LIEJsfvxNxOYw6uW6s7Zuqd4IpnzNBki0N8yXXZjnsf2kMSsdzi7iQRBjlcPSv0tZs
         +J6DQGXEwwFEiU1WbtZWUHtdSH08Sz8c6szdvCXKoQEIIrtRScqfMsOf1c3VPVTNl8iK
         +2X3luDK9rdHzr/cRDzcvrnTOpavLFdV8JYveNx9G7ZchYkp3Eprz5F+e+X4L26kp7oq
         qEYg==
X-Gm-Message-State: AOJu0Yw05UMYW+a7bQM7U8jQCOuxsj9Npuuev/LO5R7F01OJGhTL1mhf
        6cy0YYo379QIPzVPXG4gfIHJoQ==
X-Google-Smtp-Source: AGHT+IEEDtZboeUEvCNmZQwJMht/dAm03jBOAUbhvrvPk8NG433XxDKITPj8w8edkd4O3XGoTWwamA==
X-Received: by 2002:a7b:cd0a:0:b0:405:3ae6:2400 with SMTP id f10-20020a7bcd0a000000b004053ae62400mr21544681wmj.23.1697119853910;
        Thu, 12 Oct 2023 07:10:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b004065daba6casm22154892wmi.46.2023.10.12.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:10:53 -0700 (PDT)
Message-ID: <b65695d2-4217-4274-a591-c9afdaaf718e@linaro.org>
Date:   Thu, 12 Oct 2023 16:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org>
 <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
 <CADrjBPpUt-PShY4Wm9UWK7ZxujYsm7DoNUY67tzUMAp33BVY=w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPpUt-PShY4Wm9UWK7ZxujYsm7DoNUY67tzUMAp33BVY=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/10/2023 16:03, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Thu, 12 Oct 2023 at 07:26, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 11/10/2023 20:48, Peter Griffin wrote:
>>> Add serial driver data for Google Tensor gs101 SoC.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>> index 07fb8a9dac63..26bc52e681a4 100644
>>> --- a/drivers/tty/serial/samsung_tty.c
>>> +++ b/drivers/tty/serial/samsung_tty.c
>>> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>>>       .fifosize = { 256, 64, 64, 64 },
>>>  };
>>>
>>> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
>>> +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
>>> +     /* rely on samsung,uart-fifosize DT property for fifosize */
>>
>> It's an optional property, so you cannot rely on it.
> 
> Is it possible to make it a mandatory DT property for certain SoCs?

Yes.

> 
>>
>>> +     .fifosize = { 0 },
> 
> I can update this to 256, and we can add more sizes as we enable other
> UARTs I suppose.

You might also want to fix Arnd's comment, but anyway drivers must be in
match with bindings.

> 
> What's the purpose of having fifosize specified in DT and in *_serial_drv_data?

I guess safe defaults?

Best regards,
Krzysztof

