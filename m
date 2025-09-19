Return-Path: <linux-gpio+bounces-26407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFEFB8AF05
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 20:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EAF11C84B41
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 18:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBD82571BC;
	Fri, 19 Sep 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7q0S1/5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53852223702
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307014; cv=none; b=sSvW8t0RH4sbEtRsh1s2OAY9kNZPOklWF+DTIij7LWWwmmRxNGY1oBQFuVT3R/fBUO5tQusZoPd0QpAzV5wk44gVqDQfnvbPrnr+1tzqn2mF06ifsdABpYg3jHYFCHWfs6u0n5NjveSEZTePK1biXi6/sizmc1ifZrPGL495Nwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307014; c=relaxed/simple;
	bh=IaLYIZc2t4TteSa/Pl69q9ZnKun5P0ZXuMJw+fMVLMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDiCIj6c+KxOTTbm9zeZi4q/ciP+FVECQ48mmiWfRMjPY/M41pr1kU/hpP6hSuWqSgacRbT610C47avopsu23coGFJpYnxSqpfemqWRp97SRKIoEK5gT63gI5hrl2/h30mQfIxeU1fT3GTg3d4JS0VYpp7dRvGmEhU4qru3qFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7q0S1/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JD6lWN021451
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 18:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vRz1jj9Fk7FMvLwwInOIipNq
	laSA7q8QqUGbRTS/cL8=; b=T7q0S1/56oKp3yty86n14aDdpqh/9Z1ndST+684P
	M2XBtNCbRl+Y5bvzIB0ml05IE2bRW/vvQyB3DpluNUjouIkOiWYFGDdEUJXm5oPm
	yWhbufNtTvxpjoOgWUOrRlSRFmvIosvpaxA0oEzFhH5Wq8XHfdHBipJ5tzHOmGow
	YxHsR0LJrAh7hqTmVoQLeK3AtjKvv2VnQThzWUSVNolN9Iiq1EKBy3fwV5T89ppF
	pymjmt/7ch301Tv4NWMQuyPLQ/f73afpyyF1I0AxtjY+x3tk/Gx8TadDISYMx7fX
	y9x2ai+Q62BIQCndoS1Vd0saC/kxj07IvK3yvyZ4coBvvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5kha2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 18:36:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f9673e56so44961001cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 11:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307011; x=1758911811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRz1jj9Fk7FMvLwwInOIipNqlaSA7q8QqUGbRTS/cL8=;
        b=idC6qwt6aWrN/TdxwBVWIwd92il45tL4N4TKKgGwK5rgX4MfLIXyowiRvdovttheZy
         dDxtcVyNsgvX2ocYp0+UVEstyUtJk9FdHleO1vrpWG8CwkFAvnGxhSmDC1aytJ5HRPdL
         9vmkKTb2oIn7l5eojqwpqoUHcksgBZGJl962/1e8+fJ7LCzB6flR1ZCoGJHYjuHR3SoG
         FGrghaHCLuAFqlrOBEuGniLlDndzOw67U0rdGXF/9whcmeGc8MCYrOCIpWaKA9b6P7NZ
         2qObkK2AMlcDdoTtfyds7TA4/4kFJkjFdz3r8WyhzkU0N+WNOM53mwQv5pRSSdm/VhYi
         VHYg==
X-Forwarded-Encrypted: i=1; AJvYcCVwielJEZjfRBQPAiqvky+Ns+W+2DnbwQEikQzPGFA1IRoeRbwnwewig0oe1S+LOFTdWn2Z/EGOGnwO@vger.kernel.org
X-Gm-Message-State: AOJu0YwuBuS25+AYx9KL1ZyTFPkacJ0PXvJbzlB+qA2gwyByL+2GYbUt
	HfRsy1y+8uCnMonbRrn0ULxAO/6ur9kCnyc3Zkle6w4YyVGCwRxVumeHh/JWmakMOpJZZgESlRC
	vdIsSJWzFUtKBq+0njlOomyxSodsmm38XTQXNtImRbqjLr0p8R8LekyyNhw8oy95I
X-Gm-Gg: ASbGncvmBPELVDsUibJVOwgfUvTaGg0Ia9H0j4Rv5sEk7qTRpqEfgIpG0wCpZSe+kV2
	6waWpdI+PERMjs0+gZs1jXiN7Ja/Xo7MO9A9vHg9v5VaSsnNlJP1uWq1CR8OLVLYFGv05JeJxvf
	sPeec/sq6g/h9PscCR6TzkO5uipeOhWwVuPVKtttBjSVFkwZMuR9cm2fVNgkpZHU9dPbA+9mgGB
	FBzcsSJYagN8DTvUQntOXICzKfCpu46XOGj4aKvZZBTlbSuvAQrswQKKHCks1iNYNaT3mSd33AY
	wc9rExiQY8oACwe7OeQEJFUDz9uRjVfN3KRdbBXNfRZRkx2ZGkpXHbijgqUbsEawkptYtkGzVmI
	gsxmVA7S+7/88lkGupyCxh32UTSv0uLHKDzjBRQ2J7iGekTdxLsgu
X-Received: by 2002:a05:622a:8e:b0:4b6:22c0:28b2 with SMTP id d75a77b69052e-4c06fc17cd2mr44749491cf.35.1758307011181;
        Fri, 19 Sep 2025 11:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7BZxgFDyOXsNj9/jIpPAudBj4ew/yuL0jMxO3583dHiffWIBP3ZgD++Hgh8WNcx79iLjzSQ==
X-Received: by 2002:a05:622a:8e:b0:4b6:22c0:28b2 with SMTP id d75a77b69052e-4c06fc17cd2mr44749081cf.35.1758307010702;
        Fri, 19 Sep 2025 11:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa4809fasm13689321fa.68.2025.09.19.11.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:36:50 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:36:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Fix the gpio and egpio pin
 functions
Message-ID: <whhmtqfa62q2cstagywz2hesk6t3h3o7hxlcn47gjmodjttm35@lobzyyzv2sxv>
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
 <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
X-Proofpoint-GUID: SA37THcqNu066aDYM-fW44bp7F9ZJU96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2g2TnZp0ZRQ1
 V0Q4HN6DQBLjRshnzEsTLVWB/d0XQ6CCDyBNMg/dgQrVF/DUVhpfbeE7JxzVbEl0EihVtqlOiuF
 i0fdoe6/1XtRFxueFGz/p00tWYSuN3V3/RI35M5ENv2w7SaM2ciVQ7jciLhdx45gNpnDYOkZs0Y
 RFH00K0T6BVPLOfbpzyYn1pTce00sM95bV6e9kpMhkASUF2xWJ7GCh/LmUbFmTBx6II7fZBtIiQ
 PDlj+hP3sBe599HVCTb4Vc+npwMK/nb3lpPmUZ3VKAHsuZk2Pho/+nQH5Teg/GBuBSz9sP/5yBE
 DBeIjLhZjFrsUn8mofyux5lnqWP6iboYHqmFOA+Gs83zI2BA8xJckKVcUWdQffke6gEpHHZT7sr
 F+N8/r9j
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cda2c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CQ4xJWP5GyeMjeXyLdoA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SA37THcqNu066aDYM-fW44bp7F9ZJU96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 03:17:12PM +0300, Abel Vesa wrote:
> Mark the gpio/egpio as GPIO specific pin functions, othewise
> the pin muxing generic framework will complain about the gpio
> being already requested by a different owner.
> 
> Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

