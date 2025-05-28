Return-Path: <linux-gpio+bounces-20622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43210AC617C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 07:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE1AD3A9A60
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 05:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E508320E021;
	Wed, 28 May 2025 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeCs3UQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E2E20CCCA;
	Wed, 28 May 2025 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748411919; cv=none; b=f14bO0suCgkqGHrG7xKlHgdq+w1IMEIv87AabHs1+1Igbh8TemUCLpnNrx7UsddykIa0k97PNKaNXgv3SSPsG0I6IxNvINrXLD2DN334HTv29by78G+F9rGVUTUh+F5OtTyAp7jwZOtzudinLvy5nNSmwOXfcmxeRn/U6rd9PYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748411919; c=relaxed/simple;
	bh=s30BvmonDO22/VURRrlZYKuo5RtdHEqne6gVx66GPCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBEq0GCgQQzv5JiFMswS2tVUXl7OL3hKvGagaIcFDyxE9Wy8jJ2ncrZ23eu2lMEQUXser++2WdUqCHlby1XJ1GBnMtacYtax822JKExkTudonSr/Cjif9FkG20zvr3+aXv7vQXI41c+zl3hMfHrhMUrnhQiKRZs9KsK/azA73DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeCs3UQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8793C4CEE7;
	Wed, 28 May 2025 05:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748411919;
	bh=s30BvmonDO22/VURRrlZYKuo5RtdHEqne6gVx66GPCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HeCs3UQTv3j9qlYfMkDrFP/j139VPVsEQUVuxTebtdDHJ2JeaHz3/vf9F9YLVogbw
	 NVfy6LlLJ00uF2CJMvAallTbWcLYKUg0H8phDOoA6MyDg5E8oKRvcgABfS3dOlBRJ6
	 orydg9ofJ2MBy/cc2PTfHx+UAeY525p6K57IelFiu4EFLIbMNLv/2N+wQbfJODMIpA
	 bHUCI6MVe3DVrJyZvGVqbyCGy7HEAiiO3yaZmmqy5thoSmP+KPy44kJ8JwIgXwuXLw
	 B8Kn47GfnuoocVwO5N0d9fhHnQEaDar45uLh12675Nd6Z/nIAbbVI3fLfSLoJLyjng
	 pIp134ioTJ4fQ==
Message-ID: <8609abe9-8aac-42a2-a2a1-2ccd6eafb171@kernel.org>
Date: Wed, 28 May 2025 07:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
 <b0f472af-6a0f-493f-aca3-65321931bebe@linaro.org>
 <DA78AT6VV956.3FZVIIIM3ZTFZ@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DA78AT6VV956.3FZVIIIM3ZTFZ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 22:34, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:45 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> WSA881X also supports analog mode when device is configured via i2c
>>> only. Document it, add properties, new compatibles and example.
>>>
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  .../devicetree/bindings/sound/qcom,wsa881x.yaml    | 66 +++++++++++++++++++---
>>>  1 file changed, 58 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>>> index ac03672ebf6de1df862ce282f955ac91bdd9167d..a33e2754ec6159dbcaf5b6fcacf89eb2a6056899 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>>> @@ -12,15 +12,17 @@ maintainers:
>>>  description: |
>>>    WSA8810 is a class-D smart speaker amplifier and WSA8815
>>>    is a high-output power class-D smart speaker amplifier.
>>> -  Their primary operating mode uses a SoundWire digital audio
>>> -  interface. This binding is for SoundWire interface.
>>> -
>>> -allOf:
>>> -  - $ref: dai-common.yaml#
>>> +  This family of amplifiers support two operating modes:
>>> +  SoundWire digital audio interface which is a primary mode
>>> +  and analog mode when device is configured via i2c only.
>>> +  This binding describes both modes.
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: sdw10217201000
>>> +    enum:
>>> +      - qcom,wsa8810
>>> +      - qcom,wsa8815
>>> +      - sdw10217201000
>>
>> You never responded to my comments, never implemented them. Same problem
>> as before.
> 
> You don't respond to emails sometimes and, while I want to move this forward,
> I am not taking any chances replying to few months old thread, so if it okay
> I'll respond here. Sorry for doing this.
> 
> Previous comment:
> 
>> You implement only one compatible, so does it mean they are compatible?
>> If so, make them compatible.
> 
> There are two compatibles in wsa881x-i2c.c.
> By looking at downstream sources and current code I think there is no diff
> between wsa8810 and wsa8815 and it is handled by reading hw registers if
> needed. So I am thinking that maybe it makes sense to reduce it to
> "qcom,wsa881x".

No, you need specific compatibles. That's the standard DT rule.
Compatibility is expressed with list and fallback (see example-schema or
any other qcom binding, really 95% of them have fallbacks).

WSA usually have version registers so even if there are differences,
they are fully detectable, thus one more argument for compatibility.

> 
> Previous comment:
>> Do not repeat property name as description. Say something useful. "GPIO
>> spec for" is redundant, it cannot be anything else, so basically your
>> description saod "mclk" which is the same as in property name.
> 
>> Usually clocks are not GPIOs, so description could explain that.
> 
> Should the "GPIO spec for control signal to the clock gating circuit" be
> changed to "control signal to the clock gating circuit"?

I don't see previous code, cannot even reference it via reply-to
link/header. That way of communication is not effective.


Best regards,
Krzysztof

