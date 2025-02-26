Return-Path: <linux-gpio+bounces-16653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E5A46917
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 19:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41210188D570
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8867A236A70;
	Wed, 26 Feb 2025 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3yKEGCAk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0A23536F;
	Wed, 26 Feb 2025 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740593432; cv=none; b=HU78Hlq+8Ut8MOe5OqBgY0DVpFTRvjJoE99UbsCsIZH1HHCgA6krAer5SXfxrOKwclkQPtMKO4uKWtMMqWL31pZHW7g1sXnpV0e4/y6E8PVpMqLxCNS6G2A1/tPUwXTg9vcocYgKULiN6xHy8rm4C857rgkBbyPRBz6QB0TiwhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740593432; c=relaxed/simple;
	bh=P8EWsV4hQ3wrom+Ukqqd/U/Ho0Oxrn3j9NkCRkOJMi0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=FOaJHt4XoZaWbb42Z+8+l1u8TQ3W8sdv300pqs92oIZZVGmSX2i/3lHkYPUa3EW2ch9grDyQcuqKBzOFQ6lM3ArgKj8J3xUQrsyc8KqgjCG1h2pTy16nDYDcijVcWAXmOyvvMeLn5FtNUb1XjVpe+C/t3fHtfHkeU35NqyH7CX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3yKEGCAk; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFHewT022188;
	Wed, 26 Feb 2025 19:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rG1C6cXlzhh7ZHVodv74JTH3XP7VRDVgNV9VI18sWQA=; b=3yKEGCAk+JFFurwh
	A/VoQvxQfCKgGyaGnzIscwH3s+avLqtQF9jyGAM7Q8HJo1+YCqdsXZAMdn8BP6u/
	CeXYiF+QLc6DLfZWZr0z2+xXkt5/4va74qko67jNOQgFE6cDu8BFXGe+0EmG7kSY
	cTEDQGf4LYCbfka9Mb/BNB7kEMSiZon8GDaI0vs3xl8EZtCv4EiqcP1gjNirbfk2
	qWlBZj0kXIRiWf8ZTnl0oKuRrc/VFvJ4rDL7FbLciaLu+5Xcv16F26YZY2+P5bAe
	6zbx1fpBdjFOxQQruEsjc5SyOeM+AMyApBDu9C1ch9uB4RUvlydBagM5dlqsKkat
	06y4xA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrea92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 19:10:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86625400C8;
	Wed, 26 Feb 2025 19:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10BB54FF132;
	Wed, 26 Feb 2025 17:54:13 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 17:54:12 +0100
Message-ID: <248f63ff-b6ec-4f58-8a96-7aee2fcd6038@foss.st.com>
Date: Wed, 26 Feb 2025 17:54:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Clement LE GOFFIC
	<clement.legoffic@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
 <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
 <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
 <55beb3e7-65ac-4145-adae-fb064378c78d@kernel.org>
 <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
Content-Language: en-US
In-Reply-To: <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01



On 2/26/25 16:30, Alexandre TORGUE wrote:
> 
> 
> On 2/26/25 16:08, Krzysztof Kozlowski wrote:
>> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>>> +        hdp: pinctrl@44090000 {
>>>>>>> +            compatible = "st,stm32mp-hdp";
>>>>>>
>>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>>> compatible.
>>>>>
>>>>> Ok so I will use "st,stm32mp15-hdp"
>>>>
>>>>
>>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>>> components for stm32mp15!
>>>
>>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>>> STM32 story we didn't have a clear rule/view to correctly naming our
>>> compatible. We tried to improve the situation to avoid compatible like
>>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>>> it represents a SoC family and not a real SoC. We haven't had much
>>> negative feedback it.
>>>
>>> But, if it's not clean to do it in this way, lets define SoC compatible
>>> for any new driver.
>>
>> Compatibles are for hardware.
>>
>>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>>> those SoCs).
>>
>> No, it's three compatibles, because you have three SoCs. BTW, writing
>> bindings (and online resources and previous reviews and my talks) are
>> saying that, so we do not ask for anything new here, anything different.
>> At least not new when looking at last 5 years, because 10 years ago many
>> rules were relaxed...
> 
> So adding 3 times the same IP in 3 different SoCs implies to have 3 
> different compatibles. So each time we use this same IP in a new SoC, we 
> have to add a new compatible. My (wrong) understanding was: as we have 
> the same IP (same hardware) in each SoC we have the same compatible (and 
> IP integration differences (clocks, interrupts) are handled by DT 
> properties.

Just to complete, reading the Linux kernel doc, as device are same we 
will use fallbacks like this:

MP15: compatible = "st,stm32mp151-hdp";
MP13: compatible = "st,stm32mp131-hdp", "st,stm32mp151-hdp";
MP25: compatible = "st,stm32mp251-hdp", "st,stm32mp151-hdp";

> 
>>
>>
>> Best regards,
>> Krzysztof

