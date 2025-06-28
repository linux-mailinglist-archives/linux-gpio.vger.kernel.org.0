Return-Path: <linux-gpio+bounces-22379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D409AEC84F
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 17:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A89917A4F6
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 15:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0878217F29;
	Sat, 28 Jun 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS7+TBNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4B13BAE3
	for <linux-gpio@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124637; cv=none; b=IDiw/aAvSitJpg3olblqVD/HoeetbxKd7QzInwEBv0mrb8NeEAmgoiwTopV7wuxwkcu2MWkMPCjuTC+nRpBRgCWsx8NoEocQGMd3vSgUvC8diM9aAvnnWlRBxRZ4cO0pJ02epzTPejiWSgwdp1aRVq7QpPiCxJFFySVCOa3jUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124637; c=relaxed/simple;
	bh=mKixHPHsl2x8zrPqtK9Kqr23QXdhN1xhXria8CsRP/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq8Fgleev3UuTSFA2bsuhrnCcKAk+dleJrUuqILMP9vd7IYpAwYaLYUEyTwD8OkyhHzSSPjcfMbBF/uxuB7YP+O02ikfClf2VrE4MPIxv9xMkiOf9r7xvD4oa7LPmuyNbtpDg3hzVEaEiSbnyLewQjXGaOO/txuRq5J0mVkUEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS7+TBNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SEk8iR025913
	for <linux-gpio@vger.kernel.org>; Sat, 28 Jun 2025 15:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zV6PffrVUkzDxC7z10QqpNda
	qNNap6AdYnPmbW8I2uA=; b=LS7+TBNpO0HgMVDFuOE+T2A0ABY3dsKDAlrCnfrf
	HtLl4g9M4k9asawxH3XX+M7f1l9E0qBrHNefGscfiHCOQ3tWNDTWOMltrR9qzolo
	YiT26QS9NW6ME7nB+ELxDFiR5sGzgojdYZ2Giff9cI9+RNUSJ0w+zOwFtgez0R3Q
	sq4MdL/wUxAn9KfJGPwSEkwCwWYwtQMM+kPpI4dk6bu7b8hdD9uSbuflSDPsUF7D
	zWcNhB1bkYg2byQwh1GwmLnrsX5t2tKC0lMD5w+Gu2gIFeUb8Os3dQAE/Z/0THpE
	xSBc6tz80Vz9cZm08B/ahlmP13F6v8b3XT8Jp6ThJSo+tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm0v22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 28 Jun 2025 15:30:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so495225485a.2
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jun 2025 08:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751124633; x=1751729433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV6PffrVUkzDxC7z10QqpNdaqNNap6AdYnPmbW8I2uA=;
        b=UBdkE5jz9fmHAAydJffv5d49T10Bge4wWivRoWPy6Nl6AAlHYseSvnno3YD8C/JbFS
         5MKM2q+bvjprhurfZcehnarSdySgLOlYWkrJbU6Jbu+Ui4sDWMz86KV4zz67Mr/BQVT9
         Q8d90dUUzsZX+MGTt7kSg8fPKPHpSjReMGaqVc8YhImcp3PTyB104H5kYIv/kefRL+WS
         gzAUizGNTyo8SGrq4stSoSS+oupaipBTYCoSMAyiwdc4KucpSE0GftrNhzmwiv8VDDdP
         AyUYlPVyBpTsU5P/Ayqb63DhRCtx9Cpgp/hjEU0615n1ja9w7IzVU9K3W7BDYIqdQe/T
         ERzA==
X-Forwarded-Encrypted: i=1; AJvYcCWMjWEEwpToMBeoVgeu62II3NkAtsU/fmBKAOB4T1THGX0tnjakG01Tuq6YWt65QTTfyoaFSlcg7cSO@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNdRLWd0l/V3bs9a1s/VJj9mtQrx8GDe46QJGHvWkjfTnoa9K
	bkukehGYm8cWjSb7p9dzNy+q4Nm7O7nvUIWnNhVXYuZNBjQYkspzCXtUVYhQMch9Qnd50pjBLmC
	9moruV9ah8uPFm8AbgD0XlfUAEq33sb/b6Jl8NHt1qS4GKIr+ciqa3pL0Jr7f3FzL
X-Gm-Gg: ASbGncuFP5b9HFaFWohGCeCV5DFQga5TGFUt6fDCIYCVA2o+1HMm+vaGdw/7qhYyUkR
	R7a9FRnmm1VnznFFvGe0kz0cZH+0onu0CXZ5XriW27GdDy4cLtWin1p4/9easJtPpcTNzvlednm
	QzOzyVOotDxkoBWeYfXU2IWTfyUHNr6xWPiGYV0hhLQXArz1CrDgpW81Ba7k1/Cd9Okj4w0MpR3
	Yl0mXEjb9i2QlOF3W2dUAPd5DS89rrSD7zy6TAE+Kv2/sAERijymUgu+QgvDC2JBMkIDENHXpiN
	PysWUzp9vkvIqhVU/HV5vuEczFta7DDX1/6gxuU8wDhqS2UptIOWdJnyamtDSAIyi+Cccb3K4I+
	ZRwDDEydQJ79+q+fHvalbu2zn2GkQ2y99950=
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111893485a.14.1751124632979;
        Sat, 28 Jun 2025 08:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/EwrvsgsuWmlXmk/2zI+c32/xYaYtcpshstsfFwQVESoPxvE4doxrxiYp+KufrnyB1RKLpw==
X-Received: by 2002:a05:620a:2589:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d4439344dbmr1111888185a.14.1751124632491;
        Sat, 28 Jun 2025 08:30:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cd99esm844943e87.158.2025.06.28.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:30:31 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:30:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Message-ID: <zow36rolayslylfozehn7f2gq6bwbkfhhq3sq65xu7qzhpaizf@pvfrmgeshm65>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68600a99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=lH0vaW9HGQP9_1ETXacA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: jRLc_N1VAhWzPmvLr6Eilz7Xeo9Hi8jD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMCBTYWx0ZWRfX04EajVzrn/hU
 ZyYui+2l0l+v5PiXYzgaDSPtYf9Wmzos1uvRLrD3i3MSZj5IVRXGzbOdIjuOviAtQ04nxCI0POo
 t7aVMHBsl9rUff8YGVPnG3DSNU0C8CTdfUfnzuHQnFSOkvp7aUtVr6FUzQJDNwJFNSoJmnihYo/
 6Ypwxn9Edv8+KHbXXuXQ/fCsb7xvEgHUIxmlAzS4ObTBE6aVQj7s5HecvdFGKOyedthCxh5vwzX
 +iC2TWJxAPGcdDWGEKWN6YOie+psCE4e70GXh0tpA0N8X4HBqgEnkKybpSW9WHO2dLRLXL05Anv
 bKr4ilImaNpg2joa6NyT6l8OZn9KnXPgrixLzgRdgwx6zc1uTAuxow9EpgZeEoRW/+wnd2DS8wz
 GLfVo129G9gNFbpBZr+tPLOk2ET2ASNEJh/B13K7sWK5GyI8oS0/S2VZv2qc2NBtedreHjSD
X-Proofpoint-GUID: jRLc_N1VAhWzPmvLr6Eilz7Xeo9Hi8jD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=895
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280130

On Wed, Jun 25, 2025 at 11:18:04AM +0200, Luca Weiss wrote:
> PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

