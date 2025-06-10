Return-Path: <linux-gpio+bounces-21220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E433AD3980
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF19169129
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D488723ABBF;
	Tue, 10 Jun 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6WUHSa73"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BA246BB8;
	Tue, 10 Jun 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562567; cv=none; b=Xp7zvYKu7ZwSCJRpjx0WdGR3KZqtD50q7E5CHRxoN2yVnYJCC7OMKywsr7SB96iAAf24RoeLwln2mhLXUU33YUU3AXtVrR8LE1aqs/E10ElcdLFqf5FSVlVrpolSCfWTSIyJm6WNmSgg25p1VT3TQvhUBHWJGHoC4J3uOqUMlao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562567; c=relaxed/simple;
	bh=fpHJTV2BNny41O0KRlvrEr5Kwkx/Fp9ZACNun1M2bKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JFUgV214y9MxzdWrEXFC9bQLdyoeqVlTDsCk/Q4nDYIgke6w1i/iWYraq4zgzlUOXZHOR1oxbUHo4WSorECdMbwKky/gxhDFPaVZeEDWK3f4FU4lEg1IWVXTkqg/rsouEqV5KoTooMkQbVFShnwJ1GJdmcM12sOsGrJgcMfDNEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6WUHSa73; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLF7Y032713;
	Tue, 10 Jun 2025 15:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	42qeGfPPG3Jy7TK8jhUurPhAnYCLeXZebkDWKVesGp8=; b=6WUHSa73SzuDwV+S
	TnHceYDj6QtlhgnwIjJFSqEPVZV/NELe5/hM+nEMjhe205l0mg3+ZHgnKeiRPcWb
	Q8GqAQNLUvn2jf5pmrSGbz6K61eM5T2Rn1cyoIo4kuEn8WdsUugpp2W3OcbKmfL1
	XD8zE9KrTm2b1mdoErCSlrhGeNDxNhkcc2NRnlHYW/b3a9cU8BgBRzBjeik9Ta1g
	o5Z/NRI2lP0GZpt0v8t1mUzeehlGQ28N28ZQtUToVPIxdVDc+JfI5FRU813vvj4x
	xxxmbP2+hoMbFzbrUDx61zVjD9VglNArYLkrmHUt8lbnr1o04MbQVJwePkiQUcwU
	4zl3JA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnt341-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 15:35:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A9E140045;
	Tue, 10 Jun 2025 15:34:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F44EB5F91C;
	Tue, 10 Jun 2025 15:33:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:33:53 +0200
Message-ID: <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
Date: Tue, 10 Jun 2025 15:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
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
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01

On 6/10/25 14:38, Krzysztof Kozlowski wrote:
> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>
>>>>>> +		};
>>>>>> +
>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>> +			clocks = <&rcc HDP>;
>>>>>>     			status = "disabled";
>>>>>
>>>>> Why are you disabling it? What is missing?
>>>>
>>>> Nothing is missing just disabled by default.
>>>> The node is then enabled when needed in board's dts file.
>>> Nodes should not be disabled by default if they are complete. That's why
>>> I asked what is missing. Drop.
>>
>> Hi Krzysztof, OK I better understand now.
>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
> 
> These are not properties of this node.

Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
I don't get it..

>>
>> In the last patch of my serie I add them (only for stm32mp157f-dk2) but
>> keep it disabled because the pin is on an external connector (the
>> Arduino connector of the board).
>> This prevent any issue with a possible connected module.
> 
> Not relevant. Pin control for connector are board specific, but pinctrl
> SoC part is SoC.

I think we don't understand each other here too. I don't understand the 
end of your sentence "pinctrl SoC part is SoC".

Maybe some informations that could help:
The 'pinctrl-*' properties are used in the HDP case to select the 
internal signal to output AND the alternate function on the pin to 
output the HDP function.

> Best regards,
> Krzysztof


