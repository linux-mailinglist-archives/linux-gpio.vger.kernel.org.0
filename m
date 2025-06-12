Return-Path: <linux-gpio+bounces-21423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B3AD6C54
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 11:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5F73AE0D9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B7922D4F1;
	Thu, 12 Jun 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qO5rOYU0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861171F583D;
	Thu, 12 Jun 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720860; cv=none; b=db2vdSqrfgrMtXXSZQzd14spIX64T+NJH/nDOtKXfelh0oFygtTz4B7P3luF0gBfmJiZC+OOUMWnlydhjDxI318MVY2sgR2yCUeH7WTTzh7noxnz7eTaDx57VHf0VRjYNvRwYRAxJFrqIXbIz/iRU11fOG3LgLsbs9Oh+813q0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720860; c=relaxed/simple;
	bh=tvKi11/Xkd3O2SZPfJvGSMJ9ZSemya87PNDiJLRQewM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tE0IGkf7BCCO++WyzA7KcOO3DvuTMBXjV74FeLAJASEb+tJfZvTdDCqGkfu6+ZqvI/ebVugkpIsmmLKJxTgOW3n7BxHd/lCGxcA5EO1NxH+6sNbXkJQBLQDzcLDCGGZz2jtvNU9DKo43wl3owAb/px5KqkC2S0JVLHD048ukqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qO5rOYU0; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8k9nE016328;
	Thu, 12 Jun 2025 11:33:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	H8jaND8JdJUfBA787uQMniXNfew6S91UWnfQYEWlZ9U=; b=qO5rOYU0QE+X8XW7
	zu/24y84QT2IzGy37w3R3VQpSZ+z9t7ptH7JgINU5lgqbgQP1sP0zWp7JBVgsIBI
	GHWxK5kV5nkDgGuMHA/AbE59Z6P0hQhx1b2+uGPinJcT7IYN7LZgpjz49Tf05Hjd
	cSzfQiiTh/MpTFvSUByZ2Bpn4iTqaS6ymx/U1wIRYFCVrAVj/0ZZMGCx9Gtf3HCp
	jj3CSEA59A28uRrxZqdJKK9hbAnJmJQXA20279c+8JTE39ycgm2dzHtP9pGSk0Gn
	ZVytPF4MM0R9EPLovMnKtsqeqNASTWYJDjEXGmSBwf6NTCCUIKzrC9uM+dksf7M3
	5IsOUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2yf4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:33:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 787264005D;
	Thu, 12 Jun 2025 11:32:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01E0C6CF9BF;
	Thu, 12 Jun 2025 11:31:55 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 11:31:54 +0200
Message-ID: <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
Date: Thu, 12 Jun 2025 11:31:53 +0200
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01

On 6/11/25 17:48, Krzysztof Kozlowski wrote:
> On 11/06/2025 16:08, Clement LE GOFFIC wrote:
>> On 6/11/25 08:35, Krzysztof Kozlowski wrote:
>>> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>>>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>>>
>>>>>>>>>> +		};
>>>>>>>>>> +
>>>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>>>       			status = "disabled";
>>>>>>>>>
>>>>>>>>> Why are you disabling it? What is missing?
>>>>>>>>
>>>>>>>> Nothing is missing just disabled by default.
>>>>>>>> The node is then enabled when needed in board's dts file.
>>>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>>>> I asked what is missing. Drop.
>>>>>>
>>>>>> Hi Krzysztof, OK I better understand now.
>>>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>>>
>>>>> These are not properties of this node.
>>>>
>>>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>>>> I don't get it..
>>>
>>> These properties have no meaning here, so the hardware description is
>>> complete. You claim that you miss them thus device is incomplete is just
>>> not correct: these properties do not belong here! They belong to the
>>> board but even there they are totally optional. Why would they be a
>>> required resource?
>>>
>>> To remind: we talk here ONLY about required resources.
>>
>> Yes, 'pinctrl-*' properties belongs to the board and are not required.
>> So nothing is missing.
>>
>> This hdp node in the SoC dtsi file can be enabled by default.
>> But the hdp driver will probe and do nothing because without the
>> 'pinctrl-*' properties from the board files it would not be able to
>> access to any pin.
> 
> 
> Pinctrl has other features in general, including interfaces to userspace
> (as pretty often combined with gpio, although not sure if relevant here).

You're right. Also HDP pinctrl has a GPO feature accessible from userspace.
But by default the HDP is not connected to any pad; it needs the board 
'pinctrl-*' properties to configure the SoC pinctrl and expose HDP on 
the SoC pads.

That's why for me the enabling of the driver should be in the board file 
together with the SoC pinctrl configuration.

The userland cannot change the pinctrl alternate function mux, this is 
statically defined by the devicetree.

> 
>> I consider enabling this driver by default in SoC dtsi file as just
>> increasing the boot time on "every" board.
>> It's the board dts that requires the hdp and provides the 'pinctrl-*'
>> properties to connect the hdp to some SoC pin and then to some signal on
>> the board. For me it's natural to have the status okay only in the board
>> dts file.
> 
> The DTS is not the way to optimize boot processes. It is OS-independent
> hardware description. My BSD system for example uses smart driver which
> avoids probing, but also my user-space needs this device to talk over
> exposed interface, so why choice of Linux probing should affect others?

As I wrote above the HDP will not offer any functionality without the 
'pinctrl-*' properties in the board file.
If you insist, I can enable it in the SoC file but I really don't see 
any reason for that.

Best regards, Clément

> 
> Best regards,
> Krzysztof


