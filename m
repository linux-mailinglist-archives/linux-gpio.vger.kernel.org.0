Return-Path: <linux-gpio+bounces-16580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB94A448EA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 18:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30076886997
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868CD1A2557;
	Tue, 25 Feb 2025 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wgvvxZWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457C197A7E;
	Tue, 25 Feb 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504618; cv=none; b=DkPsjB/DtUKKOSzv9edioic4zxA0Sp+IE8eaapc0lkajUkM7RxhqLJ0FJ9qBEUXI0vb2nsu0unltqjgGhMy8iLePY8gRGVsXqwhpC8/QGDzuP4r7GcFLNwV8YkqUqeG2cihy3tCei9S/fqfmiyEFY9moXRp0oi1JdIQczuXUiO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504618; c=relaxed/simple;
	bh=WJWgSb2paLZ+MN/WFfvZX9SdiP9wa/LhMyVe8shgwNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gQCDazcI7VkwBmRIgeomLfV7B8og2LLzHCh9YSqtYBC7wRXYxIyeGAcOrtSbNBOOHfqDnWgJWPPoJTjPevznA7oFV2FIBcnquubOnv9C/P2FOhma5pEnqnJEy5+8T0iIkBuIFMPp1evOFNEhEiXtqp/R+6sLifiLlBlo7P3MUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wgvvxZWW; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF2BBx000811;
	Tue, 25 Feb 2025 18:29:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zboDa3cKQkLjfjJd+7M0V2NhLphn96I5A2P8IRJH05M=; b=wgvvxZWW/CqAHK3j
	H8sgxDoRLndjNM9Sd34CXs4PXk5zv6HAYe1E3VwWDrRK8sHF482eocl9THKJ9N27
	yUIfiqlKj2VdC+Ir8+dPwx5EA4NCnMKxl1X74e4c8S/swBVfsjJ5v5afQa3fhJwA
	+wVJ268wjp6nEHEytQg/Qn8skofLorecSxqwEzRIZSUNK5tkojzeyZEkWpK/srzJ
	aeOeQuvy7TX65vAKcnizUIptGUgD3I37OoEY1gX1imisG+4JVwTQoQmwekuHf55P
	SdTs5UrdwLlMDkQhIEF1hSH752cpuFUHY6BKJf01wEcWhzjbcne0+Dwif5rwpHDr
	RsHO+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4xep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:29:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 877F4400E2;
	Tue, 25 Feb 2025 18:28:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6783C4C5307;
	Tue, 25 Feb 2025 17:09:41 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 17:09:40 +0100
Message-ID: <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
Date: Tue, 25 Feb 2025 17:09:40 +0100
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
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01

On 2/25/25 14:05, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp25 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index f3c6cdfd7008..43aaed4fcf10 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -918,6 +918,13 @@ package_otp@1e8 {
>>   			};
>>   		};
>>   
>> +		hdp: pinctrl@44090000 {
>> +			compatible = "st,stm32mp-hdp";
> 
> So here again - you have stm32mp251 SoC, but use entirely different
> compatible.

Ok so I will use "st,stm32mp15-hdp"

> Same feedback as with previous patchsets from ST. Please take it inside,
> digest internally and do not repeat same issues.
> 
> Best regards,
> Krzysztof

Best regards,

Clément

