Return-Path: <linux-gpio+bounces-21401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0505AD589C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 16:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF9C1890C2D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142A5273D60;
	Wed, 11 Jun 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="slImy+QR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BB15B102;
	Wed, 11 Jun 2025 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651738; cv=none; b=Dw4mi2lhZlzHAJ55joBRh8LGpQ7eb2t7eBwdVme8pD68hfuBo5Zoe1XIJZ13o5QVeyKCwrpOTCC3AqdAC94njOWh2mFZ6u2TDBlBIuPY3k2atZ6Pr8pEl4KlzG8ZUFgQhDX+48jLKiDYM694kiif+qbchhi6TQDa5YbW5sFBvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651738; c=relaxed/simple;
	bh=MxkAPoPHOjgZGHnlpvUdpozWu5MFnKcrlN7m+0nR5Tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JHV1PnY5wSwVwZY8kWkT0Hr9iXWNvnQC4RenCKA41CSxaVb9fhwqrbl4Y7gspGKE/yglufaHR/rzXXAIMfkCaabfEbKPiEZdUhJj1S7IqK03rQ6qfFaJ026w3c4F0c+/dDMbAWFJCppnCzv6d9OxwEWIz1lSK4eOf2ZetAb4CXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=slImy+QR; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BDrZjD022309;
	Wed, 11 Jun 2025 16:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	r3EVnRbmSMlgRrDXB3H2BP/1li0w1Wem69SzKRryKtY=; b=slImy+QRerHTh1HU
	DGp3sqBUjbpbzZCKMOaa3BESUZhhR2hcTAY6+HsBb5ffnGMuxumTknxTMo28yi9K
	mu0Zu+nz6c2ycnQlXEUWXBCWWZu8BIlTHXY4RDdqQLZ8e3tD7av+vd5d7ifycU6V
	J5NjDzwHTFhIYAPnlbRYdZ2QwSDeaM0/NhpbblmhOPGD/Gf8Uc6xEgUl2xV6PK8x
	zDhf7yFiaaKt3YaTmx0+fEH+agbWtBF4FSKjTCmYeMSt8Co98XhPqY3sAPixCd0J
	jgzt3YYac9fOvo66CPMoRkyeXwRq5v7xrV/2M+JNBI1MjpHknsMhFC7WcXZlbV3x
	LE2vVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2u085-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 16:21:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE89940059;
	Wed, 11 Jun 2025 16:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B159DB23F16;
	Wed, 11 Jun 2025 16:08:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:08:27 +0200
Message-ID: <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
Date: Wed, 11 Jun 2025 16:08:26 +0200
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01

On 6/11/25 08:35, Krzysztof Kozlowski wrote:
> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>      			status = "disabled";
>>>>>>>
>>>>>>> Why are you disabling it? What is missing?
>>>>>>
>>>>>> Nothing is missing just disabled by default.
>>>>>> The node is then enabled when needed in board's dts file.
>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>> I asked what is missing. Drop.
>>>>
>>>> Hi Krzysztof, OK I better understand now.
>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>
>>> These are not properties of this node.
>>
>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>> I don't get it..
> 
> These properties have no meaning here, so the hardware description is
> complete. You claim that you miss them thus device is incomplete is just
> not correct: these properties do not belong here! They belong to the
> board but even there they are totally optional. Why would they be a
> required resource?
> 
> To remind: we talk here ONLY about required resources.

Yes, 'pinctrl-*' properties belongs to the board and are not required.
So nothing is missing.

This hdp node in the SoC dtsi file can be enabled by default.
But the hdp driver will probe and do nothing because without the 
'pinctrl-*' properties from the board files it would not be able to 
access to any pin.
I consider enabling this driver by default in SoC dtsi file as just 
increasing the boot time on "every" board.
It's the board dts that requires the hdp and provides the 'pinctrl-*' 
properties to connect the hdp to some SoC pin and then to some signal on 
the board. For me it's natural to have the status okay only in the board 
dts file.

>>
>>>>
>>>> In the last patch of my serie I add them (only for stm32mp157f-dk2) but
>>>> keep it disabled because the pin is on an external connector (the
>>>> Arduino connector of the board).
>>>> This prevent any issue with a possible connected module.
>>>
>>> Not relevant. Pin control for connector are board specific, but pinctrl
>>> SoC part is SoC.
>>
>> I think we don't understand each other here too. I don't understand the
>> end of your sentence "pinctrl SoC part is SoC".
> 
> Please read first how DTS is organized.
> 
> The pin controller device is part of SoC not part of a board.
> 
> Pins configuration for devices on the board are not part of the SoC.
> What is not clear here? We talk here in terms how DTS is supposed to be
> organized.

Now everything is clear, you want me to just set status enable in soc 
dtsi file but I disagree, keep discussing.

> 
>>
>> Maybe some informations that could help:
>> The 'pinctrl-*' properties are used in the HDP case to select the
>> internal signal to output AND the alternate function on the pin to
>> output the HDP function.
> 
> We all know this.

Ok fine

Best regards,

Clément

> 
>>
>>> Best regards,
>>> Krzysztof
>>
> 
> 
> Best regards,
> Krzysztof


