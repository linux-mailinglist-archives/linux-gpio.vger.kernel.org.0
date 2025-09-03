Return-Path: <linux-gpio+bounces-25465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC76B41A14
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D76546315
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6546D2F069D;
	Wed,  3 Sep 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ojC2NFew"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727831EA6F;
	Wed,  3 Sep 2025 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891882; cv=none; b=JsQbei9k4NMjAiY9uhwEVTXDTFrdtNpMYdtzup76F3dpeqeAikSgUYaaO5Y++e3KM4NhB/jfSU7Ma+hH5GlJujMQqgUlgeXYCaxRv5J9vwwEPF9xoCkL3Y59/rVTH14THwe4ec17HHhWsKyY6Joh1w/ge2shSrefemvfPZv0qbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891882; c=relaxed/simple;
	bh=80QWw7mC1ItOpkdyNFhY3jIiUDUp8rlf6sbwCce786Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GKE/0F7cnRHyutv18geb7YzOmyws8s7QBt3t9HtjFlK+z39xI3Gsv/IqSQNIMbwtHTGmEjnfeu7Dear6+IButu0MdAI0qd5neRmjKWku8vBsZxnMSIPeRPVMf8Y8B1fICdVOZc5b1KgxbuUNFA/t2HGLzOj1ymUaS/+q/e3R4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ojC2NFew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831hBS4018243;
	Wed, 3 Sep 2025 09:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73r4rsBoHH1UbJyDMMK0kg5EPnX2LBc0gzbnKBLicNA=; b=ojC2NFewbKfcEGWY
	VrycA4r28/DyVmSCEaWDL18c0hwyk53xCV2o5LeuMhEjiVW3VsVxtphrhdFKvi3D
	t8C0ba+Uw751iF7eWUCu77MF1BK199+MQzavl3pWibA9w27Z9LTOv4qcrl84Mb9q
	3hDBk5HM5i04hD8tlFefGSeU3f49Ny5ODYoC0ZRL0MP9LiJIGcO4W08E9Y5R+N7T
	Ka+eIwOQQoIVR+LgyK6R6UYcM4sV9tnh5VOQp2ipJ0+5iQ4IprykdnC5pYduvTv3
	1EaRCS2irBmTjxHOkimoGRVOfupAPrxWzoL35j5VWdlbFmH7f9ZxEqjlj9bjiVV/
	Vz4Fiw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwcraa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 09:31:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5839VEGJ003307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 09:31:14 GMT
Received: from [10.218.46.122] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 02:31:07 -0700
Message-ID: <1912d0f8-a87c-4f76-9a34-bfff870ede23@quicinc.com>
Date: Wed, 3 Sep 2025 15:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
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
	<mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-2-quic_pkumpatl@quicinc.com>
 <4yo7v7whxffebzhoxkbpm226vsj2twc56xuf7etwwcyfrf2lzh@x2udmlhvdiwu>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <4yo7v7whxffebzhoxkbpm226vsj2twc56xuf7etwwcyfrf2lzh@x2udmlhvdiwu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX20zQFMUzVb2e
 KviwgniQG5GYzVVlFK3VuyfZl+/mP6RLD0pA+MzoKfHOXPa2W6r5fDcAExmIdfaoWg5oEVESMTY
 PGF9ZkbyLIaynx/3pYOvtE0DgMGpIk8l50vMlofT+q09DUNVPLwCagfJwFt4E0TxnxVfkjPItgz
 Lb+npZRkl2BNQma+zVQsn3oyiyjUwboeqVY5OkkXkF8sYPz8Bvpp4yIeOkXKEW/w7qKTM2flb61
 UGNZvXk9dsDMaeVz4WVNef2tVmMPNYGE09qrTRsgoKwdMEjt8bz/09IqOxj5beXNNSkiQ2Pokcb
 VEq+Y/COoakDw/iw8vfmWY5Tuur/TQ7JquJX+NHCZfQ8J5L9ZwiUXggWbeqRpXs0efDEomy4G6P
 pE0Z2Lwb
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b80ae2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=nHcloA6FLwVU0iwWzzsA:9 a=QEXdDO2ut3YA:10
 a=-_B0kFfA75AA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gtnmW3gWs6Up2--LHuQ4MXy3jCI94MFH
X-Proofpoint-ORIG-GUID: gtnmW3gWs6Up2--LHuQ4MXy3jCI94MFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024



