Return-Path: <linux-gpio+bounces-24353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6058FB2463D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 11:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58C71A20E72
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 09:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05972EFDA5;
	Wed, 13 Aug 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npqVpoSu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3932EA158
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078497; cv=none; b=bND5pz4IIW2QRQv30SZTp7vx36BLbTMghsFZpAVJfqBVLeZkfhtgOsmS10sk02bFPrZENfimI9qdPzuBz8pBBw5mDvfnOL6fCgnDup6i4BzotbftE6XzxuMnVI72CMN+suDD7vI92yLUqREHo/HTJZfoysmNRQGHbZRY5sNKASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078497; c=relaxed/simple;
	bh=yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1ID0RjEPF4jGmjJsZfdQYTa3TfOf3VQJ1qjtO+I4GT06Lbm73Celrh+mpG9u/cn2kK89AvOqHvsJq2p8PxXtVzVS0QzUvgwyoRdJyqaI50yhSorwdDVe3wwp7rDslIQL9Nx6ifnnK9ZYfcFhV1dcierYNRcUDu2fKtLRDCqwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npqVpoSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mRqB019556
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=; b=npqVpoSuc3/mcQwb
	NxvamAK6aRMS3QzbpmZYoBmNRHNRfNb1Z6G8NqrtlonqqzVNmIvykXeq8h3i+xpK
	Jyw5RBAXxbRuIiO3SA3LYq6L/kOyC4ogSY19J4EfVozr0oXHIXNYA/6+FVOro0iR
	Fk4cI8dEym49x0nypFWxplNqPTU+kSJOvOQ7PdcPRcZryET53rDbo2KVswKIfw04
	l6XvLQ+BcqEfBhBNGZjnxW0RwpXkmGtkUYdCSpBnm4EOwB8N8fmyCOUPvM+wSHKV
	63inInnlI4AAUa0Bjvlp86v1XorQhAvZua3pEra75Xlc+ScQsxK7D47IVeYVyP8/
	Q+XRvA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6q6qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76be0be9ee1so6596816b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 02:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755078494; x=1755683294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=;
        b=tY16KGU41J/Pswi4ed+BFNZTzBpxFWMXUIm/xKMqAbiMNm7LIB/jcZ8euAFwpMLalZ
         vCubSJoUpnFS2zWHkLy1ZNSJAzYfhbXmI74idUcxvxNWY2RkE4YwrcSBci+ymHLQla8c
         rqAY8Ia+++7regM5Pur5jfLkWxivw2FWztKqtuIAykMgcR8ctAi8Yw9YeZ51325Vsy6x
         lgLvQD1RAP86hWtqaHkB85MUlckH2Jb/jjCGBJ05fuGRAwkS7UHYjdp3iDLaDQjceR6X
         OgLxw+JkosQ/K5ONnJpPB19F87T0F5xR3Mzc9snMfAArl0I1MrDhJWvSJtUjrdcVqzvT
         MgSw==
X-Forwarded-Encrypted: i=1; AJvYcCUoUKqHuaWTZEmb7RBrSNe7Ou0588wZcNtkgl9HTXG0RB7SEJyKJglL6WLTrXpQ7iut0rbYpmSN5jCK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/9cAPJNI2wSTElzLhSrJnHbeNMj0liQ62BAB8CC18Yu95nAN
	qPbXVVurNBhgttLimjVlX7sOpvuhpSqhUsgwkIUdf6w5FsCZzTGHM8E+RvW1L58bqQtlZqB8Vg+
	pSORF3tGfl+JeHDCT0/5kizS4cbPPT8EtFq+TdJKpBOCUC6t8J2xo4YFUGL+gb0hs
X-Gm-Gg: ASbGncvu2fy2+0As6yqFsJP0AZGGDNe8bnolLgP7iMCVl+3T3BdckuqKn3gfEtGSH7J
	p0weHHxFet14HPDRIcw+6gLrong69a3tTTCegDCNrwPOxrTrbAL6PCQjQ+viWV3VJc3+6Qpf0dL
	GV7JQ40sgKupI9anm1XqSAq+ZTXGW4R2HyqppR/qnfsCrclEuBNxzbauuoS/5J5Ayt8Nn9pmBSn
	mX9mS7YN2MDi6CQ+JdN2OpSKsj0AYpV0A00Vxzv8Dh5KhuORvPoil93k8xU13QVM/QZ3ZqUqOfG
	8lHKmFd9M/6u+pKM/X80e9B8Bq8Ik96aMJaYHjq0rnqMOLrNA4ObtpsTawFZHPRr5R0pqTWVOqH
	vPDxoUWI9lMGBcSQeZPqQQ4tM9Sim7D8xhiYxLgwrXtZRQPCnneE3ig==
