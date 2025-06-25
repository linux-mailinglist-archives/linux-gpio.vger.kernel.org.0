Return-Path: <linux-gpio+bounces-22117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C151EAE7782
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FBF71BC54C2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 06:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCD21F873E;
	Wed, 25 Jun 2025 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bs8xII2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2E1F75A6;
	Wed, 25 Jun 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834255; cv=none; b=Pfpgm4nn22nBHqB7XDNrtsk6Ifv3jdt4DgMOTMqU8GVIXGw7PgSj37Qp/lV7fogKoQ89wfBA3PeeFIfqEBE8aWMJvGA+i0fWIgw25UcmtX2pEoXK7S89C+Q7bnv5p3NfOuUA1Fer2LaSV+R0/LWiiXO5lXqz8VuaBRr3arSmp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834255; c=relaxed/simple;
	bh=zry1TbVF/2xgxDCVyb1F2wZ2ccRhXxEddlrrpFb3Lk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fFYi0e7PiK+S8feCnnbVqvRPFAEF9bA0YOwX603g41kFCP1MzPcx8tyEha4Y9jE9EtdK0k4bg22aHmIHw6JbgYXoJmVhyT29XzxASS213sZjt4kbZ4y4KtY/4kbKdJ7XxN0xr925kgJSrTGzbJ9qgABbCT/o+LVGJRWzWk8JohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bs8xII2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4mS56014580;
	Wed, 25 Jun 2025 06:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8hHnqbIlpHCx26J4C1orX2rK76HQgkp6MrDdnANpYA=; b=Bs8xII2FEb8yC8On
	PdPatyYO0aPZSJZcbsRzqc+AizrwVVACvdxXHYlU12YVeMzcRFbvFs/HOJcF+m4s
	sjs9eaEUtcis4m7BET76IQHM0KEm9R9cTCU1RBLFYMIxWFtM+3hf8oqFCCjLS/Id
	usCahhX8putbp3gw7hbrDIMNNXCcLWK4F96pRyCLw4O489Sh0EFJ8Rs+H77vztsr
	9XDgCKLLnFp8n94dqHj8vLJjE3lxWLJjep1e5KnWgOH1e5UFGmUZzDqe1ogKwV4Y
	6CjK0iWWxXTi+peNNnW3pjTpTXz+8HI5BEHpQrWJtyc2Td3ZIfFlU1WhaQGazXh3
	pUvUEg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5qvde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:50:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P6olOq028735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:50:47 GMT
