Return-Path: <linux-gpio+bounces-565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D67FB8BF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 12:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCE171C213CE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F0449F92;
	Tue, 28 Nov 2023 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izM++sar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2C8197;
	Tue, 28 Nov 2023 03:00:17 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso3841072b3a.0;
        Tue, 28 Nov 2023 03:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701169216; x=1701774016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUB7QgCX9kAMB/Lg9l0EP3qxCwdAvpTXoJYwnDzkTg4=;
        b=izM++sarEPxp0YqHL1kM0mwuWBwTOwH6820Cr55ZWLWu6XPoipNDP+DJ7M2nlZ2soM
         FiTfNn5qtAcp/m1RVKRiWSSZE6TbojS8D8xANOlwLjXbuNv13wcVLnK7JLlc8jd2J9+8
         knsZCqtkq4rhY2jFDzbtFqSYe3ZirVu7LeGGwFeWpRP7Dpfl5xTS7lPk9Wbnm3J+jY8o
         mDi2DQbraDrL6pvoguCeNoA+3F+UzbXj2fWqyJAjKA5f+CQkZfomaX+7Ckzfotfw4hxe
         bymxrcplsuE7G5TMkj5riEvPcxnISSBrpZ93o9ktMY7Cf84tG8UCiyMswc+GxTKyuKzr
         aU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169216; x=1701774016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUB7QgCX9kAMB/Lg9l0EP3qxCwdAvpTXoJYwnDzkTg4=;
        b=tmlUTDgKSEH1Jbi31ai+Tl7fRKWI3E+O81p7Kay4ljxDziicSUluBQXdBp1LqIW2f5
         QQqGorn1nE4d2rE1GnaGM8V1VwnWBRtLLpWAovNrt7SaaSjtIBznVD3UVyn7bcSPafO6
         Yp1ysRB5BztxkQyJkDXU3a6l7tEwo6VoL3GURbUO2zfHu/SdGj53MQOv+KLi55P2Wy1W
         5HFdZsiWplHTvMg1fq1wzw7qecp2kpENL2yFsLcZ/OmTJs+9PvbtdmuoTWCoEJYzW3M9
         Ru6sefDM+aD4GYst2PuEQlKdFO9wYDCgTaQgL8QIGVl5gKVcB+aN3AHM30hvwIIaVYBh
         dd+g==
X-Gm-Message-State: AOJu0YxzvzJ7hAsUKYmSm0kp0d5FD5ip+EQw2UPk0adQZ+vOkey1Sj6p
	iPUGoUw3c+T4zYaT7R7EZKM=
X-Google-Smtp-Source: AGHT+IELZy2cfK9evDSGdPDLQOTm0q44f8N3/c+byMrYR82BkmRcoyiSNcxwqRFBJEoqnyNviZmX+Q==
X-Received: by 2002:a05:6a21:33aa:b0:18b:9428:cd1f with SMTP id yy42-20020a056a2133aa00b0018b9428cd1fmr20906975pzb.21.1701169215950;
        Tue, 28 Nov 2023 03:00:15 -0800 (PST)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id q3-20020a056a00088300b006cb64908070sm8867824pfj.93.2023.11.28.03.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:00:15 -0800 (PST)
Message-ID: <5a96dd2a-53f2-498a-89e8-547e7fbc22d4@gmail.com>
Date: Tue, 28 Nov 2023 19:00:12 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: Document nuvoton ma35d1 pin
 control
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20231128061118.575847-1-ychuang570808@gmail.com>
 <20231128061118.575847-3-ychuang570808@gmail.com>
 <7c24aaf8-8f93-4b93-b7e5-abc88e95682d@linaro.org>
 <ffbaad9b-9a30-4cdd-bb78-8fb7d6ff4e9f@gmail.com>
 <5ac7f79a-68d3-49ef-9615-3c0076591d78@linaro.org>
 <2e0f58cc-0cfa-4957-bac1-c40897d7135b@gmail.com>
 <5109e1ce-9aa9-4c7b-bf22-9be23b5939d8@linaro.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <5109e1ce-9aa9-4c7b-bf22-9be23b5939d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/11/28 下午 05:35, Krzysztof Kozlowski wrote:
> On 28/11/2023 10:32, Jacky Huang wrote:
>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - nuvoton,sys
>>>>> This goes after patternProperties
>>>> I will fix the above two as:
>>>>
>>>> allOf:
>>>>      - $ref: pinctrl.yaml#
>>> Look:
>>>
>>>>> allOf goes before additionalProperties.
>>> Open example-schema.
>>>
>>> ..
>> I found that 'pinctrl.yaml' is not required for this document, so I will
>> drop it.
> Why is it not required? I don't understand where this discussion is going.
>
>
>
> Best regards,
> Krzysztof
>

I read the description of 'pinctrl.yaml'. Yes, it is required. So, I 
will add it to allOf: - $ref: pinctrl.yaml# properties: compatible: 
enum: - nuvoton,ma35d1-pinctrl '#address-cells': const: 1 ... Best 
Regards, Jacky Huang

