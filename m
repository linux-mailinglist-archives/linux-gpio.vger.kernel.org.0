Return-Path: <linux-gpio+bounces-20505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31807AC12AE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE623BE7AE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BB519C569;
	Thu, 22 May 2025 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6fP7ohJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D518C91F
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936366; cv=none; b=rcDhXQZH3a0Be/kIG//5g/iH1YxkzGb1qzo3b6nLe22tWdHQumz4FXYOgbZ15r1o6gqDZxzYMk9mXqmkUlKE9S7J0vUIBEwJBHQcNzyQOny//K0fT0+9IIV8Nx60ujnnz4g9lSmsOVjhcZKV7ItqvSIk5tI0bB9K9vx/boed4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936366; c=relaxed/simple;
	bh=9btVnPDQ/5pbfG+bD1s8KqMltDfTPB7R2unTJ88Ktjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX4fLIHX9bG1wgfYcGjinwfTsfKeAD8ZhLgNb418TTgf8ormW2ZPtqoCD3LFtXUis6KFG9YeBaSplDR+uUatjWh0gIhf0l7drxZxUx8YsMXxR+x/Ac9w0LYYb2xzjyQ01DfcOksp9fcJWj75ZHmzmmnAjieUJoGxBVtJ8J7bvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H6fP7ohJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a361c8a830so1052304f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747936363; x=1748541163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GbnwMM90Tp9Pwsxwupta8O9pbwTshaJHr+P8ctDhHxg=;
        b=H6fP7ohJuGWawYRAACo+sPrrwOqekGCi02PHEEzAwbBNoYWxSRJtOzy8vA3cg3Pah9
         6wmCegmF1lwP+4b1B/bw2Al4hnIpahHI4kjm02tlDFPIWIS366mp3T+/vln6iN27RjFp
         gkbOQwU2HOh9vFdkX7/M1wzS+fFFCdBqb70keQ2TLrX0cjlfBee5uSRaQHU4wkuqCtcl
         ILoiyosM86v7zUmvNubWV6fFcbGK7DlUZCLqE9Hxm2VA9uIXRO00tucUx5g6sZcRJuKG
         AzzTX8BM/j+zkmFjptZ54kc9/oRnVhInpwTeu4ppgXXr+IqTxNiYXqc3cDcX7tgMOKMr
         6J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936363; x=1748541163;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbnwMM90Tp9Pwsxwupta8O9pbwTshaJHr+P8ctDhHxg=;
        b=GoTtV7ganAvUpnlREPpuWwfglYiIgEEa8gufXM1BH4ro8S1YO8D+hNZpHPES7bhctc
         Hr2wwIDYTDGHP8YC23PeLczhp6g3HszMhGZBxT14m2AvFC04h2t+STTwixmR15GZaPXO
         587ewhQq2gMa/bLfFUSiA1WjRyaRRUKWfjwOJTJB2JEVcBtZnYGvxy+eD2vTmfXjtbzt
         dFWLo2CD8TbrhdTuxQwl2QRnCkVZW/X/jgbWAV04WVCyeo538v/cihmndbP5tEYfxVB5
         rKtvBHmG+i8oKihWnz5kSmFUC3i46EZBhNt9SYTBfHxiedp52rDgNKzo0B67pZvkUe0s
         AY2w==
X-Forwarded-Encrypted: i=1; AJvYcCVJyhScozmZJ8pv12dPT0ZNBHYakxWN8VnYc02R1qnZ9D0KTsXyQ3FYOvJaiL4qfJ9u2iUK9nDxCqnV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7FYEpCb0UssyLXWads9XIhstBB4txYKLvP07v+fdkEz9XPj/H
	ZlxC/8BFeAapum+8JznOVdpoNU+SoDhhP7JinZZsQS5bOxzb78Z9QU//2/yhKMBIrws=
X-Gm-Gg: ASbGnctaRMkPrVhBa3MsR4m3RkbU6sD+MZzEsKvL+Dj95vnM/EmTxUCBmyTIIoGhXTJ
	qKuYphcYITZzWVCnu2mPrDGU39/2+STKLh6V5yvNmq7rcn2R1ML8LqwObNbsF1Z89MoVdtkl9n7
	3SS6LX8qPOTYVsXgoZd0wYOW7Ay162Jl5wkkEx06lwnTh4j0kGeCUZeGsvlNJHzkDYgEzbwNnd2
	dgO7wIUqhRKNU4m805q1OEx0U1iN9l2GwhImHUKQ9X+jEL0KgvzJll1YNwMhxEtfjCmA5xvs4os
	10rIZeC3G+adpPSAq7H98lQWNXrZi7Q/z8iAWzUchMCV+ddDOk/yejd6+hlGih0s6rAVwRM=
X-Google-Smtp-Source: AGHT+IFWyjcdpS14Udb2lwsYPAyL+RI4DXcO80D52N7Zxv1r5Hp4zUi/6e3mDIF/WFfoDfaJTgziTA==
X-Received: by 2002:a05:600c:314f:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-442fd68436amr96058945e9.8.1747936362592;
        Thu, 22 May 2025 10:52:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f062fcsm110380555e9.15.2025.05.22.10.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:52:41 -0700 (PDT)
Message-ID: <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
Date: Thu, 22 May 2025 19:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
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
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 19:40, Alexey Klimov wrote:
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
> are required to support audio playback and audio capture on sm6115 and
> its derivatives.
> 
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Just keep one CC.

> Cc: Srinivas Kandagatla <srini@kernel.org>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Missing SoB.

> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 132 +++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index c8865779173eca65f9e94535b5339f590d4b1410..045887ae215b0965ffc098fd31fd18ac1ad90b7b 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -2689,6 +2689,138 @@ funnel_apss1_in: endpoint {
>  			};
>  		};



...

> +		swr0: soundwire@a740000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a740000 0x0 0x2000>;
> +			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&txmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpasscc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "VA_TX";
> +			qcom,din-ports = <3>;
> +			qcom,dout-ports = <0>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;

Why this not is not disabled? That's a bus. Each bus node makes no sense
on its own without the actual devices, thus it is always disabled in the
SoC file. Just take a look at other DTSI.

> +		};
> +
> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7ec000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>  		remoteproc_adsp: remoteproc@a400000 {

Looks like not ordered by unit address.

>  			compatible = "qcom,sm6115-adsp-pas";
>  			reg = <0x0 0x0a400000 0x0 0x4040>;
> 


Best regards,
Krzysztof

