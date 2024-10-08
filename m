Return-Path: <linux-gpio+bounces-11033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24402994526
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 12:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2FA91F254F9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651E3192591;
	Tue,  8 Oct 2024 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JTG7K03b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5738F6C;
	Tue,  8 Oct 2024 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382554; cv=none; b=ddLrBEmJgYr3cmZP62sLXYVjRnP9JywJ2pkPUvV3qxZX7Tuxs4otwGlW8E4PKv2Z0iqarYClL+vvzPdEMS/4Wiw05fwv9JvgHPq93yhnZr1GecdsUDeUc2bqx4iysURmw/mhYGSSIUWuTH4AeujqdTIbbQMOPYXDMjbzTqq31G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382554; c=relaxed/simple;
	bh=ZLYahmtyndIk4/pqcHsKdqny7r1Sl4aYqUTjLcYh8Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kH7AupOxVDZDDtT738o4AtQQ9p6VBlFwEZLSx+IamostYg1uNooMC9oXkxUc7Z5cSY798fcE2h3gHXI1vH27/MiryVX4OrU30DpUBihWm90I+Flveu9g767eRMHw0tV66ZoinxGHNzvjJ4uIXEKNmI+3rN03iMUL4KLypFqGKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JTG7K03b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49867ppI027160;
	Tue, 8 Oct 2024 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RJTAwrBMMifMwMRVvCFjx7Qj9rE9rKp95xJNGZcrlQ=; b=JTG7K03bVEF4d9wS
	NALr5kZyAqxAcbJ2rvbb2VOB8L8Zssr1YZYesKKkVgc4PGt2Si4fmMnyrKm0RH0w
	z34W66So35oivg7bO5EvWAUsFZ5a2PKFphKHXRo5H2SjboAglCQULWai5lzWc1Au
	6xZWD0RiVgvQZ1WicYURXIRt+W6PPBojySPvkXSgrne9wp1tC8Jy4K7yRvEmwTcl
	tnhPygrI97B5UJIVePjnb5YT6aMJjJcGJjly1Gkpj6+uuU+I7yBtBRv0Z2Pk9Fk8
	4Xuy8sDhX2xkg42h59ile0QN8QCPL8F2RohVFvVZBHjjLo/V3huAnMXqF7l7F7iB
	m+O9Gg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9y0xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 10:15:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498AFXE4009912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 10:15:33 GMT
Received: from [10.50.47.90] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 03:15:26 -0700
Message-ID: <0aa2599b-a77c-428d-a475-0be63e49d0ca@quicinc.com>
Date: Tue, 8 Oct 2024 15:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/7] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
 <20241004102342.2414317-3-quic_srichara@quicinc.com>
 <c0e9479c-0a69-4ffe-aab5-0b5af92df31d@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <c0e9479c-0a69-4ffe-aab5-0b5af92df31d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YL0vpv9p-5X-LFf5aMjhRP2uguTED-sN
X-Proofpoint-GUID: YL0vpv9p-5X-LFf5aMjhRP2uguTED-sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080067



On 10/6/2024 2:09 PM, Krzysztof Kozlowski wrote:
> On 04/10/2024 12:23, Sricharan R wrote:
> 
>>   maintainers:
>>     - Bjorn Andersson <andersson@kernel.org>
>>   
>>   description: |
>>     Qualcomm global clock control module provides the clocks, resets and power
>> -  domains on IPQ5332.
>> +  domains on IPQ5332 and IPQ5424.
>>   
>> -  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> -
>> -allOf:
>> -  - $ref: qcom,gcc.yaml#
>> +  See also::
> 
> s/::/:/
> 
>> +    include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> +    include/dt-bindings/clock/qcom,gcc-ipq5424.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,ipq5332-gcc
>> +    enum:
>> +      - qcom,ipq5332-gcc
>> +      - qcom,ipq5424-gcc
>>   
>>     clocks:
>> +    minItems: 5
>>       items:
>>         - description: Board XO clock source
>>         - description: Sleep clock source
>>         - description: PCIE 2lane PHY pipe clock source
>>         - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>> +      - description: PCIE 2-lane PHY2 pipe clock source
>> +      - description: PCIE 2-lane PHY3 pipe clock source
>>         - description: USB PCIE wrapper pipe clock source
> 
> Why do you change fifth clock on ipq5332?
> 
> Please test your patches - change DTS for ipq5332 and provide PCIE
> 2-lane PHY2 there.

Ho ok, these 2 additional clocks are required only for IPQ5424.
I ran the check_dtbs/dt_binding_check for both IPQ5332/IPQ5424.
Agree that fifth clock should not be changed in default.
So, would it be fine to add these 2 clocks in the end and re-send ?

Regards,
  Sricharan

