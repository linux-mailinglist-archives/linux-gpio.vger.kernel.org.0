Return-Path: <linux-gpio+bounces-741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBF7FE5D6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 02:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B13C1C21229
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 01:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344025394;
	Thu, 30 Nov 2023 01:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3J+8R4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD656122;
	Wed, 29 Nov 2023 17:11:45 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATMe4ZG026170;
	Thu, 30 Nov 2023 01:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Bsz3IXVIrE1FIVFVlafauAQU9rutTsW40vGJ4o+YjeE=;
 b=G3J+8R4n3CIcLnDRdnad+QBDc4UzHsSm6LfeFnVMTY5TIAkQHAVrnyzt2ZaEDDlIeUBj
 tEyqqsedhJwjuYt+/5o7uJRymXELMxZoiRED5WIABRkSoV++mAHj8JhLu6uInaaQsyNy
 2LAb3eke2sFxqYBN6dgbwQFyq4cedMLlQ5S8I14rBhkLWwZpfn2TwkCJpPnLFMjm3iur
 7ClgWVA17VO1y7iiSzhAmh7xGJ8Flo9XEOEMYaf3XkcGHIczv6/tneOvuyabP0A4Bt2Y
 JSo9VS3tRxEL7XDPw9aT8EBanS+MT9aAA/24jt7qhDi8lqdE1tk4Djy2s3HQ6O3u8DdY OQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtmn85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:11:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU1BdtU025754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:11:39 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 17:11:35 -0800
Message-ID: <2958722e-94b9-46d1-9f0c-3fc241a3e633@quicinc.com>
Date: Thu, 30 Nov 2023 09:11:32 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: Convert to platform remove callback
 returning void
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231129100422.16659-1-quic_tengfan@quicinc.com>
 <20231129100422.16659-2-quic_tengfan@quicinc.com>
 <2d6c7d2e-c8f5-4e7f-901a-8ca208d7b442@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <2d6c7d2e-c8f5-4e7f-901a-8ca208d7b442@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Md7LtClVXWDEH3M5qc1GtzyRnsNI8bGG
X-Proofpoint-ORIG-GUID: Md7LtClVXWDEH3M5qc1GtzyRnsNI8bGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=739
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300007



在 11/29/2023 9:21 PM, Konrad Dybcio 写道:
> On 29.11.2023 11:04, Tengfei Fan wrote:
>> Use .remove_new() instead of .remove() for converting to plarform remove
> s/plarform/platform
> 
>> callback returning void.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
> The commit title should include the platform name, i.e.
> pinctrl: qcom: sm4450: xxx
> 
> The change itself looks good
> 
> Konrad
Thanks Konrad review this patch, I will update patch as your comments.

-- 
Thx and BRs,
Tengfei Fan

