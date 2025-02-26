Return-Path: <linux-gpio+bounces-16617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40548A45C04
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8863A77AA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4CE24DFE8;
	Wed, 26 Feb 2025 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="L5QE9qAH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE44238170;
	Wed, 26 Feb 2025 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566365; cv=none; b=TN9iWkaus2Q+c9KS3URhuR6XBkbuc4A2Rtg/30xyfIxdXQCag2Vz8eq/IBmrjWx+K2HsvfCq3MTjGufwjS1QFVRXzg7Q9PdZ0dxhuGl88ShrA0aDgvE13wDg8NJArQQGKSIhCBTpO/yJlxt1gFmXG7m6M+3dLwEiH9luNh1+1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566365; c=relaxed/simple;
	bh=NrarBek56uZxDZEPM93Oqgy8N6FqDNNWnxTnWqaqfFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P8YYGcXuttqB88AGJ9smwc0p+KUVVSV8x1bcjhBY/LgtA2eYkWNQ4h0xCyjgbbOo1N8F2KJVyF4tvNs9EfpFEkqFC+LY5k8ugXNPO3hBI2/23ZB2hUsgpbKP6ecuUL4uq5N9Rl4LBLHEHj+u6+0j2wpwaP2N9z22b2whl0NOjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=L5QE9qAH; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q8p0Zu015440;
	Wed, 26 Feb 2025 11:39:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	r6EeS/1e2mk1YAgnjgtBzqRGy/8kMpjtGs49piq0D0c=; b=L5QE9qAHsY8p2q2y
	GK0BVRIAOPU8OoNVa7s5NOyCOPheqBGKtNDvftIP7T4ipdE0mnTg65cidM8ReFuk
	7C2yUAr/qqFd/1fLzL7KL39sGOn9EyWyOWNy5qoSfWkvJ+0wbQUlHGWxK869loTx
	rya5AyDXShceg/vx3gmE6B83sZWoB79G0jqZhHpXDInQAs+qCR4E5W8AxT66XVYv
	xduJw6vKpU5l1vGHMuTqTnrprUQ194zHSEUIZsVe5OHVosFYp3kCa0iTgOGLIKeD
	h5yvghK+Mnn5oGDguugDLCkyI5X78jOsNq88slAI+GFPE7Dx9vtIU9uTuDyr32Wl
	gqgxBw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psubfhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:39:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4A22A4004C;
	Wed, 26 Feb 2025 11:38:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 252624E1E64;
	Wed, 26 Feb 2025 10:33:37 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:33:36 +0100
Message-ID: <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
Date: Wed, 26 Feb 2025 10:33:35 +0100
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
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01

Hi Krzysztof

On 2/26/25 08:23, Krzysztof Kozlowski wrote:
> On 25/02/2025 17:09, Clement LE GOFFIC wrote:
>> On 2/25/25 14:05, Krzysztof Kozlowski wrote:
>>> On 25/02/2025 09:48, Clément Le Goffic wrote:
>>>> Add the hdp devicetree node for stm32mp25 SoC family
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> ---
>>>>    arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>>> index f3c6cdfd7008..43aaed4fcf10 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>>>> @@ -918,6 +918,13 @@ package_otp@1e8 {
>>>>    			};
>>>>    		};
>>>>    
>>>> +		hdp: pinctrl@44090000 {
>>>> +			compatible = "st,stm32mp-hdp";
>>>
>>> So here again - you have stm32mp251 SoC, but use entirely different
>>> compatible.
>>
>> Ok so I will use "st,stm32mp15-hdp"
> 
> 
> This means this is stm32mp15 SoC. I do not see such SoC on list of your
> SoCs in bindings. What's more, there are no bindings for other SoC
> components for stm32mp15!

Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the 
STM32 story we didn't have a clear rule/view to correctly naming our 
compatible. We tried to improve the situation to avoid compatible like 
"st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced 
"st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes 
it represents a SoC family and not a real SoC. We haven't had much 
negative feedback it.

But, if it's not clean to do it in this way, lets define SoC compatible 
for any new driver.
For the HDP case it is: "st,stm32mp157" and used for STM32MP13, 
STM32MP15 end STM32MP25 SoC families (if driver is the same for all 
those SoCs).

regards
Alex


> Something is here not matching - this change, this DTSI, top level
> bindings or all of your SoC device/blocks bindings.
> 
> 
> 
> Best regards,
> Krzysztof

