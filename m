Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411B758FEDC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Aug 2022 17:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiHKPKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Aug 2022 11:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbiHKPKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2022 11:10:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6151F25E88
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2022 08:10:44 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f20so25912026lfc.10
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2022 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ythLCoVb9L2vBawwAE87aN65NfOERO7MePsawDGE0HM=;
        b=GpHMp+mUorkB7eVPzZYP3xQ08kbw0mkr0pImGlClMbek72EeegLNz+nhuMZOo7wuLu
         qzOjPuzyDt/Y/ThaKW3KFd16H+SO0VVDwWvTJKnr73a1nhQo8fQr0LvCzR+VBl1QL9f6
         m1xSxv7/TpzHVngyUuhfrCYcVrAK0M2o8pR9d67WHzKPntTsGTIjYLMSd2BMshgaNv7f
         ZwfuvnLKFxkSo6EY4u84KS6jhrXCMD1PO9/uETlCO0Tac3Ey02V40jeHKh4uN13U3XOU
         3gsVNo/HiWRRtRqs/cJtjtlwzh93ZwtURmiGfAm95rmKR13v4hPOrhsG13yhr0GvZotH
         SfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ythLCoVb9L2vBawwAE87aN65NfOERO7MePsawDGE0HM=;
        b=qmeBUMUAcRfojLXSfrBI7i2ZtYxCdtw2FxpJGiJNJ6uNnjR7w2riuX3hqxOPbfKZxg
         RR7bpPrWRmjbNQnLPDozO+zV0Tlfan7GYJeAuPzeN+SwcqvfeLXFHVe0SZpqVNjNDrQX
         ep16UE99DHHhaOn4d0RQWueemhlwqpj8XAxJNPoo3yqjS0nSzYYeHF2JQbf0hO5R/h2j
         8rvf2s7PtL7udqI+/cYdzVCZ8I8GWOk/rAD2gxUSoUpz7GEfW0aJxfELT8aU6SXcZ9E8
         md2iV3ZTmLZ12VE8fi3PfWjhY3ZbuYqBDLiwNvRDeQPn7JaZ3K9gjBBonwh6hvfIVrPD
         xzfg==
X-Gm-Message-State: ACgBeo3ZaErCdjaxfusn0chXupzbuK+Az3KZUAFeXMC2vsf5tOTtj1Ke
        8OY91hzOKBlxfth33OSySSrqpQ==
X-Google-Smtp-Source: AA6agR7oR08zhJzkZ8rf5MkbjaIHuaVnR+OLR5jaO9Pq5H4A3inAXP8eN7ZQLCJOAcsPhXzgtxQT9w==
X-Received: by 2002:a05:6512:2316:b0:48a:f2e3:be97 with SMTP id o22-20020a056512231600b0048af2e3be97mr10845161lfu.383.1660230642636;
        Thu, 11 Aug 2022 08:10:42 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651234cc00b0048137a6486bsm726277lfr.228.2022.08.11.08.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:10:42 -0700 (PDT)
Message-ID: <01c832c4-6631-4865-30b3-7f060e27a7ff@linaro.org>
Date:   Thu, 11 Aug 2022 18:10:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio
 driver bindings
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20220811124135.95299-1-shenwei.wang@nxp.com>
 <20220811124135.95299-2-shenwei.wang@nxp.com>
 <db3020ef-7321-e171-b5bc-9c1795c2cced@linaro.org>
 <AM9PR04MB82741882E177387DB95AE3B589649@AM9PR04MB8274.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB82741882E177387DB95AE3B589649@AM9PR04MB8274.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/08/2022 17:52, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, August 11, 2022 9:36 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org; brgl@bgdev.pl;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev
>> Subject: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio driver
>> bindings
>>> diff --git
>>> a/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..a1b024cddc97
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> +description: |
>>> +  This module provides the standard interface to control the
>>> +  resource pins in SCU domain on i.MX8 platforms.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,imx8qxp-sc-gpio
>>
>> Now the filename does not match compatible. Use the same compatible as
>> filename.
> 
> The subnodes under fsl,scu.yaml have their own naming rule. For example, the watchdog
> compatible is "fsl,imx-sc-wdt", but the file name is "fsl,scu-wdt.yaml". 

The other files have for example fsl,imx-sc-wdt, so they match compatible.

> Is the filename required 
> to match its compatible?

Yes, that's the convention. Otherwise people tend to name the files in
whatever way they like...

Best regards,
Krzysztof
