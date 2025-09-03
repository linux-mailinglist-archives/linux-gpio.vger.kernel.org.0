Return-Path: <linux-gpio+bounces-25467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A845AB41A3B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62E885464D4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24A62E2DC4;
	Wed,  3 Sep 2025 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TVS4zLyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA42DE1E3;
	Wed,  3 Sep 2025 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892355; cv=none; b=sRE2Y4TnO9KhdnszYb/EKX2nc7cJP0Uei3OBfHWNY40RHOHdNfU62gDDXhLL54FzXsdlNQhTlqlM5daVWEFvh0KzU2NaUkan52O4HpYAdC+gDORckJEVThDxFSDXQxwjdcX46HWSB8XtQ7mX0QP1gKUJx8l2fEzr4PNhYBQ8wTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892355; c=relaxed/simple;
	bh=7OawBoLIQEMzrlHO4ZNFwoSx6OWh4gl2EizXy1qKCbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qOPJA3OoF06+bDUwp+ed9BWrABmMWINhekRQENZPT9vYnD0Pcc79TNrWSn5wFny1h4dpGW6Uy4npl4W+w9F3kGYejLZip8aDkZzW4VmGy9aNdCaV632WRH4SCBWy8nj8TVpreg9lpcpOOFi5niLCDYf60AD/XVikMtANr8WFuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TVS4zLyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58324FYe012188;
	Wed, 3 Sep 2025 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpBeBKaMIbKCX8B6pXuPCjDC5QIq23QMb0HxaWwyRSc=; b=TVS4zLyU9MsqUgA1
	e+sQoNKO0gDEkbY0VWFXZmb1Q+w4yWG8OXt4t4vHZpC+M8lqmieXE1xn3CdkvQZg
	UFXp3gHRVMEyE2uJ+nfTKlippZyKe3pYsezpOtCzdAHITGkEpmHyLgOL5dnhjnU1
	lfVsQcl7LB3MdPvMfQyW+eec6U9DEMs3XSEztJxPy7SgJprJdiOAvYK9x1gUkwOw
	RkT6a7deDDS4PnigNA2cLetla3pQvO9G/LNdGWuYYq5zkbyiM97SY1uuBunlOu+h
	t8wJgszxDRpU7DHoDBOT8VU+oCfZzC3MqFXiaRY+2MB6UXT+03smoULFK7I0m3L/
	SeyfwQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjy90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 09:39:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5839d8ft009476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 09:39:08 GMT
Received: from [10.218.46.122] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 02:39:02 -0700
Message-ID: <56df6a16-152f-40af-8798-a9ef7bb3705d@quicinc.com>
Date: Wed, 3 Sep 2025 15:08:58 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik
	<mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-7-quic_pkumpatl@quicinc.com>
 <arjgotmhd6b3ip2cvyvl74nanapqxleeeyxg63m6ike7osrjw7@gqp44che72gn>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <arjgotmhd6b3ip2cvyvl74nanapqxleeeyxg63m6ike7osrjw7@gqp44che72gn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX2qrw963AyNoO
 8jxdadQ8HNe613VN5WNbmsU9wkNz8OoEKiaueVxM+JkXtQmLotdyM14YSfkETmmcB9ohA9eo+p9
 f4XvYvA+xRV8TW9WK9Bi45iI94KtU99EOZgBqOUtiE9VqMOQfxq2zZiz2morU5NIrGZljhOXR69
 S1F4Lky4UFkY34Jh5k49nKI+rpax7Cx/0qc/wEx1tLo/+pKDdQ0zxhBimNfPnnRuxZhA9C+xQYs
 +hAFLyn0X/gVW+4GsNWI1xOpJVnuj02N8mCtk3fzx6BSJyQrHKETadVS/EYTFwjbbGn89Y9GuF5
 /uH9aD7W+flKAmm5c0n4s4D72GA1ZBsTcU/WziBMpH4bgwN16aakX76Fv2nXVkjqrRjJTGamB2l
 DVXkuLOs
