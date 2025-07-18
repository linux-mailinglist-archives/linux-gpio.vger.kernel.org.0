Return-Path: <linux-gpio+bounces-23466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81376B0A5CC
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 16:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E66E160F35
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A3C2D3206;
	Fri, 18 Jul 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdR20Z8T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2610D189905
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847385; cv=none; b=jgVpB1mFtYfskiFNZteqpL8VAheTgDkQXFunHhowt3yPFHpjU39Ub+H5VorKJ0fop/iFwv5tFAyOMoAgbKG9xTX/9BQx4eDoSnl7egPKZ/FtX+D+PTSAcPonVYzEGY2HDKsTpfBfi52bi24gQ2Vi09MNEk7alm0n7cu3EC37fvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847385; c=relaxed/simple;
	bh=oxn3IwVTE7XSOYRmBd//e1DLeZb2q0A+/xIJwcd3XFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/HJs+uR/dhW5AzhzsECOEiPMnq9t3sgUIfK94CRW3OjXkC9BrVvzGGD4hSX/CAhbB+aYYKSpeZft5nVsecUVK19VHdYDu0rMqct+mwiFGm39mTP0LHPZZIFxMfSP1RdcGsFv1FPw/jqqdlY81yNHw3iWv2DySKctxkskrEN8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdR20Z8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IE30kO000647
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 14:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sqth6q6knDV0c4169t8Y4KfYUSLGiSnvgG9U5KJWf+I=; b=fdR20Z8Tv2bfQ4RS
	ivUOSzvyP0AQHfycy2lFDqDXwSpa+5S0dmXjQWR4Uufqu/sW2guK3wPUKJSNvcs9
	kg5d2D8FgTZ4/dtZ3NeUzqEla0+ZT9NCGhREZx+RTRA3PuHEtB6FnGki+eXI64VG
	SK02lCALPeJXLR2wbAyPhUZKnlM0Dp0f2KWfK1e6aG0aSKePiWzS5aYqcoyqPTHO
	zGd8TLoee4LofmzpFKvV9fHmvcMZU+7uzVfkcUR6cXN9XyczFpW4hH+2ZWZhr9RF
	GtTiWziFm4UcHmxoxWpMg+rVX+mqSwogqnWjF1mdXyCNAE2g6RbEHehIWslkkJ27
	PqbCPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drxumj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 14:03:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2063945a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847382; x=1753452182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqth6q6knDV0c4169t8Y4KfYUSLGiSnvgG9U5KJWf+I=;
        b=jM+iYNPm7A0nWG0VOBk6JoOPqRyiNUK+8F5GfGpT8Y5BS8seGhRp9/QNgIsC0E8fKx
         8FjHVGGB9KBDs0VjpAl8DF6OfxUf7CeeNevDHhp3wnM9eVOaARrTOBygl1lhfx0i7VPt
         ctJ4lpkGOo20YDY+QAFo3H/rRsuzBv6cJCHpsAWri7qSZ2trbEklClQfXnCv6sIFFrvh
         4qe4G4DUvBj9ivb3UlcaPs+yGcJ6Z6yIMxgrKrbjrPfkArSIlczCL3QtRdPmGJLQFIgA
         KzJbnQCZB5j0KtLcWNQpG37iID+Z8NTyOkyNr8RA0Egn8cQyzkIR5sa88tcXoXiTBLE6
         Jznw==
X-Forwarded-Encrypted: i=1; AJvYcCVXSlpBycEcLtvfw+0pKlMVX4i1wLi3hvjxXu7SnqvWpqJcWsvprdUnW9oCAy4UO641axq+mMuRajdo@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3kHyL9pmqtcqA8rNXTdkEluz0UPb7gB5zeJofiMnttCHLjw2
	VEFhdKOJ0HVDsir/lvq9gH1E4Z7xkyk73eU0V4aBL6VjXZzOXpfGRrzS1367KMotsbpv/q40t5q
	GE3RE2EGGXodU/mnShxC3vUQDXV5lWn6Z2QJ3GdvmSMoPZoi38FNZVZ7zXvg6RPtX6wE5mMBG
