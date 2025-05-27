Return-Path: <linux-gpio+bounces-20608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76CAC5B62
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F0E8A7D0B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 20:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E3120A5DD;
	Tue, 27 May 2025 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbdkxlQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370819F43A
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378075; cv=none; b=LVUtTcacqB32bM1KEAzc8rIeQOkjFbZjCKp+AH1K2Z+iKPKMBpYdzLMG2T5+OiT8+3ZLIQQDK+yrUL5EuGSrsRw5+1QKcNwJphZSFPkcMVBI3g3ckuYqX/1tBD0FUewnK1OHq5wVHksXo6WF8ofUVjmCrgjVCRXsssDxL50ItdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378075; c=relaxed/simple;
	bh=Lk3vcO1oKeMbKUMeqUuClFL2qOenRvP/2/Pu/bcuHW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HGSlg2CbeYDMPOli0PJWplkGIeMyuJ9jlSYGZ68KZStgpxNLSwnnUDpiD7tzKI/AwRtlngjhmKPa6+kae5fxpaydHRZe4pnimIZD6MYtIne6iQ67c40OXugccIlA46LRuEcoOgHf/q5Kv5g20XMi0+QZ/EFEN+wGPSlxqPN7Hcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbdkxlQF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so1663535e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748378071; x=1748982871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFJiAb2IUs00ZtUjOW77VpF9Eao8kfb+MFNiZYFFCXQ=;
        b=WbdkxlQFhvDJnz2+Mn/B5rfRdkbk4ILtPgpAtVj2q8pe4K55Zo9Jv6RZSYUQNzX7B8
         e2HGMvN5m9pVoKKRqo27ilrQnAq21Sc6BUzg6VRPHGxWe2zt8En1s9Nxq7AtALMOR8Dv
         3YTGavBBTqdnyqNeVa39KId7Fxj+3wNShqNj6Vd8S19O7G1Lf83Cg4G4tHXezzUMAjoU
         trmvI/+RNW/oucmoPPBZaIIahquzk0oLmqYK87AcGdqJPJ9L4RWSIE/hhS/B6BY1WkLs
         L9dctq+EYmP+NcASYWZAF1hi6gpjI5+1JAAvlGaNUW1MlfWReGF8p2gctv7FSGeFE5nJ
         jKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378071; x=1748982871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFJiAb2IUs00ZtUjOW77VpF9Eao8kfb+MFNiZYFFCXQ=;
        b=pygjDEtyYD/0vaYudSYEogyAsp5NpXTZSYH5oEiYe+U1Zb9jxurY5eF8r+W5hbVDLB
         dOZSX9qYG9yv0VBLoSQrBDWi3/lHXJnEm8ICa3yK49lvSKE04/wmbcbGGrjSzp1uX/iS
         Bk6i4P0TTPBrBbmYqcM3C/R3UeTgDWSJkc0rQhQvsfqNGmuNrkscyP2QE2G0FUeTN5KD
         s9w0W/BDFQF+RjBQydfhiFDXuHEHdhZsqOw1IFDbFwzS+bujcArp9qCPZ5kRlj4AVx8P
         4PzFmCdx72ivaJSM2rxfDiLGQHohbOnVB9+mG1YcYUVw62pdxzsXJByPTQ0Cs1r3BTGo
         uYbg==
X-Forwarded-Encrypted: i=1; AJvYcCVuEOvummfazAe9qKn6u2lZhAFQVxvmg0C2643sQPK6vBTFnRcYJmFxgb8nocxjRBxdDtg+b7egynHk@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVzQXscKH91B7bONoECoeUEPCrIaGhGMtS01MdIuyBvCXslv8
	fugv4E5ozh8f0eJ3zJnDkTNlBKIpKV4tAXVriZUltqu7sAvY+GOzDXsAjsmMwvq39hJ9bzhdaKP
	6GLt2
