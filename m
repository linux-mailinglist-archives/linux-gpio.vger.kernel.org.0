Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616777018F7
	for <lists+linux-gpio@lfdr.de>; Sat, 13 May 2023 20:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbjEMSIW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 14:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjEMSIP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 14:08:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B31E3C34
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 11:08:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965e4be7541so1911090466b.1
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684001287; x=1686593287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pz3pC3oD+mRQD2yh5jV0jp+d2wnh2+HWJqx/JQaPzB0=;
        b=EVBWjh+d6IhLcfQHvnPqNtgl2kB1ZPchXw0HXjFU2qSUtuwNy0q6Sp0YZggQOXxfjz
         oEcw/2Tl/2G+fh5jken5DOv1L2V0oQGBznQKAHYXr5FEYY+2rEcvHxbvLt9IC6T7d2pm
         j+JUVuj+iQUbkEXes1F1CBctgEWYrWPuR7xLWrMjBF263X4+bzOn/pWNhcqVAypZKXAx
         ikR1LxkTi5RNV8l0ufwPRld9j5r5vXg8+d6nfVq3ozPse6EdauUgXDDiXX8GGkzWphAd
         OXs/uwKHfMDIkh+2EG5f+tVdc5Zs9rGtQ8K5jD4iljzDntk+BUytG4wJjg7lSp4gpCJp
         o9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001287; x=1686593287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz3pC3oD+mRQD2yh5jV0jp+d2wnh2+HWJqx/JQaPzB0=;
        b=Oe3RGanyY1HuyF9qMNUQar88k76ggOC7H7XqDLfXlUSIRP1YTI417z26clhtTSAbBE
         vC3nTQky3p4wTAhfYWnH7mZA6fhQK5brntHUC9ERhMCHhbRxyRl+kH4Q1wBZOK6gMdUb
         HC78Grt4TfJP18WYVfHWBwDM35imzBIYlPoMxpVUgrqYtGwILjlws5EgCBa0a/cmcA63
         9hiTm2+Fpuw4Qd5p0fA0yxtJ0S89mBvNqnRH07M+0XGFN3SRrnSyBx7MeLDMgu2Epbp1
         NSZXXpioE9yv9go2fxT3paUoA0dkwCU/KVEw1rNW5w5VJl5sszhKwpdpiGoRyG0Nxw8g
         FpsA==
X-Gm-Message-State: AC+VfDwT2RgUVeEWpsyFCc5UKVMlsEZSNS7lm4yQS8W53YCPBZZy7t14
        lxlM1RzWFhfDw6S7+yLO1yquTg==
X-Google-Smtp-Source: ACHHUZ7ZC5ghgGrfBuRI4KprxyOU5k85ez2jlpAKSpf+r5Q8qvL256LVhRrTCK365P5OAJhDuRHo/g==
X-Received: by 2002:a17:907:9405:b0:957:12a6:a00f with SMTP id dk5-20020a170907940500b0095712a6a00fmr25591950ejc.21.1684001286843;
        Sat, 13 May 2023 11:08:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4? ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id ib10-20020a1709072c6a00b009531d9efcc4sm7023439ejc.133.2023.05.13.11.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:08:06 -0700 (PDT)
Message-ID: <db2dcafb-db14-96ab-87cc-88408f3bab4b@linaro.org>
Date:   Sat, 13 May 2023 20:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] dt-bindings: mfd: cirrus,cs42l43: Add initial DT
 binding
Content-Language: en-US
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linus.walleij@linaro.org,
        vkoul@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-6-ckeepax@opensource.cirrus.com>
 <5969fe82-69cd-34d6-edd1-d16ea741d9cb@linaro.org>
 <20230512161803.GM68926@ediswmail.ad.cirrus.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512161803.GM68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/05/2023 18:18, Charles Keepax wrote:
> On Fri, May 12, 2023 at 05:25:52PM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:28, Charles Keepax wrote:
>>> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
>>> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
>>> for portable applications. It provides a high dynamic range, stereo
>>> DAC for headphone output, two integrated Class D amplifiers for
>>
>> ...
>>
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  '#interrupt-cells':
>>> +    const: 2
>>
>> Hm, are you sure? Who is the consumer/user of this interrupt controller?
>>
> 
> Anyone who wants the device has GPIOs that can signal IRQs. Some
> of the other IRQs could be more generally useful, such as some of
> the jack detection ones.


OK, makes sense, but it is a bit odd then to have:
codec {
  which is GPIO and interrupt controller, but not pin controller
  pinctrl {
    pin controller, which is not GPIO and not interrupt controller
  }
}
Maybe all the GPIO/pin/related interrupt properties should be moved to
pinctrl node?

Best regards,
Krzysztof

