Return-Path: <linux-gpio+bounces-29088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95EC8A61F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24365357B9E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1000F303A2B;
	Wed, 26 Nov 2025 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omo5ZC73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdG86tzf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ECB302CD8
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168036; cv=none; b=kdAY9mdBNMhbTdgGmgyEVte9TRYcVx93+5DomPj6hSuVEuYXrIuMQrzJpcKfevOMNsggE2tzHVqLV+ckGmpSW0tbyE/8sYNitRtAg84MprDVLWRbViFoV4sLggM/GDB3/UEBW6ZfRJW3CtTAd3L/ECXmmInSWj6CvGUJgYmg+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168036; c=relaxed/simple;
	bh=Eon8982swap461jNuY7SXuzLgQoe187zDdqMW1UQvKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXhYwnB0NdQDAfXKNkQvSZ3Wo+vcSeU64f1IL7YcaaDpDCFXuzBKUYzFHYdY7L+Onwz574XWeXgMA3rhcAb9xIQ4DdLss7xndJmPyhi89tPsn5xyKmNILFf8gnaVvu5VzJFz4D/Bpn2HwuNaiJphAbtEgLPcAbPkxkCPtOtbkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omo5ZC73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdG86tzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB2hO82122166
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZUEjnUCCK0JIG3JUS5Ii/sy
	vWTzLObg8cbEzR2hy9M=; b=omo5ZC73IrCxVqeETim7CtOztKHwKmkgAOEE5eBU
	gM+h4Q8TAt5+VpNlRbPNnFa4qCt+gP4uW3cm0yvolYKPHjlJkhboBOkI/BWc4Bbw
	HENl4DmMLNxYbEeEtUyzeJbuu8wIEu+vIeRH1RzkGZXg/WdukgXa319NpKDLjTNw
	qjme/s1+InySS0HJr3yhW/TWj68FEvXFyb8NEw3EWmrhCapRUAA3ruQt4xrY3K5e
	7e8u/dO9kMyr0GLPRe1YK61QW3smY3Ci7dbnftbzkxB4URF9MOpmgmVKcFIuIjWm
	SRgt4m9by+8qT87S/QHNH5a++UbxgH6cDNZybxgtz/lVcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b30hrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so27219485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764168033; x=1764772833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZUEjnUCCK0JIG3JUS5Ii/syvWTzLObg8cbEzR2hy9M=;
        b=YdG86tzfOnjYKq6zVtveyz98RzzgO1m9mVzZHHGnTpXyhvVbcUUZPOn8mSTaAG1lqP
         Qfcdfmb2unt/BRHbcT8DEZd9QmXYZ4ptD3q3S2CjKZkaK0whiPRPZ2TGZIFSIuG2PXTK
         8EY/Lsv/y0HFrgD3Q8M2u7NzXf2UFtJuPRh07eW+hk4usGhlghdoRIPHxhH28lCZlqzx
         qAJV25vqeh0wpx8ZV6mDPSCwlgnmW8dzB9j87Uq0R1fQci5fjRJh7QLKWVm7XPhUh+u5
         LqfHL5J6LUBvHstV5wzRomcnnM+saklDUcZVqqmgOPrZwmSNG5Khk6+JLDVEYWuhEshg
         336g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168033; x=1764772833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZUEjnUCCK0JIG3JUS5Ii/syvWTzLObg8cbEzR2hy9M=;
        b=FAN4ZQi0B1pLpFYrch0LwwpCBe8RwcYVt8uQakx+ZZ+d4P6cdQ0aZkXC9X2rCmKjW5
         F5Q9Cm7cXm3ASLspZo14Nifu2ViWASXWyLuB/JZ4qw44cim3EtpQhmrR0yY3Mftqz0rH
         YYptntpYmqzXqSf4igH1q+QZQ63VZK+D5Ve+MxD7jK4UCq2aqgALeFwJATtudlbfsKXs
         Aij6yAHqUE8/X3SLUR0i03HvYt6GDyBcoz0WPx4+DC3p2eCUwoBGxlZ1Nd7M0Y3c3NNZ
         r58AQImxZc/6fhDtrUM1GWCdVgNudOYBehvoM0a7VmZeyL5rWGMxEj9qN/3nyg1xN5D4
         pTJw==
