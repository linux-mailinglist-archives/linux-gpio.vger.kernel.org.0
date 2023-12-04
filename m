Return-Path: <linux-gpio+bounces-918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AF802A06
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 03:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4B61C20850
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 02:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225FC10F0;
	Mon,  4 Dec 2023 02:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JCEJncpN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7A9C3;
	Sun,  3 Dec 2023 18:01:01 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B41vf7I016151;
	Mon, 4 Dec 2023 02:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xC9igk4FhHuAMzyEU0EM5GnQTq3G+P+IMkIVcX7DToY=;
 b=JCEJncpNjFl6xGC83w/ZS6xt7dViD/LmRRyvaGoFgLktzcreF+FMnGMNCG9NOzQDuEP4
 L9CH9NR96ytl/XFATCzaiD2DNJv3QtZt1kKjiLucoaoM8irDWGlkJ+XDQa2ZQMbbj0qK
 m0/syh+D81WvA6OZoxWefRotW3vZUPiKd7yzpBI2jFkmqan1n2hWok/O94H/AO0e67A8
 Dy1yJhl6AIx7rjnUwoz0PYm7OzIuPrutZjZNkLs1UlqTZpLD+A0lJVTIyuZQk+ZL5wII
 +NXuDCvt+dtZ/dQrA9YWceBcCS7LrpMHb8czxpYwUw8YSSA1QGBv7SMeKIsoxxnGb8FH Ww== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqvp12nb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 02:00:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B420ov6023445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 02:00:50 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 3 Dec
 2023 18:00:45 -0800
Message-ID: <0cd61bea-3454-4eff-abeb-8f6b54c43e0b@quicinc.com>
Date: Mon, 4 Dec 2023 10:00:43 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] pinctrl: qcom: sm4450: Convert to platform remove
 callback returning void
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-4-quic_tengfan@quicinc.com>
 <34afe467-bf18-4328-8325-0f2cce4982d3@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <34afe467-bf18-4328-8325-0f2cce4982d3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9ufKatKN2WYkAtqlJ-8Rvjx9vlvvz16U
X-Proofpoint-ORIG-GUID: 9ufKatKN2WYkAtqlJ-8Rvjx9vlvvz16U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-03_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=657 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040013



在 11/30/2023 6:36 PM, Konrad Dybcio 写道:
> On 30.11.2023 03:40, Tengfei Fan wrote:
>> Use .remove_new() instead of .remove() for converting to platform remove
>> callback returning void.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
> You misunderstood me, this series now introduces a driver with known
> issues and patches them up right away in subsequent changes.
> 
> What you should do in such situations is squash the fixups into the
> newly added driver (e.g. by running git rebase -i baseofyourtree and
> changing 'pick' to 'f' (for 'fixup') on the last two patches).
> 
> Konrad
> 
> 
I understand what you meain, I should combine these two fix patches and 
the driver patch into a complete patch.


-- 
Thx and BRs,
Tengfei Fan

