Return-Path: <linux-gpio+bounces-11702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3C9A59D1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 07:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A45F281F9C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 05:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9D81990D0;
	Mon, 21 Oct 2024 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b7Ovei4D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED65634;
	Mon, 21 Oct 2024 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729489302; cv=none; b=tv92V0n5sbe0h30GXeR1jpnfvJVpCzuY8SAsD6DQD3X/yYE8w5cYaqxLhJYD8H1HV3l+JPxmHQG9IkBIoqf4/wH56sSQm5QgP1O/vgVWvEBJreK+LKDtP0BZpozEV6UdWH/0l++0CAjIEwaCVO4jNQDSm2n5/ngOMgxKdB1x3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729489302; c=relaxed/simple;
	bh=x15yRLhgy42+yizJ86mU28DoOslmxHJB5vdr0m9Jm+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CdicnGy1g3R3rY/OdSzLqCR4nvGIUsVoq7KbICP+rc/xh1+v9bI858hVUXrj8RLwb9htfRirzlH+5R3WAAn8QpdBEWjlYm+TdVMasKyDa33AQXpOjnGOhKpsQlw5xUXvqq74Kd7DIeZufAMYYVqtmWxGv/Vy6+w9vOq5DIvlJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b7Ovei4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNHeBB014302;
	Mon, 21 Oct 2024 05:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI+g/PDRqVZ95UWxsvAz05m79blc6jc1PXoXbNyQswA=; b=b7Ovei4DFeFWBJ0Z
	wC+yHk5XzuTgof4wrQkk7Mwnyh3mc0DLyZEDo0rvIex9U90w7eqSyqbCpf0VVhF9
	O+UaWCU17fV8k69zKZhE3eSo/cu3+dszW1lHxqJu1/jCZo9fv4L/PeWJcyJFTwn4
	zxWw2wrKLHAaRxkxsknJUHOAUSIOdLhxiCKOpzGjC5eBRLE2UaQwBcEBu4GSJ1Vr
	Rv7bJhKcbho2QrvIgZez5UYNnz93WZ6vW1WE0aGOObN3MzhDYN4DbD79SmwVRWBD
	nsvp2+BYnQX4H6vUDH3A39g/zf8NA2bjUdjGAVf11xiOEjXAZxqrdQMbD8W7cG4l
	m3p0lQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vuua0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 05:41:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L5fLt2005526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 05:41:21 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Oct
 2024 22:41:14 -0700
Message-ID: <01cbb389-1966-4501-a22d-7227765d1eb9@quicinc.com>
Date: Mon, 21 Oct 2024 11:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/6] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_varada@quicinc.com>
References: <20241017123626.204421-1-quic_srichara@quicinc.com>
 <20241017123626.204421-3-quic_srichara@quicinc.com>
 <nznisr4aqpe65fovvk3q3r6capmqj4jm4xsqufjib2b7vax4xx@6r3tzaar2w3p>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <nznisr4aqpe65fovvk3q3r6capmqj4jm4xsqufjib2b7vax4xx@6r3tzaar2w3p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BvccQ3eEA3DBohRrCELpz3wod20lmi_E
X-Proofpoint-GUID: BvccQ3eEA3DBohRrCELpz3wod20lmi_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210038



On 10/18/2024 11:43 AM, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 06:06:22PM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add binding for the Qualcomm IPQ5424 Global Clock Controller
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   [V4] Added 2 new PCIE clks to end of the list, preserving default order
>>
>>   .../bindings/clock/qcom,ipq5332-gcc.yaml      |  40 ++-
>>   include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>>   include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>>   3 files changed, 499 insertions(+), 7 deletions(-)
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>>   create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> index 9193de681de2..ef1fd9d9f8da 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> @@ -4,31 +4,35 @@
>>   $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Qualcomm Global Clock & Reset Controller on IPQ5332
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5332 and IPQ5424
>>   
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
>> +  See also:
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
>>         - description: USB PCIE wrapper pipe clock source
>> +      - description: PCIE 2-lane PHY2 pipe clock source
>> +      - description: PCIE 2-lane PHY3 pipe clock source
>>   
>>     '#power-domain-cells': false
>>     '#interconnect-cells':
>> @@ -38,6 +42,28 @@ required:
>>     - compatible
>>     - clocks
>>   
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq5332-gcc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 5
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq5424-gcc
>> +    then:
>> +      properties:
>> +        clocks:
> 
> This needs minItems: 7, unless clocks are really optional (but they
> shouldn't be optional). I think I missed this part last time.

ok, got it, will update and send V5.

Regards,
  Sricharan