X-Forwarded-Encrypted: i=1; AJvYcCUOhS8iMvC/qcm8fbI+e2DVAWHt9XuPpiTcn8Tj7p5r1x2X8nHFQBCtL6i9CZNKWPDegk/ms95are0F@vger.kernel.org
X-Gm-Message-State: AOJu0Yxof0PM1I9l5PbO5hUDq7L5FPJlh+j98Z9zvwXQZAp4IWKqX+Df
	Tr8UA3q+VxTbOH8IE7K9tuaDhMPlm0kHi0pQkjXV/sD6bmbvBva+6Vga3r41vV3Mht5+krpUzat
	L/BcdxY43aXdGqowzBBIBWqNucln/qocSq0hP4NRFJqfYWD04drS6f0oDZiYvsIPz
X-Gm-Gg: ASbGncsrkyrBpTJM80sGn2DLz22ccem7cYMmqxKJxdxF+kz3Y7UjEErI6LBZwNpqDcT
	c/fAMfgxYvStLRj3yY/nBxo55rhKHOViNYfEmx/YTQjmtDIiNgRnWZVApLAr1cyuFDRyNLEyQ4d
	cHeQOLyZKnpLDKM74HVZfeFqLri34wFs/U2ou+RUiGSyL8pS2/eY/4VOZaInTt2EGPBKDRHYmIm
	dz5E06ciLjKBCmr8XySYmldDetmdZkns11Y78w59OTbvah/bVNQo1qGVbMCWMvSnLt86a4VICph
	Aao9yCyMJPAXKr9RALsnje4KN3/Qa0PLQ60Tt7W6FO5zNr/CtVHKbyCuDPlCCcbDnKeCbcHK0hC
	UrAFyz00HJTqqf4vKy+1C5xjOhwdcTD1pSgEFfINvThudAcT+/cfF1QSMRsMOJaXt5g4QpiO6IJ
	XMfRIDr9WrVQb2tHnlkj334Ao=
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2485356085a.90.1764168032708;
        Wed, 26 Nov 2025 06:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp3wUSeWxCbqnY4bLYKUrg2wuf3aNS2sdexjo3KjQDa70tqm6BPX+WmzJtlJW5uK+qMO3d0w==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2485351085a.90.1764168032205;
        Wed, 26 Nov 2025 06:40:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db87153sm6085150e87.31.2025.11.26.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:40:31 -0800 (PST)
Date: Wed, 26 Nov 2025 16:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        stable@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as
 sleeping
Message-ID: <m7kk4bcmaft6at7isv7p5whvcqrfpydx2ajhp5hzi47m46rzds@gjomcts7c74v>
References: <20251126122219.25729-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126122219.25729-1-brgl@bgdev.pl>
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=69271162 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tJZk5_2C3ecUZBiXCX8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyMSBTYWx0ZWRfX3sjA3uMP8zEu
 HrYADhHhC3xdwXAOP2pwW4bC6gXqZgrk+VaXIX/fFL3D0/GbqS1BTBTonLziSk9TTk9B+WfhPBR
 a11nhzEL+CmYrq+F/nbJN0fW9GYLGoFZ0qmGr6Cg5uA0AATGqD9Qtxg8wSPLwkyJJr4E9W+ykze
 BPyf6iz8puh/9/HlEVRjiHWeuyF60JJm3XqP9CzWo9msrqHnFxAArsZb3TUEnl8JgHhPjhItryX
 P51uUdnZLVF5xJ6GjYZOVTXEeMiOyALFJYnh8zOOhdKj4Io0UoGBAfd7fXzFlc4t3LbJ/WzBkAv
 EKF0idJulXswXyxpwTa9jRDL7GVl7vlzTqIE4hhJ+N28CuqIMBF6WBQNnMEFuYhTOGWbL7SODLd
 YApIySwIZ3cDH0Jls4FNnqTge4Y9UQ==
X-Proofpoint-ORIG-GUID: YpTNjVGGNetCewtDSjX65vq01r2m5nNX
X-Proofpoint-GUID: YpTNjVGGNetCewtDSjX65vq01r2m5nNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260121

On Wed, Nov 26, 2025 at 01:22:19PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The gpio_chip settings in this driver say the controller can't sleep
> but it actually uses a mutex for synchronization. This triggers the
> following BUG():
> 
> [    9.233659] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281

Nit: usually you can strip timestamps from the kernel dump.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554, name: (udev-worker)

-- 
With best wishes
Dmitry