Received: from [10.216.43.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Jun
 2025 23:50:42 -0700
Message-ID: <74793074-19ee-48f3-b502-8d970b9f50af@quicinc.com>
Date: Wed, 25 Jun 2025 12:20:39 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
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
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-2-quic_pkumpatl@quicinc.com>
 <q6rbvbvejugioon6l23nmmzeue7l4bgtlaf44o3a4krj3lytjp@p3y6opl7vs25>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <q6rbvbvejugioon6l23nmmzeue7l4bgtlaf44o3a4krj3lytjp@p3y6opl7vs25>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: evxMCpGCLPr4Oq3aJyfN3yt4aycsZw6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0OSBTYWx0ZWRfX2LnYfKSShuEf
 JBka6qRiQ8nfO8XwSLjpmsczyu454ddR0VI9ktAqcflLnFOlWK+/fNqqkjUwlusjiRbhI5ppVxo
 JOR8xXHyyK4z02yJrzBzWQ9n+YHNIHljLRw2lzcqjG42uxIV+s8QTa/sNu9hQ0zn5ZSb05MjFXF
 TXV+LhTqgqlODnWabm+//t1S8eKM1SzSemV1EFmz3vLlm/eK+GTruyNx2ahvCSNGCUDYgoAhHiv
 OJ3D/yXckqbHEa5wPFe8BE5BPuRDySA7HLHRn26nxNvOc2qvd1ptxREvq5jm6xMRXCAWq++RUH7
 JCuiRlWNLj3h1FxN1Xh3aQnQKvCMHrbvoLam3BavH1QD5va1HYa+JS+WqQ6ZAEa8mhMkfJKuYZZ
 sBCrneS5a/QQ6i0LDAnE5/XBAEqPZoU792FnpETLjnzSW68Pz+aPxFqZknmqCb1rjjnJBSUV
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b9c48 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Vh00SPQc0_um_keYItkA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: evxMCpGCLPr4Oq3aJyfN3yt4aycsZw6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250049



On 6/18/2025 2:15 AM, Bjorn Andersson wrote:
> On Tue, May 27, 2025 at 04:42:20PM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
>>
> 
> This should talk about the choice of adding a new "-audioreach.dtsi"
> file, and should cover why it wouldn't make more sense to add the
> opposite of this change in sc7180-trogdor.dtsi.

Ack

> 
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 53 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
>>   2 files changed, 54 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> new file mode 100644
>> index 000000000000..29d4a6a2db26
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -0,0 +1,53 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
> 
> We can be more permissive than that, please use BSD-3-Clause.

Ack

> 
>> +/*
>> + * qcs6490 device tree source for Audioreach Solution.
>> + * This file will handle the common audio device tree nodes.
> 
> "Common audio device tree nodes", but not those audio device tree nodes
> that are already specified in sc7180.dtsi...

Ack

> 
>> + *
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
> 
> Glink only consider available (status = "okay") nodes, so if there's a
> even spread across AudioReach and not, we could even move this to
> sc7180.dtsi and mark both status = "disabled", and have the appropriate
> one enabled for each board.

I am trying to add apr and gpr both the nodes under glink-edge, but yaml 
not allowing to add both the nodes.

Facing yaml errors, it's accepting apr (or) gpr only one subnode.

Please find the error logs for reference.

arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: remoteproc@3700000: 
glink-edge:gpr: False schema does not allow {'compatible': ['qcom,gpr'], 
'qcom,glink-channels': ['adsp_apps'], 'qcom,domain': 2, 'qcom,intents': 
[[512, 20]], '#address-cells': 1, '#size-cells': 0, 'service@1': 
{'compatible': ['qcom,q6apm'], 'reg': [[1]], '#sound-dai-cells': 0, 
'qcom,protection-domain': ['avs/audio', 'msm/adsp/audio_pd'], 'phandle': 
356, 'dais': {'compatible': ['qcom,q6apm-dais'], 'iommus': [[66, 6145, 
0]]}, 'bedais': {'compatible': ['qcom,q6apm-lpass-dais'], 
'#sound-dai-cells': 1, 'phandle': 355}}, 'service@2': {'compatible': 
['qcom,q6prm'], 'reg': [[2]], 'qcom,protection-domain': ['avs/audio', 
'msm/adsp/audio_pd'], 'clock-controller': {'compatible': 
['qcom,q6prm-lpass-clocks'], '#clock-cells': 2, 'phandle': 204}}}
         from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,sc7180-pas.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: remoteproc@3700000: 
glink-edge:apr: False schema does not allow {'compatible': 
['qcom,apr-v2'], 'qcom,glink-channels': ['apr_audio_svc'], 
'qcom,domain': 4, '#address-cells': 1, '#size-cells': 0, 'service@3': 
{'reg': [[3]], 'compatible': ['qcom,q6core'], 'qcom,protection-domain': 
['avs/audio', 'msm/adsp/audio_pd']}, 'service@4': {'compatible': 
['qcom,q6afe'], 'reg': [[4]], 'qcom,protection-domain': ['avs/audio', 
'msm/adsp/audio_pd'], 'dais': {'compatible': ['qcom,q6afe-dais'], 
'#address-cells': 1, '#size-cells': 0, '#sound-dai-cells': 1}, 
'clock-controller': {'compatible': ['qcom,q6afe-clocks'], 
'#clock-cells': 2}}, 'service@7': {'compatible': ['qcom,q6asm'], 'reg': 
[[7]], 'qcom,protection-domain': ['avs/audio', 'msm/adsp/audio_pd'], 
'dais': {'compatible': ['qcom,q6asm-dais'], '#address-cells': 1, 
'#size-cells': 0, '#sound-dai-cells': 1, 'iommus': [[66, 6145, 0]], 
'dai@0': {'reg': [[0]]}, 'dai@1': {'reg': [[1]]}, 'dai@2': {'reg': 
[[2]]}}}, 'service@8': {'compatible': ['qcom,q6adm'], 'reg': [[8]], 
'qcom,protection-domain': ['avs/audio', 'msm/adsp/audio_pd'], 'routing': 
{'compatible': ['qcom,q6adm-routing'], '#sound-dai-cells': 0}}}
         from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,sc7180-pas.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: remoteproc@3700000: 
Unevaluated properties are not allowed ('glink-edge', 
'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
         from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,sc7180-pas.yaml#
/local/mnt/workspace/ANDRIOD/K2C_project/UPSTREAM/linux_next_11_June_2025/linux-next/arch/arm64/boot/dts/qcom

Thanks,
Prasad

> 
> Regards,
> Bjorn
> 
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
>> index b1cc3bc1aec8..708df3f08984 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -3814,7 +3814,7 @@ remoteproc_adsp: remoteproc@3700000 {
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