X-Proofpoint-ORIG-GUID: zkxN1jI--fTQSintpulFt8zOVB8p1Zc6
X-Proofpoint-GUID: zkxN1jI--fTQSintpulFt8zOVB8p1Zc6
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b80cbd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=w648W8wVgDTgWg8gngwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038



On 9/2/2025 8:21 PM, Bjorn Andersson wrote:
> On Thu, Aug 21, 2025 at 10:19:11AM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
>>
>> Enable lpass_wsa and lpass_va macros along with pinctrl settings
>> for audio.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  8 +++++
>>   3 files changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> index 6d3a9e171066..078936237e20 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -58,6 +58,12 @@ &lpass_va_macro {
>>   	clock-names = "mclk",
>>   		      "macro",
>>   		      "dcodec";
>> +
>> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
>> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
> 
> Does all QCS6490 boards with AudioReach have these two (4?) DMICs? Is
> this board-specific or generic?

yes, all QCS6490 boards are with default 4-DMICs.


> 
>> +	pinctrl-names = "default";
>> +
>> +	qcom,dmic-sample-rate = <4800000>;
>>   };
>>   
>>   &lpass_wsa_macro {
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 7509c27bd3f8..09e2cb9053a6 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -19,6 +19,7 @@
>>   #include "pm7325.dtsi"
>>   #include "pm8350c.dtsi"
>>   #include "pmk8350.dtsi"
>> +#include "qcs6490-audioreach.dtsi"
>>   
>>   /delete-node/ &ipa_fw_mem;
>>   /delete-node/ &rmtfs_mem;
>> @@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
>>   	};
>>   };
>>   
>> +&lpass_va_macro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_wsa_macro {
>> +	status = "okay";
>> +};
>> +
>>   &mdss {
>>   	status = "okay";
>>   };
>> @@ -1039,6 +1048,32 @@ &sdhc_2 {
>>   	status = "okay";
>>   };
>>   
>> +&swr2 {
>> +	status = "okay";
>> +
>> +	left_spkr: speaker@0,1 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 1>;
>> +		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrLeft";
>> +		#thermal-sensor-cells = <0>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +		qcom,port-mapping = <1 2 3 7>;
>> +	};
>> +
>> +	right_spkr: speaker@0,2 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 2>;
>> +		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrRight";
>> +		#thermal-sensor-cells = <0>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +		qcom,port-mapping = <4 5 6 8>;
>> +	};
>> +};
>> +
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index c51c38cf147a..d472de18296b 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3001,21 +3001,29 @@ lpass_tlmm: pinctrl@33c0000 {
>>   			lpass_dmic01_clk: dmic01-clk-state {
>>   				pins = "gpio6";
>>   				function = "dmic1_clk";
>> +				drive-strength = <8>;
>> +				bias-disable;
> 
> Does these settings belong in the SoC description? Are they fixed for
> all targets of sc7280, or are there any board-specific variations? Any
> variations based on which audio solution the board implements?

yes, these configs are fixed for all the variants of sc7280. These are 
on-SoC configs and don't change with variants.

Thanks,
Prasad

> 
> Regards,
> Bjorn
> 
>>   			};
>>   
>>   			lpass_dmic01_data: dmic01-data-state {
>>   				pins = "gpio7";
>>   				function = "dmic1_data";
>> +				drive-strength = <8>;
>> +				bias-pull-down;
>>   			};
>>   
>>   			lpass_dmic23_clk: dmic23-clk-state {
>>   				pins = "gpio8";
>>   				function = "dmic2_clk";
>> +				drive-strength = <8>;
>> +				bias-disable;
>>   			};
>>   
>>   			lpass_dmic23_data: dmic23-data-state {
>>   				pins = "gpio9";
>>   				function = "dmic2_data";
>> +				drive-strength = <8>;
>> +				bias-pull-down;
>>   			};
>>   
>>   			lpass_rx_swr_clk: rx-swr-clk-state {
>> -- 
>> 2.34.1
>>


