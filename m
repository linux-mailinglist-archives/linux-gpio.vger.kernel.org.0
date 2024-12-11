Return-Path: <linux-gpio+bounces-13735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8A9EC10C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 01:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8F5284204
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 00:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A72642A95;
	Wed, 11 Dec 2024 00:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KjCTQrhB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE81F5EA;
	Wed, 11 Dec 2024 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733878006; cv=none; b=AtWsIhr/uSXpNGGDpkNronxlZ8arxtwDXz/yBBcWA1RGFwUNIMi9d3loxhkO3IwGzrB3v0vFnUEG3F2OlJYYDRgYNa+Xaqf0PgjgdX6an3a8eYzRuQPT53A7lMeTc9YjIBppwI2Q6SyhMSIJYMgQsqo+ZnPfdryCl3CZIrjFgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733878006; c=relaxed/simple;
	bh=1H3cIATD0dXLlSVUR/ldxmWO5MYq4IIJi3J0Hk+r9dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=This7hUD2SpQwiQYcWKzJ+68txULhjMeyPBxPMLVfx4RcNOQgzrxQBmYyZpukzXTv9flvk+Nf/x3CZ+1ZRQwZ8IiP8mZVdaSQZtCG8abITtdIGneuf3mOPZPAHv/SzFq2VMB4+htoatatFw5JlzlnuW2M/u8LE7feE3mrTbSlSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KjCTQrhB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADXbp4014608;
	Wed, 11 Dec 2024 00:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOvQ4kEW5+JbIoo3oLAx3A6GmkI7mBSEDvoz1mE4eXw=; b=KjCTQrhBUH38ytjN
	RUtbiO/IEO49nRXsFTPDMtuOEqVqcvodDRVk5i8iitWNs2a8WE6Q1ZwVJo7OQi7y
	cXvEum9l7opxX4RhHY4nXSUoZsL2bnmNBCwwS2+i05Q2THqox6sGVMGx7mueioXY
	PnJ24Hy3X644/kanKm5OxEu7Os4VR507b4b6Wm9pTB6GcvB/TTJC5aJ+0XbD6rzn
	nSCS2LnaRLNzK70P7nXChTrJVcaCll0nh3ht+BLRbF9pxgvZaw1g9vaoNCmRVKt9
	/HP8JdX0Ahy2FZwpmOoN0CqY5JBJvx+jsnKQqYu0uoY2F/nhObKJp11xoPFcKtLd
	4MFU3Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3nb71x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:46:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0kPcP029536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:46:25 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:46:18 -0800
Message-ID: <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
Date: Wed, 11 Dec 2024 08:46:16 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
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
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ygGzruQ_LQRZ7QNeIARNz0cm5J1Cy4Os
X-Proofpoint-ORIG-GUID: ygGzruQ_LQRZ7QNeIARNz0cm5J1Cy4Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110004



On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
>>>
>>>
>>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>
>>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
>>>>> USBC and DP PHY using the match table’s type, dynamically generating
>>>>> different types of cfg and layout attributes during initialization based
>>>>> on this type. Static variables are stored in cfg, while parsed values
>>>>> are organized into the layout structure.
>>>>
>>>> We didn't have an understanding / conclusion whether
>>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
>>>> or two PHYs being placed next to each other. Could you please start
>>>> your commit message by explaining it? Or even better, make that a part
>>>> of the cover letter for a new series touching just the USBC PHY
>>>> driver. DP changes don't have anything in common with the PHY changes,
>>>> so you can split the series into two.
>>>>
>>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
>>
>> What is "DP extension"?
>>
I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
>>>
>>> We identified that DP and USB share some common controls for phy_mode and orientation.
>>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
>>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
>>> It would be more efficient for a single driver to manage these controls. 
>>
>> The question is about the hardware, not about the driver.
>>
>>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
>>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
>>> we still decided to base it on the USBC extension.
>>
>> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
>> thought that usbc-or-dp platforms support that, but they don't
>> support DP+USB pin configuration. Note, the question is broader than
>> just QCS615, it covers the PHY type itself.
>>
>> Also, is TCSR configuration read/write or read-only? Are we supposed to
>> set the register from OS or are we supposed to read it and thus detemine
>> the PHY mode?
> 
> Any updates on these two topics?
> 
Still confirming detail info with HW & design team.
I’ll update the information that has been confirmed so far.
This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
TCSR phy mode is read/write reg and we can read for determine phy mode.



