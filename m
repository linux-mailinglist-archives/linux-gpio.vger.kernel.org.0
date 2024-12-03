Return-Path: <linux-gpio+bounces-13440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D539E147F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 08:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFF7282D56
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BD6193402;
	Tue,  3 Dec 2024 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JEo43xnv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE317BB25;
	Tue,  3 Dec 2024 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211744; cv=none; b=AwZLk2FwaMGvZryolmDnoFQ6ZoA7RZZ9WxmR/mbek9OGvsNn4w4Nuf/ZDWjEdeH1vOmUkmqXUK09+jCIOl77AX0kkzaa3Cw2zSy+1Gf+VnH71aa74w2oewNzFdmjHEPhnMZljxcBohm7Jl18O0SIKCL8//qinFZwDVAAFXq44h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211744; c=relaxed/simple;
	bh=uJpAWbtffBXMYvdF0d8RLjBLt5cDK1OhE1wwPna9wEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BCprtaag0WRpOO275pdRsLV6aBu1CDKQSVGg4v81Ggw2V2CSVMEHknDxrygVvBy9QD65rrP8YfKu9FQAejc0GHe3qH2jwNezlhvHro0+U12bEK+ov9h0yq76ddEna2/Agh69fRVlg/aUJC9WrIO9M4294wEwwS6DdzR1KzQ/MWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JEo43xnv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B373dY7031023;
	Tue, 3 Dec 2024 07:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHnc1l0YpCh8KNyPY+LZmpCKvM4O8DE/NokifUNNwt0=; b=JEo43xnvdfC4duyA
	sD1c/RQnr6HUVckU3xD9c0AGtAbSyBxmDvkHjhTOl9zm6ugJfvC94y4otx+Ag0wt
	17rjQoBNQvF0/Y6P2snPJpP9T78cLwaHzrBVmaSQlipNYPSkEgB9TmckN9d9JdTT
	N4FwVBT/FjnTxAP/Be2ACpkIWHbdU53KEev5tU3od+qxD4dATN3SdxEGFkFhxNNO
	DlN1LpvWYbdgPZXARlBC0YoDs2kmq5UHX6kXcECwDwCfAeSrzx3zzsvpyBRw65yt
	XIkh86WIYn4cZbW1Ke5g+ZSq3Qe/h+2V3sZkguBPaPuzQyClFFkAs9GYtcW2FkP5
	WF2IoQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90r316-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 07:42:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B37g4Lf004198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 07:42:04 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 23:41:56 -0800
Message-ID: <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>
Date: Tue, 3 Dec 2024 15:41:53 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
        <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
 <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
 <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q1qP-vfrtkvEYCb2L1IbQAc1v8C0dnsc
X-Proofpoint-GUID: Q1qP-vfrtkvEYCb2L1IbQAc1v8C0dnsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=655 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030065



On 12/2/2024 5:32 PM, Dmitry Baryshkov wrote:
> On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>
>>
>>
>> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Introduce a maximum width constraint for modes during validation. This
>>>> ensures that the modes are filtered based on hardware capabilities,
>>>> specifically addressing the line buffer limitations of individual pipes.
>>>
>>> This doesn't describe, why this is necessary. What does "buffer
>>> limitations of individual pipes" mean?
>>> If the platforms have hw capabilities like being unable to support 8k
>>> or 10k, it should go to platform data
>>>
>> It's SSPP line buffer limitation for this platform and only support to 2160 mode width.
>> Then, shall I add max_width config to struct msm_dp_desc in next patch? for other platform will set defualt value to ‘DP_MAX_WIDTH 7680'
> 
> SSPP line buffer limitations are to be handled in the DPU driver. The
> DP driver shouldn't care about those.
> 
Ok, Will drop this part in next patch.
>>>>
>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
>>>>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>>>>  4 files changed, 18 insertions(+)
> 
> 


