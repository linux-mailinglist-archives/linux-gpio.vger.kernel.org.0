Return-Path: <linux-gpio+bounces-25588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F08B43C60
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278E61C843F8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784EE301469;
	Thu,  4 Sep 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWXbA4T9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D1301004
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990787; cv=none; b=eIv1TS+PbNGeY6jmMMCF73TAFq5gf2tM5GAeGLdvOMQCspH0Zl58wSqdlWgvVckeJKzlG6ZVVOcRBY3/5KQxbneu4yqfwfp0fEWztGGnFze5IV+dPqxDkP2pIDDYboZ5oJUZpMrL+DRH6pLvcYX+lldtIk82PtD4V65tO819MFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990787; c=relaxed/simple;
	bh=HGRZFwd49tFfYWB9SUlChD9l0RfYHNSiyeeXd+GpDu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDopEDT5boP1MsHeR1lR+slgCy//6aFH3Y5xbo3A5c/rWQHKh092rl9H6bNKKc94d5NbWY1gVEl8fAQRuYoEMWM23hFqGqVjdQ80AfyYHG5EzPvD6RVGkpJ2bUv8AcZbF2eFcdXHMgfT/VRnTCimO29DQi5yXjHkf2RNGuGogOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWXbA4T9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X68q013961
	for <linux-gpio@vger.kernel.org>; Thu, 4 Sep 2025 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YrnPjMXXm4RKHlJrdtGIK0fP8Rj/KwUrIvqQDVckTVc=; b=HWXbA4T9cfiakpA8
	HMr9BVStDLMzpW8OsgkJHaMl7o/r7xsh+CTuF2qEQTbWkb1APsBypqyHZcK5N9X/
	rCsyzc+FL0no0pUxM1arWbG8Gy0D5l1wknfmNxIXaigwa8JsIRmlhdrANUwOyhAj
	teVXby0v9LPmhV+XOabManMLZBHH8rDgtBer0Zvo+8IklWQhp8iJchBxb1bDZUZc
	9u+ii7hDuom/gZI1poh4t7IxCBkM3+hVIkbb0Qz2pmE0ThOr57njPpB20C4iQcec
	ALN1WWiXsrpjQGRvkX96xbGsR+MyYaPvoylnn/RMywd9NVdbGHtxJx8NJcr/6ROv
	t0hW4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7nv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:59:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24b2b347073so15187095ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990783; x=1757595583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrnPjMXXm4RKHlJrdtGIK0fP8Rj/KwUrIvqQDVckTVc=;
        b=eZkfPuSs5fLb7TkjEIng2FoN9Ews5s0A/em4Va6EXTSLMzFgxpILpTqF4zc+2M2EL8
         bu2l+hMSlhcmpFBY3VV5EmvO/doebyths4k8G0+AuLMS6E75/c/HyIfmyq8JDEueTVj2
         H0IcQ66ENa8ufH+470KlRWw43VsTFSMiNaAsiTnI5dI7IW3IfBWQ0iOJCD8vrFPB+yjh
         GHYve62DgjyYWjMwCrQhtmP5zLhikGD0nSeBr4BpGifrZ06MVJfNPNWE6QwS0tq0/T9U
         oLXPFTVrFsFkO/IAJ4IB+hoHcw/neOMdfr0QBr+MKwgX0MQGVRmMV8ngmkjfHJDzTzX5
         mwCA==
X-Forwarded-Encrypted: i=1; AJvYcCVIHKB8r+1dJaWE3tl3PnoOSVbAsGCh6e9cNOJ6hbJH9wKQs+952J90z5754DYANYalSu9RorPlmjNC@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLXgLiO+BVTD7Uokc6efJZd52YumPGZYDH5B2GsrZIQbVb8VP
	d0IBlIYs3KjZYL/LXORhZhOiOzKDko7E87ehta215z1PLuKAATyWnx6xMXTDP38Z/nyE/2ZkIcD
	HWOD2zKkW/SCv8AEaZ90L4sb0FHGU1XenmWBbfVwUCDCr5suiUFNXqyJaJANnIdKg