X-Gm-Gg: ASbGnctz3EFMnHrt7xx04PeINjyeD5jSeIyXnE4VYnc9GrxppaLaOddJCQw1XnVBvxl
	nxKCYfm9w36vLrIWiXZHjE3+Yqwl5ZZomBjZ5Cb3cu6d5Q2XB57tfgkoYK1n7vZ4Mz+WqgMn1Kb
	yL4utclX8CkFtYtQEsa5Z1o7ZvWjolMOt8KxjZXFU7dECR2daZi4RkusBG0Ljf9SbuJ4Xb+Ns98
	Uh19uRmy4+xHUW5nnX9eDIQvytyupterMEQRD/owQhjqMbcpryZwNLRkAFT9stBBCwb0qm5NBvt
	RPUMCV1jrPZmDMDmPP2YP1JD53EPJiKKNZl32t9oztKuVvR0WsxB7bdRIw==
X-Google-Smtp-Source: AGHT+IHlDeoVP72Q/Uqyo+pZHURLBnl8XrfCspQPzPuFoQwwhDij8rvTNzWrNHORRzIve/wtI2xDsw==
X-Received: by 2002:a05:6000:1885:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a4e5e5dac6mr1861963f8f.9.1748378071390;
        Tue, 27 May 2025 13:34:31 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f45a8434sm292912855e9.0.2025.05.27.13.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 21:34:30 +0100
Message-Id: <DA78AT6VV956.3FZVIIIM3ZTFZ@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
 <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>
In-Reply-To: <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>

On Thu May 22, 2025 at 6:45 PM BST, Krzysztof Kozlowski wrote:
> On 22/05/2025 19:40, Alexey Klimov wrote:
>> WSA881X also supports analog mode when device is configured via i2c
>> only. Document it, add properties, new compatibles and example.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/sound/qcom,wsa881x.yaml    | 66 +++++++++++++++=
++++---
>>  1 file changed, 58 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b=
/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> index ac03672ebf6de1df862ce282f955ac91bdd9167d..a33e2754ec6159dbcaf5b6fc=
acf89eb2a6056899 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> @@ -12,15 +12,17 @@ maintainers:
>>  description: |
>>    WSA8810 is a class-D smart speaker amplifier and WSA8815
>>    is a high-output power class-D smart speaker amplifier.
>> -  Their primary operating mode uses a SoundWire digital audio
>> -  interface. This binding is for SoundWire interface.
>> -
>> -allOf:
>> -  - $ref: dai-common.yaml#
>> +  This family of amplifiers support two operating modes:
>> +  SoundWire digital audio interface which is a primary mode
>> +  and analog mode when device is configured via i2c only.
>> +  This binding describes both modes.
>> =20
>>  properties:
>>    compatible:
>> -    const: sdw10217201000
>> +    enum:
>> +      - qcom,wsa8810
>> +      - qcom,wsa8815
>> +      - sdw10217201000
>
> You never responded to my comments, never implemented them. Same problem
> as before.

You don't respond to emails sometimes and, while I want to move this forwar=
d,
I am not taking any chances replying to few months old thread, so if it oka=
y
I'll respond here. Sorry for doing this.

Previous comment:

>You implement only one compatible, so does it mean they are compatible?
>If so, make them compatible.

There are two compatibles in wsa881x-i2c.c.
By looking at downstream sources and current code I think there is no diff
between wsa8810 and wsa8815 and it is handled by reading hw registers if
needed. So I am thinking that maybe it makes sense to reduce it to
"qcom,wsa881x".

Previous comment:
>Do not repeat property name as description. Say something useful. "GPIO
>spec for" is redundant, it cannot be anything else, so basically your
>description saod "mclk" which is the same as in property name.

>Usually clocks are not GPIOs, so description could explain that.

Should the "GPIO spec for control signal to the clock gating circuit" be
changed to "control signal to the clock gating circuit"?

Previous comment:
>That's not a valid syntax. Either enum or const.

>This was never tested.

>Why are you repeating the if?

These parts are no longer present.

Also i2c0 was changed to i2c in the example.

Best regards,
Alexey



