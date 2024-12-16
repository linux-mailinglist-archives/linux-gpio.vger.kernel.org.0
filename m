Return-Path: <linux-gpio+bounces-13899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AB9F2A48
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 07:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0538D7A22C1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F7B1CCEE7;
	Mon, 16 Dec 2024 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EuJhHu0K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A975A48;
	Mon, 16 Dec 2024 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734331606; cv=none; b=E8n0BLtWKEfC6uLIazn9wqHL6zIjq1njKe+7sWgiqL6L1xhoY3X/v9DtVUs14NYWxBAmJRJb5k6niRzLfgn+JI+O4LGz5R+gxW/WVPeM/lDdXwsp4+72ALCQ2f55SAbD1xvCraHNQ6NnFCkKNYG4Q+o4PoPmcxgGL3ay5f3O+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734331606; c=relaxed/simple;
	bh=uAA+xsvVn62MXq04wVPd7Kih4Sb9EJn29VAChkY1Up4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l0POM0dsXfUVFDbYbjCFQwVtBwU9hENJyZV807eTXzpSNLlMPyxTpAos0ACZvwjE1bCr8F7h5kPGKKEt2/3DiaFzx1NjWEzfQP3pHzGCzOnnhbMIiSfQ53QRZy/08yqOpvCHadM/ABMxTNxVV0pVC5XVt4lDi4KVeeWeRV/hk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EuJhHu0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG28tB3025857;
	Mon, 16 Dec 2024 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzVlqg/tbSo4RLlGYHUSgvpFKa0KrzSAkEHjBi+NHG8=; b=EuJhHu0K/dfrhYsQ
	KKDv9okeNKpyr8IS3ilMH6Wg6x7rSBqksuuNHVlfkPIeBxQWThuytH1X/f/brSG8
	UoOt+sSB9pNOpBYLy7pjhtk2feUmKh+Ade0KGKFQTIR6Ow8qJJ8KgLGv5SLAoWEm
	vIF7FVFcWTC9q2DZfrBsvXXo9WiD9IpQtfbtDC54EK/2BcVlKiDyXJwGgoVcuBxw
	IeeP+PeSCjnhBnxJ0xz/FOo2zg8o3l0Qhjm9jinZSAwFMlf/ZOyabAOb6406mUG1
	Ax5v86uBrL4p5hm7BvahWL//p6TKuV/e8CXNrZ58p+/VBiKqWTJILf0rdafwZSv7
	mEJfSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jb5rrn5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:46:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG6keZu011347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:46:40 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 22:46:33 -0800
Message-ID: <365c24e5-5482-4ee8-9dfb-36af96454d2d@quicinc.com>
Date: Mon, 16 Dec 2024 14:46:31 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Correct the number of GPIOs in gpio-ranges for QCS615
 and QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
 <ccsuwijfrspm2a2irycsicqepjhwai5pfvgkd5dcaf3nhmqwui@hels74qjkiva>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <ccsuwijfrspm2a2irycsicqepjhwai5pfvgkd5dcaf3nhmqwui@hels74qjkiva>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ANd-U4zH-U6IysopODhS89HLFQ3969Yd
X-Proofpoint-ORIG-GUID: ANd-U4zH-U6IysopODhS89HLFQ3969Yd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=814 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160054



在 12/12/2024 5:34 PM, Dmitry Baryshkov 写道:
> On Thu, Dec 12, 2024 at 05:23:59PM +0800, Lijuan Gao wrote:
>> The UFS_RESET pin is expected to be wired to the reset pin of the
>> primary UFS memory, it's a general purpose output pin. Reorder it and
>> expose it as a gpio, so that the UFS driver can toggle it.
> 
> I don't see pins being reordered. Please correct your commit messages.
> 
Understood,  I will update the commit message in next patch, thanks!
>>
>> The QCS615 TLMM pin controller has GPIOs 0-122, so correct the
>> gpio-rangs to 124.
>>
>> The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
>> gpio-rangs to 134.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>> Lijuan Gao (6):
>>        dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs615
>>        dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs8300
>>        pinctrl: qcom: correct the number of ngpios for QCS615
>>        pinctrl: qcom: correct the number of ngpios for QCS8300
>>        arm64: dts: qcom: correct gpio-ranges for QCS615
>>        arm64: dts: qcom: correct gpio-ranges for QCS8300
>>
>>   Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
>>   Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi                             | 2 +-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi                            | 2 +-
>>   drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 2 +-
>>   drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>> ---
>> base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
>> change-id: 20241211-correct_gpio_ranges-ed8a25ad22e7
>>
>> Best regards,
>> -- 
>> Lijuan Gao <quic_lijuang@quicinc.com>
>>
> 

-- 
Thx and BRs
Lijuan Gao


