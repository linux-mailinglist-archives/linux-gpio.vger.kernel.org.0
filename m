Return-Path: <linux-gpio+bounces-20502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA78AC129B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50DB87B978F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FCE199FD0;
	Thu, 22 May 2025 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLnb4rtV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABC18C91F
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936082; cv=none; b=LTDkOpTUmws+94G8EIxL6CgyGrJuexcCme0GF0TjYZvjn9St6Ekmxnnhrm4nM7YPo9skYSMlHIy5NTeAGjxKBKed3EaSz4v0aRGn4EiVfu6lNb5WiiQsgsO7VcJgz1qRrxNwg/6FY5NnSqMQIB+SgWuAuHUvDmO5LmJgN/mRrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936082; c=relaxed/simple;
	bh=GM9EsMbmAbClMnZO5mNCSbC/ozmms6eMZj0STnzBsRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Srr8RQvQSjaouh+T1UfBtZsuQosQuIY8tg+mEUaOI5RDcDmxQBMhX5wEQVNrlvI/pLYvD9FYINkRD58t1X9hhx0XlnUp8nlBu2+NrXOZ6ZJX8NsGQWS/MtJy9fE3Y+GG4/J2uXc9R0VCGoOfnJoABOB+et+tX00g1RqhrWerocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLnb4rtV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a361c8a830so1051704f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747936079; x=1748540879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FI3yfrnKDwGbYegks2vQUUxNO3r1jrxUpuIbQf2sNko=;
        b=KLnb4rtVZMJwots8omJI8Z1cYffwNSyptnYNi23HWHGD8B2sdV7t+IHC1kUqQ6llfD
         OH5tFaunqyENK+WXKft+ckc99EgFb3BgT7kTK5RcKE0ghG7+yDawvp+UUwBHg03Hs2nw
         XOhPoh1TePUMdrJrCv+S+aU4vhGBeZ+eBm2EcKTtirRb6iogHxwEyWbZDnUQbsLnRmOx
         EvFLZjYlFIMynfRbTGS+7lgArf46O8/s8oCleD//g+T1m3Yycl59QHzi9ibzfdqe+BfT
         JPxoXOyuwuRxWPSJhr5bC5A5r/SHhLlQsIj9Lqwi9gj+gworZGtX3+WyQllV4iYVZH/P
         E4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936079; x=1748540879;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FI3yfrnKDwGbYegks2vQUUxNO3r1jrxUpuIbQf2sNko=;
        b=kdJzdf/4U+K6acBMoyL+LwJJPzVXnN/vvLU4Wrj09/YyXSKEKhu+snOn7Gxxrpk6ZA
         PhSckAT7Bt5Nz6fn6VyzP/KaWObAUw5KwURh1vpyol0mD7/OwvcnffKBvV512uWGiUUB
         1D3hl5E+bp3u967VAe5rwKdT81hi4BnenVPrZCMHfUgI2rRkEoKqpnHdWJvbmym2R1/1
         PDh2LQNkma7r3sSf+IDpz0emRbrLeoQ1YtZzrt3eA+bWQNbYErGQ+XIhdVL14Hfd331m
         AOLYCisb+2YDXTpEbCteNKD6kkDL+95sa8CXwR4HPRWh12JCzJ7MKkInjRh/88A5tHq0
         RxOg==
X-Forwarded-Encrypted: i=1; AJvYcCUth4Bz0uTArjDfs028zZ/QYfldICLn0J5GZ+Z50rGkEXEzCJoQTWct76UUXjFPlvuUjlUMKVyp/EJt@vger.kernel.org
X-Gm-Message-State: AOJu0YwYPHPkKCw4okPHrKfhV+uxlVloGjJGDTAAewpKbngKULIKUDdZ
	1NYGYSu6ZTKCCNRdN23G6G2zohEX4ReGn5duWsVSaUz7I8lmJjD/u5lI7MMOOxqiPP8=
X-Gm-Gg: ASbGncuYVPcpJ/gjyygeALky9a0AVFEehZt7ZkcTrWZSF/CNiwDuL8Wy5orHHnZoGfn
	AkRx1I736qNEm2pakhv5dYp5gaq/fbfbDI+GpbRLXVjytmhLJ17BHLIKPCX8+oNmiZ6dhzb/k5R
	fjvZVnuy6BupipwyY2HLIK6DPKYGrmTynAzH7F0DaEdle/86vErFkSYgqjPEKJDXe2kGuI+NC5p
	CtGiPAMEnNPOVoN9tG0sGbeYeFXMj0Wgy5zJ5Her9PwqWMXrNsyG5nWyPj1zoYJhz84kE9TmsAT
	oywf0xIQGoimQVpl9WQ5WIxMkEmqKPIw4f16waiZjxhy5x4MomWpa9zIBaqlIqOOxyVdXwk=
X-Google-Smtp-Source: AGHT+IEZs7x3L5naJ16CKBdcYa6ztLamzUbH9kEsc4+k76NpQZj1EiyCGzpfgrulZfqhvMjbKSUbIA==
X-Received: by 2002:a5d:5f46:0:b0:3a0:b807:742c with SMTP id ffacd0b85a97d-3a35c826936mr9327551f8f.6.1747936079173;
        Thu, 22 May 2025 10:47:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a841sm24210906f8f.34.2025.05.22.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:47:57 -0700 (PDT)
Message-ID: <1225a93d-e298-4477-81a6-e871b9d771f3@linaro.org>
Date: Thu, 22 May 2025 19:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] qrb4210-rb2: add wsa audio playback and capture
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 19:40, Alexey Klimov wrote:
> Rebased, updated, re-tested. This implements the playback support via the
> following path: RX1 from DSP is connected to rxmacro which communicates
> with wcd codec using soundwire. This goes into AUX input of wcd. Wcd codec
> outputs analog audio into wsa8815 amplifier. Capturing works through vamacro
> using one onboard DMIC which is directly connected to vamacro codec.
> 
> Changes since v2:
> -- dropped [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching
> to support qcom,wsa881x and replaced with new one;
> -- dropped [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210
> -- reordered as suggested by Krzysztof;
> -- updates to wsa881x-common.h registers descriptions and corresponding updates
> to wsa881x-common.c (Konrad);
> -- sorted subnodes in DT alphabetically as suggested by Konrad;
> -- wsa881x bindings updates (as suggested by Krzysztof);

What exactly changed? This is way too vague.

> -- ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
> is still present;

What does it mean "still present"? You never responded to my comment. I
never asked to remove it, so I do not get why you mention it is still
present.

Best regards,
Krzysztof

