Return-Path: <linux-gpio+bounces-21971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647DAE3522
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13A4916BDA9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 05:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B58E1A3145;
	Mon, 23 Jun 2025 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0A8jkrz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9CC320F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657688; cv=none; b=VxUv2sFo8iGn8MVXyhBny+g6OJyARqiVGsPVA/ADSoERyL2CuB9/nGElp1qgvy6LJDuauXMdT0RP2a078KIqODxyuebWzSCrs63ElLj6zJhxd44mOQHH5qncNiQlvhFOISpVhfFYVkZwFe2euIui8VCo6TiBvD6/7ZL7omPZZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657688; c=relaxed/simple;
	bh=jcobvtMnOdwvMr++5+Edh0qP8TMiLNj+23DbcExBTJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWG/V9K54pXDPxtg6Jwl5/nKI2xvtRVDLY8EiE1HPjP2T0cvjcMXTV3M6WOC985Fusr5Zx8MqYDK3LDj/HSY08BfNudNXEI5P+iKdDjjVp9qHi+EfPflrj3e5cbLhQ61L2rXE323oZh1jggqgb/2SaWFOSOwlgjnfY5f1Wy0GtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0A8jkrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0PjZi015731
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 05:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbRJoTOYKERrFGee5+m1f/UpxEvLfzCKtE0Xi3HsgBY=; b=g0A8jkrzO4qrnQLM
	ur2jp0lVHsZ3m+NsBFlXQUfYHvBHvFvKdMlZE5SxwmDXTtY7Pga/l8yYFXS19kER
	XeVHhHIIhBYRGbCXV+1HE/z1p6IYrbVXVw/a8GQsXXVrbptRoZ+peIJLE0reHaGM
	wcgtch78UbikbzfUcEOJ4r7qSiHQS/7DzC2n6+DoezF31O9b62j091BlBkonDmRJ
	DA+KrvzKYpM1/4fPwUzR7gJ7jIcuCxvZy28gi6j+Tu8SRyJwCeFx3f287dA083xd
	bl9aDfkMiCI2vu2QG3sjULQ40onhz9LuMac2n3C2AxRSJsIy8aLhNt5OL1M7IqiT
	AReOAw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5gj0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 05:48:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74858256d38so3035371b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jun 2025 22:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750657685; x=1751262485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbRJoTOYKERrFGee5+m1f/UpxEvLfzCKtE0Xi3HsgBY=;
        b=hR6Xjl/inD+bPi9GPvF5zdtrOqUTBQr5O4NG/OluJYO1QcjuUmxSA6x3xS5eQeu2Sq
         iwsFtw2JWlJUC26tI0uP4ie+gdquHwWmb96CJVAFfHvPyCF4XbaO+GPwwrnIVAFsD84b
         5YMBq2o3ocYKIEAi39ymUGfzKSuO7El1yVwRUbv4AU8SDdcy1OVvIm28m1g5MQ4YNwI8
         U/c4InjSOicbf4zHAA7r6041V1VcSsnbO/MuTJZyfhhFzybJAQ9bo0xwJ0vPEYiwaT1N
         BPIeLqftjp+yAPwwK5qseaYA8GR7W3MO0S/NgZfQRRzJfEKKZWJTpHzW/XAoa/sQN/7B
         0aEg==
X-Gm-Message-State: AOJu0YzdJJr4sgJn53AIRjnuE5KwGcyoGIiuvUDc9UhPJ0Oyg30TZ9uf
	xa4Ryx5kny8YmrpbUgghmQld8M3exO/aWr4BXoWs40lq7Hy98i6GEAnTxUhUqswQU9gTh7Z3oLJ
	IBgkZZGcA1aN3kzmCCdInr3gshlJnL2EDtqoXsgooiOqdXpogizr7luDsL/NJROic
X-Gm-Gg: ASbGncsqeejxGJw8fXRXLqdzNhoHbJyXWyuh+/iJgBVYwEp8Mzsi2KosEaqt8GEagoI
	kvC2DSm+3fb3hi/hHcBEPmpzo1WZoXh2pllJ6KXr6XycRwl4RCkjaFfsyfEzmZ7anXlkRzL30yN
	2SJ/wfrNnkLsmQMb+PIqW7NeK1xSYthaXiPXqZOSPvB9ElobPagrWWDXOOmr0vqKa79bZZXY5CH
	8Yj8Df6O2dMARiM2AsuTE0Bm9lzRMjoGh9JvdP3ov7uuN3e0IWhCuzgwfb+pgDwP1hREVOwGqUJ
	HyVeH5ONX0RK3ZmXADUbz9FsArHFQUqanazN0nl0hODu9w0yfg==
X-Received: by 2002:a05:6a00:3a0a:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7490d786d97mr15265920b3a.7.1750657684709;
        Sun, 22 Jun 2025 22:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXRjqJm5/CswjVpQ1SX8DoINTW14oKg+/CbEGNXmoJMAhb4MElgHRu4lGa6+EVzvmOQIyCew==
