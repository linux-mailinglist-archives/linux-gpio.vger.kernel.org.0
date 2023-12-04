Return-Path: <linux-gpio+bounces-932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DA802D01
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6D9280F39
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 08:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D53DDB5;
	Mon,  4 Dec 2023 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RLFsYv4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD983CB;
	Mon,  4 Dec 2023 00:19:51 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B45k8te017698;
	Mon, 4 Dec 2023 08:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7lyoP0LlnyFu/BiIos9IGHaAeEk3gWrvekSiH1bCIn4=;
 b=RLFsYv4fiYvJnnn0rht1OjA7dOGI0xmtFVzY/zABzsQeDSMXPyG8ZGSe/9U7Ay0NeSeM
 TBavSBakVzUQyROg+Y4d+MqFb2WI5dS5d+NrzELQ/UOsDa9FOK7qAxunx7Awxft479yA
 e9/JhUCoCBqDE8ipOBIlFY+w+2V4V9UrkLHWx8w+Ge1hykOO0zDPKj5ixYtewJqaKYpv
 p3eGMPAWL3uOif+EK8lW1XP20xLk5OXQwjZ6h7ADgXG/Y29JW06zeMTqNIKdsgH27DVB
 xpOorKMUNeHO+PUniXi3BrcPjEyC4Qsy5+5Ncjv9smKFkmPy1WvgbTtT9pRYPp8ZyCtz 1w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3us8wpgahs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 08:19:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B48JkiJ002607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 08:19:46 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 00:19:40 -0800
Message-ID: <34f7ac9b-e84d-45a0-9f43-c59fed7ee887@quicinc.com>
Date: Mon, 4 Dec 2023 16:19:38 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] pinctrl: qcom: Add SM4450 pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-3-quic_tengfan@quicinc.com>
 <1d2fbb36-9476-4f32-8bcd-33fd5dcbd6e4@kernel.org>
 <d192f32a-130f-4568-9622-d3465c709853@quicinc.com>
 <1b65f67a-8142-4690-af6e-4a0bf641b7be@kernel.org>
 <c3e18a62-0d50-4291-94a2-17a51957253d@quicinc.com>
 <6539d781-ecb2-4ffe-9daa-e82ec8d70bea@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <6539d781-ecb2-4ffe-9daa-e82ec8d70bea@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cwUTpANtwVprO9cylqH2B0-jty5eIOyQ
X-Proofpoint-ORIG-GUID: cwUTpANtwVprO9cylqH2B0-jty5eIOyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=745 impostorscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312040062



在 12/4/2023 4:14 PM, Krzysztof Kozlowski 写道:
> On 04/12/2023 09:06, Tengfei Fan wrote:
>>
>>
>> 在 12/4/2023 3:56 PM, Krzysztof Kozlowski 写道:
>>> On 04/12/2023 02:57, Tengfei Fan wrote:
>>>>
>>>>
>>>> 在 11/30/2023 7:57 PM, Krzysztof Kozlowski 写道:
>>>>> On 30/11/2023 03:40, Tengfei Fan wrote:
>>>>>> Add pinctrl driver for TLMM block found in SM4450 SoC.
>>>>>>
>>>>>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/pinctrl/qcom/Kconfig.msm      |    8 +
>>>>>>     drivers/pinctrl/qcom/Makefile         |    1 +
>>>>>>     drivers/pinctrl/qcom/pinctrl-sm4450.c | 1013 +++++++++++++++++++++++++
>>>>>>     3 files changed, 1022 insertions(+)
>>>>>>     create mode 100644 drivers/pinctrl/qcom/pinctrl-sm4450.c
>>>>>>
>>>>>
>>>>> Hm, was this patch ever built?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>> This patch has been built before, I will check and compare if there are
>>>> any errors and changes when I submitted this patch series.
>>>>
>>>
>>> No, it wasn't built. I just tried - applied it and:
>>>
>>> pinctrl-sm4450.c:996:19: error: initialization of ‘int (*)(struct
>>> platform_device *)’ from incompatible pointer type ‘void (*)(struct
>>> platform_device *)’ [-Werror=incompatible-pointer-types]
>>>     996 |         .remove = msm_pinctrl_remove,
>>>         |                   ^~~~~~~~~~~~~~~~~~
>>> ../drivers/pinctrl/qcom/pinctrl-sm4450.c:996:19: note: (near
>>> initialization for ‘sm4450_tlmm_driver.remove’)
>>>
>>> So you just sent a patch which was not even compiled.
>>>
>>> NAK.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> I compiled all the related patches together, but I did not compile this
>> patch separately.
> 
> We talk about this patch here. Please do not send knowingly wrong code,
> because it does not make sense and hurts bisectability.
Sure, I will avoid similar problems in the future.
> 
>> The fact that there is a compilation problem is known, but because the
>> patch is already reviewed-by, so a separate patch(patch 3) is submitted
>> to fix the compilation error.
> 
> That's not the process. Each patch must be correct. Each.
Yes, the correctness of each patch will be ensured in the future.
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan

