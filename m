Return-Path: <linux-gpio+bounces-10504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A0988601
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 15:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34AF11F21694
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE93818CC18;
	Fri, 27 Sep 2024 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XG+nKQ2g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE116C6A1;
	Fri, 27 Sep 2024 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442163; cv=none; b=F1PRB8d4KKpT4C8xwk3YdluiTrEpQUrRiu8Of6lrZDnxYxDMPv3X+IBICybWIzSd1I9yu94AiYH41Ob2y+MLZu4UcTZXB8X14c07SzX7WpAMjCQFb/lBtBWteMc7+2XY1C02YBm371gaANIo0Ggkletyazy/t0lAyRAsVPlRSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442163; c=relaxed/simple;
	bh=quDg/WTHOUWxyG4wdkg0y+YyZgY3G7BZqKrSLPoqeYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qXA0OwWeeS3CBwXtsLFyJMZXQB8r4LLYi0ykTbQAY+SOf+qNED9a5viyM5Aq24cN6Nnhx4Eop3ZCse1ZGKDRkW2YaSq028Ba6iEln3qHhmrsQ4mQHam8JP9cKt0wsByhHwcMJFXXLY8/NKBSzKNVM5eJckXAGDqbPuHQcAr6pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XG+nKQ2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RD04qW026375;
	Fri, 27 Sep 2024 13:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cB22I4o+uZPMHUCsQ4G8pU+CQy1I+qeGUQIDjJ0fEM=; b=XG+nKQ2gifreiJ6e
	TrD+NHXiW3Kkp8kO01CkA6t8DvaOmE4hKrLs/LkbLEc5hySfITd6U9Ds4m2C03ad
	GEtZl6i2F/xcMDBE0Fws3tEzZvE1x8y9AKDjQySqohD2uLHpr7KHLsFl0U262Grq
	odvUokH01gKvZY3jDSlq5i8FoSwGjMdW7E0ZSW2nWBC4M6nlDxQQYHcZEpb+Ded8
	TEqRyoltyIVYWKiuuoIhtF0yBA8L9qy076fmSOk5tse2DT9xmsllaa5kq368HZlt
	fG1FK+p2Zfk5V93mT4T/37hGe3ynzYOHL/e4biUeBdcUtDtpC7eoksoPOB/KOagk
	+/F4jA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ww7080d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 13:02:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RD2L0o027936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 13:02:21 GMT
Received: from [10.50.40.232] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 06:02:13 -0700
Message-ID: <64c24ac5-f689-4226-8f28-1f597aa3b892@quicinc.com>
Date: Fri, 27 Sep 2024 18:32:10 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/9] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
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
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
 <20240927065244.3024604-3-quic_srichara@quicinc.com>
 <ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j_Hh1pZZyt3a_TVkV6tK8IgFT9N0cvtO
X-Proofpoint-ORIG-GUID: j_Hh1pZZyt3a_TVkV6tK8IgFT9N0cvtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270094



On 9/27/2024 2:13 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 27, 2024 at 12:22:37PM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add binding for the Qualcomm IPQ5424 Global Clock Controller
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>> [v2] Added the bindings as a part of ipq5332-gcc.yaml itself.
>>       Difference between ipq5332 and ipq5424 being 2 additional phy's.
>>
>>   .../bindings/clock/qcom,ipq5332-gcc.yaml      |  57 +++-
>>   include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>>   include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>>   3 files changed, 508 insertions(+), 15 deletions(-)
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>>   create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> index 9193de681de2..aaa8b399c3b4 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> @@ -4,31 +4,24 @@
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
>> +  See also::
>> +    include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> +    include/dt-bindings/clock/qcom,gcc-ipq5424.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,ipq5332-gcc
>> -
>> -  clocks:
>> -    items:
>> -      - description: Board XO clock source
>> -      - description: Sleep clock source
>> -      - description: PCIE 2lane PHY pipe clock source
>> -      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>> -      - description: USB PCIE wrapper pipe clock source
> 
> You cannot remove properties from top-level. Unify the list, so it uses
> common part (ipq5332) and keep it here with minItems.  Then in allOf you
> only control min/maxItems.
> 
ok, got it. Will fix in V3. Thanks !!

Regards,
  Sricharan

