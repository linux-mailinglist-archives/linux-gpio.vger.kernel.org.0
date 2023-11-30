Return-Path: <linux-gpio+bounces-742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 459857FE5D8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 02:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006CE282F0B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 01:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC5C17C5;
	Thu, 30 Nov 2023 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9vSfxLO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802D610CB;
	Wed, 29 Nov 2023 17:12:26 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0xvVg031698;
	Thu, 30 Nov 2023 01:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6iprRU4CWcp+7nQ2BvabMB1D1LXd606xKDhQyKxSeCg=;
 b=X9vSfxLOtkktadXdtYa+P2iAZJjnKUZ2MWnpVNyaJUE1aH4Psz54UHRtZPeRCrZNnMAf
 Dj7pmgj+i6xV+5BxfgtMPfFjGf8XCsYb/wiIDMPAVRuj+jCjOzl2u2cCgLgL2SI0PPZU
 zIS4u8PIQgIKH3xVXTwgRFrXV0L5rYQ4bNDHBa5hVDjGDNwCfyRYlMnfxdFNFBn0dBEx
 lKEGVDXEftk+eOmx6eNTQW8vBLy+Dwpht7sz6cbb4d7BheMg3/i4tLBEOMqWbQJ7y3KN
 AVTD802vSAEHIY/PzQjMf0COwisVnmxYxo9U+lbAa+Tk6F+Y53bPE4b/vJuJdTl5X0Yd 8w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up2s0a5cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:12:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU1CM2t016093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:12:22 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 17:12:18 -0800
Message-ID: <e2ff7520-1727-4945-b5c3-3b14f107475e@quicinc.com>
Date: Thu, 30 Nov 2023 09:12:18 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: correct incorrect address offset
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231129100422.16659-1-quic_tengfan@quicinc.com>
 <20231129100422.16659-3-quic_tengfan@quicinc.com>
 <09f46b92-edb0-4edd-aaf0-c6e685e2acae@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <09f46b92-edb0-4edd-aaf0-c6e685e2acae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: re7VjYayNGViRGrlO2acskoMK7gYN4lc
X-Proofpoint-GUID: re7VjYayNGViRGrlO2acskoMK7gYN4lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxlogscore=471 priorityscore=1501 bulkscore=0 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300007



在 11/29/2023 9:32 PM, Konrad Dybcio 写道:
> On 29.11.2023 11:04, Tengfei Fan wrote:
>> The address offset of 0x100000 is already provided in SM4450 DTSI, so
>> subtract 0x100000 from the offset which used by ufs and sdc.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
> The change seems correct.
> 
> Looks like the pinctrl has not been merged, so these patches should
> be merged into the "Add SM4450 pinctrl driver" series and resent
> as another revision
> 
> Konrad
> 
> 

-- 
Thx and BRs,
Tengfei Fan

