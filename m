Return-Path: <linux-gpio+bounces-25391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13FB40664
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 16:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44754E33CD
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B782DAFB8;
	Tue,  2 Sep 2025 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idsb4DJV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303442DFA2E
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822541; cv=none; b=eUjGeLnMioBi7MtdSM1GJMqtxIF8pJPTD4t2szNhHLRc4nSoalTD4UbgmflvOEpzIusyPR4DZQGVOMRVgjX+pmlupr0RmrsXBspQ9il7BQqpJu0PWItNUW1B/hN7vW62ONpiT2BBAUHi6e7TtyHisjJTVP9KuxKBwkh4fjqTarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822541; c=relaxed/simple;
	bh=akGpi+QtTCgfYTofF4Pk4tpeZByYbVJ+RjDKLpVnM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fhfcw+QbfI/xlL3YRBPaVdAW/hNDP/CT6DWtI/ODT+7DMeiea985OO64L9HXV/BUru6uk/xt0SIvDTh3eRy4wnCtQE4rRZA0YA7BRRDNpAMh0mP97YpwJuG5AUHfYHwy7yLbMnXPaBWqHMSRZq7U+3JBiFYfl5R3mH16dqZDwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idsb4DJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Ajxbs031556
	for <linux-gpio@vger.kernel.org>; Tue, 2 Sep 2025 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=; b=idsb4DJVLCwHX/wd
	dLBEgRWQ5XfjnjoPCs7vnuCRGJDdRCLaAbT5T9svXWbSJnjAlyb3/SWGWuOXj3nU
	Qf062q356QCUP7EggKRkCFJpFN80p5bOLKePqvMQ+knYwQUYRK4AOeYvjlNkcp0B
	Mc0bbXRe13v93zHGHvugMaUGyLlbRd+iWqVdOTLObCSNW4oStfcXJFow81/iP6hy
	oTt7Qq42AOjVxo4tLmcNly88otHG5A1q5+jjW/t6ic29337YqqsxkJ8cJ8NkDG21
	ReeAlq5PVBOhG5ubWXO+i1jNO66SVUvqRx9IF/hi/OGahlLGwyFigblyPUyCj8B9
	XN0p8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw9tex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 14:15:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-892458cb161so398457241.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822537; x=1757427337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=;
        b=tz8VQnt3lJ/9kTQRPJ05ZWf9tAfc+JoU0RWWQNWgrwLeU/y1/Alf+wtKy8G792sd8h
         H2md2Ym7MbZK+U+jWWmuf1GPL1yMZTAGtTyBhIRF3I1ez5UhQhf/6GRDzlc+/k7+WnKH
         hvcMcMRegqqAHyw72ifegGHLI8lfTiqLUYHdrAIuu5amfgxHT8ZNdW7j0cXGpxkGaw79
         hbgkMXsb2lXSAOt1U5Xp3gBiFtmfAMipU/elBLWbiY4vgVpXyrFwuuJzF5druVv2mE3v
         KqWp0Z42VvPFGg8mXD9gvZWnKBe1BN+p2FkxanMLAVCrAQHUqH4KWJcKoWAPPDYkeO5o
         nmPg==
X-Forwarded-Encrypted: i=1; AJvYcCXrabcXVGDvgPb4YWcUNqF54UYNstk/Em/smxt/l3QR6x0ey+/44wRa7SPcjb2kbly2L9ijpiI/AtRZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YKWcII1fvK/ZYi4kvXOfW8byGxkscfHMgRgrOsgaG9kfsD7x
	WwxdE5UyJUI3o/GH0bsiP8G8k5I68KHL4K3MRj1vDF+pepOeCj0qEKn48zOfQTZPLpGFi/gzFUX
	8tXix4aQ1beJby3x5/Ym36aVN+Xr7LxrnS5AurXTCL31poxQC8T4454o2Q51SQ4S2
X-Gm-Gg: ASbGnct25bYAMkgUX6/G265UzVgQw77OryByv9z3EF52SOa74bGkIAZr6pYfxtCnu4c
	ykOc71vCFzTET7cs4teo/wElMGVH3PMRQKptqM9fToDr1fItGdTdqObQDIBdbk28H2YpDB4s24V
	0vDOxbSfBw8QbzddOsTDljsnqP0MnfQrHpdeJ/xl91bIMFWY1w1y6Pk+NTtdhCxkjcBnqTSYim/
	jbT9LCA6msLFkU31BhwItZiWqkIkRU2sV00Pv5TpJbHV8mSgO0X6/e29kLM0gka1nXmHSelbzZ8
	ZZDAGYLOvOM5X4VuN8Kqb2NgMMXVPK+B92L0LGW+5pI5u7L9VxnkUv2xW8LtnJeMFOuzTvaq+OY
	RNURAQnSBGI+2KUdQQpBdO82K2qM/KYs6Ns/JK0CdkgmAAGM6wasW
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570540137.20.1756822537109;
        Tue, 02 Sep 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjsqepLP76zUIqTQQBX9Us4UoXPo5VPCLW3VzTnrFgAj+u/0dS6AteoLKyMgNUBFdMU3pqQ==
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570468137.20.1756822536291;
        Tue, 02 Sep 2025 07:15:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827b1df6sm730194e87.143.2025.09.02.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:15:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:15:33 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <gkkxxd45xclwjs6cp2loj4male7wobeacbshvjasolr4accz64@vux2ou4wa2wa>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXzvPg7vkK4br9
 NmiDN9iE5ejQlCzG+1ozU5ejfxneygAPgdau5OXFKK9/eb4/F4VQe/cXXRKZic0V4zgUNMp2pA5
 7zK1TXXBt1+qaGV87OoIRK2A6FDV6+ql9fWcStAWlBlwFBskPYQbh4hg8KwfoHc70FXXWSdre5A
 7J5kyFZ3jDPmcIl2xzStLQZNgp83eWQPKbxthS5wHyER56XOjHxcjHCSSP0OhBGjn/sw1stw9kV
 191DUl1UktHX/9lU1f5tcm1HRSs89+s4aXTTknl9XBZ84ym3yz4psQVRFOKVKMzji5TdoVOGceL
 sErQ3zyfE41lDrPHHMXmNIiHXoS677xeFNDqFJNXANOw2m98ScC6SYSUNSU0dR7LW4Hu0Uu26H8
 V5xu+BIC
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6fc0b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: H-uuRGG_ymRGYvJYuBFJdf0wPiWwIGIL
X-Proofpoint-ORIG-GUID: H-uuRGG_ymRGYvJYuBFJdf0wPiWwIGIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

On Sun, Aug 31, 2025 at 02:29:28PM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

