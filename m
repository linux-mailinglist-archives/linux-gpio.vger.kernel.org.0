Return-Path: <linux-gpio+bounces-24481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0DB29C6D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 10:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F271897263
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 08:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B402E5D17;
	Mon, 18 Aug 2025 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eP8x2g+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491BC21FF5E
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506310; cv=none; b=uNzXyJxouLN6k8Lu52HwPM95KnWwfLViejKEW+wav9Sye+Mz67dtJFq2c0LqqFcDCG8wgSFJSyy9pUU2BCoOxzTPvKg5mE57ajmKzCRgHSc28dhbnwNVb8WLH6V/DhSf+AyNokf5hGfY0u9kno3mBz26Vj2f6+ogwDS5zIv61yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506310; c=relaxed/simple;
	bh=CD035llIDCD4Umz8MDtQLrq9fhNGHZvEXyXcmG6C06w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuTtQ0UQKyKUTIjRUyTwUX1IP2EKK+YIanhwLLYydPuJkzauKNs/4Ea9GkpLz+fc9SqoPv33ZxmXwYy//skpNVe3EGPlGtaJBJbqQVqwuYatZLIEK2gQRo1GqJmeIrUZWdGIsOtbmCtmQKaMwx7yVdjBel7fpSPD3H+N93UWhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eP8x2g+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7pjAv007143
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=; b=eP8x2g+3WBYupLeO
	z86kgWbHPJb9clVn+brIPaR27lH/NVYQbmb4zBiF+QxIyZwuqrek3FeYsvS3//Vs
	exRuy9ufDoi+pL8PMTi9XcU+h58wWRqPvpaaqbbkSI4k+lQmQgbj8w+zLZZPsvsM
	A8R/43Beq1orMsnl93CBsyZPqxBO6AW2GYGGHTSyUbzw94NECzlGtWfhOqXGm2V0
	iaHlOc6SZaA6erjtSkVMl1njEH2uHedcGNxcNK3sgckPnptZ1DTEqmYaOWqK2AVV
	Az+1LkzNWH738cUMhkNO87M3VKy6WDLbXBGtzOd90d3tZTF44OIKn0PdkLqlXVvf
	iDGgyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7uxy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:38:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so630188b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 01:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506307; x=1756111107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DutGDO0lNPzkANi5DBJgpa1NUAXx8F3Z8Af8NmroXBo=;
        b=OdK17xQ/FwIZzE4Dq7mjpNPW3C7Vm6sEldqJae+x83mhg4zATq3Oj8G/703YNFvZS6
         w0jBwbEhS0XFJRVLa95i6YnB+Y9AgBua2QgaUP7x6hBJl4vM1BEADWIAOKkhfjKSy88B
         56IzTt/YWbgmq1v1P+VdmkuTeGZOBiQNO/Sxe+2NqLLnuMHUp7ORMUe0ffOdmv14lagk
         sQ2vEbcBiRAQBiAV2T6wKOCyeMqdYpCAKPyMF5Dc3mKF89uK99d5QorSp/osdyRNddFS
         OQKtpMY2qtTDdnaPN6bAL7Xqr9k9mA2cC5Kek03ySCDKkL4oySpXFtAFPiTp473MdJI3
         xhAg==
X-Gm-Message-State: AOJu0YxdP0Kbnt2EOASx8GhkZHW4SeZLDxOa9sfEEQpuf39h2V94DG+U
	y7+LYJ/T4Q0leaNz2cK8GEGdJbcfQ+/76OMltWxTm2fGrnaTnez8lzGJwf6D8LMAnID4NAGZY9k
	miWlv21CC3QNIDeset5lcfAnjzRrVYdAHaCKip9WyA4MRoaGUfaWQH0T+bn3ig755
