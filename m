Return-Path: <linux-gpio+bounces-21171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50227AD35B3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A22918986F2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BD428EA6B;
	Tue, 10 Jun 2025 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IBiW8Pd2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741AD28EA58;
	Tue, 10 Jun 2025 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557578; cv=none; b=dXtpLNTVKr+RQCfhM7HaE4LXr3jPVOoF20FUu+CqyfWmQW+LMnD3VLho2MUXHNDWXYWmldK4hxZInW57oo2YrfU0wJ1QTfWMFGaPkjLPxU9XznvDEKlr7HFnMk2gUUXnPV3ysdEEL0BxHo6vMraTuUH125+t2jv2FUkeZTuO1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557578; c=relaxed/simple;
	bh=zTU3AkzKUPbLNpOvwNZlm0Nojlq2PZZ8y5WaFs4xjW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M89iYi0eSwr2U21dsupbaZFdAhjSrLOEqtWqf8EMMPZ1KsQTjEzU8h9owDCxj76VUv960Rwa9j1xG4kVqfEHYPgpLPOT1XGGMVd5a+d5jpWV9GW55AB7lKO6Ew89dc5KLjHC9Vjgfqk7xFw7WHMFfCk76HODk0YSXBH6duxbkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IBiW8Pd2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC97NU007654;
	Tue, 10 Jun 2025 14:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3JoIjs0rN0Mef0RCPvvnCGsgeRN+4kOPLLI4ZD9o2Mw=; b=IBiW8Pd2ALdNOtHN
	XRPdHmX5cTFMzfSFGNahSDjWx6E60NVZHz7RlKXUmNwfGV20G7xd9V9G3HiR6ujB
	s+AZQL0BORu4XoQQw2qgCAB1ogBecjXstW5BDDTJ1IdEXR5HIP5dzWhaDQwR2xTr
	DN++VSdsEGrCF7mKiFWci9lVp2CO6zMKD0zCB5hhG1erz3Wu/jwuqg/GKdjloTbj
	tBUQ6/vo43atWvHUG7qXWWX2LRMnpUjlBn8AmANT14iUFewIlwezop9IJIL2CRl5
	Q6Pbbq/R0mNtnUVfPtNb2+Az+ReLy0hp7cE7LzTFCBZ5rEOk5XssMErKjm6G6nvk
	K0WZLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2mt3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:12:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C66614006E;
	Tue, 10 Jun 2025 14:11:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB802B39A25;
	Tue, 10 Jun 2025 14:11:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:11:26 +0200
Message-ID: <e4a1bbd0-3886-4a88-bfaf-1e5ce5b27625@foss.st.com>
Date: Tue, 10 Jun 2025 14:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
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
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-5-7e9b3ad2036d@foss.st.com>
 <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01

On 5/29/25 11:13, Krzysztof Kozlowski wrote:
> On 28/05/2025 15:30, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp13 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index 8512a6e46b33..9e3797ee1f7b 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -954,6 +954,13 @@ dts: thermal@50028000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		hdp: pinctrl@5002a000 {
>> +			compatible = "st,stm32mp131-hdp";
>> +			reg = <0x5002a000 0x400>;
>> +			clocks = <&rcc HDP>;
>> +			status = "disabled";
> Don't send new versions while discussion is going.
> 
> My comments are still valid here.
> 
> Best regards,
> Krzysztof

Ok keep discussing in the V3 so.

Clément

