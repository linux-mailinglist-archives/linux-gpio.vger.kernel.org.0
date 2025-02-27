Return-Path: <linux-gpio+bounces-16694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D9A47B7C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021B53B498B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A7322F140;
	Thu, 27 Feb 2025 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ozIJ/Y7+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85322DFA7;
	Thu, 27 Feb 2025 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654464; cv=none; b=mWzhD0l4qE/kK1Zyb4quFOi9QmUsGAaXGdDsogNl0NCPeMtdT9kQf7qMwLFukFzvV2rjiHnDosDqYc3jcEc8ooC8Cz5+nc03VgUBUUQC4lT2MJN5dPbRavNif5WpnPWgDBZ3AbnfEwxH96p4eN+cZe8NkoSTSXBEaXRzz7pto+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654464; c=relaxed/simple;
	bh=zuNxJDcwOt+AZSFS7EuNKwbkIx0p8GUHFRIHGKFQ1Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rDzzbACEOLB60iTbxYjq6uI39NrNIGiRXde+L60CKawBnR0jhO+RYHiG3U5qwPxq54qEZBvbB8WM+L/zPEVc+BqqraGmm7aDBb1xSG+SJ4OYAipaMJWuLsPuB0k+8Wyyrq9JQ2n8liaiQlJbhUMTCaGu0X2vE0WRtm24Rt3ybA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ozIJ/Y7+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9RQsm007985;
	Thu, 27 Feb 2025 12:07:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PmYOF4wGhNjibuwqHEkxWyFSrgjUr3eu12e+XRp9DPU=; b=ozIJ/Y7+zHtMTIV7
	hyQ1rotHYSzK19kFLs2TIDdp+GLHmUVuN0VaMXuLBVqQ23FjYCiMGNIsj+w36lKb
	0pXpYWvkzhzh8JXR9OpyrJb28J+fxxf/9tILzBvZWoW2hRxEocfm98bAQsHOVcmB
	VPOmGxWcjf4GF2WZpvKhKesKOO6pDWzxWa9eW7dr3BdKoFGFZzsdb7vfQKXVF98F
	JriWOVgjuaO7ESanfU9VBE0dRaTzA8AeIqgAWnqClwmtxm49tridhXODbo0SWinA
	MnpubI7+vcCcxL/gmg5nFp57ewF8IqyQ7keecJHGWEv6+58meEeK2u6ITzz7MJQV
	7CozKg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrj758-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 12:07:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4815A40047;
	Thu, 27 Feb 2025 12:06:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CBF13E756B;
	Thu, 27 Feb 2025 12:05:25 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 12:05:24 +0100
Message-ID: <cf86046b-00e2-41cc-b93c-7ad6cb4d062e@foss.st.com>
Date: Thu, 27 Feb 2025 12:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
 <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
 <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
 <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
 <46fbdccb-610a-4b73-8697-d7bcf4942a41@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <46fbdccb-610a-4b73-8697-d7bcf4942a41@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_05,2025-02-27_01,2024-11-22_01

On 2/26/25 16:05, Krzysztof Kozlowski wrote:
> On 26/02/2025 11:52, Clement LE GOFFIC wrote:
>> On 2/26/25 08:21, Krzysztof Kozlowski wrote:
>>> On 25/02/2025 16:51, Clement LE GOFFIC wrote:
>>>> On 2/25/25 14:04, Krzysztof Kozlowski wrote:
>>>>> On 25/02/2025 09:48, Clément Le Goffic wrote:
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>>>>>> +
>>>>>> +description: |
>>>>>
>>>>>
>>>>> Do not need '|' unless you need to preserve formatting.
>>>>
>>>> Ok
>>>>
>>>>>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>>>>>> +  It allows to output internal signals on SoC's GPIO.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: st,stm32mp-hdp
>>>>>
>>>>> There is a mess in STM SoCs. Sometimes you call SoC stm32, sometimes
>>>>> stm32mp and sometimes stm32mpXX.
>>>>>
>>>>> Define for all your STM contributions what is the actual SoC. This
>>>>> feedback was already given to ST.
>>>>>
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  '-pins$':
>>>>>> +    type: object
>>>>>> +    $ref: pinmux-node.yaml#
>>>>>> +
>>>>>> +    properties:
>>>>>> +      function:
>>>>>> +        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
>>>>>> +                "8", "9", "10", "11", "12", "13", "14",
>>>>>> +                "15" ]
>>>>>
>>>>> Function which has a number is not really useful. What does it even express?
>>>>
>>>> As said in my previous answer, function names are very different from
>>>> one platform to another. Numbers were used as string to be generic.
>>>> I'll consider it in a V2.
>>>
>>> What does it mean "one platform to another"? This is one platform! Is
>>> this some sort of continuation of SoC compatible mess?
>>
>> I may used incorrectly the word platform.
>> This driver is the same for the three SoC families STM32MP13, STM32MP15
> 
> That's driver and it is fine, but we talk about hardware here. The
> binding is for given specific hardware.
> 
>> and STM32MP25 because the hardware is mostly the same.
>>
>> Why mostly ?
>>
>> The peripheral is behaving as a mux, there are 8 HDP ports, for each
>> port there is up to 16 possible hardware signals. Numbered from 0 to 15.
>> Each of this number represent a signal on the port.
>>
>> But the hardware signal behind the number is not the same from one SoC
>> family to another.
>> As example, in STM32MP15 family the HDP is able to output GPU hardware
>> signals because the family has a GPU but in the STM32MP13 family this
>> signal is not present.
> 
> It looks like you have clear mapping between function and port number
> (your header also suggests that), so the function property should follow
> that user-visible function.
> 
> Just like we do for many other architectures - it is not that very, very
> different, I think. all of platform hardwares do not operate on strings
> but some bits in registers (so numbers) but all (ideally) bindings
> operate on strings. You created here exception on basis this is somehow
> special, but the point is: it is not special.
> 
>>
>> The purpose of my helpers was to give a readable name to facilitate the
>> configuration in boards devicetree's. If needed I can get rid of that
>> and use only the number as string.
> 
> If you use "names" you do not need even that helper header.
> 
>>
>>> What are the exact functions written in datasheet?
>>
>> The exact functions name written in the datasheet are the ones of my
>> helper file without the HDP prefix.
> 
> so full strings "pwr_pwrwake_sys" and these should be used.

Ok so in the V2, I'll keep the 'function' property of the pinmux and use 
signal names such as 'pwr_pwrwake_sys' to select signals in the DT.
The signal names are different from one SoC to another (stm32mp131, 
stm32mp151 and stm32mp251) so I'll need compatible data and the 
compatibles will be:

MP15: compatible = "st,stm32mp151-hdp";
MP13: compatible = "st,stm32mp131-hdp";
MP25: compatible = "st,stm32mp251-hdp";


> Best regards,
> Krzysztof


