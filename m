Return-Path: <linux-gpio+bounces-19220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFAA98C45
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 16:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B143BAA4D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 14:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95801279912;
	Wed, 23 Apr 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqLJFhRC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0E27934B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417048; cv=none; b=dm+bdzbeSiB4KdqgX2n1F7pKpJXlw9DSmBPrxgBWKhoQPVnO/mp7sy5aPpsDOCpJ8ZOH5UD7JToX6y8kUU9ag7AIHkpGD20li5UXSb2hasozNsfUInUB8fyHyIPUx+tIfem6ugJX5mPnd4ugySh8TrxGYQCK5bEWFsP5gCTgOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417048; c=relaxed/simple;
	bh=Kpbhj1qhSKEadaVbA0z6YY9AlvNfJBM7kna2rhKpIUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFHHH2t5/wNCA/NTXlqxeNcjHonCbMd5LsvDpFA4Oa+uujGm+gppYIG/6LwL9680UZ2ZB71VQ7na8JfE8qJ25/imypqzH+RYdhyO6Gi5EXmrCjunlkBkPaMRwS1QyDHWNaRnX/RTP6JI/WX9whNw7g3wM7UMVDdwlkgtuc1aiT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqLJFhRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAM7VV007642
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 14:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=; b=gqLJFhRCUndtiYt7
	7nVFud9l/0MH6QpvE/kIW4J63tMdeelEMdTC1IAEuFA5K8jVzh0/d2qRdrDKK0pn
	GZ33/RXPMfhZ4ODI8LwwhwIjrHfe0CCVJ9oGBukOxpkpnVOdAvlmpDk6pQ9Yr6Sd
	sGmrczDi829QgGOBpgyZcaaTXhafCwhyZ5ukT4NVV2sYiNrr/zgOGkk/+us2b4qe
	PQ0B8HH0A/1PTId4jL0cQbCi2yPTJVav6wv3gPj9Mryc4kD+5qj9DW91th1v8CHe
	sqcBZzwfinKADXufKObWXY4eajJl+7rEEMVrYwYjd4EyLomAZtuIXhSz+/e8iXwP
	1ecJ8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5abjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 14:04:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso132012485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417043; x=1746021843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=;
        b=OIKdrQysFDMn48Eg6PXjz/sBX19pnrEYHU7PXuWdoVPX+XE1fvaCUCnv3yRKlStGg4
         +Mrdl+PgO/mqe/2Em+SXJ6Rh0fyUwkl5ePNTvHv6DqUPqFzMiWgpe8xHaxBabR79iagy
         b1vKrxi7rkg58cQJr7t92EpIrt+9VD0LEeX5BXkV+tMvx37h9yGzx/0ynTO8G9bTYHWe
         O2TEDI7OQo0udkyCsNJymib/59L5QZb4lobNyl7D/933jH9ofqfghHtLHRvtoORZLdGz
         i2aNlr+ABlKzQ2MW9jDaCYXoH6g0d+cnH1qfJcV2BKDDHGLfz/RZnVS3l1oZo22YQPv4
         6TYw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Cq6NxBdiEyWDcZ2HKGECHRSfsZTp7aDzTRxJVbu9Bxllu4MNWVyiC/LPAezUko5mhTkSJp2Njwui@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1Bt5mlghz594TF8vgqudcVMKd/dRAjiZ4ZCsP/ivBL4gNJRZ
	jvO6F+zYqLYjtfEtKkSIU2eeTvGjujYDFKrfYLphij/Z8q432dXg6dQX6WU7qKicnsAFRLWX+gb
	/LEocaXSrKLh0FxF/xILBrPKY4yNZP7G5jmbfu1K3hRoP4AG/egtyS6Ruife7
X-Gm-Gg: ASbGncsrIZDu8e9MxG7eJDKqrLxQM3K6Pws39RB1uLu/mcwEwaB0SqHk1bOENIP1gcm
	oDfrmaiUdp27KUbgsTZs3JeK2th07f8Nt5i63b1UEHXxImkwFMJda6faU4VrhVi//+xLkcRjBCY
	mPwpPYXiz/UuO94IWsSX12QolIVBYv8Pg+8JXJSKEB850Pfw8t0RLcXMM1eNiZxZzUUpdgxQLT9
	sQmbEzDk6nnlk1M+o6rnabr54td+pdc7ZBCZZA/POPyYR4u2/+7QbuoEo6wSLmvZoct9xbCWjeH
	KLQnc+BODeciREqNO3sjH2dWfPTmYhJtPFCk42ObAUYYGE82QA74X/a1bEQ/K80xUik=
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c928038e5emr1063390685a.11.1745417043381;
        Wed, 23 Apr 2025 07:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Nmp61dxe3+g8XquReGtc6SZo2EBLqOi9MgrQLq0RCvHH8eZt76lUCj3q3b5DnYlZ2FEF3g==
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c928038e5emr1063386885a.11.1745417042771;
        Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4d397sm808450266b.59.2025.04.23.07.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Message-ID: <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:03:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfXxdmb24rAFFbn qiBx6YSmDJuiRA5fEIRvNe3/6k7UDcttuNo37p/YnAMrKpPgcRvww6oEl/CrHF+e1Y4fZtiIekd 9xefattI8YarEscv+PKgi39pl9277/8hpFoGhbmNeM8/hvUN4Jy4eKjsG8Fm8uWkfUQ8iBIojU0
 lxr9Xy0hP9GvXAHrP4xdcnS6qsY/57rFaQtXsYA5O3+Wl6cYnI6Y72+VqEgY5L6pNFbKw5li4u1 xv/7erdT3SVxaFfqpdYIP9zTrUy35Le0rJ5ENNuUcRywVWwbV3MKFejwZrBP+NLZbdYrLLvy0GF z6qlknDXtvJEZhH15X7TjPjFr6qn0sa1uYullRcBfoeAw2OvNfDH7sHw6nzkXmQ+THEmTFur95P
 QZj9ek2tS/bKBERHegFfemjyFyR3YwaVFQtc1X1ChLSqnI1XUTNyd/dVzilpKmPGuJv+JcEO
X-Proofpoint-GUID: KQO3WIe3J-fxZMnEyCUYNn8WZTWn6DUt
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808f354 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=GsLbDo3STCR25-WXoqoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: KQO3WIe3J-fxZMnEyCUYNn8WZTWn6DUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +			tsens_base1: base1@1d8 {
> +				reg = <0x1d8 1>;

The size part should be hex too

[...]

> +				wcss-wlan2-pins {
> +					pins = "gpio76";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +
> +				};
> +
> +			};

random newline /\

[...]

> +		mdss: display-subsystem@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x01a00000 0x1000>,
> +			      <0x01ab0000 0x1040>;

The latter region is 0x3000-long

> +			reg-names = "mdss_phys", "vbif_phys";

Please make reg-names a vertical list too

[...]


> +		gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
> +			reg = <0x1c00000 0x40000>;

Please pad the address part to 8 hex digits

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					opp-supported-hw = <0xff>;

The comment from the previous revision still stands

Konrad