X-Gm-Gg: ASbGncuNybN6+h+nRaPkr2TToPw989oJ8s/Kwi+8ZolEgGsO6gFdr8WYha/X8mjNFSQ
	Qhc18aZ82RSimK1aj8U0PxhOvrqxl3VVkg8kfbF8/U7FX+3XTZD/zZmTp5inIUjyQKuPwNSgGOH
	WZxzvSXHfoPbsn5xH2YKR6SuNrBIIgko8jTLkI7Ib/pWtOxvxW6iB+5MxSeLmE2RXSzTAotyBa8
	LK01SJK5ASA0eamVD1raooeqf8FaoQb3sFn4P4105++Sn7ftitYnhuwDGzQLMBueDq6Bg+PlU3x
	vLOsGuQQS5QgSOEmfBgC0bOU34nBkWMdLm1aP44yheE0cC64kkEw+zCxoVbE5EDetukA59y7zzx
	e+raRXY4YTrurW4uek5w4WQ+vC7u1St+Ir8FuIWqxCVIVcZfge0oT
X-Received: by 2002:a17:90a:fc46:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31c9e7617d1mr18338319a91.17.1752847381219;
        Fri, 18 Jul 2025 07:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx/Y9pNMGr8gS5RpnPZrq5fjuBLOtCovUN4eitkJ53U2heLtj7mZN3nIf+YOVTn/RDfU4J8g==
X-Received: by 2002:a17:90a:fc46:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31c9e7617d1mr18338214a91.17.1752847380598;
        Fri, 18 Jul 2025 07:03:00 -0700 (PDT)
Received: from [10.79.195.52] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm1391851a91.3.2025.07.18.07.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 07:03:00 -0700 (PDT)
Message-ID: <a2be3ff9-d364-4a6e-a8e2-e0391e979b11@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:32:36 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
 <e69e6128-3f50-4bd3-89bb-09d7b237a568@oss.qualcomm.com>
 <19b62fb0-fb49-4a90-bff4-f5634547f2fe@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <19b62fb0-fb49-4a90-bff4-f5634547f2fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bRfxG9btrlQlCn0V1pFxD8bZTNdaQW0-
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a5417 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=ISValDjW7LgzQFoTVgsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bRfxG9btrlQlCn0V1pFxD8bZTNdaQW0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNyBTYWx0ZWRfXxSgwJ3Jx/d0E
 zd8iVMvUeyt106ASgHubebrosgAkYaMiuHN+uGg4PLX87sEnUvCZoAoC/BG3D3neleThDuyWYEz
 vF3eZHE9G+qFVRwqM47VPYGLCEK5X6JSmYkNhJuztVAG0umzhzS0D+i1NEqGIMbeufna443JT+Z
 AwycgWuSd7WyJXbMWku4UVpvGZpviUesqd6Z7MeG09cL6Q1kYrLuwYNz7jC9nU5LpEPO/J7YM0S
 Zw5kV20sXo4hOeYWZ+thrZI/YDRKzWtiJ2MaeteS1FVal+bw5/T7JZJu97BRDw0Rk3gZLYq77NJ
 fNrqfQ5hOT4MQAOc2zXOycS+eHAYW4gGnEResAxTS7kQ8Tv1gcR/tB9VwrcSWGNxu++m5wP23iS
 85vMWf+LoeRDe6sPEz/r2RYcUKJ+znqaANWkFnQD9IyA4Khrg9PXbUPic21e0TRZs6yYqEjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=974 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180107

On 7/17/2025 8:09 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 13:52, Konrad Dybcio wrote:
>>> +static const struct msm_pinctrl_soc_data glymur_tlmm = {
>>> +	.pins = glymur_pins,
>>> +	.npins = ARRAY_SIZE(glymur_pins),
>>> +	.functions = glymur_functions,
>>> +	.nfunctions = ARRAY_SIZE(glymur_functions),
>>> +	.groups = glymur_groups,
>>> +	.ngroups = ARRAY_SIZE(glymur_groups),
>>> +	.ngpios = 250,
>> 251 (0..=250, incl. ufs reset)
>
> The binding said 238 GPIOs...
>
>> Konrad
>
> Best regards,
> Krzysztof
Will correct the bindings along with the driver fixes in v2.

