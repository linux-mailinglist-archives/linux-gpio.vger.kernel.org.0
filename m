Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872AF5EEE45
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 09:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbiI2HDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 03:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbiI2HCj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 03:02:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0CE12FF38
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 00:02:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a3so857121lfk.9
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XOvSHmFJKeh5yRkDJlU1n6MZZmHObV6hSAVG20Km+VE=;
        b=If7jJbfMCHwm4H071OfjzvYgNquTh0WVRQ+kk4g0SIxFHdM2UApkmcsxC0++Y7MFMV
         uyRGlgUgMBiwlklRxUS2z+tLyTPhW/6masPNggNR2mCOZpuDV4i48P/So8pXoxQ+hLte
         jz8PQ3EXAPHiXMKLFCGycw0WtinBeV8dS6+17h0ELImTp5cDr/RHVNeK3SgJSbCXNtOd
         SrJiwpZ9sUdOWa0vHVp1TaTOfMZEnXmn/kQKECke9vf9j0E4Z+ghuDgCqvTew0oqyzIp
         V1yBdslbyFJFwT6ClHDwfJiZfBxyGdDFbC8so5cBVJrXTxlt+Du3NWVoRsQ1V+rdmLf2
         CUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XOvSHmFJKeh5yRkDJlU1n6MZZmHObV6hSAVG20Km+VE=;
        b=4Ew2ZVybTEgcC2JJaoVwKvUSVI+zyQjmrknSlXUcmLx8dxwpIZd3jnibYjXGz9jUwP
         kMkpNk+hn+ej0pCHtSQtAjF1kzFnzny/QXHXYkxS5KzVDjm4ZaByf+AC+xZ8yw6J+MbU
         BmpunErBnsR/MlSCavZjYnlh2yiMZ9nR8rWiI7yaY+Mu7G1GEyvYvIP+gIsieljleADb
         JYBaX0qXza9Lom4YM4YACGgcJ3AZKqUHs+ciHSszROZE43YT8o1qwNJ2iALoMgmOp+Dm
         41lWSRVHJZl7/mvlLfZHlMf7MCZ3+uXgZ7OdU47puhT7sRnSvs0RQWPKoJCVb4wxTR0z
         JEGQ==
X-Gm-Message-State: ACrzQf22M6I2AsmgDETSj7vdVB4mu0XvpMJwYgcikBM2Rxw7JdhFpwAs
        spTLCeZlOtwfzRY4tt9GCDxDkFXhtxONkw==
X-Google-Smtp-Source: AMsMyM7qkTQ53z7i1O+hV2ggXn4sNG0CVBxtHUC2ppRVlPra834JZuvv/OrKYbCu+8i5QOEIewzSKw==
X-Received: by 2002:a05:6512:3f29:b0:4a1:c920:ebad with SMTP id y41-20020a0565123f2900b004a1c920ebadmr758260lfa.574.1664434956034;
        Thu, 29 Sep 2022 00:02:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q16-20020a194310000000b004946bb30469sm697275lfa.82.2022.09.29.00.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:02:35 -0700 (PDT)
Message-ID: <bb61ff78-182f-f4e2-bee8-556234ca07ee@linaro.org>
Date:   Thu, 29 Sep 2022 09:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Conver Unisoc GPIO controller
 binding to yaml
Content-Language: en-US
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220928092937.27120-1-zhang.lyra@gmail.com>
 <fca2b97c-9d4f-d372-ef2a-aae8b367bbe5@linaro.org>
 <CAAfSe-t=-pZAcrY0o-ct1uJaNhtkCMQKNW5gOrJfE6DEOhSZDw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAfSe-t=-pZAcrY0o-ct1uJaNhtkCMQKNW5gOrJfE6DEOhSZDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2022 04:29, Chunyan Zhang wrote:
> Hi Krzysztof,
> 
> On Wed, 28 Sept 2022 at 19:31, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 28/09/2022 11:29, Chunyan Zhang wrote:
>>> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>>>
>>> Convert the Unisoc gpio controller binding to DT schema format.
>>>
>>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/sprd,gpio.yaml b/Documentation/devicetree/bindings/gpio/sprd,gpio.yaml
>>> new file mode 100644
>>> index 000000000000..c0cd1ed9809b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/sprd,gpio.yaml
>>> @@ -0,0 +1,70 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright 2022 Unisoc Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/gpio/sprd,gpio.yaml#
>>
>> Use compatible as filename, so sprd,sc9860-gpio.yaml
> 
> Humm... This is not only for SC9860, also for other IPs, UMS512 as an
> example which added in this patchset.
> 


Then it's ok. It seems you have also typo in commit subject (Conver).

Best regards,
Krzysztof

