Return-Path: <linux-gpio+bounces-20610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AACAC5B9A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31087A73C4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 20:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A4020C005;
	Tue, 27 May 2025 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuwHtTT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1120B7E1
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378986; cv=none; b=pvg5ph4kMAvxcpdipTEs3gnSD6miXdKje8MCfk9DwHIs8N50sqRdMY4xpr74AA0CUKJ+x1hEXGA+LRTtU0uKZbIMlif3WRoa+5AlGtP5VLG6ECRFq5AwGalu3c4qCyXbrOf31ydls0wGihQa2QuEYgjHX6YgrHpLYcfBuWwUfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378986; c=relaxed/simple;
	bh=r3whjUIUpRdHK1V4b5tOyVHJGvxYVniojff5RrS+ur4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6MMQySJvWfr7HKLNknoGfpxuHgN8C4udYFxEmN5yeBy1JMlQuzLXsCOTJ1qiGw352qOdtXrQwWy52zpBuk0Mhk0uKKqfcL95ucxX2IZqMWMPRl8PMLuicDsibMXkrhl1aAdYbaeOY8WZ6VcxQbY34Sux3AgiPL/RQWfgQM9Zno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsuwHtTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJle46005773
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 20:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=; b=UsuwHtTT+19r7X8+
	9xmaaZgI+E0BIU70xalEcDbNCLUWA3zODGfnv3/ro6F7QXVxsRWDTWwby1mIIJfB
	W8z2bntkGEeR9PFuJqqDMH8dlrAKdVUw3qxjFFb7O3+F98T+bWjAh4Lo/WqA8gj5
	Ymffg0F32lHihXoT7GeEg3BRyPZu3RX70+mdjrzLjgji3SKwywfI7V6RDMuUWHpP
	mWhc8g6vUvxkgPjIMvMfEXVvLpnVcuQI2qNMFUHlKJAEHQgo+yn6w/111Xgrpv8S
	ARkHdfBTbl8Y2ByIpLAcep8iN4/qLAK91a8pqvU4NgKeovig8qb5MvcwvKY7fvSV
	N//IMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p87y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 20:49:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so111488285a.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 13:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378983; x=1748983783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=;
        b=sVYNBfHH3o+ojKWulfNeCfYj8Ob6iJ7rAMLmlVI6GAUoWoHnG2Lizy2FUhaAVeadLd
         Losm/a7ctxlwv0lvz0ogQ0hs8nfeMQP1xW7H4u0XOAo/Zd/eYj3QpByDZzu+0l9nTrEX
         njIwsoo5U8uJ9TqdaLC/3/OrIRTG0IuiyLbPe7C3pGQR+af+qY+AwaJFrQp5fC/ST8gO
         QlJPWuCOTNy5gQuHkE6NJrWWYoHOGfikvWmsGh+MUgxii9JazcIaJrcSBXqsnwQZxgon
         j3Ou1Jp2TWtuyd+0nSiXwNUn/8hycA5/TzU3+SZcCLj30XY5JMJMTnrKNkoYQCIrfNgC
         598A==
X-Forwarded-Encrypted: i=1; AJvYcCX5W7/JsXblSioV4zLEFut5aB1OXhne38nRPWipmRizOn6nKi8WDRyBDgMa6/d4iIkae3qeSpc18ac+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ny7aVfDGtDDThjVRX+DCKj9f8w4H3JN04lPHd1xUgJ8r0qEv
	CsV/1nEChdw0/5934ukaSLwyhNkJ7rEVdhFYJMHLhLLIE/dVytTNibOSiXA/gJFtuYL7fFAK3Ag
	qBy/ND0fYNEpvCl3uwyfGrvXUsVTpANl6Nr7WQekDXLtz/fIknH72xydtosr2oPDA
X-Gm-Gg: ASbGncsdCK2tELP2eKsAFtCPXSbekQmPeXnFunumNwsUP0jCNNbyiyw7qKCNGNHnbMk
	atjXr4XHLmttEezwks+awgpV+q7WlMgII2gYJXGgN1Wh+e/6d2jmGDjUul19rIqVyYKiDNlJA5O
	C3lwQxsw/+FF9wnn1TmOF9UWi6Dod1uhhswMwOA2NWQSyc3QGNOoiHzomWK2iG3vPZNKSAm4IQx
	DbccvOFUPWXORB4z6hWJguiWZ4sS25a6HVGixyFajwaQAc9cjonIL5SbacB66B8sG206AMYP1aK
	RvIYAolvhK1QzKFAR7GM5PPAcOoZMlS1TsMSvj8wqhyxG7MB2wqaXje6QTUmOM6m2w==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796618085a.3.1748378982910;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Ja5XuujBwuUP9ccKnyssxrFJe/lbLz9Lqf/caKcpdJ8XAsoYbJmo6SDfbvW/t6c1zMYunQ==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796615885a.3.1748378982465;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f2508b7sm8518366b.132.2025.05.27.13.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:49:41 -0700 (PDT)
Message-ID: <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
        quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HmgIKnXb45xoV5LH_XJb-dfAUCKt4Ke5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX38Y62CoyDHSY
 TUL7Tns1UugJKpponVeqsR5Z+bMOIRjYw/8toTIo3jiAz5W09hkZOn5zeq5xF+VXs+u74B6TTGY
 x65ew7O412V7bIuHKl/2js8ABcK+kbBURmmQ+STgunrhsEAHSWGpqMOjzVNha3yGEyyNzQ4LMA+
 JPitRZHHaVxnNDKOuJupqa7q0bhxnd7MTbGcIUwwZP0gwra3Fxm9YIySokY5xlLpekZJsSU19Sa
 IjpeJF+/pK09wB8SlOxZxkcOjhhIgTe/kji2O3BS15rV12tcuRdjJbLH0eZxh8SLE9ZxDWRVvNj
 ghrOCaQqO0SxGN/O0YKO6gOtsP6zAHUarDEcxoIUwPO9km68wXfluowDR917pfdduvAEoh8rCaT
 vR5hSXRT/G+BDdnC3gfj8gav1kSaGOlGXYw/mvrehdCbt67lL34OLY5nPODYDjhSmZZlgG9e
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68362568 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OAqA0DyV7igbTOjjZJsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HmgIKnXb45xoV5LH_XJb-dfAUCKt4Ke5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270176

On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>> when the link training #2 first attempt fails. This approach enhances
>>>> compatibility, particularly addressing issues caused by certain hub
>>>> configurations.
>>>
>>> Please reference corresponding part of the standard, describing this lowering.
>>>
>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
> 
> Anything in DP 2.1?
> 
>> - All devices shall support TPS1 and TPS2
>> - HDR2-capable devices shall support TPS3
>> - HDR3-capable devices shall support TPS4
>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
> 
> Any other driver doing such TPS lowering? Or maybe we should be
> selecting TPS3 for HBR2-only devices?

Bump, this patch looks interesting and I'd like to see it revisited if
it's correct

Konrad

