Return-Path: <linux-gpio+bounces-14052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA69F8FC2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 11:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4977A3E0F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 10:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148261C1F0D;
	Fri, 20 Dec 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RRpyMvDH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86D1C0DD3;
	Fri, 20 Dec 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689082; cv=none; b=Pgg9OSciC1E0Ap7hc0ZgBpwIKnKghSoLyaDNr+4ZzjZk/wa3HYXMmBWer0ts/Qap48EeiTrnjjfeGBhOmy0EMSXi6eRp4L0rZqzDiGlrwyI/QXlIWQ8t7ukRDPdPj0QdG9y6aLHUMiKnhHyltFT6qpqOoPH3hZj8p4Up2UNWPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689082; c=relaxed/simple;
	bh=gUwgz71CV+Sb+fex+RhOpBU75zH4vvkMU4AvQgioVow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=arwOSQ+k4b50ifWCx+RAwO4KwvIId68oc0rM7hlC6+50nP5GhL4SDm1uGkoGYu/hMuH70BQsbgusxiXiRg/3heD9SP0rcRt59MnmykTCQB4w+8u7vBXYDE+Ojso1V6dH/2sNdpl91orwgOr0dczbjkFWhuK4wnFoJ0JsyDaFtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RRpyMvDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK82j2p018674;
	Fri, 20 Dec 2024 10:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbqfZU5/rpM64DK1jNZD/7wTZN06f2M3HDFEwIJvF6w=; b=RRpyMvDHBefGb/FH
	Hmrkq3B3sC8NQnB/oBkqQEj5VgWPin05BuJD8/DeoGlsS2uqMUXwP7BJrfC+17dX
	+M5mgD+xnAyUAGtwZommqLvKTeuayxerXk9be4ojHGFnVNlxHlFdhudz65hUSH2w
	omNPeBeenmDH/h7EB/waAxCJFbVeFtfzgo2aauv4lSBncNcqzqtwO5sbadIg9wX+
	jDC1kKSc4WNneB87M8GyJewtKE9L1G95p8ymUtl6R/rx2j0s1R+eJVj0DhSPTL/0
	AixTdAi3Lz1d2rFmabu6erjWvQGLUQlqC6buOi025hervmojP1YVsoTkh/0yoIXy
	PTLDkQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n4qmrbkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:04:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKA4bYI005181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:04:37 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 02:04:32 -0800
Message-ID: <61bead44-c1ee-4960-8cc3-b12900fd4751@quicinc.com>
Date: Fri, 20 Dec 2024 15:34:29 +0530
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
 <f51b7196-1774-45b0-a63b-1070091441dc@quicinc.com>
 <17ff74d9-2336-446e-95bf-be8d70d20a07@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <17ff74d9-2336-446e-95bf-be8d70d20a07@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xTLXkITabUkGIg0tMZOQLeoKSgm4n85s
X-Proofpoint-GUID: xTLXkITabUkGIg0tMZOQLeoKSgm4n85s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=974 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200083



On 12/20/2024 3:15 PM, Konrad Dybcio wrote:
> On 20.12.2024 8:25 AM, Manikanta Mylavarapu wrote:
>>
>>
>> On 12/20/2024 2:06 AM, Konrad Dybcio wrote:
>>> On 17.12.2024 10:13 AM, Manikanta Mylavarapu wrote:
>>>> Add SPI0 node for IPQ5424 SoC.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in V2:
>>>> 	- No change
>>>>
>>>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> index 5e219f900412..b4d736cd8610 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> @@ -201,6 +201,17 @@ uart1: serial@1a84000 {
>>>>  				clock-names = "se";
>>>>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>>>>  			};
>>>> +
>>>> +			spi0: spi@1a90000 {
>>>> +				compatible = "qcom,geni-spi";
>>>> +				reg = <0 0x01a90000 0 0x4000>;
>>>> +				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
>>>
>>> This register base suggests SPI4 for both the name and clock
>>>
>>
>> Hi Konrad,
>>
>> Thank you for reviewing the patch.
>>
>> The IPQ5424 doesn't have SPI4, and according to the Qualcomm IPQ5424 register catalog,
>> the register base maps to SPI0.
> 
> I'm looking at that register catalog and what you added here is
> called SE4
> 

I understand your point and will rename it to SPI4.

Thanks & Regards,
Manikanta.

>>
>>> The existing UART1 similarly should be UART0
>>
>> I didn't understand your comment. UART0 not yet posted.
>> In IPQ5424, UART1 is the main UART used for console
>> and UART0 is HS-UART used for some debugging purpose.
> 
> Here it's my mistake, 0x01a84000 is SE1 indeed
> 
> Konrad


