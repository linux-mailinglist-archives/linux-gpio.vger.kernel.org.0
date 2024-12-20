Return-Path: <linux-gpio+bounces-14050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F040D9F8D3E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 08:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEE217A3BBF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 07:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21E319D098;
	Fri, 20 Dec 2024 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VUFsyzxS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5018A6D3;
	Fri, 20 Dec 2024 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679546; cv=none; b=oeS1QPh3lj6TSa3Dlna1OVtnHDJddSyauuasJ0bwFI6JoFQTSx+YiyQElEK7GEPGhmTXroZ6K8cigbmk2fgezMvGKsokaLXcYCNU780P93X38c9EgJWQqA5oT5/Uj8b39r7PQFZCDCD0LJLMeR/uO62n8BAmBrMLojy35VAcK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679546; c=relaxed/simple;
	bh=I2B06Lz9nLv3TLOua0d/SMFlXnk1dlFguUt1Vpk+SWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lGZYPI+bRSEu+ck2REBTU7ZH78uw7iyTLD7x8plXcIxh8Wuh+RuWnfoYKAFxmFeDSkYNqySJnVlA3JejABZ7Vu6ew25pk9YwkixtCOC4ZREe/kVjj+7m3KvaxxIRugvqWWMbVQa5ZSbyPgXmwzCP8P+PLa5ZrQXQXqCTrF1Rsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VUFsyzxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6nG2M004043;
	Fri, 20 Dec 2024 07:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nSxt1Qr6AwU7RPGceSMPFkHmPPyK6OSnsa5ESq7x2A=; b=VUFsyzxSq9TYabYx
	DeNTZmvVYHbpvF3xVZM1EOeKY1hGt/bGaNLEY1RmcKlzL+WRu0fu4CHeDco1Sj6U
	SwSNzJ/y1epUmt3CmIyimis4HDz7BA8QUKErCdgszeM+RXiNgrVlk1gugPNAA26R
	bTHy0dcUzMGCyNvAv9+wBFoeMXBZpU7rupO9+QVdf15tn844bDpj0S52RUt9gPHs
	bxDmMivZoH0FIEQamESZSGC9dLttf8kLfBK4M5bqoLeromcwLm4nUHmwZzlSDYl/
	FpH40dc6NpuwqjzmdmcptCyKhUXiJ9VZp1aef+9pQuSDAdQPiOiU17KH0vuEkMow
	fS8r4g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3my02ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:25:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK7PdnF027123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:25:39 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 23:25:35 -0800
Message-ID: <f51b7196-1774-45b0-a63b-1070091441dc@quicinc.com>
Date: Fri, 20 Dec 2024 12:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq5424: add spi0 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
 <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
 <ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: URPMaOposko9dGCxIwzq0PRaewVxvdN_
X-Proofpoint-ORIG-GUID: URPMaOposko9dGCxIwzq0PRaewVxvdN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=915
 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200061



On 12/20/2024 2:06 AM, Konrad Dybcio wrote:
> On 17.12.2024 10:13 AM, Manikanta Mylavarapu wrote:
>> Add SPI0 node for IPQ5424 SoC.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V2:
>> 	- No change
>>
>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 5e219f900412..b4d736cd8610 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -201,6 +201,17 @@ uart1: serial@1a84000 {
>>  				clock-names = "se";
>>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>>  			};
>> +
>> +			spi0: spi@1a90000 {
>> +				compatible = "qcom,geni-spi";
>> +				reg = <0 0x01a90000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
> 
> This register base suggests SPI4 for both the name and clock
> 

Hi Konrad,

Thank you for reviewing the patch.

The IPQ5424 doesn't have SPI4, and according to the Qualcomm IPQ5424 register catalog,
the register base maps to SPI0.

> The existing UART1 similarly should be UART0

I didn't understand your comment. UART0 not yet posted.
In IPQ5424, UART1 is the main UART used for console
and UART0 is HS-UART used for some debugging purpose.

Thanks & Regards,
Manikanta.

