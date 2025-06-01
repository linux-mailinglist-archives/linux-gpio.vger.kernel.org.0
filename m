Return-Path: <linux-gpio+bounces-20846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCDAC9EA5
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 15:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A25A189260C
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 13:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21601DE884;
	Sun,  1 Jun 2025 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hEohhef6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A319F101;
	Sun,  1 Jun 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784558; cv=none; b=oOs9u9ULWwriOpmtAWaIF4NtR32H41NIUIHs/x3Gi7Qh5GpQIk/mlKGJpSP0IaI1StIlDPFqNeyjg86d2P+mec55G9OSFqX+A+n+H2LbpMAgbDcZFw4/8fDCUmVBEuUoqT8q89u+sIwPRptLYRPBb6zGbXxysQYk3VlVdO8/HS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784558; c=relaxed/simple;
	bh=gjZ/qzWcb5zr/7Enq5pBkOGZcqOD4uwtJyTQVIwKVr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TdQQbtzYjZD3WNZOMqbeLae/pD+iIDW5FIvoscrEe51G3wA9hIK8iThgsIu0rvaHkioYL54BPXOmO8w3FDV5CwL/nJW51j8c6vGTCLI4XR5qS+tO2gBwH+rmAVnC8qyfgj29LwyNK/dnPFy5VZV/imixjXRGgUmodyEma4j6dgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hEohhef6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551DOYHY003659;
	Sun, 1 Jun 2025 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkQxlpFdXZp2KugpRTbmYcvIhJMud/OtxDtMupzy1xg=; b=hEohhef6h7/KU2ZZ
	tPEnqnesAOAKUYr6bU/G2UfH467fyLbSGqbQRTNuafgCrPK5c/+MW+AG8VpqRs1h
	ecSx9ldKsZY3r+3epQ/KBoDGjZNgs9CqoNHaXvJ5e3buNRMhWbqmLJkwyVAROG2o
	QB9DYNMgbU3mKGuSe+okXrjwk2FAxEN0fGHrItf3t7CorFw+lhPNgU8ICbLRevds
	g5/cS81jhYXK5gsNgrHDPQhlqXMj4nR50Ji30jGO4pGPbs+adyAxCvPQmQG0qQis
	Id1yYQi+Izz8zfmIH5eH76ku/4iQp6GkUAI85p8hXB0SQWKQDLUrpiAYk9i582K4
	p4CGqA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkr2cjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 13:29:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551DTBep023446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 13:29:11 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 05:58:59 -0700
Message-ID: <5ffadce9-7121-465d-ad41-81cf9f626019@quicinc.com>
Date: Sun, 1 Jun 2025 18:28:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
 <43581d09-4e30-42bc-9c5f-9c40f5d2cb39@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <43581d09-4e30-42bc-9c5f-9c40f5d2cb39@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SnL27D-yV1HKe25yc8ZoHoA6M4y55ON4
X-Authority-Analysis: v=2.4 cv=OMMn3TaB c=1 sm=1 tr=0 ts=683c55a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SnL27D-yV1HKe25yc8ZoHoA6M4y55ON4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDExNSBTYWx0ZWRfX86PIR1pPBo/u
 kbuNUB6CebRGjEpBU30N6etSw1yDx+YPUq720qn+0MoQXt+ghJMfaf2lKZ2NVB5ywdGOmf2LMo+
 302ohlhFM8j5a52ZDDYiaxQz6ismBMyxFwbMNs994B8oJ1x0rfUdh3PCl5UQwG/+os2RNhxz6gS
 UUyfJt/AWAwGcuK6/uB1m9oyZVPP+m16XeehQd6zvCw9nzagsl7vmLv64aR+AMiPwb2uHoDZzwA
 1N/UzbG2zebSfJFSbQbS/iydi1r+1g3HBjmhphSs2cMWNvTWDmlKiJEnx2SNuEM4UNZmNRiMQVA
 EAh6qWKjTTUxDma5I5kgolLp/o1FVC0aG0YGya+kNLnFPGj02HY79//dI/f8ABR+uaKyB7O7cNm
 cfhM5f++Z4aD9Vrz2Pwe/VS3Mt1rdq66B1CbtzvuWGXoOacEDbel9oeqysSwr22YuMaquGqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=682
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010115



On 5/31/2025 6:05 PM, Konrad Dybcio wrote:
> On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add nodes for WSA8830 speakers and WCD9370 headset codec
>> on qcm6490-idp board.
>>
>> Enable lpass macros along with audio support pin controls.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
> 
> [...]
> 
>>   &uart5 {
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> index 542a39ca72bb..2e75e7706fb4 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -29,6 +29,30 @@ &lpass_dmic23_data {
>>   	bias-pull-down;
>>   };
>>   
>> +&lpass_rx_swr_clk {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_rx_swr_data {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-bus-hold;
>> +};
>> +
>> +&lpass_tx_swr_clk {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_tx_swr_data {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-bus-hold;
>> +};
> 
> All other DTs that overwrite these pins seem to be setting the
> exact same settings.. And given this pin is connected to an on-SoC
> peripheral, I think it would make sense to consolidate these in
> sc7280.dtsi

Ack

Thanks,
Prasad

> 
> Konrad


