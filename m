Return-Path: <linux-gpio+bounces-23695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E6B0F34B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 15:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 884633BD5F4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB83E2E973E;
	Wed, 23 Jul 2025 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RreGXii/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D572E7F35
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276000; cv=none; b=fp4bTpXjrOLlh3Pr2xYRosLw1K9D/GN1t1TmOCD4ovvS4PX1Ke7beY0283WXQsjPnfwXoGm9p4NolchPmUviwqDooccwlT3CueKJBUs7/hOvMSfA1qAKus4u1mV/4JNMCh+IQuNXWpb/YbwPhxTpTxIbqX5NddFH2RF5cl0e+Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276000; c=relaxed/simple;
	bh=HCpPcP1++9JXtPVhSMZtVXW/xDeqe8ilKiIpJh1wrRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlN6IRLIVD6+qlipigK7yQMhHB6ysXStIelhNtVpkGaEElmmra0t3WYxA73hgBJGrBtEiR2ApTKU0ZY7fRb6Zxyli9hJb9MIi5isY0tAiWRmNqZfiX8Rxfv8m7yV8tiV5M2+UL87jv5/xQkleJbuHzoW6mh3UCAxDcDGrIsfVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RreGXii/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9U41G024377
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 13:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk+9lQo8OLB83ZmQKGeqhkdZVjnwAl1R2lXLUIpQERk=; b=RreGXii/7t9qNNrq
	DbFUiqGFPpcSsP1x+0q0SSuLU3f8PJogH6cufEOXdeX+gFz/Dn32IeKeEKvLT1C5
	iWpL9q816FjFMx+F+TnHboV4c3+QSvhWwQqUEzs+0RNZ5rNgz0jEZawq1KVWJisV
	wlBurbDpJMa99lauhWu4rWj1IaPBxz7DwfqFJJnSsLB/RCKP9MfE+IVEoz1Kz0Ch
	28pjoGdllyNkPG6oJPzR9kfa24I2OLtFVrD2299e9ls4GKbsRc7ViqkZCG4C5x/n
	jIX60c6BYiqsZMrs/UV1I0NXV1dj2+amT8WjgeHN5Kh9Zz0e1Ssfb0N/g9tis4x6
	M0N6PQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3er0w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 13:06:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so56326915ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 06:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275997; x=1753880797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk+9lQo8OLB83ZmQKGeqhkdZVjnwAl1R2lXLUIpQERk=;
        b=C9bYJD/obDlK2ELrU44kdqlc7CB9gwv8jTiqXefa6OeD28cTAyJwHIkgmabtI3HyuE
         q0zv88v9xGGf7oBEB47QuLwJXfpmNRefrDUWAPNPTVLZR8vWSTeZ/r66stY55dMlp4+0
         GVJYIA92ZRPHwLU9pDniLI/gFSLJ1UMB2/mX4CKkA0wcPFRiCHuKR2mmBdRM4HjqEZf6
         CMMYnJW59HxB1XzxJiKgY4wUneiSc2qTMILDJ0lcEM1P92omE2Ljak8zd4CW9XRD9BdI
         w8OKkueHigOGh7xeRpk4XVlX/L6SAHVxxjvEYnvHIQimVT3guOFnnlfqE98JbPPsWtkF
         mMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJlFs/OpoCVc6AeJA4c66ZMMjZ6Gl1ekaKDukEKiWzLwGj5IpF+WbydLzE/ay9lyk5xrwCc2KJc9Jk@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVmqveHdBm7hgvkoEHZsvfFKIW3/7AvCQ90ygEtqOtbrGihdJ
	flSu/NHZbp9mQT/VG0Yd35n7Y1IwUuzll5x0s0ViiNeh4vf2mJYlrDRRz6M0JO24izfh9vO4kJJ
	ReGDeFMo5I/11Q/og7+8ClF+Wf00A9JkAsiiA8biOpWwTIvIvkopba9cSW0ALC1wJ
