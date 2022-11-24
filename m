Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717BE6379DC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 14:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiKXNYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 08:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiKXNYO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 08:24:14 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A175C13D3A
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:24:13 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id q7so1585197wrr.8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TWdHEIhQJolLV9piJexmiUcaauZy35sANMJtric59n0=;
        b=rguYDKI2ty6fv9ZQMrfQIWwdHVGPDqvPXCToXJrEc69ZEGKb3NO6hMtm/CiAVNJVed
         i2G3xhlHQEhr809vJ4kyNtFqxNKMKZYAprs6Q/+w1OpP8uvo0r5fNVmsYFJ6yJgBt63L
         bd3x2H/MI19t73WlG+xJn+7GYyG3aE8+kMM5ELJQEFy/OP/Om37zVIUSCd5oguthql3Y
         Iowsnr2dijU6MPbeai3zQtYiXz0xhopxyxa3TzObO40YBFaZlq5Mk3hBz7Vuxxoda4wh
         XbW1a1h0EJw2gbCsWw3n9YhNyefQaAbsm0AcoVmQqg5NjCezJ7G6RXcCCTkFDpszLkXB
         hTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWdHEIhQJolLV9piJexmiUcaauZy35sANMJtric59n0=;
        b=V1xCQjKx+guclgDH1qviuWcJ1NFb/1U+bSFaiGt29769/r+sRwjAZH50ZNRb6Pi7Ug
         3bntQ3pXSC9dJGKzRg2ZGKHFmVldZy4JjPTrxE5CdecrJWBiHqpzgBaVRJBXbPmML60I
         YubuMGMsBjtYUbZLROrjCPRbN9WzP0/bQPnrM9ifJZvAk48LJWtTuLl2sUft2ndEegim
         4ggQx3vGG66t93jUP9A+PQ5cxOhbvkpRd9ndq1CLB31uJSv+Czg4a8Y+dK7g6G3gBVv8
         XyUnbWEEoWQ4hzL+j5kxul/PdqOQiwur71QQ5n73wEdCdJir+WBTe4ZsqZ4KSONDeJLn
         H6Vg==
X-Gm-Message-State: ANoB5pnCJ49uo88Ahf8ij9TJBZkeJDxcxZgs8zRoEGix8pZYZ4VGOAvZ
        6DsDcB5egsZaWnxyir1m+xWNag==
X-Google-Smtp-Source: AA0mqf7Jn3k6EzokKUy0sxQU+IibqSzMAOZEuSw/2DJkBMIxO1OmsoHYBspu6A8noUsbL8KEcvB/9Q==
X-Received: by 2002:adf:ec04:0:b0:236:63fa:c792 with SMTP id x4-20020adfec04000000b0023663fac792mr8349892wrn.476.1669296252202;
        Thu, 24 Nov 2022 05:24:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c48e:30d8:4886:1148? ([2a01:e0a:982:cbb0:c48e:30d8:4886:1148])
        by smtp.gmail.com with ESMTPSA id i19-20020a1c5413000000b003cfc02ab8basm6163783wmb.33.2022.11.24.05.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 05:24:11 -0800 (PST)
Message-ID: <fecb2dd6-9be2-78dc-4598-cc338fbdc2a2@linaro.org>
Date:   Thu, 24 Nov 2022 14:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document
 i2c pull property
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20221123152001.694546-1-abel.vesa@linaro.org>
 <20221123152001.694546-3-abel.vesa@linaro.org>
 <CACRpkdZtkHCkfUAcezSJvmei=HOezK6oyx+4C5kBrEtU+vAB-g@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdZtkHCkfUAcezSJvmei=HOezK6oyx+4C5kBrEtU+vAB-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 24/11/2022 14:11, Linus Walleij wrote:
> On Wed, Nov 23, 2022 at 4:20 PM Abel Vesa <abel.vesa@linaro.org> wrote:
> 
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Document the new i2c_pull property introduced for SM8550 setting
>> an I2C specific pull mode on I2C able pins.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> (...)
>> +      qcom,i2c-pull:
>> +        type: boolean
>> +        description: enable bias pull feature designed for I2C on pin
> 
> But what is this?
> 
> I2C buses are usually just plain old bias-high-impedance, high-z
> or open drain, wire-or or whatever you want to call it.
> 
> But now there is some special i2c mode, huh?
> 
> The description is pretty much "it is what it is"... can we have
> some explanation about what this means electrically speaking
> and why you cannot use bias-high-impedance?

I'll try to get some more info, but so far I only found what I wrote in the bindings.

Neil

> 
> Yours,
> Linus Walleij

