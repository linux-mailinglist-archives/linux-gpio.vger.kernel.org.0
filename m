Return-Path: <linux-gpio+bounces-11869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F49AD3C0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 20:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAF2FB222FD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 18:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7136B1D0949;
	Wed, 23 Oct 2024 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j9TDRImf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35021CF7A8;
	Wed, 23 Oct 2024 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707386; cv=none; b=susZZGcw5adC8eKNo0RqpSPTcZ061ASngDcZnMT+7sh69vMoZUrwxGOE/1v5SlsNfCBKQz/O5uTAZSRSWxef3issu3ovBdjEw+FTdL9X6oF2P7v0qlTZlZ/N3TF0bRS/YTK6gUhsaPTOdPtLYaQiH14gCGZFwyZDTRFKkPhhGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707386; c=relaxed/simple;
	bh=KQX8dw7pK8Jea/E9TPeB3j1+6XTYeyNVoSLpd/A6AG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WI+VjUh3o5Z9EHbmB5M6JpSe4BjnsL3wWjIhe7toFPVLHbmo/paYT2vrjLzBoufGyyYMRj46ocNDtzArEx7YItf+T3xqSC+yK4s+1xPiL+hP2TFA/3hYLmxfDFsg1V07uwEHZNobGJBe8HGJNJRPA0DA52cxQ7JkKJRy4S5C6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j9TDRImf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9hVS5031330;
	Wed, 23 Oct 2024 18:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RueU0ksXDKW2wUdMExIXR88SrgYbVYySvuzFQj1eBSc=; b=j9TDRImfvG6TxVr6
	UggR/pa4Ro16guIDapNes9e/FIPJXj8cJXbHNpgcaAYH7u5qPt0oPD7VTZJ7IrXn
	3S3q3IKNii2ZNlIFIyKeB0ITOvB/StFvlnZVMM5LEHR1ZU1KZ5zgOSH+9n1RmUW6
	H0xFZ93Ogw3GqODKM12whbjgfVE1MEl3J32W5U/+RCkRMrVxoxN1hD+uV/kCS3sa
	d/Qy8QppMUN1qet3rLemdzGJWHmqPQymd9A90OoOY0O83J6q5briy3rwQLFw+sta
	Rrfl8KOpzsmPke1Qh/ksjYIWFDUrFBVVbx5A6YhLYCk5haJDcb1Ls2luKuuQeRc4
	9TD6Tw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3vu71g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:16:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NIGK2j019671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:16:20 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 11:16:19 -0700
Message-ID: <5c7c9cc4-a1f5-4014-8b16-829a70231374@quicinc.com>
Date: Wed, 23 Oct 2024 11:16:19 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-2-quic_molvera@quicinc.com>
 <5k3kfyx43d6r2hchlbjpplhxkm4xfuu6xefbhydqrhnd3zievw@oftxc2ub5l6m>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <5k3kfyx43d6r2hchlbjpplhxkm4xfuu6xefbhydqrhnd3zievw@oftxc2ub5l6m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BmxxvsqkMtpZRbVrEWSG1R5mA2qKTn1q
X-Proofpoint-ORIG-GUID: BmxxvsqkMtpZRbVrEWSG1R5mA2qKTn1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=732 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230115



On 10/22/2024 8:22 PM, Bjorn Andersson wrote:
> On Mon, Oct 21, 2024 at 04:04:13PM GMT, Melody Olvera wrote:
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
> [..]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    tlmm: pinctrl@f100000 {
>> +        compatible = "qcom,sm8750-tlmm";
>> +        reg = <0x0f100000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 211>;
> I know it's just an example, but I think this number should be 216.
> Please also correct it in the dtsi, where you made it 220.

Will do.

>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        gpio-wo-state {
>> +            pins = "gpio1";
>> +            function = "gpio";
>> +        };
>> +
>> +        uart-w-state {
>> +            rx-pins {
>> +                pins = "gpio60";
>> +                function = "qup1_se7";
>> +                bias-pull-up;
>> +            };
>> +
>> +            tx-pins {
>> +                pins = "gpio61";
>> +                function = "qup1_se7";
>> +                bias-disable;
>> +            };
>> +        };
>> +    };
>> +...
>> -- 
>> 2.46.1
>>


