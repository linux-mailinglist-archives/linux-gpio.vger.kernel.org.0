Return-Path: <linux-gpio+bounces-20655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE672AC6905
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 14:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5DE91BC1CA6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD34728468C;
	Wed, 28 May 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P8uR/8ZY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D64283C8D;
	Wed, 28 May 2025 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434626; cv=none; b=AjdJlM15lDt9kFyDL8wKV7bHBMyhTcHvX6GxEzmMMntG8o0vJxp+tB90PhM4RazPlvkmuMWcvL9WWBvqjvN1hEVdR35uelFGBtI7ds0khqVoEATC5/hkKVg6bofoXSR/d556Pgrym94C8bhJOZ74e/3T0LE3FdEWXp+aR3nNkmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434626; c=relaxed/simple;
	bh=yJWSGnn3wp/DMSOtHLPOXPAfp4dcohM8iFhmiHG7eYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EjF/dtbKpudHdQ/yC/rER4t64JEfcXdmhFgMm09PeV9yM6o4M4B9SDGeScGr6Y9KwoNSwgEodrCtm77cy05P/0SwUyLHJ7aGkufiRBDSg6WZKCbH44WD6NwT3neGtYm5EJ+S9qTZT6hQdbKpHxdPhZaBYGDzQEFWHek9UptZaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P8uR/8ZY; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB7A5E007927;
	Wed, 28 May 2025 14:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gsxchGz+NPMbQD+2/mdAAZvARKNk9ZKprAWBWXssYfg=; b=P8uR/8ZYHA6PyU+p
	1yQYTn8+drhMGTmu/DwUOUFEmJY6sFik+XP7pbPz0hRRgOgJdATJhYeD+ClTZxvW
	OfwmpHZkxYvD83+alQD1NSA43S/Ma1WerAhlvHAHY3sKa4nva2yaT7tvmQESC8Xy
	MNtWCjm8Evwhv9FJG61K3A7gKhoP2rkAFns0EQRDXcncu5yIYuQAvrycmWQBj6AJ
	/+QwsZJ43IrNZdjnZR9bWlQkQskQ/Yyy7Xk/r48zr/K2Y/d30WGeyQ7CQPMiQQv6
	sO7e7tkct39wYJYdYW119O178HKQVb5ndHre0L6ztrjwyE8tacZF58sBBnYeal+x
	mcS98Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f2951g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:16:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF12C40049;
	Wed, 28 May 2025 14:15:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EC216D63CF;
	Wed, 28 May 2025 14:14:49 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 14:14:48 +0200
Message-ID: <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
Date: Wed, 28 May 2025 14:14:47 +0200
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01

On 5/28/25 10:55, Krzysztof Kozlowski wrote:
> On 23/05/2025 14:38, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp13 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index 8512a6e46b33..b0537bcdb9d5 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -951,6 +951,12 @@ dts: thermal@50028000 {
>>   			clocks = <&rcc DTS>;
>>   			clock-names = "pclk";
>>   			#thermal-sensor-cells = <0>;
> 
> Why are you enabling it? Commit msg should explain this and this should
> be sparate patch.

Oops good catch I'll fix this.

> 
>> +		};
>> +
>> +		hdp: pinctrl@5002a000 {
>> +			compatible = "st,stm32mp131-hdp";
>> +			reg = <0x5002a000 0x400>;
>> +			clocks = <&rcc HDP>;
>>   			status = "disabled";
> 
> Why are you disabling it? What is missing?

Nothing is missing just disabled by default.
The node is then enabled when needed in board's dts file.

> 
>>   		};
>>   
>>
> 
> 
> Best regards,
> Krzysztof

Clément

