Return-Path: <linux-gpio+bounces-13628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDE9E8BA4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 07:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B26188356B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 06:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240B1214A64;
	Mon,  9 Dec 2024 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JL95D+/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C262135D0;
	Mon,  9 Dec 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726622; cv=none; b=VvhF92fikdt1OeOerzmaCqGO8Y2h+yKDp5e/uN5XGF5CDouOEyXGSUkiS1EzdCEZJ1DkTziLXL2rvSCKfgX1zwtdzd2anSkcXDsBJpgHi93+tuJ70mYyB2phW7UmYFrv8kXEiXamHX77oq67phIZm9Kdx+CuwRrBHmlkHTWAKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726622; c=relaxed/simple;
	bh=vLK+Yed2BeeQ8DSf6jqpnA9LNHXJjh09orawJilA99k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dQCBy6u8pfMvJTP9QZhcw2rnpdgfbjw0tUdbHCILd3K7um1OcOUQjpURDFaSxKnEpWYKYAqMHTqHFv5XTBFGb+IScnN8ZaLPv2nhvytytfwcl+JO8+ixRi208rAcHXREqEVT2sKES+foGR2U7d94PLQCgFRThYTIo3H50aGhK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JL95D+/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8M024R025063;
	Mon, 9 Dec 2024 06:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjZFA3oy2Si6WnAP3k2skZKTYXVLLfhTiMOnT+d73m0=; b=JL95D+/mW+l0hxcY
	/SajKDTxEWp2377xIoa/5yqCIR/0P9iwY+wZWUIGWWUFX5GZBqKLU+i7KAAhg52a
	XsGkTlV7kTtKjAuG8j3lpbhGgp9nqCwcX1HMxkjmjrgQeRJoFSlGM9TO6RQwb/nP
	pjdUszt3T7KDv/8YP60bW0OSF+MjdUw1UEjff7m23z5pCvGw39h9CZWAV3T69hN1
	Uo760CH3qp4WHpJO5V/g4wWciudI3ussYYE7HHmPeJjOCMLWDE6yg5WABwOcwS0k
	M5qbdXxXPmu+dhXOcL3UGZFYE/IfXhBs5jVI6AX53TRru0eiO5fZf5/fQH8xez4T
	zKyamA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1ukc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 06:43:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B96haCg024382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 06:43:36 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 22:43:32 -0800
Message-ID: <aa8a252d-cb7c-45c9-bb44-dcaaa01d10bb@quicinc.com>
Date: Mon, 9 Dec 2024 12:13:29 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq5424: configure spi0 node for
 rdp466
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
 <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
 <249fb0aa-5624-41cb-8a3b-c2e54dba87df@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <249fb0aa-5624-41cb-8a3b-c2e54dba87df@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ocV8A6s3eBXsm7eJxQd1IJenPenF7FPs
X-Proofpoint-ORIG-GUID: ocV8A6s3eBXsm7eJxQd1IJenPenF7FPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=881 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090052



On 12/5/2024 11:00 PM, Konrad Dybcio wrote:
> On 22.11.2024 1:45 PM, Manikanta Mylavarapu wrote:
>> Enable the SPI0 node and configure the associated gpio pins.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 45 +++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index d4d31026a026..6256216ca764 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -23,6 +23,36 @@ &sleep_clk {
>>  };
>>  
>>  &tlmm {
>> +	spi0_default_state: spi0-default-state {
>> +		clk-pins {
>> +			pins = "gpio6";
>> +			function = "spi0_clk";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +
>> +		cs-pins {
>> +			pins = "gpio7";
>> +			function = "spi0_cs";
>> +			drive-strength = <8>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		miso-pins {
>> +			pins = "gpio8";
>> +			function = "spi0_miso";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +
>> +		mosi-pins {
>> +			pins = "gpio9";
>> +			function = "spi0_mosi";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +	};
>> +
>>  	sdc_default_state: sdc-default-state {
>>  		clk-pins {
>>  			pins = "gpio5";
>> @@ -57,3 +87,18 @@ &xo_board {
>>  	clock-frequency = <24000000>;
>>  };
>>  
>> +&qupv3 {
>> +	spi0: spi@1a90000 {
> 
> &spi0 {
> 	pinctrl-0 = <..
> 	...
> };
> 

Thanks for reviewing the patch.
I will update in the next version.

Thanks & Regards,
Manikanta.

