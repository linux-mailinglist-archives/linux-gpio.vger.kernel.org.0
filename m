Return-Path: <linux-gpio+bounces-1486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED28134CB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62233B20CFE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528B15D489;
	Thu, 14 Dec 2023 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgQWTeSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67522111
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 07:29:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so9552886e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 07:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702567784; x=1703172584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwyCFz/MUclTRWzeqYWWdhNHfbt5UD1rAyh1foF8lAo=;
        b=jgQWTeSH7WrCLewruoTrrNDiGeZhtWHwlcDKryqjCZMtn0/QvGvJMcrF9SwwGfV5ZY
         ukijuaA9h2SEMpIGPxsHJknN0VhJrDb/rRJoTN22gM0DyuHwIt+gR+v4tkfQYeJlBcA2
         WVhWpCbcfdn9NWJGrobyPVVr34T67/1ziON/9W22dmB6sYDlyd42DUFljKhsShymhWsd
         7SZyNC6NDWIuhdlRbt241NTdhrd0elrr9ngYMU60Bta+QbIgN/ydZ3oAz/F8UVBGregS
         2PffybW3jibpKKY/azAZaFX1/Z+ZGxdqqCUNbFePPMib4Yo0SCcyv2/jwPPrUo1naUYz
         mj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567784; x=1703172584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwyCFz/MUclTRWzeqYWWdhNHfbt5UD1rAyh1foF8lAo=;
        b=j4wgwAIT1sbaprOKKgiAefYmJbwn9oV87JKa3Gcks8lHRiM2eF+2O8O7ofhV+fegDb
         rfRPI8pthP7frL0XT3DCKeVDPRVf3GL0jihiGANL/H4SXJVO/Hug53ZrnYGT8+I2/VMZ
         9nzpDmz6tSveR5CS/3abNlOFh4hF2dtt6wgpv0EGOuABhZ8fJPgfnExREUh4fNYaQxwy
         OF8VtQrza9nd8R483pEO0/DvAEp5eKoT5EwaGdaCkdWCVyPyCh3AdurtI1lvFb1K+bkh
         V3f1zG/M+6y03iQkp5RjR6CUVebh81fDA/5EpUlVtAsCZIIkO3xr2FlrAfrWWs6Q/x5Q
         nAsw==
X-Gm-Message-State: AOJu0Ywy9kbl/vaT1nQqo+VD3uq/DIfN2/EgV4CkhoVGtnyWY7rCVT/5
	yLAp+h5x/aqeqqD7+CbnXH1S+w==
X-Google-Smtp-Source: AGHT+IFjx50C90EZ8AIexcW810r7G5QU/6Nx+euoI/7pqiXYZ9gCdSqqAzbCmQ7WR6b7iePKB3KrmQ==
X-Received: by 2002:a05:6512:3604:b0:50b:e20b:93f1 with SMTP id f4-20020a056512360400b0050be20b93f1mr2026870lfs.47.1702567784630;
        Thu, 14 Dec 2023 07:29:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id kt19-20020a1709079d1300b00a1b65958c54sm9453161ejc.125.2023.12.14.07.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 07:29:44 -0800 (PST)
Message-ID: <35b87d1a-f290-4d41-91d1-fe089e5d8229@linaro.org>
Date: Thu, 14 Dec 2023 16:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: arnd@arndb.de, pmenzel@molgen.mpg.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213190528.3751583-1-tmaimon77@gmail.com>
 <20231213190528.3751583-2-tmaimon77@gmail.com>
 <ccaefd08-161f-4aa1-acc1-5216c5f7f7c7@linaro.org>
 <CAP6Zq1i42ZUJmt_=VpLa6e-gzOndMFYL-Tuc1gEPr-fARS3VBA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAP6Zq1i42ZUJmt_=VpLa6e-gzOndMFYL-Tuc1gEPr-fARS3VBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 14:34, Tomer Maimon wrote:
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - nuvoton,npcm845-bpc
>>> +          - nuvoton,npcm750-bpc
>>> +      - const: nuvoton,npcm-bpc
>>
>> That's not what I suggested. I asked to make 845 compatible with 750.
>> This works, but I want to be sure you really, really understand the
>> consequences of this.
> Did you mean to do the compatible as follows?
> properties:
>   compatible:
>     items:
>       - enum:
>           - nuvoton,npcm845-bpc
>       - const: nuvoton,npcm750-bpc
> 
> Appreciate it if you could explain what is the difference between the
> compatibility suggested in V3?

Your v3 says there is a generic, common to all current and future SoCs,
interface to BPC.


Best regards,
Krzysztof


