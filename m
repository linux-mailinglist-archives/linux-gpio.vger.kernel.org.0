Return-Path: <linux-gpio+bounces-18798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6CA88D31
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 22:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACAEC7A57D7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 20:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DA21E5B75;
	Mon, 14 Apr 2025 20:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikVxrvTU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096171E1DE9
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662948; cv=none; b=O9N4/gXMveiVhLlKBJ/RsD/PRrpgHUyPawSeXCahDWQOk8FmAIMoKSkr/TPUX7udWoy5SN+gauiSWkNkb5UukRu76za9ubX1hBU1CYunJ9EwjN/gNpwAy0c76GilVN1clZs64ZYOiM6A2NwduqapFP1ciyGZPtkvsmYhhTGvtqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662948; c=relaxed/simple;
	bh=treTBaIxZoc3jdxAPHMCYgFICz5n9kyVrC8UeP9/WSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARoKDglRTkj3VM/sqDgz8VHyvoFGGlWgOw9jwPp4DmPcpj9MyVopEKdGeD9hPeeVsZIecxbjto5fiPXxGmaa0i8iq40sFDk/kwMsImJyJisSWdR1cm4YThgqwNZhp7zpzVXX3rf/NkGK6edfiyBFgQCnTcGclCiVBlsxeuIkXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikVxrvTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKIh7G028993
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=; b=ikVxrvTU13ys9n6N
	jaLLgH1FaPL+nIYUpFJPW7Q409nPG1nghVHIT6Cx2I1bRUnGTqQYaYpcknUVlAZW
	Qd515P9l5wS0CXUIXBha6uLcHrCyNbrn1gg+cn8BqUsMIPb2arDJOAuU/ED9u1Co
	ornb1tJSAxhEU4uRJZ3pHG2Ct4p/LS22YDGHOu1dsBCUam9Znu1hp3Fg6EJ+T4JT
	S4P5Ph/luMP/LjxzNt27frSZMeHtEOMRCC61liIXC+rmIW3wYIjF3n4+/6s5nYHz
	KE2ouncoT/DaqRlTIPQJu3RNpP9ykc51eXyvXr72x9Fr/aFf4Qf/bwrLUgihG2Wq
	jRfY0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs15t03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:35:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so14617116d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 13:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662940; x=1745267740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=;
        b=MCieH8s27B0GPUSdve4o0jMnBeXzj7ggvWEG9G1xPRChGDNUM/v3B60uSwRJA1WmHh
         1UV4ZgHlw0q7RoMW55ZpKdfOASPd5w1yYitMVaSpQj39e0fDqBN/2Q4atsM+PCuBN7s0
         8XrW0yurk90HYCXKRpM/Ee7T/aHOwnLNMr11RolT7I8G+3JyeHSIeJXmdty+iu+bo8VD
         k5lAYCIBaqQ6t3zlWxMTMnhvLWSx4C8DlZHpuDOj9pD6RbpM54nOknO+2OSAwGfd0bGY
         UpmSfkjrOgHT5lVJHPmlqaGsW8IBXiKy4rRmQGDtjl2134Nq9r5Qjlb+NwULnXDCEbhL
         FWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiwqyB2qxxqCCmugsbViKL2lkIbPn0PNEEolDVQPC8UnZ+HWu1EOeFSqtTQOb7RYrvpcPAyvCo2+RF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw1dmM15tzb0azz8SbXxS2KZFxB+CaYtDLbK1hIBARy1AtqQMe
	P8dKhnD5CF80Yio7WgAeZOxWwh55yj4n+nVjWCbSaRsluULwhCrTeiNC5eyL6KsORKwN0X7udPF
	u+uaYPXlGHp4B6zsBKA1PnEes1SpXausMyUiYuYlEiLYvryYgn6fahzgOrLr0
X-Gm-Gg: ASbGncsaDIDJOBDILnllfBpzGjYH85nGjYMSyPa6c4wPDJAOXsDK14Kqp6zk23oyoKH
	z9FGw+x8IKlBTW8EuvhrflrglTFJmE8jAowEw7+gm749vJvTN5jyt43WD+G5artBMc5nD83I6YX
	L3rBZDZ0emiu3zftnAEEytTiukbpHuF/ZmDzKojM21EDgJIkn1HTmYwYKGgrA8OsZ59QTwrhJZe
	pm6gYEKQ8eAZJyZCPRlkSMJU7twCqPTTmyQBsr+sp/yhux0MDFz1jKaRWxpfMC+YKHYoFrtEefZ
	72eCphmAJCf08Ox6WeqG2u/RNnKzC6Od+UfGUUPSNes2JzArMHFWKZXjDIrb7QD0EA==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694926185a.14.1744662940205;
        Mon, 14 Apr 2025 13:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES94yre95taymhy/asOVTUHtSDJQP8JMi6CuPlrYL55wGW9j9JqYzSQvw7vL4wpMWwbjEpGw==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694923685a.14.1744662939794;
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc195sm993479766b.143.2025.04.14.13.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Message-ID: <9c21f321-1aec-4b36-9e3b-026ea9a810fd@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:35:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
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
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Daniil Titov <daniilt971@gmail.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd71a1 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: AjZe30KUxBdtMff4rd1KRvIAU7MVwyJL
X-Proofpoint-ORIG-GUID: AjZe30KUxBdtMff4rd1KRvIAU7MVwyJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140150

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
> which are different in this chip. Register all the clocks to the framework
> for the clients to be able to request for them. Add new variant of GDSC for
> new chip.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +static void msm8937_clock_override(void)
> +{
> +	/* GPLL3 750MHz configuration */

So this is a variable rate PLL, I'm not sure how it plays out
with your frequency table - it looks a little different to the
3.18 version

The patch looks good otherwise

Konrad

