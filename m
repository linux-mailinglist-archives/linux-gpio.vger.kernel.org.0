Return-Path: <linux-gpio+bounces-665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 503EB7FD7D9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E70A8B20F30
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 13:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4D1200C7;
	Wed, 29 Nov 2023 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGHLNph1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F86194
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 05:21:43 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a02d91ab199so916522666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701264101; x=1701868901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKqVgmmmP85xT7paIKn2Y6mbmwhcI9WsvGmtiq0rLgg=;
        b=jGHLNph1X6nT5BohT2XCfbasLVuvBF9aqleZOSw+I/f2NV8wW7ZpjMwMnE/3RgiIRC
         CAD7Ckxu55aI6tL48aa+O3YrbVM5+GBFbRVI7a+sd3KZVffVAaWyiw7Wod0JK5WDCYzS
         DWEVXjjWvGJ+BgSzNKO0zLuEF5yG4pNRCgbexb4paex+sqow8yAumbSxGlFeuRJeqPMm
         yjBEfhKdNo1+HD4zTWFNXwM434sRpN3EaBwxqmdQygvsOgqdhWubPNsfhaCGf0EPXKfg
         F7Kt9XzbjLMyG0CLrpVK0SYwvKZUiEZmblSDZLpVlUpPqTCnIYUf45gXXtp2P8bDwbtf
         bfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701264101; x=1701868901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKqVgmmmP85xT7paIKn2Y6mbmwhcI9WsvGmtiq0rLgg=;
        b=E5BEt89tD3AK1YkApdPiegLR4wqJ64Q7odOwixWtML8rMnJilK/pxpjv6Y1wGgBOuz
         rec7//rxBI7Yt9Pxwdm4r0MLbW/EXXWXTabwxIrLel0vLpRK1wkVGm9W8385gat61ZXc
         WMM4adFGREzCHpJ4jsA+ozJmmGbuWrg6xPpLgDLGOeDAEvqOF5lzJBAiZo/Le9F2iRGV
         okwdmPBqwcV0269akOdFsorCggHG4USeeBnA7oucAOrde+FDJ9wmBB9ras1HRf/ZcWKV
         6JRUxFiev6WeWCpu+UnkFcWf31juwZnLHetr/r8QQSURFG3IhreM92Yzxx2g1hRS82oS
         +Few==
X-Gm-Message-State: AOJu0YwByoO3rnyL5lddT6b2L/V1F2GBBqX7WIHoaG0/7zX6Pzt2y+Nm
	O8Scy82I9BAYUU/7dSAwkKm33g==
X-Google-Smtp-Source: AGHT+IHHyUSZ6isQL9Gg3P4bkNKgpkgRqY7gYY8XwE/b6ZVC89XZtodpS6v9WiSekYotO/DV7gB4aA==
X-Received: by 2002:a17:906:c445:b0:a02:8b23:895d with SMTP id ck5-20020a170906c44500b00a028b23895dmr13115240ejb.35.1701264101545;
        Wed, 29 Nov 2023 05:21:41 -0800 (PST)
Received: from [192.168.209.173] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id rv24-20020a17090710d800b00a0958af2387sm6510255ejb.201.2023.11.29.05.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 05:21:40 -0800 (PST)
Message-ID: <2d6c7d2e-c8f5-4e7f-901a-8ca208d7b442@linaro.org>
Date: Wed, 29 Nov 2023 14:21:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: Convert to platform remove callback
 returning void
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 agross@kernel.org, linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20231129100422.16659-1-quic_tengfan@quicinc.com>
 <20231129100422.16659-2-quic_tengfan@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231129100422.16659-2-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2023 11:04, Tengfei Fan wrote:
> Use .remove_new() instead of .remove() for converting to plarform remove
s/plarform/platform

> callback returning void.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
The commit title should include the platform name, i.e.
pinctrl: qcom: sm4450: xxx

The change itself looks good

Konrad

