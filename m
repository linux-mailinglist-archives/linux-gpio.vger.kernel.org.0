Return-Path: <linux-gpio+bounces-16623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C520DA45F05
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 13:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 233AB163B84
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 12:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F20921ABA1;
	Wed, 26 Feb 2025 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MdEAhItm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180A214803;
	Wed, 26 Feb 2025 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572880; cv=none; b=tsWsO2en/oN5CzQjWe2zdKrRQtQVtd19VTLdrEyCo0ysOQOAqvetljVRKEje3QAT7IuZ1SvKAiui2hCQNF2q+71h4fE38hHvcCjJa6V2rHoNjREiV0YV75hQWcyXH5X6Fz7wQIkCvJ2QIfc3IUvON2YiaVUzNhXK3OjrQPgGEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572880; c=relaxed/simple;
	bh=K9oUygm4AKDUmgMf4aFOL3Lbp7QFh/wmXeF8uUXzjec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tM7CtNEWIS2dBlhmxGRzbwHSvZ6ab/QVcDvj5iXrEEa6vZtz5m/iYX0v9x21GiVAs9Tm09GWGz8aKr6reOPI3/b5eUI3ltDc+LrTBfVsd3Vdiw9NT/KUMjBm8ElvkZaUoEwtmnW/1+2Lxds+RjJRHQ2jp+pwkV03mDc1e1znNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MdEAhItm; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q8wODq012375;
	Wed, 26 Feb 2025 13:27:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hZZuGvujbz+DHcZWLDWVwgKdZX6e4AC0NKcxZ1Mlhwc=; b=MdEAhItmw3+E1u3C
	r8HueeBOvKLTCaKleXHh1C8dodj135VyASWo0XfJ2NifRuQ+x5lYfjjzWR3X6tNZ
	802co02i0Mxx6VYM7W6BoZCSIULZCePY/KRWEATaZLQAxf5AYkJ0yf4vhcgUHl3s
	OmG3W/wVw4GweHAFey0xk3IMjY1X0qCo7jpD4FsoH7GScd27EdJwj2wfRnV9ZNLn
	T6F4onw9J6qRweP5pioK2Dxie2OQQG5w26nW5KoQeoJaD7ajkK9qrFwT2+Qe41e7
	ZZYxL9oEobWQ1SoYMT7XqbOFC2djKKvCQh73Gtl5HSr/Ui749DxYb++YCioXf4fu
	SJFQ5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv4a64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 13:27:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA74B40051;
	Wed, 26 Feb 2025 13:26:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC916495277;
	Wed, 26 Feb 2025 11:52:59 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 11:52:59 +0100
Message-ID: <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
Date: Wed, 26 Feb 2025 11:52:58 +0100
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01

On 2/26/25 08:21, Krzysztof Kozlowski wrote:
> On 25/02/2025 16:51, Clement LE GOFFIC wrote:
>> On 2/25/25 14:04, Krzysztof Kozlowski wrote:
>>> On 25/02/2025 09:48, Clément Le Goffic wrote:
>>>> +
>>>> +maintainers:
>>>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>>>> +
>>>> +description: |
>>>
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>
>> Ok
>>
>>>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>>>> +  It allows to output internal signals on SoC's GPIO.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: st,stm32mp-hdp
>>>
>>> There is a mess in STM SoCs. Sometimes you call SoC stm32, sometimes
>>> stm32mp and sometimes stm32mpXX.
>>>
>>> Define for all your STM contributions what is the actual SoC. This
>>> feedback was already given to ST.
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +patternProperties:
>>>> +  '-pins$':
>>>> +    type: object
>>>> +    $ref: pinmux-node.yaml#
>>>> +
>>>> +    properties:
>>>> +      function:
>>>> +        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
>>>> +                "8", "9", "10", "11", "12", "13", "14",
>>>> +                "15" ]
>>>
>>> Function which has a number is not really useful. What does it even express?
>>
>> As said in my previous answer, function names are very different from
>> one platform to another. Numbers were used as string to be generic.
>> I'll consider it in a V2.
> 
> What does it mean "one platform to another"? This is one platform! Is
> this some sort of continuation of SoC compatible mess?

I may used incorrectly the word platform.
This driver is the same for the three SoC families STM32MP13, STM32MP15 
and STM32MP25 because the hardware is mostly the same.

Why mostly ?

The peripheral is behaving as a mux, there are 8 HDP ports, for each 
port there is up to 16 possible hardware signals. Numbered from 0 to 15.
Each of this number represent a signal on the port.

But the hardware signal behind the number is not the same from one SoC 
family to another.
As example, in STM32MP15 family the HDP is able to output GPU hardware 
signals because the family has a GPU but in the STM32MP13 family this 
signal is not present.

The purpose of my helpers was to give a readable name to facilitate the 
configuration in boards devicetree's. If needed I can get rid of that 
and use only the number as string.

> What are the exact functions written in datasheet?

The exact functions name written in the datasheet are the ones of my 
helper file without the HDP prefix.


> Best regards,
> Krzysztof


