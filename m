Return-Path: <linux-gpio+bounces-4256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79587928A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 11:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3442281D51
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3167B7993A;
	Tue, 12 Mar 2024 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LU6bD7dx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0854378292
	for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710240915; cv=none; b=b0g8W/n9Xr+Z+oUqWCOj7sRdEzMKzM6nca04QbGoqGqTGBwFNGtWGPM8e9KVecCz1/w6/lRGfQS5kbO93ilnwjpRGvC/TZHtINFXE/oHMtZnCBINSVeSBW2hGmCeP+xFZD8IdUkDUBbniv3ilMsQZh2VZwCi+x0VnFA0qUkjn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710240915; c=relaxed/simple;
	bh=XWf15Q+auRFabU7lzDAkIuBXDhxSqJCKDVIS0vsdV54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5/XPoghgqbR88iDSOCmNXE8Y3Liv4S9Z6CCDA9O+KIjAEFm70l2o6VWW6z/XrGIzDbpg1EbcvDjq41Dt2aE39mnXk9C2jlQwCEL2LZmlsDVhO9U9naN4FrrxAb2SO/0CIEG2cCqq8CEdPJyHB2cSuDQ0fOklPsqIDHIUA8sQz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LU6bD7dx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4132a348546so12062705e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 03:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710240910; x=1710845710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVDhY33G0m7YFfWicSvtUU4vg69COlFC1stMQ+1us9I=;
        b=LU6bD7dx1ynIaXffzaB+L4r5tJ5VSNsiNxYI3xiUoBf1/sRS2hgKX3Bg91DoDBh8DH
         TwCUAJ7Iph4leYiI5Ai8+unyqZcyK3miXx5xdN3OV/uGrXFD/fhA59AkH7mfLBgCFsG8
         fs3lhGXYDoqDFoa1pkCH5jVQRXMskwNtjqkhD+NE6DDWXiXVPIf/UfKJG6/NLO2+1sKn
         6alt5z8bTbNgU0qQFf3MzSYj4pnuIvrlSBlWLkw2loqipfIq5JjBXrxqbV5uhP/80x8T
         CyEfyo+bQrqi9X/GypXQEOBRFCDceJ3ul27vFAueII8NdX7rmWee7h0gMeWvGtcIypPK
         Pu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240910; x=1710845710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVDhY33G0m7YFfWicSvtUU4vg69COlFC1stMQ+1us9I=;
        b=ITY+g7uFBN4SxYj3kFDnvK7sNyMhmv7NljUeN0vngJHIRH9GXpFfADmE8iH5Dgc/Ma
         8al1oMjSrqhY09pbfvOMEfMtSiwbsHLW1t7bdDhFt3znJEe76VHQ4X093pPWmFle+AZW
         N47uOF09tDg1vXWl4SyOXc01UKKczttvlZjIhYPnPUjlFBBKc7jPTAxvRsvY1ZtsYrIx
         xE3VJuAd9SDvABhMqUisIVsyfVZdON+ekI/Rxkj/9etwgXFcZwTfhXcVd74BMQuSV3qw
         tgv2TfabEV9ILJozjh+HH7yc/+wds/VJnUAituzgEE3wHVWWQwwSs4hK3W0r4kWdKTc1
         5SYw==
X-Forwarded-Encrypted: i=1; AJvYcCWmayOu6o7QgOrcsnecIMv/3GIAHDEnkZREJBG6L4Z4RXWoLcYRIz+l+Nx4aBsRmUgzEodYpT+qStbiDprogk0+NclcCuGqyOCT7w==
X-Gm-Message-State: AOJu0YxZy/udKo6v4j88rtJ0p4o1w9F/nRde+KFDPbtUWvGNhAtcsPwx
	DhA9pjGykmMvgibUMzIlKmKUJO1Toonv3mr47zgSSnTrObrGglVx8sNJexNKMLU=
X-Google-Smtp-Source: AGHT+IGJy48qrDo2fEIIIR685ry4hBJoPU0SKJzAMgTfVF31HjIrcVZVEZit5ZvTXEiRXikYUTZKrA==
X-Received: by 2002:a05:600c:43c4:b0:412:faa7:1398 with SMTP id f4-20020a05600c43c400b00412faa71398mr7358621wmn.21.1710240910345;
        Tue, 12 Mar 2024 03:55:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b00413427e77b5sm1316852wmo.29.2024.03.12.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 03:55:09 -0700 (PDT)
Message-ID: <6a3b5c9d-6375-457f-83c9-269746c1612a@linaro.org>
Date: Tue, 12 Mar 2024 11:55:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: update compatible name
 for match with driver
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linus.walleij@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240312025807.26075-1-quic_tengfan@quicinc.com>
 <20240312025807.26075-2-quic_tengfan@quicinc.com>
 <0d768f17-22d9-448e-9253-8498b61bf71e@linaro.org>
 <31b02b76-88ff-42d7-a665-18d2661e028c@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <31b02b76-88ff-42d7-a665-18d2661e028c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2024 08:47, Tengfei Fan wrote:
> 
> 
> On 3/12/2024 3:41 PM, Krzysztof Kozlowski wrote:
>> On 12/03/2024 03:58, Tengfei Fan wrote:
>>> Use compatible name "qcom,sm4450-tlmm" instead of "qcom,sm4450-pinctrl"
>>> to match the compatible name in sm4450 pinctrl driver.
>>>
>>> Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Wasn't this applied?
> 
> My test code base on tag: next-20240308, this patch is still not applied.
> 
> In fact, the following dt binding check warning only can be got before 
> this patch is applied.
> 

Please read all emails in the previous thread. You ignored two emails in
the past and apparently one more recent.

Best regards,
Krzysztof