X-Gm-Gg: ASbGnctarJU6U4NXi14pJcUPG/Gz/IWONZBmUziHRncKt8/2BR8abSpqVNphJJYuchu
	GLnKK22YM1QrNplD67pea+jwN+EGBtbLRulGG7V942GCGsSCDb4O21S2ErBa9eRGRDrMI8Th9eD
	vBJo/wIpEgAA2bjgO15O8rmljS9o0buRYVUb43jJA5VZl+WOggxwKjpC17F/MLi94dDmemqVV4E
	RVKL6sC5PwZXjJbaRxzgpPU0JltCC+Em162yB2luvmFwPkyLfdD90lNwITMlg+d5BEzDnIebleq
	0wdpMOXCUDmgyqvMemFxGdogrk3Ib37hJWNVYCUIwe6lWsafmHXuuMCICrxsHIsCXL5BnZaIoJA
	z8XD4n2L0RHIaMeFp4Hqad7vwY6PMaF2Khqd8YKo5o/DgFnFGOVDO/UIz
X-Received: by 2002:a17:903:2441:b0:24a:b86b:fc4d with SMTP id d9443c01a7336-24ab86c16a0mr194843245ad.22.1756990782928;
        Thu, 04 Sep 2025 05:59:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDs555ipRvC1ST73yAjE3u8OV2Q+43GBd/Kx6p1J0zf61ODiAveluuSUk6VqxqWJkCV5TZJw==
X-Received: by 2002:a17:903:2441:b0:24a:b86b:fc4d with SMTP id d9443c01a7336-24ab86c16a0mr194842835ad.22.1756990782410;
        Thu, 04 Sep 2025 05:59:42 -0700 (PDT)
Received: from [10.50.21.161] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c829d9114sm51930465ad.57.2025.09.04.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:59:41 -0700 (PDT)
Message-ID: <6be45464-0b54-4fe7-aded-96d6c7d38da7@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 18:29:32 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
 <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
 <d35s5ldfswavajxkj7cg3erd75s2pcyv725iblyfya4mk4ds4g@hekhirg4fz65>
 <bbf60240-4d84-47fc-ae35-483e55968643@kernel.org>
 <hxwrmoyik5bzgtxufw2trjwz5oqn7jut5wsej4v5xqdk5ho6hi@jic2xbti5jn6>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <hxwrmoyik5bzgtxufw2trjwz5oqn7jut5wsej4v5xqdk5ho6hi@jic2xbti5jn6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX5qIuDcz+tVaw
 A5BbUbRXA9HoM9Ax5DOo/XrZrWVJDXQu4r4l+C2ugb3JVH1zjssFLnFRUsBrfC/9uukM5yu+PSe
 3vGolmC3pwObi84rtPLVJovgAcBJ/1nY32S5Baq3Lgo1w6Kg42SFrylKmzPZ2oyKau+rN59CyOo
 PgnWI2211W0UWfn5BYTtVFqfZHBaoL6bgAEpW4DoFAE1nwmjVizyTeIsgE8vu/toWShT+2IiJ5p
 EU4IXY4hBUypnod8GGwOPoI7bI50RcQhMwkL+oXKijDm7atV+25iVldK5tJ/h4aDgVuKPZd96uE
 Ze5ijq5BkPJVVdfk84W+P+wC8W9fI41CuwKnru2FWbh/DsvoxSShcZEQ7e5FWId2ygAWdIQzsw1
 pPtkon89
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b98d40 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=tCOUNiJIdlxrdUxpUMYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: imRBpzxDlSAs8UvF8_uLXKMi7Y-yo6eg
X-Proofpoint-GUID: imRBpzxDlSAs8UvF8_uLXKMi7Y-yo6eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 9/3/2025 5:52 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 01:28:43PM +0200, Krzysztof Kozlowski wrote:
>> On 03/09/2025 13:01, Dmitry Baryshkov wrote:
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  gpio-reserved-ranges:
>>>>> +    minItems: 1
>>>>> +    maxItems: 119
>>>> 124, I guess
>> ...
>>
>>>>> +    properties:
>>>>> +      pins:
>>>>> +        description:
>>>>> +          List of gpio pins affected by the properties specified in this
>>>>> +          subnode.
>>>>> +        items:
>>>>> +          oneOf:
>>>>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"
>>> If it's up to 124, then this pattern is incorrect.
>> So 125.
> I think so
>
Pattern is for gpio-line-names max items which is 250 [0-249]
I'll update the gpio-reserved-ranges max items in the next rev

