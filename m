Return-Path: <linux-gpio+bounces-16577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A57A447BD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 18:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020D017FA00
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAC51C84C8;
	Tue, 25 Feb 2025 17:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Nrq3B2Bx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BC91990D9;
	Tue, 25 Feb 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503557; cv=none; b=g7Ra1fre2u9RT40bYWF+JwYxI205KmdPr2JdCJk5jkXYnnz/BQYJ2q8WoxHTFWY47Rw8Ntu4WkhlQLzq992+uI/7sMiOcYmSf0w4Oew5TrNkGr4mgUyUzRwOtuFtJ7iWbPYEIhgjqaMsjG//BZr5WLlhKV8Y2S2JDPbrzT3QP7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503557; c=relaxed/simple;
	bh=SFIcUyN26PFdGS1xQAZHSdinxS1e1K2TCA4eKm/UVFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WLP6x0VoYCLcFqRrMa3hSGezWlQnuVoio22ZVYHPrFV2hknejwyRklPcK+2F3E6QwSAbkhNqFWV6jZ4/5ypVP64sejvYFyy0+viO1j6JGcRd4XP18aylbCLxGsAtKi0aFE57sJ51eNBqaAg80qdsIdxK2I9mOocFq0dTAe3rkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Nrq3B2Bx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFJbae032256;
	Tue, 25 Feb 2025 18:12:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	b7ilTU0nfN/VhX4AMlIMGSs7WY/ZNM9E5SfWaQXtVJA=; b=Nrq3B2BxNYdXhmuF
	+jmL73KaSfStcX8QKPExFFoP7RqoSXYGRppAkI6ARlaK53KL1dyVyO4IMN3JVCnu
	tGYXS6HfgioN2NTwRJczUCCAzE/57xH5+kkV2Cxd+AHYpSo3/5Rp4fedb48NofFU
	yRjXtSt7zrXgOVoz1WW7amsqH28Yp3rUjJrK+GLhi7HIdO+d3IRP3u2GRmnhln0m
	wPzqD2UC/k8vmQbeA/rNHAVlwELmzgPuiainGS0hQhjKPcssCNvWe615sk4+RGOy
	/wQR2a7PFRz4SNwGT2jVCzJbDqAn0mnb30eauFGVK8qKkbI8fMakiei+0nXKNr1q
	eIqVKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4ukf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:12:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69B38400E3;
	Tue, 25 Feb 2025 18:11:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72F044DBF82;
	Tue, 25 Feb 2025 16:51:36 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 16:51:35 +0100
Message-ID: <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
Date: Tue, 25 Feb 2025 16:51:35 +0100
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01

On 2/25/25 14:04, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> +
>> +maintainers:
>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>> +
>> +description: |
> 
> 
> Do not need '|' unless you need to preserve formatting.

Ok

>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>> +  It allows to output internal signals on SoC's GPIO.
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp-hdp
> 
> There is a mess in STM SoCs. Sometimes you call SoC stm32, sometimes
> stm32mp and sometimes stm32mpXX.
> 
> Define for all your STM contributions what is the actual SoC. This
> feedback was already given to ST.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    $ref: pinmux-node.yaml#
>> +
>> +    properties:
>> +      function:
>> +        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
>> +                "8", "9", "10", "11", "12", "13", "14",
>> +                "15" ]
> 
> Function which has a number is not really useful. What does it even express?

As said in my previous answer, function names are very different from 
one platform to another. Numbers were used as string to be generic.
I'll consider it in a V2.

> 
>> +
>> +      pins:
>> +        enum: [ hdp0, hdp1, hdp2, hdp3, hdp4, hdp5, hdp6, hdp7 ]
>> +
>> +    required:
>> +      - function
>> +      - pins
>> +
>> +    additionalProperties: false
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    #include <dt-bindings/pinctrl/stm32mp15-hdp.h>
>> +    //Example 1
> 
> Drop

Ok

> 
> Best regards,
> Krzysztof


