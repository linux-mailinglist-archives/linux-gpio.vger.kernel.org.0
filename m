Return-Path: <linux-gpio+bounces-21444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C26FAD7118
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D823B2234
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1587F23C515;
	Thu, 12 Jun 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dAr2YaZ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790E23A58B;
	Thu, 12 Jun 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733484; cv=none; b=L3FgSVC66/hD158eihCxurO3Eolkmb4UgrHKCqjOT3BDLcZfxFK4k/oeAreKqFAUQMf1onbbMVvICQX1yx2KBIo4mGffNW/gHgqV88ofKMpFnc7X/YK6vFnbHNuVM3Guo+5Zq5hXrk68clasGvMrJEYOAujMoYFnSb2svl7vs8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733484; c=relaxed/simple;
	bh=4UFDFeoe7EB6tQy/EkC230pjAKgF8cr6eInUsXKP8T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rdsLeXAZ528+Ubj3VKdAwVxbEHpWKXnCNK62A/zKzLAc7j/OO0xYVkLD6MZqnrqx356sep/2zkbQ1Ji21glphInO24N7FY++Xi2Sem4gu0xOa6Dr14pGPViHIo9cC0nB0/faX0DLjMHAZssnvm2syrWdFhs8JUbjI/nbjbuxEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dAr2YaZ1; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCNNFN024136;
	Thu, 12 Jun 2025 15:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xgUlRHqrOgjoIr0Ken2L714FlmdoDE0xA4Gj6ELLtuY=; b=dAr2YaZ1sX7fLlr4
	qIJtWMwLwt0MLr5MHKrK4dGxNw2ETtYSi2iYYwSjgJZZoe7pu6Z+FpxLYIBC65q3
	L1k3ToqJl2w+O1gIIrkuVi019NXuGoI9O3N4usFcC5H0VJ04v+YKi0Wt+KSLFvcE
	CfY+NKdw6gDnJBQzWSJbgR/k9OXf8x8yDRURcNI3AjzX+IKF8+ckI186VtX0KcMf
	PvdvxvbE3AMPswfPQnoAkr7+IEo2KufhY2qBSXbAcEloo32YVEjy1rkV91/uTPzZ
	E26qrJcRhDoyF2IyPgTlg1+/WiPEo0e5aGdOhElP4bIZyobA+ELz89Y42Fm/Uumd
	c2a2nA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs30j8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 15:04:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 903E240071;
	Thu, 12 Jun 2025 15:03:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80866AFB28F;
	Thu, 12 Jun 2025 15:02:16 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:02:15 +0200
Message-ID: <782763e2-99d6-4533-b0db-79b618577586@foss.st.com>
Date: Thu, 12 Jun 2025 15:02:13 +0200
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
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
 <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
 <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
 <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01

On 6/12/25 13:05, Krzysztof Kozlowski wrote:
> On 12/06/2025 11:31, Clement LE GOFFIC wrote:
>> On 6/11/25 17:48, Krzysztof Kozlowski wrote:
>>> On 11/06/2025 16:08, Clement LE GOFFIC wrote:
>>>> On 6/11/25 08:35, Krzysztof Kozlowski wrote:
>>>>> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>>>>>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>>>>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>>>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>>>>>
>>>>>>>>>>>> +		};
>>>>>>>>>>>> +
>>>>>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>>>>>        			status = "disabled";
>>>>>>>>>>>
>>>>>>>>>>> Why are you disabling it? What is missing?
>>>>>>>>>>
>>>>>>>>>> Nothing is missing just disabled by default.
>>>>>>>>>> The node is then enabled when needed in board's dts file.
>>>>>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>>>>>> I asked what is missing. Drop.
>>>>>>>>
>>>>>>>> Hi Krzysztof, OK I better understand now.
>>>>>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>>>>>
>>>>>>> These are not properties of this node.
>>>>>>
>>>>>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>>>>>> I don't get it..
>>>>>
>>>>> These properties have no meaning here, so the hardware description is
>>>>> complete. You claim that you miss them thus device is incomplete is just
>>>>> not correct: these properties do not belong here! They belong to the
>>>>> board but even there they are totally optional. Why would they be a
>>>>> required resource?
>>>>>
>>>>> To remind: we talk here ONLY about required resources.
>>>>
>>>> Yes, 'pinctrl-*' properties belongs to the board and are not required.
>>>> So nothing is missing.
>>>>
>>>> This hdp node in the SoC dtsi file can be enabled by default.
>>>> But the hdp driver will probe and do nothing because without the
>>>> 'pinctrl-*' properties from the board files it would not be able to
>>>> access to any pin.
>>>
>>>
>>> Pinctrl has other features in general, including interfaces to userspace
>>> (as pretty often combined with gpio, although not sure if relevant here).
>>
>> You're right. Also HDP pinctrl has a GPO feature accessible from userspace.
>> But by default the HDP is not connected to any pad; it needs the board
> 
> OK, then that was the answer to my first question - what is missing.
> However aren't these pads connected internally also to other parts of
> the SoC (like in most other vendors)?

No, HDP "output pads" are only connected to SoC pinctrl to route outside 
the internal SoC signals for debug purpose.

>> 'pinctrl-*' properties to configure the SoC pinctrl and expose HDP on
>> the SoC pads.
>>
>> That's why for me the enabling of the driver should be in the board file
>> together with the SoC pinctrl configuration.
> 
> And what are the default pad settings configured by HPD driver in
> bootloader (and by bootloader I mean one of few bootloaders this is
> going to be used on like U-Boot)

The default is to use the GPIO of the SoC pinctrl. The HDP is not routed 
outside.
  >>
>> The userland cannot change the pinctrl alternate function mux, this is
>> statically defined by the devicetree.
> 
> If you expose GPIO then userland needs this regardless of alternate mux.
> IOW, board level could not configure mux because it should be always
> configured to safe GPIO input.

For userland sight view, SoC GPIO are preferred instead of HDP.
HDP is only GPO not GPIO. 'pinctrl-*' properties configure at the same 
time the SoC pinctrl mux to HDP and the HDP pinctrl mux to one of the 
HDP functions (e.g. GPO).

Best regards,
Clément