X-Gm-Gg: ASbGncs+le+xxhNjKGdrhl228RHoVt0+vaYMxDgupRZqhfjFGjtlj2qOiVQFDV58php
	pyFgBmAycytdLrHD191nLIGJ3qlvBovNaZ6+RBxisOZ0FeZD15HB6wCvHSairxnFX7g8LabthSk
	77kbpOReueG9C6pL9p8ezFI376lIMh6UZ+4zGw7aE0RnLKteCGC5tsq2qUCsIbHkWePUDxRucCg
	nrq26e1bc2RAdCTTCkW3o5wNIBeB6KLBB2tBwCI4In9QAGegZAaSn0jdOdcISvkSwmXpjC6DRE0
	AKKDfW5S7oWBZC4kP6WbFaPUFHt1Zev6+pRfpGunqyflDl78W6Ata2+VRl1NxZkLkA9nSFBApkm
	UcsZz3HgoIfHKf17x8d+Vq0jdtwKkuCdF7A==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr15383867b3a.20.1755506307012;
        Mon, 18 Aug 2025 01:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvGdpW4BvmgJvwA220VJKl26q0Ske15oZJchuSMBJI+GJMNDoy8o/+l77TsIoRB1+4K01lCw==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr15383839b3a.20.1755506306610;
        Mon, 18 Aug 2025 01:38:26 -0700 (PDT)
Received: from [10.249.31.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45593060sm6615636b3a.86.2025.08.18.01.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:38:26 -0700 (PDT)
Message-ID: <e13b4b1b-92b3-47c0-aaa6-7cfb759d1de4@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 16:38:20 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
 <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
 <77067ec1-4f1f-45d1-8027-4c7a6f66ecff@oss.qualcomm.com>
 <14ea3a7f-003d-4893-9c43-c21bd2e7f922@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <14ea3a7f-003d-4893-9c43-c21bd2e7f922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX26EfjjpyuXp8
 0Yk55mEWJZ3igiz9ZWpx7vUHwHkn/F89A+CvzghNcqcaqXsLpR0TD+DgJhid4Z7YXdFkts3hRNe
 NLQKs7kne9tcM2vOKXVOAdo/ALi1SI7rugTkQEA/AvEK8dsFzkq7NT7fMa49URD/GlRzvT7WVxx
 QMYgdlMAsya0hKdv4l3HyO2R62gC/Q/56DX440VFof9YMyI3up9l3aL/Rk0xWdrVTTs1lF7exge
 HVI3/BgtB/Qcu1wnd1+k3Rfg4GB941GuvIYICSi5/cDwuWx9HlP4d9oqjhZ75WP6h7pambgLy7Z
 Dz+Vc1d/AMtfF/NyTfRNu+7l3ELZT2WP8bUfSlTEvdQ5wB9MeHpi9uj1bDDmoqYWTyyWdo/GIaX
 TzFu52zs
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2e684 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dcxJtuKkVfpdsdCNSmEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: G1_luN8ecOekotv3WeEn1h9kWcOAG8ak
X-Proofpoint-ORIG-GUID: G1_luN8ecOekotv3WeEn1h9kWcOAG8ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033



On 8/18/2025 4:02 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 09:10, Fange Zhang wrote:
>>
>>
>> On 8/18/2025 2:33 PM, Krzysztof Kozlowski wrote:
>>> On 18/08/2025 06:41, Fange Zhang wrote:
>>>> Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
>>>
>>> Qualcomm QCS615 Ride
>>>
>>> You are changing defconfig for all platforms, it's not your personal or
>>> company defconfig.
>>
>> Thank you for the feedback. Yes, The change is intended to support the
>> Qualcomm QCS615 Ride platform, which is now upstream-ready and actively
>> maintained.
>> I believe enabling it as a module ensures it's available without
>> impacting other platforms. While it's not currently used directly in the
>> kernel, having it built as a module allows flexibility for platforms
> 
> Hm? Not used? So this rationale is incorrect.

Yes, still not used yet, but we're actively working to upstream full 
support for the QCS615 platform, and this change is part of that effort.
(see 
https://lore.kernel.org/all/20250818-add-display-support-for-qcs615-platform-v6-2-62aad5138a78@oss.qualcomm.com/)

> 
>> like QCS615 that may require it in future use cases.
> 
> No, we do not make defconfig changes for future.

Thank you for the clarification — I understand and respect the policy.
That said, would it be acceptable to consider the defconfig change 
together with the platform support patch, once it's accepted?

> 
> 
> Best regards,
> Krzysztof


