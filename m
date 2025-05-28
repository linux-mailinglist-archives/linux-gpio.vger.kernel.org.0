Return-Path: <linux-gpio+bounces-20656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF0AC690E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B263B6814
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B41284B5D;
	Wed, 28 May 2025 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="390QO/o2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDE283C87;
	Wed, 28 May 2025 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434694; cv=none; b=GXLbZHoO0b0YYgbD0HlYxqPBou8Xr5AJYbB45R//o+uJfMXz7LoOtg/uzA22AALWu5ZgW17lTJE49Df+CQAXUitrwpP4WidRWSTuR1vqcN1ItnXa/2vbG1YRykSvs3gjAkng/Xhh5Z8x552NY0DmYSHdB/Xj/SgUMzIeyAO1neE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434694; c=relaxed/simple;
	bh=hgwlbRSW4jvBljubue1AXwysta/coRLcV6WzlaykAXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h8TM/NUesxZTDxizmyJj7g9TQZGBh2MYYmGPChziiRQxgXALvohc/ZIEc+gbrTbav63j6ECIJzWVx8U7OKKCpwiCSlLZsq/Ca9Yl0aakGLdibuNvSff2eXk/yWIfQtrMAW7poSDAWcP2xY3oEI169Aj0wZf9J6nlV34aOFor32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=390QO/o2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8ewG3017013;
	Wed, 28 May 2025 14:17:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qfmkwNJuQPgRSv5nRvippWgZ2ln8+OwhTXxV/tbD23s=; b=390QO/o2W/+aXv2v
	rSzQAJskUa0wTrEFkuE2s6XzLs2G6pTQ6qpfRW6NOe1nKuhJjYIrSB2VlsQUNiCZ
	r5TwU5UlnQAVk+c2cqucPwSw+TUaBJvim16OoKktuZVA0qdAI5Z+wKVWuATxw9iK
	a4jy3ZchWVpFupWMeBrVBN/gRKYRNHdOid9Q3f7XGJOwmGugCCcT081pEAkf1QYv
	KcOdXSHx+LG584DetTSm9RGsTuKNDz6N1xI0+9d3ru1L8bF4GwsA5OmDNIjSrcel
	RzidRptdgNA2lFeXQ0dffhx2LEjxTby6EqEBBdxZGFd2ytx4VK+7ErSMXlmXhjck
	RgypBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4q18h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:17:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C0EEB4004A;
	Wed, 28 May 2025 14:16:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68E786D6652;
	Wed, 28 May 2025 14:16:00 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 14:15:59 +0200
Message-ID: <ef481451-b7d2-4f9a-a3d0-c67e8f5061dd@foss.st.com>
Date: Wed, 28 May 2025 14:15:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp15
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
 <20250523-hdp-upstream-v3-6-bd6ca199466a@foss.st.com>
 <1c21f915-e067-4801-925a-3d4882f358f2@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <1c21f915-e067-4801-925a-3d4882f358f2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01

On 5/28/25 11:00, Krzysztof Kozlowski wrote:
> On 23/05/2025 14:38, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp15 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp151.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> index 0daa8ffe2ff5..b1b568dfd126 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> @@ -270,6 +270,13 @@ dts: thermal@50028000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		hdp: pinctrl@5002a000 {
>> +			compatible = "st,stm32mp151-hdp";
>> +			reg = <0x5002a000 0x400>;
>> +			clocks = <&rcc HDP>;
>> +			status = "disabled";
> 
> Same questions here and in further patches.

Same, disabled by default and enable in board's dts file

> 
> Best regards,
> Krzysztof

Clément


