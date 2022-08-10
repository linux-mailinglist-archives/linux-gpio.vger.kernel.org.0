Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EF458EF93
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Aug 2022 17:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiHJPqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Aug 2022 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHJPqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Aug 2022 11:46:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE1621250
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2022 08:46:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bx38so16486234ljb.10
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2022 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DCCjTYZ0qN8vBfPF1lwOb8EOTQj5fWe2+onwYOWjKsw=;
        b=BNTZtwqIPvOw5SsHSMFNsnlLhZ49JLS1j+DZDiuYlnDZ4zNxuI5qux+fn/wm783Joc
         m6fdIrPnJBco0EhE1TvkXC2uVOudAz3Qz/+T3W1v+Yp8bZusjPHFYuApNfGqg6O3qmc0
         WkON1bYYV/3nx+l+jMkK1p+md86rty447/XrPh0CTuY+w4B9rhsQrMTykBrdYVrGUbx7
         1UBt4hs/6oyTNMhruBx6y8EOsRVrRz3HCjg30qUOe9nD2fQcL/FRyIOZ6TBMTFTIFlXS
         vu2cBYpoly76o4eS85rLv0rQZ/eLprt9bxMplRMq+m/6klWJzinblrjV7uaOH0SvHamZ
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DCCjTYZ0qN8vBfPF1lwOb8EOTQj5fWe2+onwYOWjKsw=;
        b=N0TUzfZeOJYfiJo8Lc6Ou+lSesV18RipMQ6QuIfy9aU5gBcMq8fIWBr59VGGmsxFp4
         wwqGkylw2dt14obcF/0malpf0byPbjEiJE9CPE1n7JbxY/zUiPY6d2ebDm+mvObUoICc
         TC+CD80yPvP9E0rQ81CxA0vygtFt0gNwNoxMnpzPQxtKAFQVNymLkuLOzy79XPmNtqkd
         QP9Ik2bqhaAlwplZC5lsNTkM6P5wNAp5l2ZgemmkT931LHsXyq5RzXXUDabvTuXOS402
         72r6+kV9R0i19d3LxxDPutFyR0QyUYAZcqeETa+imgBila3Agr3ldgUNZRor0zGiir7l
         27hw==
X-Gm-Message-State: ACgBeo3uBR9kVl7nz8St8sO8JPqmexMPsbHRyvWOSINoIIVB3BBEq0+U
        D3XGZCm3RHJvXGbwvaE+KS/rSA==
X-Google-Smtp-Source: AA6agR5sH0ECkekUtJa3azyuIaHtiF8N4pVi6n1YrHGKr9bBBmKnyPTJAXXs3TI9F7mXBtYTGiz2rA==
X-Received: by 2002:a2e:9e17:0:b0:25d:8897:2a77 with SMTP id e23-20020a2e9e17000000b0025d88972a77mr8720646ljk.441.1660146362059;
        Wed, 10 Aug 2022 08:46:02 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b0048af6242892sm388217lfe.14.2022.08.10.08.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 08:46:01 -0700 (PDT)
Message-ID: <40ca4f73-aed5-3e2a-7fb6-cd3a2cb74cb9@linaro.org>
Date:   Wed, 10 Aug 2022 18:45:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: gpio: Add imx scu gpio
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
References: <20220810133005.74653-1-shenwei.wang@nxp.com>
 <20220810133005.74653-2-shenwei.wang@nxp.com>
 <ec6fd9eb-f46d-afa9-b08b-15e202b3a624@linaro.org>
 <AM9PR04MB827495CB596427BD86A1522B89659@AM9PR04MB8274.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB827495CB596427BD86A1522B89659@AM9PR04MB8274.eurprd04.prod.outlook.com>
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

On 10/08/2022 18:23, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, August 10, 2022 9:46 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org; brgl@bgdev.pl;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev
>> Subject: [EXT] Re: [PATCH v3 1/3] dt-bindings: gpio: Add imx scu gpio driver
>> bindings
>>
>> Caution: EXT Email
>>
>> On 10/08/2022 16:30, Shenwei Wang wrote:
>>> Add binding document for the imx scu gpio driver.
>>>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>  .../bindings/gpio/fsl,imx-sc-gpio.yaml        | 40 +++++++++++++++++++
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,imx8qxp-sc-gpio
>>> +      - fsl,imx-scu-gpio
>>
>>
>> This is too generic compatible and it even conflicts with the above...
>> Your driver binds to both without driver data which is even more confusing.
>> Make the compatible specific for one, given SoC.
>>
> 
> Oh, that's my bad. It is a typo. The generic compatible should be "fsl,imx-sc-gpio".  
> So far there is no driver data required for both imx8qxp and imx8dxl, but it might be
> required sometimes later in case the scu firmware is customized for a specified use case.
> That's why I put the generic one here.

That's not a proper reason to add generic one. Either all
implementations are compatible or not. If you are unsure, this should be
assumed as not and just use specific compatible. If you are 100% sure,
then use fallback, not two compatibles, and properly justify it.

Best regards,
Krzysztof
