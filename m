Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D8A6530D2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Dec 2022 13:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiLUMaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Dec 2022 07:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiLUMaQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Dec 2022 07:30:16 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766B62315C
        for <linux-gpio@vger.kernel.org>; Wed, 21 Dec 2022 04:30:15 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b9so15454423ljr.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Dec 2022 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRZOrty5MgfXDX5Qq5G+s7U6FuXGETTST3AS0wLJyjE=;
        b=w9bW7mJQ98C/1sGABi6FE2EoLYodXp1Ksn/JipkCzZfM889fycz/RIRqNqm44kiCWB
         1sbFIoW6x3xebfswBOAaLnKnLXONK8QGGKC1mSjSA/qXNKUdath+1GDuPieQjAP1QDjX
         hPB4UBehx0gYO0kOMcA8sty7QwKWZ37V0TvJ5U4iVCIOAeG9MDiISrARxKiYbrtLfJlJ
         u9tDXRVUU+pCQn4axbnhUROiNqY25nUl87nu70F+WaUjsfQvcFGBTgSUIbLM0DcOQ0jB
         gEAw+M8S6wgJYdQNfugQaMMyMjHCp3wGFw7VB68jrdLPB0nsT81i8DcWxfUx8Rxn0hQ1
         rOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRZOrty5MgfXDX5Qq5G+s7U6FuXGETTST3AS0wLJyjE=;
        b=VN2H7r3YrMJOybioNR98FOCpfzg2+zEJ2J7C+YPTYZap1Dntw1bzqJqcKyNur4BmRJ
         NUqBOvcr4Lu15/01sA9AihWM4niLzzOJ/+fqRBwCmO4De3iBJ2DAW+dY2V4wwbzcKql8
         HsyKfLxyXYczL8ueOPbnzT0KTTc+pBcd43CJdWVY/dDe4PeX+gENp1TeEKK6OOkgyHSw
         tbnH4YhiCY+FPTIRrnnL3tjVUGlHY+nSipIc+pk6F9lTaG6souVMWipTFPjoAo2rYGjF
         t/1da1SUhrnP2RBeXaEpA+c5jAkiFfYpBVQe4NBY7GERE8B+M1YK8OhFniv5maUyMX0J
         VLZA==
X-Gm-Message-State: AFqh2kqb1AnoxzVUT8rjafGTYNEY6etbIrhATa2gBtncgceSH9HU0+a+
        Fy3Vh1z+uSQrK+qiyY9ghgHKfA==
X-Google-Smtp-Source: AMrXdXtvztDDZB4uZQJgNyxRmxBHPk71MN5H9Vyhw7koQDZIqCIqCblN9RI9ix8HjRyFOHE6ZPZPyw==
X-Received: by 2002:a2e:f19:0:b0:277:3de:f78a with SMTP id 25-20020a2e0f19000000b0027703def78amr379185ljp.27.1671625813877;
        Wed, 21 Dec 2022 04:30:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m23-20020a2e97d7000000b0027973ba8718sm1284085ljj.37.2022.12.21.04.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 04:30:13 -0800 (PST)
Message-ID: <5c0e7f2f-94e1-c6d4-d848-f90e29eead10@linaro.org>
Date:   Wed, 21 Dec 2022 13:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: add schema for NXP S32 SoCs
Content-Language: en-US
To:     Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Chester Lin <clin@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc:     dl-S32 <S32@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Larisa Ileana Grigore <larisa.grigore@nxp.com>,
        "Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
        Matthias Brugger <mbrugger@suse.com>
References: <20221221073232.21888-1-clin@suse.com>
 <20221221073232.21888-2-clin@suse.com>
 <AM9PR04MB8487286EC9EE4AE3F2FD382CE3EB9@AM9PR04MB8487.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB8487286EC9EE4AE3F2FD382CE3EB9@AM9PR04MB8487.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/12/2022 13:28, Andrei Stefanescu wrote:
> Hi Chester,
> 
>> +patternProperties:
>> +  '-pins$':
> 
> Sorry, I missed this in the previous versions. Could you change it to '_pins' (underscore)? In our .dts files we use underscore in the names for pinctrl configuration nodes e.g. i2c4_pins, usbotg_pins.

You cannot have underscores as node names, so what do you mean here? You
need to fix your DTS not introduce bad practices to mainline kernel.

Best regards,
Krzysztof

