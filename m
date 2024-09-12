Return-Path: <linux-gpio+bounces-9994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37767975EB4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 04:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698E21C229DB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 02:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C382D7BF;
	Thu, 12 Sep 2024 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QT1C/bUb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3D2A1CF;
	Thu, 12 Sep 2024 02:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726106522; cv=none; b=BEn042lMoxMxH+2oJdzDF9sV0jVYcIfDRIcpiOi8J3Wy/ywNhNYZbzepyiYEg66DFeZFXdzJHqaC/cztYh887MROPKL17HDVfB+SaYvM+e9zpjUYRKaV/MAJ0si9Hx3ZRMIeo/ToW3NJD967nLRbHTolAldy4p+zfBVfQTVBhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726106522; c=relaxed/simple;
	bh=7JOMGHPGl9bZpl9dgy1+02bXme1tNRDP9Oj1y+Mp9K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cvyG23EaME+iqJiZC+pnwlaGolPlaCAjDmnoo2FSNMyqyoc+KtZVDZfiwoWwTs4NCfzsflObeZFx0ES628Stx1CQA5vBlJMharqsYC614rNT5M+W+OocFDhMmYC7DaY/TPZgaAQ/zXgw0fPnwRQPRQ9Zgzk3DFZEv4nTOGmUCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QT1C/bUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BEm0mV008622;
	Thu, 12 Sep 2024 02:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9uxWCoTZQ9l46bFxytwAFQkW6irJNtC1UxAD6uZ9uM=; b=QT1C/bUbY+bHy1YT
	C+Ocp8ek4LKHWLGt5clrlq+AqwTPWJFw/CIiFiq3KlEnzsprZCrknLSldnlbzCs7
	QMa0ThJG240ZIDQJUElJUhZglXxGtTaYwweNA9toJFQXphlr3HaC55Y3p9NWrODD
	8CjqRis/LrWFF8N7y8JJ31v3Gf13kptMH2KFk3a0v5KBVIHPeSMwJPaMMJGZCHxj
	rG37H87dMr5zAevW78EZghZliIX/rrbWMXpFAXm8Qs5EziARisjHB6rhQwo+/xdH
	hlLlWfBr0croD+KWXuHYIPYYTix5WNUVKcQ9IHQdYVW1Av0KZxIeV8Gx4hYGJtdK
	YJrurg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy733m2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:01:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C21sBb030061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:01:54 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 19:01:48 -0700
Message-ID: <8e5364f8-eaa3-4f70-b298-70a21e716f90@quicinc.com>
Date: Thu, 12 Sep 2024 10:01:46 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the QCS615 Top Level
 Mode Multiplexer
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com>
 <20240910-add_qcs615_pinctrl_driver-v1-1-36f4c0d527d8@quicinc.com>
 <20240911151818.GA283533-robh@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <20240911151818.GA283533-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qx0pBzmCki2RXxuwV4hV_dyjEJbLbZcB
X-Proofpoint-GUID: Qx0pBzmCki2RXxuwV4hV_dyjEJbLbZcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409120014



在 9/11/2024 11:18 PM, Rob Herring 写道:
> On Tue, Sep 10, 2024 at 06:26:14PM +0800, Lijuan Gao wrote:
>> Document the Top Level Mode Multiplexer on the QCS615 Platform.
>> It concisely explains the pin multiplexing and configuration in
>> the device tree, and includes simple examples of typical device
>> tree snippets, making it easier for designers to configure and
>> manage chip pins.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         | 123 +++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
>> new file mode 100644
>> index 000000000000..2bfb0a453880
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
>> @@ -0,0 +1,123 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,qcs615-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. QCS615 TLMM block
>> +
>> +maintainers:
>> +  - Lijuan Gao <quic_lijuang@quicinc.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm QCS615 SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qcs615-tlmm
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: east
>> +      - const: west
>> +      - const: south
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 62
>> +
>> +  gpio-line-names:
>> +    maxItems: 123
>> +
>> +patternProperties:
>> +  "-state$":
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-qcs615-tlmm-state"
>> +      - patternProperties:
> 
> Needs 'type: object' before patternProperties.
> > Otherwise,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Well noted.


-- 
Thx and BRs
Lijuan Gao

