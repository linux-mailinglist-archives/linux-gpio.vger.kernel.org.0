Return-Path: <linux-gpio+bounces-25484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA6B41C77
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 12:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9689F7B280B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D432F3626;
	Wed,  3 Sep 2025 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9JUpZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434212F39A0
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896889; cv=none; b=mZJeexPG6N3McS5h2CUuzm6s1Ns4JlhfCR8THm3L7xDZ64s/fjlb2MIFaiy9BV6lr9OuA1UXq60KrecRjbn2RhiWYWcZY3rX4dqhQQo/gXknrHBTvpES9ruDByOEOBj3RCQ6wlPZ9LvcvebLV2HEf2d4QV6l42b+DaL242qHrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896889; c=relaxed/simple;
	bh=Tm+ubvDpNij69TvVH7w3Pi5cDsVKJICM7WBgBpUCufU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnOr79aRGdz/kEnjHYMJPKP5I7ex9p2t4+n1jHDVyrennnb4f6d4u241Oo45/fT0LETifihCLBgc7ZscGA/ubrBoTAPU5nbQWxdy5laNVajIZp+MOdUNvzJtR5mkV6ROuund420ILFVRIIisqVJ0xi4X8SzItUiCkZnQ3aLNbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9JUpZ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AAI1u021315
	for <linux-gpio@vger.kernel.org>; Wed, 3 Sep 2025 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=; b=XL9JUpZ+VtDwPbNG
	R12bsrBYQgiEvFwu7M6IkEk0sHMwzQjPhmsvgvSX/rcv72V3Xad3TjVc4xMZFrrF
	ly+LStev01TlDrXqB3MUO8ipPdmAzrtcuQNmRAAbaeDH/pryFP357V7OITcmz8JU
	3vIpsQjTkFotg5EFcDTtAnwa1k5tvD5FVya2qjvL0oJXNtxA9FBg/eTxEQsTN6Eb
	yOTX7AI448QwROoEYzShuS5QdElPe1Yu7fjJWYMf37V9K8cW4eGYazkhN4NMIrrc
	yREXPskGTy6/7D9GWSAiCkdz57G50OTIGECgZ07VMftIU4bGD/kgJ+I530QXQiiO
	6W6O2w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3e6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 10:54:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-721c6ffab9cso3793586d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 03:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896885; x=1757501685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=;
        b=Vrhj7aHVnBfJz8wmJncXPGhbUIxXTeltOK8g708J7GABlevtg875gOArHwADO/hBTs
         sXVnwuJpjBWGH0GvJc2qfKkBFlIJZwR9FFiixWdMHi/oOCZCSUOAtZB6XZRgDNv75rJQ
         M2kYX2bOZ+oUz2L/pRBHMmKW5yEfsJeVv0+6bVFx3uD7Xa4Vii+7T5FYei0hqxz4dfwf
         VrY/gK6XwUsP4KnEQiVxdY51q//9wrwa3JotMRvbr50AIoaxY4zlJ5qEIFQfb9BH9CVE
         bLocZNhaDGuCAOxtxmfBmHxIWpa7GQ2BEh731efi8+wV+LzljDmt4UpthjBrS1ZUYT2j
         qL3g==
X-Forwarded-Encrypted: i=1; AJvYcCVxU5Lvi8LgPVgZorNJDHlOIj1LHhVMi2SKfFsF40DgRSyEH85VU0G12QHU7I3IROKXXLzKHiSz/WiQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQitwK9/DfCszzj7evSgQq7hJsGmNlDzEHHhnz8m/nRneKJV7b
	96ktUO1xmR1ik5flWshBDgAr0+VmmBoshFR3TXsAdR0j+Gzw6vFXfzuOKIRpF0QpKotyr+nriFF
	N4Dn3OyU2ligjQm6jAxvHPAamPGcvHhSmJbrVTYBGa94YvWO1WVmedpc/giIWSdBc
