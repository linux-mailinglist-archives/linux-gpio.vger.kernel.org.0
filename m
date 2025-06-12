Return-Path: <linux-gpio+bounces-21463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE3AAD71AF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E51711718F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7F023E336;
	Thu, 12 Jun 2025 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XwySzSf7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249341F3FF8;
	Thu, 12 Jun 2025 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734634; cv=none; b=oJZMhtVYOwqThpMwPkyHyjj/FJC8iKCKjTaWECiP4Sv/nPfdaUXshtl4A5q77ntoE4r/q4jfbw6nEDfvSRoZBTs1S8/ej1JwTGJW/2mexANKDiaJeCegL9Za2mBNVLAzaFYV6GDB+6+FviMeISItnajwTreF89XQKx6MHft7Tj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734634; c=relaxed/simple;
	bh=o479zEcN34If9gsRNoa+Rb2aUKHYTD0HfZNmEYpZ9lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IOJkq7C4levHdnUTndtJ6JVvQIKQlUw892MYrHnyIKaQ1FVwjXVPqJi0q/SAVrv3oCZqy800uuOwFnWZ/qbl7Z/ZWhL3syWoH/X8Csyt0kIr5h3KuLJ3vWfZIWrBtjKzGbCUEN8kW+Dp0qVh+oiJjRsmLMOxtemXI2rSvBQR6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XwySzSf7; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDDwF7016289;
	Thu, 12 Jun 2025 15:23:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/s+c05XapIIjOVl+x1SSWFS08/sFZmEJD1dfE0OiG48=; b=XwySzSf7vwO2P0p2
	vm2H5MB9V4+yrLkmjAnpj1548o8qvKx+tEsePRnYdkDESf5nKtghaTjoTN5yCIc2
	RiZPqhi+UXjWtGVH5qfTC7tKymH34oIqTPvzLDCBzT5By7htHST9yT0KKaWzI8fW
	Zpz8Qev6wtXnQE5P/ZGxglBxzs43kk4WBNTYO7k3Y2TIdN4FZ+Zrx4S+juKv/Mv9
	Yd7617eWJhu8HkkRVpqSy4xvAaZo56hTzPYJOdP5+xp/94tsHQPG1rez+jDDSPPO
	XsJJteSRjX3U7PODiRYJuwGTiNvvaFb+WO7De25n4xm/bqYP7whYcNZqljkEScUu
	ichOIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs30nga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 15:23:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 76E2C40078;
	Thu, 12 Jun 2025 15:22:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1CA4AFD842;
	Thu, 12 Jun 2025 15:21:24 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:21:23 +0200
Message-ID: <49e5b9ca-6860-4ebe-9856-ae550e1aff42@foss.st.com>
Date: Thu, 12 Jun 2025 15:21:22 +0200
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
 <782763e2-99d6-4533-b0db-79b618577586@foss.st.com>
 <30f8e319-4103-44ba-8f98-c01e7b0ba76c@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <30f8e319-4103-44ba-8f98-c01e7b0ba76c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-12_02,2025-03-28_01

On 6/12/25 15:09, Krzysztof Kozlowski wrote:
> On 12/06/2025 15:02, Clement LE GOFFIC wrote:
>> On 6/12/25 13:05, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 11:31, Clement LE GOFFIC wrote:
>>>> On 6/11/25 17:48, Krzysztof Kozlowski wrote:
>>>>> On 11/06/2025 16:08, Clement LE GOFFIC wrote:
>>>>>> On 6/11/25 08:35, Krzysztof Kozlowski wrote:
>>>>>>> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>>>>>>>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>>>>>>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>>>>>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>>>>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +		};
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>>>>>>>         			status = "disabled";
>>>>>>>>>>>>>
>>>>>>>>>>>>> Why are you disabling it? What is missing?
>>>>>>>>>>>>
>>>>>>>>>>>> Nothing is missing just disabled by default.
>>>>>>>>>>>> The node is then enabled when needed in board's dts file.
>>>>>>>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>>>>>>>> I asked what is missing. Drop.
>>>>>>>>>>
>>>>>>>>>> Hi Krzysztof, OK I better understand now.
>>>>>>>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>>>>>>>
>>>>>>>>> These are not properties of this node.
>>>>>>>>
>>>>>>>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>>>>>>>> I don't get it..
>>>>>>>
>>>>>>> These properties have no meaning here, so the hardware description is
>>>>>>> complete. You claim that you miss them thus device is incomplete is just
>>>>>>> not correct: these properties do not belong here! They belong to the
>>>>>>> board but even there they are totally optional. Why would they be a
>>>>>>> required resource?
>>>>>>>
>>>>>>> To remind: we talk here ONLY about required resources.
>>>>>>
>>>>>> Yes, 'pinctrl-*' properties belongs to the board and are not required.
>>>>>> So nothing is missing.
>>>>>>
>>>>>> This hdp node in the SoC dtsi file can be enabled by default.
>>>>>> But the hdp driver will probe and do nothing because without the
>>>>>> 'pinctrl-*' properties from the board files it would not be able to
>>>>>> access to any pin.
>>>>>
>>>>>
>>>>> Pinctrl has other features in general, including interfaces to userspace
>>>>> (as pretty often combined with gpio, although not sure if relevant here).
>>>>
>>>> You're right. Also HDP pinctrl has a GPO feature accessible from userspace.
>>>> But by default the HDP is not connected to any pad; it needs the board
>>>
>>> OK, then that was the answer to my first question - what is missing.
>>> However aren't these pads connected internally also to other parts of
>>> the SoC (like in most other vendors)?
>>
>> No, HDP "output pads" are only connected to SoC pinctrl to route outside
>> the internal SoC signals for debug purpose.
>>
>>>> 'pinctrl-*' properties to configure the SoC pinctrl and expose HDP on
>>>> the SoC pads.
>>>>
>>>> That's why for me the enabling of the driver should be in the board file
>>>> together with the SoC pinctrl configuration.
>>>
>>> And what are the default pad settings configured by HPD driver in
>>> bootloader (and by bootloader I mean one of few bootloaders this is
>>> going to be used on like U-Boot)
>>
>> The default is to use the GPIO of the SoC pinctrl. The HDP is not routed
>> outside.
>>    >>
>>>> The userland cannot change the pinctrl alternate function mux, this is
>>>> statically defined by the devicetree.
>>>
>>> If you expose GPIO then userland needs this regardless of alternate mux.
>>> IOW, board level could not configure mux because it should be always
>>> configured to safe GPIO input.
>>
>> For userland sight view, SoC GPIO are preferred instead of HDP.
>> HDP is only GPO not GPIO. 'pinctrl-*' properties configure at the same
>> time the SoC pinctrl mux to HDP and the HDP pinctrl mux to one of the
>> HDP functions (e.g. GPO).
> Thanks, that's explains, fine to keep it disabled. Unless it is obvious
> for everyone, it would be nice to put it in commit msg.

You're welcome, so I'll provide the V6 with more information in the 
commit message of patch [5-7] among other needed fixes.

> 
> Best regards,
> Krzysztof


