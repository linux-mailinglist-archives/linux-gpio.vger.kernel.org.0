Return-Path: <linux-gpio+bounces-10307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AB97D4FB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 13:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4422285E90
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A28149E01;
	Fri, 20 Sep 2024 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XKwpaT2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2913AA46;
	Fri, 20 Sep 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833392; cv=none; b=FnCeEerc7Znq5npWW3H7WgWIYP//13yA2zOUJ8V7lIFkEFzu807krkT9Xxj1mErvz+rqJKrs8eeyM/hDeJSSmPi6y4+z62zuKK+skVlMUUJM075BdLPyGcbfs5FJu+S0FTmRnbAx0NqV+bwPCHyOxKEj5KK6nx/YsVCc/FB6IRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833392; c=relaxed/simple;
	bh=RNec7BVdPi/LdBJN0Bz9n7hYw3Z57PdKQQbXFuB7LF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tPnX0CusPbi/3MxOhLy8a4Oq+3ReXZbIN7LbqBRgNp/s62BIynrCI34623XMHOMJ9GXVNkAgpEMi9+wv+w6Dw6iXeeCT5xHeV9gJfF/BF0rNeD5bUd/vAy088mW0t69/2KNlR9YmQ/ZIcxWKmSvObo/riWjzLTeedgmDqu0QBC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XKwpaT2P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K8D1sR017296;
	Fri, 20 Sep 2024 11:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Polskk9T6FUawelzjapeNON4Q/inj9BMUxOHfhmNqi8=; b=XKwpaT2PDp5gcnrq
	50ro/O9lLj6GAAfyMZ3+b0DlwMWC0pILUdp3zUq73lL3EYOpFzsfFO23iwozNb27
	wtBEcoX7h9/bSWqjLCXgRtX9b8g7RNBsPdEObGN2ctmM0NPEA99K8EV0889dooIQ
	HVcFD2N6Uj2Iy7h5yTgMlK8WWANRnNnBbdulCMkplrphRKvvcLZ+5KS5aKE1WUZy
	xN3IzcGLi0nXcvK4f9iqn6vl/UeJFplbEH7UQsJiM8a9+qyWlnckA+ufbn7u8Lcd
	vezaUKDSyzkapY9TrxGXVP9tmOQU/E4TscNKwNBfFwWWuR+S3MERz22aGyEjdSoF
	IA8ESA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhgwnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:56:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KBuB2F011684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:56:11 GMT
Received: from [10.50.45.132] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 04:56:05 -0700
Message-ID: <9f2ccf3d-fa71-4784-b6d2-2b12ed50bdd2@quicinc.com>
Date: Fri, 20 Sep 2024 17:26:02 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
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
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-2-quic_srichara@quicinc.com>
 <4cd3d3f8-7d73-4171-bb35-aba975cdc11a@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <4cd3d3f8-7d73-4171-bb35-aba975cdc11a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c2z0oZZoWIpyMPZxfT76Nj8IYSyZyNA5
X-Proofpoint-ORIG-GUID: c2z0oZZoWIpyMPZxfT76Nj8IYSyZyNA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200086



On 9/19/2024 5:56 PM, Krzysztof Kozlowski wrote:
> On 13/09/2024 14:12, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add binding for the Qualcomm IPQ5424 Global Clock Controller
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq5424-gcc.yaml      |  58 ++++
>>   include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>>   include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>>   3 files changed, 524 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5424-gcc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>>   create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5424-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5424-gcc.yaml
>> new file mode 100644
>> index 000000000000..af2d0cec43f3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5424-gcc.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5424-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5424
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on IPQ5424.
>> +
>> +  See also::
> 
> Just single :
> 
ok
>> +    include/dt-bindings/clock/qcom,gcc-ipq5424.h
>> +    include/dt-bindings/reset/qcom,ipq5424-gcc.h
> 
> Wrong path
> 
ok, will fix
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,ipq5424-gcc
> 
> So everything i sthe same as 5332? Why not adding it there?
> 
infact, ipq5332 has 1 dual lane and 1 single lane pcie, whereas
ipq5424 has 2 dual lane and 2 single lane pcie. will update the
bindings in v2 accordingly.
> 
>> +++ b/include/dt-bindings/reset/qcom,ipq5424-gcc.h
>> @@ -0,0 +1,310 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> 2024 (other places and other patches as well)
> 
ok

Regards,
  Sricharan

