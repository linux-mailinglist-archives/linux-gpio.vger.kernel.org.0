Return-Path: <linux-gpio+bounces-21170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9FAD35AF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91C13B480A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A93528EA42;
	Tue, 10 Jun 2025 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="t6dw14ZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1228E5FA;
	Tue, 10 Jun 2025 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557537; cv=none; b=JwOzapAohlwa9ax3AP8iro4/b2TEgf2GIRCXM9yOayJ4W99YgN2iGyVyX34y4nmLczAegAa1pkPvMCSKORd9Gk2q0fwIJTvLINfku5YwGM82vqowiFBpQhxQnWaaSftNimfXn6ULtS6JtcYqw6deJXtVGjR0rQxWnOBZJi5EnvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557537; c=relaxed/simple;
	bh=IdIgWgA4HsbTmTwzHl/YQnzy5xBRzu15AjtN91AYt6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E2Gx0dlXLou0jpgjkKFlpe7n3LnS6LUbU0zMsCfdmOoTW57luRqaiTurdlrYymLXd4nGjQm5+9Twn6xEkTdQaAsCUOBkbc9G7NSLVAaKAaq8IlZuqDQm6r6qL2HHkumqbTrn/vtoxh8qvT9Yf7sYXElxm2lotHMC6QQBbedhaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=t6dw14ZV; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC90Ov024216;
	Tue, 10 Jun 2025 14:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MXR00VLxmhsH+jMRE5s/YJIThaFKie022RUlAGpjRqQ=; b=t6dw14ZVsezx0sZs
	dftYh8TOHkwZtHKigra6IELajwcohq2X2U/EEzOrgg0UgqcCvyxyY95HhWWoKgi2
	l4ZJJjbTa8HLWqKfQm2wmIhV23PM+pZlQmpP8ZqXmB7w5Uf/sVmqzPJA0LWQ3kzx
	ZGDc3AczGGayRcDDLvlGgg5SfZ13prHfUyt+Ywh3/Jr8eSaFyEFcCezGJD7sBfT4
	yo67Out2oEAp5y//3gcZ3GC3tcrKPk8c+QbnrmIiPOzCjQ5TIcxZ2wQ28JCT4cF6
	dPSGGljjkPcfzRdCSTvtcIyJm+uXEV+vGImsJ/DQAgwWFd7J3L8SD+EZ/j+BJKwG
	ZYYf5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumd4ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:12:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F28EA40054;
	Tue, 10 Jun 2025 14:10:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42B8AB3A752;
	Tue, 10 Jun 2025 14:10:07 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:10:06 +0200
Message-ID: <60423d3e-20b2-47c7-a889-f5cbffb83734@foss.st.com>
Date: Tue, 10 Jun 2025 14:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
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
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
 <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01

On 5/29/25 11:14, Krzysztof Kozlowski wrote:
> On 28/05/2025 15:30, Clément Le Goffic wrote:
>> 'HDP' stands for Hardware Debug Port, it is an hardware block in
>> STMicrolectronics' MPUs that let the user decide which internal SoC's
>> signal to observe.
>> It provides 8 ports and for each port there is up to 16 different
>> signals that can be output.
>> Signals are different for each MPU.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop reviewed tag. It was given under assumption that you will test your
> code before sending.

Hi, yes sure, sorry for that..

> 
> 
> Best regards,
> Krzysztof

Clément