X-Gm-Gg: ASbGnctKxp6TbqA+TUSZ2f4ROW2PIolSf0EjBPTyEnzZE/oQIr14AyokveoBc89mGga
	wZcqA/lm0XXYvesVGPqNfpZf2Xc98mYYskGAgDJDrZL4kz8aYegkVYKlrQhGnVl9l1hQTfdGwGv
	YQcMxQs8f/bCnzrDz4Rq0RMZx20prj7H7cOTdr4erhRttSyTUFNxnxrzK78S49xgFWZ7BfSjT8d
	WXmDigF03VBuQtLhBiVFwqkAwCK1l27m2N5R1AD4u23qphNLMxl2yji/m9xyAdclBev/rKaYP1M
	eO+/m8gc7Tvb0YhGBrsZ3N72i2w9wCQ22haHquuBsv45sAPXatVl6YrgUFbl755s34s6c1fAncC
	ayGdDt3AxB6YWujMDDLSh5Q==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150776d6.4.1756896884455;
        Wed, 03 Sep 2025 03:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetDZkFBnEZJ/kKVop60xaty004rw6FYmAAfEqO0MuEDwRglU3hRd6MaQX/oR3QxdMGUb85g==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150266d6.4.1756896883912;
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ded4749aesm7462141a12.32.2025.09.03.03.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Message-ID: <6083a6b2-c5cc-41f0-8026-e022f2f4eb38@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
 <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
 <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX3DpXwNn3O4vK
 ESxoSVT3L2BVS8200X4dtA6zfNaCVigjnm4kpdamS6KmNRbIFBBwjpsflD88hDJ91OpM3NMTVvl
 MlvZBNZ8hf5JxvkWLTzxQ3EntWi803LKIAsiy9lNrQltXGEILsTQupkMzcSyE2jZKoddcWrQZwf
 DG3kXFQlSnAKj1pfU+3RYAtU8J2WACmAy0VqDnQOthJoaudN5eYb94eGja3U8luNYNXQu5qFHFl
 qOcunVbfEOsPsCQL2HpA25aGhJ6TO9wGisEFjpGVDKdzbbhSy2hez6r4UEWvtGsvXiac8GdFzN8
 Z0OiuijJ8f19VHMZxqtJkJq75mBTWnd2DBirvwlEfXd3+BREzvz5pJfpQBYeZIB1r8GWZHj0gxE
 gCUOYL5n
X-Proofpoint-GUID: WG_y4Cpu_19oiC2oUec8R9zz3RrQ68r1
X-Proofpoint-ORIG-GUID: WG_y4Cpu_19oiC2oUec8R9zz3RrQ68r1
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b81e76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bBqXziUQAAAA:8
 a=OuZLqq7tAAAA:8 a=G6GrHqeLqaT2Jh2KzrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/3/25 12:47 PM, Barnabás Czémán wrote:
> 
> 
> On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 8/31/25 2:29 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> +		qfprom: qfprom@a4000 {
>>> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
>>> +			reg = <0x000a4000 0x1000>;
>>
>> here you reserve 0x1000 for the qfprom
>>
>> [...]
>>
>>> +			gpu_speed_bin: gpu-speed-bin@601b {
>>> +				reg = <0x601b 0x1>;
>>
>> and here you make way for OOB accesses
> Ack
>>
>> Make qfprom length 0x3000 with the current base and the gpu
>> speed bin should be at base+0x201b, I *think* (the docs aren't
>> super clear on that)
>>
>> [...]
>>
>>> +		mdss: display-subsystem@1a00000 {
>>> +			compatible = "qcom,mdss";
>>> +			reg = <0x01a00000 0x1000>,
>>> +			      <0x01ab0000 0x1040>;
>>
>> In v5, I pointed out the size of vbif should be 0x3000.. and the random
> Where 0x3000 is come from downstream is using 0x1040 for vbif.

Hardware documentation.

Konrad

