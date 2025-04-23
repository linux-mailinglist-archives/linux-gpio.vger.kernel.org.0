Return-Path: <linux-gpio+bounces-19227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD578A99BA2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 00:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7911B81709
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 22:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7531F9413;
	Wed, 23 Apr 2025 22:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFbqFKet"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F91F1522
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745448466; cv=none; b=SPKdo7iBAJOhFxONq+/fi3JAhl5n6YbwRjF/tB3wE0ZssibP2eOFzG2nX1jgWWcbgCb3OVmWKo0UfdDn9k9aFLHA0mNdGLDPgiVJ85sL1HnXdiI4w9eiiWhPWXXQB1Jbz4JSe9nhsexbn/ryOJ+F+zFXx6kWuZrofuoBeGjw5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745448466; c=relaxed/simple;
	bh=DbFZ7/j/K1EGmGKXu/FDfvVNLm9h/iduss8FipNFjck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brGL2pjgMCk0eA8AFZYlXOeR5YwPMvARuHf34E1FRwBU4DztJA66ewKaJCAXmTB8Notcn3yszqshfmQBxJn7Ev+uSHhmuvUhdZfEk8SN1442CfyD56vW5EMzEhHQfPM14XCp7/YrJMNvpPFR0EvKrFvvtHE30Ghk71IJyQuPh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFbqFKet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NLEl9j012126
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 22:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=; b=RFbqFKet4C7XAcmr
	uF5l93uiKoYOIpW8pKISLlNb/6aUfRkdhfZCwj81DjrkRecyxn0IKak+VzOAN1vI
	kw+YX+eCRVZB6kh2zBGWoloFdT/TuLhMVwH0gT6N68JStZEtSNL7tzVY3H1ZfiVY
	CHa4RdeututYol1HUcfFXrxVyeDNlKlJE5a9Sk0TSNKo3p+Yh9p8NxsaUBVo4WM/
	LxgE0HcFg+S4AavN2k5aoumEGjxtKb7wpUPAzlCACltegnXV/j+zLe+JLIzIhFYy
	5gx3+GvOkk4ZnWAcJnq+H4Mx64JafGwPvSVQ285T9vO8vlcFuqIO49KJVHqp+GHN
	dP9DSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1kkh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 22:47:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0a3ff7e81so62908385a.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 15:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448462; x=1746053262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=;
        b=Kc4+07IoI64hbnbSqos8WhipIqAFgg11uKjuGe4NQA5DpQYt+/wHmfaT/6OJLh6aNN
         WmnTtPb/owoMebcnPf8/WZo53TFhxfNgQiBECO7aDc8J38R1QMP0wcTxf00TAVPi2YK2
         hkCo4XY0SxNMR7fmY35wHrWsnPXnCmoEE/xsvauhGIlGWm+68eqnR7M7rNvmkPTdKNAD
         FRZXOTxsWeL8Wq/ELRDm3fWQ/fmxDYCy2sw6G+qDaENJwhsBOVAmQgSNkm43ON88/hul
         ZKTgHkhTOv+RS15AIYHdEvRYMx3tmxV4txGgoQsdw58xIcmfyTCsFaD2OyYFhh7Sl/J2
         BtZg==
X-Forwarded-Encrypted: i=1; AJvYcCUTfHwlBuq5OEyv/iBiQCszBQJNcj6nEird/D5bjEV4Jf+23D5YffnZL32ae5VMpJR9XgKVZKOvPMso@vger.kernel.org
X-Gm-Message-State: AOJu0YxgI7B3mz9vAilvbeNP2JVZatryO3gsU08z1kje1gxmKQZ3D4oy
	8LnZ2Gy3Z4TllAD/2AqQt9GS+XCJ/3D2cgHykbPg+fuYFEH9G4LxyGND/AtaoveUyqpvp52L84D
	MavtRdEOAkXGsa3FclboBMBLXSqWzY099Ip1NUvax3j+CrB4BfW+kvtTXAosC
X-Gm-Gg: ASbGnctOKtNEu+1k+iJy2JwbIplc7t0Jz345DWnDd/Kksfzx3K7Tlffujtukv8GQ1B3
	LSb2j9ZxZkjEVpyO7mgA/6Q+s3KmF8L0brvBjU7z9WqjwqXhX9/QKugACPh1Upvzr84C9Ex0M6n
	7FLSixukTLWHozjGq2onyM19DIhIBXF5VbuDwUIvgVFGIHBu8jj6BAqyPQKc0NQePo2MPU3WLZs
	pwd575jznzPBzZZIGAR7tFG/0iajQoJcmlv9wX9K1Qjaqrn8Q8ndIeJx7reDZOZ7CJPOovZC23O
	5tlMprJ7yolSBFDs5a7bTGZsWC0lju6g/yVwozKIL+ki6r+MYnSdbhrdR8tnriy/xTPbrg9hB7M
	=
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c956ed7543mr92880685a.27.1745448462226;
        Wed, 23 Apr 2025 15:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGInwM3Ub2jQ1lwD3hZid86OUOjGIyjsbPxDcJGVMhOF+7PpJenxAlmHg66u64h4q9mPPY9dQ==
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c956ed7543mr92875085a.27.1745448461829;
        Wed, 23 Apr 2025 15:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3be1asm26736e87.93.2025.04.23.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:47:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:47:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v5 2/5] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
Message-ID: <h46amkfanqmu2v2bbsx3f4iqdwxzcgmu7ibngffn4wfavbdp2q@ho6sy346vjxp>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
X-Proofpoint-GUID: 3mCeqNl96ySBwA6jpFv7vZLE_K5XjiIK
X-Proofpoint-ORIG-GUID: 3mCeqNl96ySBwA6jpFv7vZLE_K5XjiIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1MSBTYWx0ZWRfX7kdllBaKxu40 ePJP3TuovkprARJrts5ig65KdKEEYStL75H6Z8UnzyBWV1sXMJcjzCF0LyDSi18T75whTv9vZ8R aPIV5uhIRJlqgIdz+cMhRoVnKtFHDQMjWJmvBJQd+o4rFRGbcMmSXJIhoW4ZE1fB8vQZ58sPnCc
 4uWJmMgcUcKefSmSQdguVUN1QzzaIoQ0Y7KPd3GwiAbq/OcQ9BNBAz2iIZkV8AJw10qNzTcPkjZ N15JYKMeS5KFDHkFTvrRXk8yzrsTY+ztwUvX1uz/s5Y/U/szYJ0sLBfqfCe0X3/Y576d9Pxb9Gg IVx/utOTLEG9fcCchjM2nyMPV3WklQQ2D/LdSCuC9N2+uHU4i97TudO5Tf+/Xi/E8/+Qsz3p6LA
 ma5pbbrmFpvaCa/s/yjV4xxVHiuhts7cFGgqtO6B+xnxs+PKdhyik7EP8mMV/mxyd25cZ+ON
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68096e0f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=968 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230151

On Mon, Apr 21, 2025 at 10:18:24PM +0200, Barnabás Czémán wrote:
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
>  drivers/clk/qcom/Kconfig       |   6 +-
>  drivers/clk/qcom/gcc-msm8917.c | 617 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 616 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

