Return-Path: <linux-gpio+bounces-16704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C987A47D90
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550E9177003
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5624A22DF9F;
	Thu, 27 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nJwZcULP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEB22D7BE;
	Thu, 27 Feb 2025 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658732; cv=none; b=gJLe10ZgRpSEsRtsa3Hm8OXl7AbilT0Z11D9FQU+jobPQNV6Q6U+Mqm++o5s8z+afJ9X0rJ+yeVl1plryfm7GVcoYclPuVcdnHqgZHgI4549NVGO5aMIU84HFZybYv7hPs6YtDhLtN9jycodWOr8gEeBlrT+LT2nLm0PHrKSYDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658732; c=relaxed/simple;
	bh=MslIQA5QHTBZ8/xByWEGkAlB0Wtbl/MEE+cgVdbemrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kLa0RLvXx2COsd0udkifgHryCFXJG5ppljmnq+s1ZfdWYjjVcM4awZ4Ymzw3pJGrTWSNMNbSHUqpnR+uyCZgp++KSA/sUAfV9ZfzT5E1DUBlc+Da6ORt/n+N2otpLwN011hXJ5RefcGVVPHUQhObzxMxdtekANJH29vmIqFMNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nJwZcULP; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9RU3K012382;
	Thu, 27 Feb 2025 13:18:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5VtVpJbGl3ABqgeyotfSFZTXggVBvrafMpv9raSwNMI=; b=nJwZcULPguYTFbLK
	s00zfJzJvVpHQh6/3RohsrUhqhjn5Uu6s/W72KrdQhfvtEj9v+b+VBIjBKouXUJc
	cTA0ai1DvN6SC2Qa3r7gMUqs2gSODT9cie56XWXiyf9MYzV1yuPJgY7Gtu0dmXvh
	Z/3KS9y5wUYK6E415GV7CkqaP48Iv9fyC018NbQ/6iRK99WgnP/BKdDKh66+hW5Y
	LZqNKHjDzI9l8hcBnnQ8qB8f1u8X80M9IY0sAcmgA2fNjLo9VizKFhsty8DZWyti
	Hny0mmZFyCUzaLhMZyZdzQn3vcIdkOp13Whwhn8ebzvG13LCYBjw22njwSWnOnHs
	NRhWRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psvah7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 13:18:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45CEC40045;
	Thu, 27 Feb 2025 13:17:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73A2540E4F0;
	Thu, 27 Feb 2025 13:16:43 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 13:16:42 +0100
Message-ID: <df74157e-d141-4045-a244-3168c58c0ff4@foss.st.com>
Date: Thu, 27 Feb 2025 13:16:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
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
 <48cc626a-d632-444f-8563-07a9ea0ecc71@kernel.org>
 <17450f7d-d398-4a75-8b53-6c9c396661ab@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <17450f7d-d398-4a75-8b53-6c9c396661ab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_05,2025-02-27_01,2024-11-22_01



On 2/26/25 22:31, Krzysztof Kozlowski wrote:
> On 26/02/2025 22:26, Krzysztof Kozlowski wrote:
>> On 26/02/2025 16:30, Alexandre TORGUE wrote:
>>>
>>>
>>> On 2/26/25 16:08, Krzysztof Kozlowski wrote:
>>>> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>>>>> +		hdp: pinctrl@44090000 {
>>>>>>>>> +			compatible = "st,stm32mp-hdp";
>>>>>>>>
>>>>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>>>>> compatible.
>>>>>>>
>>>>>>> Ok so I will use "st,stm32mp15-hdp"
>>>>>>
>>>>>>
>>>>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>>>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>>>>> components for stm32mp15!
>>>>>
>>>>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>>>>> STM32 story we didn't have a clear rule/view to correctly naming our
>>>>> compatible. We tried to improve the situation to avoid compatible like
>>>>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>>>>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>>>>> it represents a SoC family and not a real SoC. We haven't had much
>>>>> negative feedback it.
>>>>>
>>>>> But, if it's not clean to do it in this way, lets define SoC compatible
>>>>> for any new driver.
>>>>
>>>> Compatibles are for hardware.
>>>>
>>>>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>>>>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>>>>> those SoCs).
>>>>
>>>> No, it's three compatibles, because you have three SoCs. BTW, writing
>>>> bindings (and online resources and previous reviews and my talks) are
>>>> saying that, so we do not ask for anything new here, anything different.
>>>> At least not new when looking at last 5 years, because 10 years ago many
>>>> rules were relaxed...
>>>
>>> So adding 3 times the same IP in 3 different SoCs implies to have 3
>>
>> Yes. Always, as requested by writing bindings.
>>
>>> different compatibles. So each time we use this same IP in a new SoC, we
>>> have to add a new compatible. My (wrong) understanding was: as we have
>>
>> Yes, as requested by writing bindings and followed up by all recent
>> platforms having decent/active upstream support. See qcom, nxp, renesas
>> for example.
>>
>>> the same IP (same hardware) in each SoC we have the same compatible (and
>>
>> You do not have same hardware. You have same IP, or almost same because
>> they are almost never same, implemented in different hardware.
>>
>>> IP integration differences (clocks, interrupts) are handled by DT
>>> properties.
>>
>> Which binding doc/guide suggested such way? Countless reviews from DT
>> maintainers were saying opposite.
> I was not precise: IP integration differences are of course handles as
> DT properties, but I wanted to say that it does not solve the problem
> that IP integration means you might have differences in this device and
> you should have different quirks.

Yes I agree. We'll take care of it for future development. Maybe, It 
would be nice to apply this rule in our current drivers/DT already 
upstream ?

> 
> And the example in this patchset: entirely different pin functions is a
> proof. This device behaves/operates/integrates differently, thus
> different compatible.

Yes, discussing with Clement, it is clear that we need 3 different 
compatibles.

> Best regards,
> Krzysztof