X-Gm-Gg: ASbGncvf18OhF4ErdF/qgB6MvYNN01OIs6k6uYZhc8d4lg3NGGi3P38fh/CBmgy1KBE
	dJ7lxohJjWjz0NGXa07q5diNw7Zpx6pbHOmSfeB7NfAMKTHO3o8SljjhgQmQSIdLr34TAanZwXG
	zVK6winCOQdTLjC2ByAzuIxwVKihtkBp+6H9pgVgO7+Npid+1bi+MBXrTRu4i4eaUTlAaxf0K2o
	7PBV16KBGe8G554lq0UZq+dv3gknbEw2UqntmFGXuys5QN5qFS63objFEpSJh/Q/wsQhkBgel4K
	heJ9takCP3dfvuY3S1CSLK+eAn0YnYHIYH0zDXQodQrHBKmjfSoyTHJ2OL1t06taLpNb//hkRDx
	QwUyF8F652pwtgL+WPHCVXwl1E4w1vGxZlzgbYJVxMmX306c1eRYD6A==
X-Received: by 2002:a17:903:2a8f:b0:235:be0:db4c with SMTP id d9443c01a7336-23f981d70d0mr37484695ad.41.1753275997074;
        Wed, 23 Jul 2025 06:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFR09d0346jm0sDaEVMHx8YhV6QKTGDzDqC3peZGOi5ZhCvo3sbJzMUXqkg13bKxJY6DVNg==
X-Received: by 2002:a17:903:2a8f:b0:235:be0:db4c with SMTP id d9443c01a7336-23f981d70d0mr37484365ad.41.1753275996639;
        Wed, 23 Jul 2025 06:06:36 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2e51sm95859345ad.19.2025.07.23.06.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:06:35 -0700 (PDT)
Message-ID: <e3d04cf8-6d9c-4514-9d8f-782e2d1505a7@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 18:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
 <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
 <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
 <0aa2b07d-8c66-456d-aacd-c554bfa7664f@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <0aa2b07d-8c66-456d-aacd-c554bfa7664f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OG1iv7tFHREJBHZNEuHZm15vvN88rfQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMiBTYWx0ZWRfX2WNiIbGuBVsv
 Gl6p7fz3vYLWdLFsxG99L+Hy4gfOFx66Y3QZ3ZNW7GaNbiCsb78aZkp507JXFIuEiCriZT3+Rep
 TS0/xpRKa7lE9SsZkXkOUssVCFFjgXvS6pA7DURsL4JGf73ZNPtbevsGAjHKfY//8dW8Z9B7h5c
 TOoLM31/tT7smgaGasgDpEthqJ2YB4Xu4f0dadaCnZVTAa6AdSKZ6psGptBFnN0+Pj0OMn5D6qA
 HMx/7kOCmezirx/BoDqdbtV4yyRd2u75F/bvKqJ4WCjDZC9c0nY8ZGk57vSEiaP5/q6VXaf2LEn
 KaN6QWHSsNQY5ai0eu9MrXvnd8ANWQRv3Vm/XowrzLhSXZRtNjcSUPmt5VMvEjSoIgITDnPvodQ
 T7uL1LY1n7Yhab/ALHUQjXPv5a4BE4y1ktsalrDzkJEhGt5RcGH1Cb32qXrg5XRbu4vYvKiA
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880de5e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ABa4ZnCp-855lqKztdsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OG1iv7tFHREJBHZNEuHZm15vvN88rfQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=933 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230112

On 7/23/2025 6:23 PM, Konrad Dybcio wrote:
> On 7/23/25 2:07 PM, Pankaj Patil wrote:
>> On 7/23/2025 5:25 PM, Konrad Dybcio wrote:
>>> On 7/23/25 1:48 PM, Pankaj Patil wrote:
>>>> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>>>>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>>>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>>>>
>>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>>> ---
>>>>> [...]
>>>>>
>>>>>> +      function:
>>>>>> +        description:
>>>>>> +          Specify the alternative function to be configured for the specified
>>>>>> +          pins.
>>>>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>>>>> Any reason for           /\ to be uppercase?
>>>>>
>>>>> Konrad
>>>>>
>>>> glymur_functions enum members fetched from ipcat,
>>>> this does not exist for sm8750.
>>> I'll repeat my question
>>>
>>> Konrad
>> It's in uppercase because of the way it's in the driver,
>> I'll update only the bindings to lowercase and repost.
> No, the driver must obey to bindings. That's what they're for.
>
> This value is only used between the OS and DT, so it doesn't matter if
> the docs refer to it in uppercase, so long as you keep both in sync.
>
> Konrad
Okay,
Yes both driver and bindings are in sync.

