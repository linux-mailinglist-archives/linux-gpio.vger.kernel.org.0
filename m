Return-Path: <linux-gpio+bounces-1210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629280C1F7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 08:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A784C1F20CA5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 07:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E088200DC;
	Mon, 11 Dec 2023 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcBnmb+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2F2DB
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 23:34:40 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c26a45b2dso22020785e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 23:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702280078; x=1702884878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B9M3ivj0hin/IwQCfivGV6M+zrF5Su1X0x53Rly3MY=;
        b=KcBnmb+iy6bjUxPyk0ybmvWHaBHaXjohqLIq9mhPyX1p2SJDM9em15eJQ61epl5fXk
         XGgYF7g1xEshqDb5JdJxFmPw0F9QjsBdTWW4gn9vyG/W88DV0ViD7olY6ArybpcAqFIA
         DUWWbq3y5evcvPTZ9fO4jim89awO8/xT5r748DfZ1ihXbp1xC7n+sveDISeM9JkvdbRB
         OUYD4o8cgmb7KWlCWmh5gzhtPEJscCt0La4dIz1grgpA8taI7VgS2qyP0JW4SD+AN1ZH
         EmDJvdgT6HmQnc9CulpKZekZmwM1IlNYXY0BSNHwurAAZ5caZqbbXgAx7qkWz7NlIQME
         gmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702280078; x=1702884878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1B9M3ivj0hin/IwQCfivGV6M+zrF5Su1X0x53Rly3MY=;
        b=d13c/Ti+P4rS0g+dDoMEOboFZ6IAb6To4JbuUfUWrt7Eg5EF30EGesT58+9U+Ka0ud
         KEDmfKLfmO+06JngkzOJw/wNV3Ap/fftxRYvQShRHWgMx1rSRIdd3x/lit35UI2Cf800
         sO9MI/YzYT3hBes/zW2oFnA0/8pMa0rjOKKAttB4G8L9J/q26+kH86j2CGDgL/97WItF
         E52ggES0oEYYjymMEPUqrvgBF7MAVTTqq1B24NB7C+cUJ75Lv17b/PWkUPXlwbTpWwMV
         wv2SRmRXIdktVae+mR+1T8Z3aH99WsEx66qHojnnvcXxY0FDsuYFVUQTAuzDMyhvXfme
         I9Qw==
X-Gm-Message-State: AOJu0YwZCKQo76NtuyJTgXo/xDi/TPJCC7dIFRz8mvYFJ6Fp3Hu0F9II
	/wZC52RS7ERgO02zPSnMoysr0A==
X-Google-Smtp-Source: AGHT+IGVoJA169fh7hxs5BUnAQ4rS1b1QWUhEhKU+BJAdmClOdIaEg44LrjVk9fWAM+JY1nBcdCmDw==
X-Received: by 2002:a05:600c:287:b0:40b:5e4a:2379 with SMTP id 7-20020a05600c028700b0040b5e4a2379mr1983548wmk.123.1702280078362;
        Sun, 10 Dec 2023 23:34:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b0040c42681fcesm5126187wmb.15.2023.12.10.23.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 23:34:37 -0800 (PST)
Message-ID: <a441ca43-8631-4a6a-b828-6d744fce5aee@linaro.org>
Date: Mon, 11 Dec 2023 08:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: correct ExynosAutov920
 wake-up compatibles
Content-Language: en-US
To: Jaewon Kim <jaewon02.kim@samsung.com>, Tomasz Figa
 <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20231210133927epcas2p3e2633ad371b03d5ab19f9b44118fcb58@epcas2p3.samsung.com>
 <20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
 <c63bd0b3-ecb2-d4c6-2147-43f19c1dcfee@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c63bd0b3-ecb2-d4c6-2147-43f19c1dcfee@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2023 03:18, Jaewon Kim wrote:
> 
> On 23. 12. 10. 22:39, Krzysztof Kozlowski wrote:
>> ExynosAutov920 SoC wake-up pin controller has different register layout
>> than Exynos7, thus it should not be marked as compatible.  Neither DTS
>> nor Linux driver was merged yet, so the change does not impact ABI.
>>
>> Cc: Jaewon Kim <jaewon02.kim@samsung.com>
>> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>>
> 
> It is reasonable.
> 
> I will also fix this in v4 patch.
> 
> 
> Reviewed-by:Jaewon Kim <jaewon02.kim@samsung.com>

Please send correct tags so I won't need to manually fix them. Otherwise
they get ignored by b4.

Best regards,
Krzysztof


