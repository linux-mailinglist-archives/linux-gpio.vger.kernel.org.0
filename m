Return-Path: <linux-gpio+bounces-18617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E033A838A6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 07:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3204817B8CD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 05:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C57201031;
	Thu, 10 Apr 2025 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYJ8gIXC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07B1F1311
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264145; cv=none; b=givhArS5lpnWt70ZlqThNZiZJPnw4x5RhCBRlmgcdW819QpgbYnjqdPucZgZhHfrVjJ4aST8QeW0koklrYblazPkvr7MLNxJQVIPKZjeogSMnCEV2AYlFsvSU4DwEKA7+UwTKnD1jNSalR7wmGj8RbkLT05NjkXAVskYmmiXEMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264145; c=relaxed/simple;
	bh=oln2jJOOqICfShN8BJEsdupRTcRq//7pVVPzBAIOxSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So/h5xHgPretBGQDLz01qHyangSUaH7XMZ7AQkYaIhtHYvBJqAgSQoHKDCADyybtGPePjF5IBUbwhjsIwiLGHWW3MP7C/fePcm43sVmx2BNtCSItZs4SExJmHzEXxhCsaFxn6ZBYvbUwNjyADFx7LFFdTYen807lSZcte7QiUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYJ8gIXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UA6I001083
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6MfMIQcCfAX5ZEXpELMyE/uJ
	lS97RQd/7sCSe2WVOqg=; b=KYJ8gIXCaxiIXAsB02wvIO0JlatZ4IQwf9CstzvY
	oYUdp59mFB7RAAd8xdcw4x7YvkRff6O4Mxk+tZVr/d1iGED0M8X3H7eLLNkodq4u
	25n6cq7Yrg8qLk0wmr8DeONgMQhAZipqjPx2GAkpgHLLY5PieH36DzzsbcCpCtXO
	bxY46FklShistOwfEEHORNukgjUy6GgaqoDSLxPA4ipRlzMNbvUH9ukDl5SatvNO
	+3ZZ7V7J3ZsYTXT+kb8LuIBMXAte+FvjevmVrDT2lHN7J1R0dtZqwDQKxBPUqbVB
	tuGEWvEhBFm3C0VyaeH952c7TKSQC7jZCz/VhbJaasyopA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgnuke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fae3e448so8078376d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 22:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744264142; x=1744868942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MfMIQcCfAX5ZEXpELMyE/uJlS97RQd/7sCSe2WVOqg=;
        b=ebhvxmnZmHOUtbg81O6bPuKcDqQhElWCUfKiSLNHF+gy6rlcDYUhOPod2okjH86B17
         wkGX7rfmNiBQZdlb8wMQMlUFAbypB4P8ucPiIkJfJZa1nLr7ylLXrFtWcbXD2wpnGVhU
         HSJpogbemINGIYq9H/IQxYiXFg7LRbSWx2yaXmRK6Sz6VGAO03OQo8DE398TnZKH0rKX
         VYmH0XmSLkcYmFL1K/HXgzNrG6mBMhzZyURJAWDwQsX/3XiHL7e7QbEiNAX8ya/jZ3nu
         njGedsuWG9uznWE82780d1agSwZrX6nyjKJONpV1TD6jOC0zhuYXdgjQSLgALhrhQWUh
         aeQA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNrGJdZq71x85zx+4rtJV3hclw2MBG9MYRxJKsgeDalLc8jT1zgDFIjAYkiN8EA/JF8W9TDAGyydW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/eYvyxuH+a7JIQ+DBS4dw3Al8f0VczQALaBTnsWgZPPgGU+B
	yC1DMSMQ/FfoK7t5ZL3k25O2iPwpoAufo5zIO0DrUZEh9PmPEhDs5dxlYvP8WoUp/+qRsd6eXc8
	/a3kfhXXorxe5JDgKDay8Vq5a3D5kTBbHZ2Wd339vMn1356y4ggJ+xf1Gn9J1
X-Gm-Gg: ASbGnctN7BKcfIX+huPKgzdlG2rnzflh6GteZcsNnarNzji1EoPvz7wsfyf05iAM8C3
	q12rKuwwByfuF1KNonl26trzg+2kZWfF0fUIuHV/eXg221LJBJnGVoaBWXGE42VJupkQmjkwjh4
	fZKmF8DrMgelIxwFjZzvVjw/EgSbWUdIoJtFEfv4jsv8jiwCw7wepd+kD7ahXKn2SqxlC7ff7rH
	GKq1IX9UOgUeVR3+v98iXxxtgC5rvfm7s0rjOeZu72ndlYtHeELW47+LVNFMyGRis5H6N8HCLbI
	NNqGlh6A9DaICQDMIUOHHMUzSnIlqqu8FTiyta42/exqTohCJMd5biqnlw2Y6KTnYKoP8GX3TRc
	=
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20662046d6.42.1744264142392;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oSJ0cAMrOma0aNj8l0ookyEkkm93nqZHeWGbUi2zEFDAzsFv+nBjyFl++iehgnLplpiGbA==
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20661896d6.42.1744264142081;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510914sm45087e87.196.2025.04.09.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:49:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:48:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
Message-ID: <6q6iftxcym6ubvtljaquwz2xllsvxyfhfkb3t5fifugedlb2c7@efpxjlyqfuk6>
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f75bcf cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=seQdOu09bPYBcSS_nr0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YLiwcqAigrSHSm8gvUn6X6Kk-uiVfe7S
X-Proofpoint-GUID: YLiwcqAigrSHSm8gvUn6X6Kk-uiVfe7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=769 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042

On Wed, Apr 09, 2025 at 10:00:29AM +0200, Wojciech Slenska wrote:
> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 70 +++++++++++++++-----------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