X-Received: by 2002:a05:6a00:3a0a:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7490d786d97mr15265900b3a.7.1750657684221;
        Sun, 22 Jun 2025 22:48:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a48a1b6sm7676218b3a.50.2025.06.22.22.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:48:03 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:18:00 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinmux: fix race causing mux_owner NULL with active
 mux_usecount
Message-ID: <aFjqkMxNPT7cZAgK@hu-mojha-hyd.qualcomm.com>
References: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 7FTa9kX9BcnTJ0ex8uG8NrxidTciRjhc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzMiBTYWx0ZWRfX6YjgpfZnwtKc
 JdRIcSFfXihMZqfbHd1ax3rTHTP9PlJEgYRNtohq8Xdzmi3G25HYa3lc+Y8J2h3UzsvptFAJI6W
 K8DWsDAn5zbdcI1TR07KSYOGYfD4oLt0kjihWIFwm28Z4vp1A7GsFYI+KwsMmv4wVqSWRxXYPUw
 Xgxxe9ZKselk2shr+T79aqGDGGYY5PktIsrUQFRaBe6IMUAf2WkSE4RNqDTY5SSH0K3Ge1q+AE8
 W0wOFAkbTEg+eU79lvHNSZ8TZJgnB3M40wMBci0bSNH3ungd7j4U3O+NB9CD+joL0fbw0bT5SSm
 hZzhLNJTgXjGIUWtgCEcnZk12SkV5t/dtblMsg5km9R2OdpCggIFK3OUufYWyKyOb7DcCqwjHWX
 u+f3jAlIg7cCOAV464YQOZ4/MCotLgBYTtX3qaeEU/oU3oxQl+FR+4XUpkMjEp2ZWsiQcbR3
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6858ea95 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KXfMyb82C9iuoBlzvdcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7FTa9kX9BcnTJ0ex8uG8NrxidTciRjhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230032

On Fri, Jun 20, 2025 at 10:13:24PM +0530, Mukesh Ojha wrote:
> Commit  ("pinmux: Use sequential access to access desc->pinmux data")

commit 5a3e85c3c397 ("pinmux: Use sequential access to access desc->pinmux data") 

> tried to address the issue when two client of the same gpio calls
> pinctrl_select_state() for the same functionality, was resulting in
> NULL pointer issue while accessing desc->mux_owner. However, issue
> was not completely fixed due to the way it was handled and it can
> still result in the same NULL pointer.
> 
> The issue occurs due to the following interleaving:
> 
>      cpu0 (process A)                   cpu1 (process B)
> 
>       pin_request() {                   pin_free() {
> 
>                                          mutex_lock()
>                                          desc->mux_usecount--; //becomes 0
>                                          ..
>                                          mutex_unlock()
> 
>   mutex_lock(desc->mux)
>   desc->mux_usecount++; // becomes 1
>   desc->mux_owner = owner;
>   mutex_unlock(desc->mux)
> 
>                                          mutex_lock(desc->mux)
>                                          desc->mux_owner = NULL;
>                                          mutex_unlock(desc->mux)
> 
> This sequence leads to a state where the pin appears to be in use
> (`mux_usecount == 1`) but has no owner (`mux_owner == NULL`), which can
> cause NULL pointer on next pin_request on the same pin.
> 
> Ensure that updates to mux_usecount and mux_owner are performed
> atomically under the same lock. Only clear mux_owner when mux_usecount
> reaches zero and no new owner has been assigned.
>

Fixes: 5a3e85c3c397 ("pinmux: Use sequential access to access desc->pinmux data")

I missed adding the commit SHA and the 'Fixes' tag. However, I’ll wait before sending the next version.

-Mukesh

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinmux.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 0743190da59e..1cea04d57ca2 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -235,19 +235,9 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  			desc->mux_usecount--;
>  			if (desc->mux_usecount)
>  				return NULL;
> -		}
> -	}
>  
> -	/*
> -	 * If there is no kind of request function for the pin we just assume
> -	 * we got it by default and proceed.
> -	 */
> -	if (gpio_range && ops->gpio_disable_free)
> -		ops->gpio_disable_free(pctldev, gpio_range, pin);
> -	else if (ops->free)
> -		ops->free(pctldev, pin);
> +		}
>  
> -	scoped_guard(mutex, &desc->mux_lock) {
>  		if (gpio_range) {
>  			owner = desc->gpio_owner;
>  			desc->gpio_owner = NULL;
> @@ -258,6 +248,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  		}
>  	}
>  
> +	/*
> +	 * If there is no kind of request function for the pin we just assume
> +	 * we got it by default and proceed.
> +	 */
> +	if (gpio_range && ops->gpio_disable_free)
> +		ops->gpio_disable_free(pctldev, gpio_range, pin);
> +	else if (ops->free)
> +		ops->free(pctldev, pin);
> +
>  	module_put(pctldev->owner);
>  
>  	return owner;
> -- 
> 2.34.1
> 