On 9/2/2025 8:13 PM, Bjorn Andersson wrote:
> On Thu, Aug 21, 2025 at 10:19:06AM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Subject says "add gpr node", that sounds insignificant, but the patch
> actually introduces the structure for how to model audioreach - and will
> set a precedence that others will follow.
> 
> It must be clear from the commit message why this is a separate file, so
> that others will understand, now and in the future.
> 
>>
>> Add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> says to start your commit message with a problem statement, that makes
> the reviewer understand which problem you're trying to solve. "Adding
> GPR node" is not the problem, that is part of the solution, it should
> come last.
> 
>>
>> A new qcs6490-audioreach.dtsi file has been added to
>> update AudioReach specific device tree configurations.
> 
> "Has been added"? When?
> 
>> The existing audio nodes in sc7280.dtsi, which were designed
>> for the ADSP Bypass solution.
> 
> Please complete this sentence.
> 
>> The audio nodes now being updated
>> in qcs6490-audioreach.dtsi to support the ADSP-based AudioReach
>> architecture.
> 
> No, you're not updating qcs6490-audioreach.dtsi, you're adding that
> file.
> 
> Please start your commit message with a description of what exists
> today and why that doesn't fit your need, explain why we need a separate
> file to carry these things. Make it clear why the bypass solution should
> be kept in sc7280.dtsi (isn't that design only used in
> sc7280-herobrine?).
> 
> Also, is qcs6490 the only variant of this SoC that comes with
> AudioReach, what about QCM6490 and SM7325 devices?

Sure, will update the commit text as per your recommendations.

Thanks,
Prasad

> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 54 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
>>   2 files changed, 55 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> new file mode 100644
>> index 000000000000..282938c042f7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * qcs6490 device tree source for Audioreach Solution.
> 
> That's pretty much what the file name says as well. It might make sense
> to leave a comment here, but if so make it useful.
> 
>> + * This file will configure and manage nodes from sc7280.dtsi to
>> + * support the AudioReach solution.
> 
> So far it's only adding things, not configuring and managing (which
> isn't something DT does anyways).
> 
> Also "This file will" implies that in the future something will be added
> here to deliver something. We don't communicate intent like this, and
> once you add that thing you intend to add in the future this comment
> won't be useful.
> 
> Something like this would be better:
> "Common definitions for SC7280-based boards with AudioReach"
> 
> But I think that too can be derived from the file name. So, let's make
> sure the commit message for the change that introduces the file has a
> good explanation.
> 
>> + *
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> I think this would look better above the comment. But please use the
> right copyright statement.
> 
> Regards,
> Bjorn
> 
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +
>> +&remoteproc_adsp_glink {
>> +	/delete-node/ apr;
>> +
>> +	gpr {
>> +		compatible = "qcom,gpr";
>> +		qcom,glink-channels = "adsp_apps";
>> +		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +		qcom,intents = <512 20>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		q6apm: service@1 {
>> +			compatible = "qcom,q6apm";
>> +			reg = <GPR_APM_MODULE_IID>;
>> +			#sound-dai-cells = <0>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +
>> +			q6apmdai: dais {
>> +				compatible = "qcom,q6apm-dais";
>> +				iommus = <&apps_smmu 0x1801 0x0>;
>> +			};
>> +
>> +			q6apmbedai: bedais {
>> +				compatible = "qcom,q6apm-lpass-dais";
>> +				#sound-dai-cells = <1>;
>> +			};
>> +		};
>> +
>> +		q6prm: service@2 {
>> +			compatible = "qcom,q6prm";
>> +			reg = <GPR_PRM_MODULE_IID>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +
>> +			q6prmcc: clock-controller {
>> +				compatible = "qcom,q6prm-lpass-clocks";
>> +				#clock-cells = <2>;
>> +			};
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 0dd6a5c91d10..18e959806a13 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3944,7 +3944,7 @@ remoteproc_adsp: remoteproc@3700000 {
>>   
>>   			status = "disabled";
>>   
>> -			glink-edge {
>> +			remoteproc_adsp_glink: glink-edge {
>>   				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
>>   							     IPCC_MPROC_SIGNAL_GLINK_QMP
>>   							     IRQ_TYPE_EDGE_RISING>;
>> -- 
>> 2.34.1
>>


