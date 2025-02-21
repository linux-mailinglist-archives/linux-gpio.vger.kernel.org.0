Return-Path: <linux-gpio+bounces-16420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A5A4020D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 22:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 934467A72B2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59153253B7A;
	Fri, 21 Feb 2025 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ8O886S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012724CEEB
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173640; cv=none; b=hPyn+VoV1yrI2duqwq2bOT4M920n4fD6GnwZgH+pcp9upiqlxOTJdCaAgpSzCjjbeSWtwe0ZPRAvpvujJ8cFzwM/lWUEhD5kI2gt6EeYKzISIpO60vTmJ/hcEWE8okOv2cTAPN8z1b3nync9Y8ZeoPfYMRdhn2++4guEFB0S5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173640; c=relaxed/simple;
	bh=8tmdo/Ter+kdGrzmZv4+c1CC3FGOX+GbLELDtAoZByo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5vApd8G/44M7DPgsFDuIqysMw4xIV//oG90En0ZLxgxa5n5OJ+5VjwFdBG2z990XBqlVgUakYs+yxuIBrOwK1kP736jNI0WvetjoxXAVPE+nlgDIrYNcITUEbWtRnAp3j50y3YqU0ACJ7UHwlazmz8ZOZgTeAU7nlc97WkEt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ8O886S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LENIR6018624
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=; b=TQ8O886SD//Mk5a8
	T3Xz0YYim+FzYQpLp1+NISKMF0Eu4sh4jDyBL0kCmmA6GR4jgy07JLlHDE3Ev7gC
	IghEuF+QLWar5EmBYPtCMI9AInB5t14smZKyO4Cl3whg6T3X9MX9EnG901Os6n+Z
	prjV/aWiVASujUuqDddQfNr4w1iqVD1/lLOHkJ7uNW+PQwhFey8rWVbM8m2JXmIo
	/rMzKH4Y0i1JiILKyEA6u+1qGgrdxtzaB0FRC5BcLe1L7bxf1wx2l0E+XfuU6H/X
	tcAMGhARTBBLciIqVi6tQChxXMHpKrDuBIqDzoo0n71h6ecx4mZep05R8PCjA60q
	/WzY+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rjjdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-471edf114feso4411411cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 13:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173636; x=1740778436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=;
        b=wFs6kHS7tavuavx4ceBPjhZWjGKI8trV6VFYkl0UC4L6Ttg/n5JNxEdSQX/leX5bzu
         rQtEzoxCKSdwiHw5CLdHhcBawoLLeBwDNXXCeQ7H34WVPKJEaeCL7j7vtMWdAlLS9r8u
         9FfaX+oJEZMpKEkr1eryoOpRDN0RlLk5CXD2tvQAu2jjpNjksyDyMEYzoOaxbCwL8fhV
         hcF+Z2+Rdy4Gl67cY2AtSX9PZ5rXEs4ZVc4Npaf9h5+zlXIqQyI8aBMet8sU6E/j3eWE
         Ab0Q8F7u7biMbYjnY4qPRkFQumdq583f535gMQBMu5+6RYPl+JWzYpfDjrO93luEZ1NX
         ZwFg==
X-Forwarded-Encrypted: i=1; AJvYcCWfkjDqhmjBQQW8MkQRMyEnN8+LhjujBohY3DCC6UmRnKanT0MFSOHfXGKSrTV4uKmvz92ssu5JlVJi@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIos6/68DBwOrYEUPEKiQ2/GAAcTzegXLkPNzm+HV4RN3jxop
	XAGJvdeL7oJ8FOfD//TeVmMgVL93OVnsPvhsbnjg3u72yhspoVyv/TUlwd8/vz/oVM0SOp3LMbu
	hZiyDfSPLjM9UA8vkNANHe8d46oUVZsPDP/l8spR5IRA5h/YyGYbDhBhkEIOG
X-Gm-Gg: ASbGncvE42NAL7dq273GH4G+35Okg3hcSK1HR5G4or4Y5+LhsRPRym2F6y9uCtpBWBm
	ygTfrzZ19CBjcBqqA30hLlW9pjx7cMFOKFxBWLZzhy1dJalJIB3xmg7zKzJNQZsGKUNFHNiPZLD
	wYhfaCX3pMARYllzt7yKHePpWv0ljka8CSy2ecxc5AXvFM10g3V6zMoDqMT31IvZLKhiIK2aNm3
	tQSMRIPvtzR0fECxdGxRy0OpE315EpiB1c5VRDaGhI3bEFSu2b9sbo29g/p7yvS26Kmd/q2fnUS
	n//HYlq/xvfqpv+I48bQ2XgN0eU7ZyM+7U0uFTVQC6auP4qEvDWDXtTOW190uBEbYWGUqA==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460951cf.13.1740173636387;
        Fri, 21 Feb 2025 13:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3eGXB/j6IzUtZrEuHEsUKdriBuCF9PZH69iEvZpR1z/0tsNN3yb6D7Tmo01aYFqwMf4Hx6Q==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460631cf.13.1740173635901;
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb96fa4d79sm1069931966b.126.2025.02.21.13.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Message-ID: <752a6234-cf74-48f5-8836-343011b6eeaa@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
 <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
 <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KssldbjrRJ9c5llDJssFfiZdEyTCqjn2
X-Proofpoint-GUID: KssldbjrRJ9c5llDJssFfiZdEyTCqjn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=856 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210146

On 12.02.2025 5:20 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-02-12 14:07, Konrad Dybcio wrote:
>> On 11.02.2025 11:37 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> So the computer tells me 8917 and 8937 are *very* similar. Have you
>> tried assessing how making 8937.dtsi an overlay atop 8917.dtsi would
>> work out?
> 
> They are similar but there are many small differences:
> - have two dsi
> - using adreno 505
> - different iommu it uses arm,smmu for gpu and qcom,iommu for applications
> - 8 cores
> - camss will be a different a bit
> - venus will be different a bit
> - have more i2c and spi
> - different mdp version
> 
> Maybe i can find more differences, originally it was based on msm8917.dtsi
> but we have decided to keep it separate, also it have different license from 8917.
> The plan is MSM8940 and SDM439 support will based on msm8937.dtsi in the future.

Alright, makes sense to keep them separate then

Konrad

