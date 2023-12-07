Return-Path: <linux-gpio+bounces-1088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B080824C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 09:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EB51F21ACA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552341DFF0;
	Thu,  7 Dec 2023 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ilPCaLe3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CEBB2;
	Thu,  7 Dec 2023 00:00:11 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B76Igpp028697;
	Thu, 7 Dec 2023 08:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lGjg+eMB7ihoQUbzm2j98upCYMWjjJlXLBUfI58OJP4=;
 b=ilPCaLe3G8fTRmgELV/+eppm5dcISeKA12S/8uAm3k0rRSOYmjWaPSlEKnEv1hSHJQ7T
 jU3iBnZ+PYlj9wjJs0hsh9YMdQILLJ2QnR/BMrL2HoHlaCsQ35vWZe8MJ1xYQxTxdihF
 KNpYGmvvaudPZnaFhlKW5vvUyHJnW1D8dUMIgtsiyx08GKEvrn1JJrHObmUOPlREZk9y
 hCP8fEOopB2HL47rn3Z0T9mU0mgz6aA0ytyA9LnGMf6fPn6AUUghxPjfL4QBO4BScQVV
 ZmFLEklgnsoAkKbMY0BV4NGc6YJPBxtEFiEY0l4adrCTLP8/D20A28s+ZGJQwWdz3tQ3 Hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utuhfa09x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 08:00:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B7807Ln005793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 08:00:07 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 00:00:04 -0800
Message-ID: <775026a4-82d1-4369-9d22-c33a031a8f70@quicinc.com>
Date: Thu, 7 Dec 2023 15:59:59 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] pinctl: qcom: sm4450: Add SM4450 pinctrl driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20231206020840.33228-1-quic_tengfan@quicinc.com>
 <957060a5-1d99-4dee-a83d-004622e79262@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <957060a5-1d99-4dee-a83d-004622e79262@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GYy-VF-8Jx1yM5filw1g7EFapqgOzPYd
X-Proofpoint-GUID: GYy-VF-8Jx1yM5filw1g7EFapqgOzPYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_06,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=486 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070063



在 12/6/2023 4:59 PM, Krzysztof Kozlowski 写道:
> On 06/12/2023 03:08, Tengfei Fan wrote:
>> Add SM4450 pinctrl driver for support enable uart console.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>> v5 -> v6:
>>    - squash the fixups into the newly added driver
>>    - drop reviewed-by due to update patch as new comments
> 
> Really? Why? What exactly changed in the patch you dropped my review?
> 
> Best regards,
> Krzysztof
> 
There was a wrong understanging of reviewed-by tag before. reviewed-by 
tag will be added again in the next version patch series.


-- 
Thx and BRs,
Tengfei Fan

