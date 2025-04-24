Return-Path: <linux-gpio+bounces-19259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F056A9A8B8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 11:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD98C1B84562
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A05221FD3;
	Thu, 24 Apr 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L20d0vEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FC8634F
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487589; cv=none; b=FQhu87NusSlqZsjxngnscPqzJOGy41aku+i+y2LbXNl8GKvdsrHp3a83z7+zP1ow4R9rNfSad4u2dHIwx3TVzyklhGI8jBjk3cBlUeZOduuhmxXK+D9duLnbeHDLHevs1HO6zBEb/fmewKyu7Lt5a5O/U5A56scchakrZjUDLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487589; c=relaxed/simple;
	bh=uLu5qq+fu6nJOObQPQvzr891FiZ0IVNq6dpcmUuw9EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5tQRFig5wSkBxQ9SUNGasvCV3qtsbUlqREbWD3u/th2+BkL4qoBbXiqPztS+tHs/jsYAd2GR7XVLyEUwoEuUlDaNUzk1vRp8k/WGjkEhwpgfuyFH5Fc5SUvtl+Qvbs2AD8aT0iY1iDpwszcxyTiwUdQKIgLwG88uePETBi5GVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L20d0vEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7sZ010242
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dGjO56yZ5rnlYsrCbSawbQj
	IoRYwOqdiOvRK7aRuDw=; b=L20d0vEn2+o/Mnh5N8rHWG+UItlv3JpyyEfm3y5y
	L5NTKIamb1n0+cI1PM6aPf1kpqx+p5BsI007OV/mAyj2ITqZ0BMP71qCMEQ3C6En
	V99lBkho+oJ1v0pw2rbpXCjiPNL4WP/ChzZGyyWmc8jXyl7xX04yLUz8ugdnee28
	W+8RYTUeMeqeKemcceYT9eAxUQQPN9kpNRLM3ZWgfysOWQjDoOfY1Nt7kb4iuzNS
	ZuUDFQCWPHTcrtFq6/7eWYZv2Qu8yvDu26VmxYVI63Y2QhDwikInXLVrZNfe32t/
	/F46b1emKn/0xgBJXOYiX27VfPn8cXXOuISwlts4wFdm4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n0rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c579d37eeeso125643185a.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487587; x=1746092387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dGjO56yZ5rnlYsrCbSawbQjIoRYwOqdiOvRK7aRuDw=;
        b=a+RSHDS6pKuJLWoec4HLKUqp57Fqbpb9GlG/C5WJluFZi9nz44f/4zrNrK1tylOMPR
         bkf4jhLozr5kZl4ITz23N6kDmJ6tSDpzPi6dO4JNg0frZuyKwAOyElbToM64OUCXhWdm
         nx0lGza7geTa9/FZmA41ni12LipTk4mR0XavA99Jg5m5yc9BID+NFA8/SZJT+zHv+PWh
         AH2hriqpwQFCjfbx63NrcXqqwVaw6kMmOgXP0lkOaoeik8tvbV4cSXn0aQ/zf4VsI6QU
         A0N8Jb5Tqud6LhPzv2fx6grNEfLKoin6rKyZWH5AE+X/7w5tAPTurz6Hfg0Qkatavsg/
         yb0w==
X-Forwarded-Encrypted: i=1; AJvYcCU+EcQmtqo2QuuD3fN/MApw+lW0YmrXQ/Jc1rrWYolR59s+4e3dSk05bY0tC6KxBCDI3LxvVcAlKlIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcz+vy6Onc6EP7tnkfWYnH8A4N+/iT1oqbdl2+xtlRn7en0YqX
	rurZBNVHDs3mdVBf+6h8v+ea80xHm/ABaTsraL8eDnwaJ6TWtx1mT0ZJz8Jr+uY2NBfQGRBEnoJ
	udvDx5UCljNpOh8UcxV6HYuRtVWAD8Gzyosa/l4C8l2bzStkbJIH8no57PteI
X-Gm-Gg: ASbGncvcdkCtRfAXrCtOBDibFKwJJkk6+OZrAVDSU+BeXNXf1mGFo2JMnBg3I1E+D2Z
	WxWlxejobzdaPFs0OHhRUa8F3EMoo5YYG4b9h9rCiAYFiEGOlNnihDo1QcvLwX+D1bXnXpwN9Nu
	rsHR0sx50eDYPm7mQk6Bgqd9CchUokwsk4tH1L7F2L5DHyALHRyUtqC33GBlfyqlu1+9KsGZz/v
	T0/LGtjGtcDV0vQzGLbIAQzS0ioKjuHLea6Z/ACJKwW1ftK8KunqX3SARL0xAzhSfHsVEE2mMQ9
	KgkQam25Zgy/cHwOfQGctnhRmdE1O/5efs55VzQNHiOxbURyZi+JLUP2u3R66GbAV75Lc3I0//s
	=
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299385385a.10.1745487586706;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8jnKxL7E7dGye9CmktSI0DSfoKsAN0FjpOYzJxhooQSxBRnV8KWWUfkIDlgbYRG+Pw0Rmdw==
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299383785a.10.1745487586416;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm169674e87.237.2025.04.24.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:39:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:39:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Message-ID: <r542y5lcoymvykl5fdayjocvysrvzli6xlhcqjrwlpszucmaoa@ewwbbpynggnl>
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jWQXTyKahHGgMtyCbSIZ7_OcBj6DxV9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX/uiku31uTrOe uX3ULNjFPkIB5gB7Bco2hiNEZIFvLMYaLSV6TE1mhEPrr4Eg08fuTE2a9TxJwiIRP7/udQyggfE PFjCoAQDEE3LGgpzBVlILPrejyldIH5mU0bZRr6BZffXYxVKO85at44smKBNMLlXsxabf2AlRYO
 xbdDLrEVv2P4tU0ahskL9naWSwfgBmcBg25iXmxeUWDmoWLKHW61SRyQvWlQvlA77mWSEEtnIPV wShf98mCPtenMXTIpjuu87+vhYRgG0zBNlj8UOUnQBZEuxb+GE/SWxxiilWOQzmDGNnJBnpJKE3 wjHDR+73hqIOu5rv3iS7eaNYQS0bVsDn2BSvvFf0i4c2VPrwjocpuggZHa8LTmRC/gnvIGqFGE0
 anvEohJa84P571bWJh+KjKP3b9aDV+ik2kC9ZV9Kvcbtl1NicDaEkhzkKWD/qB4q4uirsRYm
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a06e3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hy4lFNwNYWihUDc_pIEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jWQXTyKahHGgMtyCbSIZ7_OcBj6DxV9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=630 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Thu, Apr 24, 2025 at 10:17:10AM +0530, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
> 
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
> 
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

