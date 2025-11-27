Return-Path: <linux-gpio+bounces-29167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A2C90443
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 23:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5DE53AA254
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB459302163;
	Thu, 27 Nov 2025 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFXqo31y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsLD5wLp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B652417F0
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281342; cv=none; b=lrG8CPpN54u6qOrRhklW1VqPQKN/x5NU7Y5d2y3WNfRhWEPszfB26rMiIFxZyNr1XfDowz62vB+MmhW8cCF1H8mTvGbOwd1pJKwflI2QLIz87WL4cLmsrzUA1WHRJNfaOtgSkj8HqKuw8YiNp+XsIhS3y+3ErUOZbwCVx9yEjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281342; c=relaxed/simple;
	bh=NIeDW7sR+8DutoT9zOSuoLoQCerEb7JHgIQGMvxDnK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b44qGnd5sLoGmIxTDcSx0dDKBrndxv8RODXV1/yjkj7UUPDK0zV9gvV2npPRNkNsvBcCPZMdmmTwHsp8p0lHa7eQG4DDJ+cZ34/79sm52QHSV7ApZal8nBy0z5nvY9SwUPEMjyyjTZv5Y1wGbvcWKqt4YBLUjaaVDhd2a9BMbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFXqo31y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsLD5wLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAJvJY3840278
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 22:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NhAtvThchhqQNyKp/Rnt8jjW
	hnuy195yrPhkYdxR5i0=; b=eFXqo31yvoA8f7U2ZMZl4VuswE4eomnYtOA06Zi7
	HVKMcJjBv2Gc6Zj/UBtNUAaQxOE1uVN8x7Z2QTe2cQD+5TaiP6+4scvW7Qmk+Ztp
	OHNPouY3Y4YNDGThg62cSMeNjBU6l1zxOahC0tDzcQdzsmMWJlpoLnpSXSWd52iw
	UP5CxUnsMuObIYFQvkKyy/zrZLw5IFtezZALskXnXbY0KaI5FNfuFkebJBJ7OkrR
	HWNVsIDNElAyNPWzGYmwUmgBMFR/PHkiCKW3S3vgdj5GQD41LTtmiq9o6/s6wwLz
	IL4k/cnn+1M+lCJUNrCrWinbv9mVHDbRDp9dvRH4Q034mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj0as6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 22:09:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b225760181so150765685a.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764281339; x=1764886139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhAtvThchhqQNyKp/Rnt8jjWhnuy195yrPhkYdxR5i0=;
        b=bsLD5wLp3qlIucWn4d0yTbLkxj4rha+U0ixmrS/ZpdUM9yoJucjdAkQFV04WXk9uGu
         AZcfY5YMMgx0qPI9lItdhJzaXBYbKj8WqDGLaD1UHEM4puHiGQol7TgfsjpbJe2E+9PU
         eSsSRyNN2wOFYFgzDN656sj6cTDzqrhDXSh5zY5lGC42t55dDsaNB04x21PopXk40WNM
         OPAfQf73LgZsV2n2Gtsqsx7rF0+IllRIANJl48sqjsX+iUh7Kg0RPyALPnAbyAbQ20ZN
         xXCKG7txREW/v3BXkMfVmcOJIUYvAW+OIMeHMtYqrodjZBdlaBrpAy3fUQfzYdvwbMjo
         /e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764281339; x=1764886139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhAtvThchhqQNyKp/Rnt8jjWhnuy195yrPhkYdxR5i0=;
        b=WIABdN8CpKlNMBSPMWIn2TwkRulzA4WVhp3WBRFK+b99thWz0uHpbycDwKgn0YG7z+
         ysODf4JSXk/w23xBnvAi19nr1ePGS5fwnKzbtL1ctQckovsv49apX92LiAyrM4NC6XLz
         E4O/a4kMr4LFWXw0PcUs/U7vyJEgO+f7MefXsi/zxAbi4LyY01VdlVvOZc5zzzT/0bVF
         UQ+rEWtnGJEIAKre5ZjqDSYebI+Y+bIU190CCRT2KK73tyOTNIR74W0gDhehDNBiDBls
         51duqkRnKrhgnONC90ngab0T8jd7jmfSNyxBhOQ1mvyvjkwAv6MFCorV9u0yziLBOqjg
         CBMA==