X-Received: by 2002:a05:6a20:5483:b0:23f:ff7a:4d69 with SMTP id adf61e73a8af0-240a8b5e283mr4270072637.40.1755078494464;
        Wed, 13 Aug 2025 02:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQi28wBETX/FfzYkh9vYqVOP0sSfPKuwwUYnt2NYefL8rquOBU1sF704aafnQm7XBD0r47EA==
X-Received: by 2002:a05:6a20:5483:b0:23f:ff7a:4d69 with SMTP id adf61e73a8af0-240a8b5e283mr4270038637.40.1755078494038;
        Wed, 13 Aug 2025 02:48:14 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bacbb74sm26978433a12.42.2025.08.13.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 02:48:13 -0700 (PDT)
Message-ID: <1c27e30d-9d99-4348-a92b-e9fe86d0c339@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 15:18:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <17b90fbc-ccce-4eb1-b334-5fdef82c094c@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <17b90fbc-ccce-4eb1-b334-5fdef82c094c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX8JLCEdKbAtL8
 q1BI+ITKOOtaXtYItUExk0P2zZgNjy+T2qHxPjcg7ZaUfoOsRlb2DPEm3beBKlUab29M1EhIvAz
 FTWvHYJnDZIk7rW8MG4MmxrKkT4gHYQfuE4pFiGZEg1R/5gPxsiuL2v5Mf9kW/G6tgfowzYuoEH
 t5SP6N4fTgQJHCX/NmWkApHu7vUz7sZN0e3Q4xQvpGR80geRHj/YllCp04o9Vk8aPta/IUCLirQ
 VqxnZbGfg4Ux6vFfLJjjbL3EMpIjteDlZldUgkJwXrvJnffI7uwPQfXM/N2l0zFL+Oo1lNcsffx
 QRlA/YX8xyFvEmTSnVrXTmjuKar4u028+wL1DeyyyOx2KlWIa/z9xGnRn+ajcd/USlA0G3XXKt9
 qnt+3cRR
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c5f5f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DNT5GobofFhSdjKMTB0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: UXW9zUHfrUR_yFg7vXDnVkUSsAbk35ST
X-Proofpoint-ORIG-GUID: UXW9zUHfrUR_yFg7vXDnVkUSsAbk35ST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/13/2025 1:01 PM, Krzysztof Kozlowski wrote:
> On 13/08/2025 08:55, Pankaj Patil wrote:
>> Introduce Top Level Mode Multiplexer dt-binding and driver for
>> Qualcomm's next gen compute SoC - Glymur.
>> Device tree changes aren't part of this series and will be posted separately after the official announcement of the Glymur SoC
>>
>> Changes in v5:
>> Rebased on top of v6.17-rc1
>> RESOUT_GPIO_N changed to lowercase in bindings and driver
>>
>> Changes in v4:
>> Updated bindings to column length of 80 char
>>
>> Changes in v3:
>> Fixed indentation for example tlmm node in bindings file
>> Fixed s-o-b and review comments in the driver
>>
>> Changes in v2:
>> Fixed dt-bindings error from example node's reg propery
>> Fixed gpio-line-name maxItems
>> Driver UFS_RESET macro updated
>> Removed obsolete comment for pingroups
>> Updated ngpio to include ufs_reset pin
> Where are lore links? Why aren't you using b4?
>
> Best regards,
> Krzysztof
Here are the lore links for the old series, I'll setup b4 from the next rev.
Do you want me to share another revision with lore links embedded?

v4:
https://lore.kernel.org/all/20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com/

v3:
https://lore.kernel.org/all/20250721163221.310746-1-pankaj.patil@oss.qualcomm.com/

v2:
https://lore.kernel.org/all/20250721143037.20983-1-pankaj.patil@oss.qualcomm.com/

v1:
https://lore.kernel.org/all/20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com/

Thanks,
Pankaj