X-Forwarded-Encrypted: i=1; AJvYcCVV3HAONrpbJOMQ/QOh/rSNROZO/gwtrK6yk3RRINgDb9FEXaK7wXcTDvvO3AdMsJb0H4TiMCse2/rx@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3u+S9ebjU/xqBs0SwgmtL3pyDH8BTzDHNVdh36Itlej+e9EH
	0AZEAUd57GI4YynPW/jcHWUviNjKe+5aeUsPiQhrvSEKlI4GilP5baYr1Uk4GUaWX2OPK6s0u1S
	5dR4f3Ar5ONbl0yw6DfO36xpeOjFBZTWBx1R3NZ4x1t3mVP+HT+kxAmUw9EvIBN2Y
X-Gm-Gg: ASbGncvtiJmjjR50Nsa/zQHnddzscw0cZOWROFjH90aE1/8DKqbsvJctCe5lso9W8Ic
	gW7iA65Ij2yFoyFGiYWvHRSdtuAA2ftOXjXN9MRajFDLU9z+mWLcKLNw4i8BSEZhTtNAQQIkMei
	OXh/m7E0eRx/qY2V4xgv9j8kqRa6xrpXDK1LbeEOz1+wG3McdaFwaCUMB7rbE7CVFISU49stgL0
	UPlmXrQwXuOGFyvPszIELAc5eTfxrIN9AW/Toj+vryLCcDeAVeHujmRDSDJI8IPaoakHY/tG5x4
	2P6sjAi+tNhnbaOtVfA0yL7b1h52KhJ3dKRLuZQ/QG9eM9fksiw2WZQZCrazgmY9Q6bi3/FCGni
	ofC9EWYwjviZCKrTkNjGuB8MVf8+KKl2/OIVk1cTt3ShCZGyXuVU7lG4kAV0cJXyS11/niC0qIf
	J20+1H6ZjYUhVrnNKK1+fZK5g=
X-Received: by 2002:a05:620a:4805:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8b4ebdbcdefmr1543808585a.80.1764281339287;
        Thu, 27 Nov 2025 14:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQAb56l9OVVMhfQpDC/4iSeGajYoILCeOgLn2bqtmKWHSq6kbrPIHOZAaMz3q9pQC8OAL6Fw==
X-Received: by 2002:a05:620a:4805:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8b4ebdbcdefmr1543804385a.80.1764281338728;
        Thu, 27 Nov 2025 14:08:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236dd782sm5593281fa.15.2025.11.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 14:08:56 -0800 (PST)
Date: Fri, 28 Nov 2025 00:08:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: shared: fix a deadlock
Message-ID: <pq6di5nia7kcdiqsitcr6p42r4jyejzlr4wzqsmz3hes5igcy6@3r3inhvwozga>
References: <20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE2NiBTYWx0ZWRfX/vV5fabZVQ0C
 lLhGE+XyXaEx1yev2EXltEeX6898XRnWXqGMeyXkAwooboXCpItfdWCKxUGf2QOAoh1j0mHO1pZ
 Ph8g0mBXsTM+pUeslWGTkuC8iZTZXzoLh7G9ytp4+QofNRyDBl89tvsnnWlK5k3zWhs1zK3q3MI
 0LE4z+GSXY7kIzheqrt5zanBhVI3igslepDVa9CgqPrnFKgUJinvNmekmC0Q8A+vm4ih3Tx1eK4
 KWAkTI5ahQ8/5AtfH+FdrVdnHZF6nTWCrf/hyV4l0fI2s3YWq+OIXrvQN1MqOfQ+QYNs35wys8v
 TaWqkpzuo97ZNcI97UuBIdDVQjipk3OCZuIieaRoeKytttvXFJibIm2VOduMn8yT+kuWlqzZ+70
 igGaH8M005LJcI1rI3mYYNlIEahVAw==
X-Proofpoint-GUID: 2cN-H51anjqSfBxzATXKD3hbxXUSMGeB
X-Proofpoint-ORIG-GUID: 2cN-H51anjqSfBxzATXKD3hbxXUSMGeB
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6928cbfc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jZQzvE71K1B4g2o7vSQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270166

On Thu, Nov 27, 2025 at 10:53:56AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It's possible that the auxiliary proxy device we add when setting up the
> GPIO controller exposing shared pins, will get matched and probed
> immediately. The gpio-proxy-driver will then retrieve the shared
> descriptor structure. That will cause a recursive mutex locking and
> a deadlock because we're already holding the gpio_shared_lock in
> gpio_device_setup_shared() and try to take it again in
> devm_gpiod_shared_get() like this:
> 
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

-- 
With best wishes
Dmitry

