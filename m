Return-Path: <linux-gpio+bounces-26746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D870BB22BC
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 02:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4149117259C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 00:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0A5F9D9;
	Thu,  2 Oct 2025 00:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVEd9Hyi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E70C8F0
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366317; cv=none; b=j/mvxWG5uH5++DHr95vTTrke9XzbTFUlTArNOhaehbS2oVwZ+aW4nmANDeuSLc21fCbu35KlXedfxl5FtIkE6kbzWhQcfqjF7q4wKmPSrizIc2v96ADk7rWAM80IB9naek5S0Gc/OJgKXhjx7aM30frpbQubcs15DyiNR8h4ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366317; c=relaxed/simple;
	bh=xXe71YIonX/mx6fgkbEFp8qhQU4Ld2BTPUxSllwc/As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLnNo9DRN0UvaEZeDMJgzFL3hirOiUPeh+wXXxZ9Ix6UvL2X8sfxOCYqOhfa8TeE7haEMv3X+GUCsTQyfvo5MHuRa9++al9aeMyJdMCVECFgfOWfYRoLpzKNvS5ddgybfH7SJe1Hspya9lfssdPiQnA6xL0Oj8SVBTb8UGXDv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVEd9Hyi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcA7T022697
	for <linux-gpio@vger.kernel.org>; Thu, 2 Oct 2025 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=93heGJe2ZgckPIR8dkGPHK7H
	vBK4psoY2YpacrDOB7M=; b=CVEd9HyiwuMsIJ86DLi1VBtReg2aL5Q6khNwceFp
	pldsTYldByQ3UG/VrXe/rVxR1PzP2/h8hHipiVoMnzyL5ZX4uxRO2z4lIjhbG4A4
	HqLZb3nJEHaR8owB9ZZ+hly4GQISEmT7tQH0OacvJ2j/febF/GmI6lzf1P6x4Y8F
	CNZvWfGLupQuDPcMDmbXiIr9raRtz7M2qL6ZyRvPpZAB3yL8wz1JR2txUTW0rJLU
	bcH2ue97LDR1n91lFerirAgR31qS/r01H2pUmoZVs91OxXeOw+Q9VF/6TNMycbNg
	nWkKf7O/xLvw7YEFOtAQmYau7jZd0BeCxwa9jOlsDnRHBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6nj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2025 00:51:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e1f265b8b5so12161521cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 17:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366313; x=1759971113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93heGJe2ZgckPIR8dkGPHK7HvBK4psoY2YpacrDOB7M=;
        b=Cb0gJi2UNKn4iWYQDLfZya0cmUngBjTP2StLlw1cHsoz2QspSmfdiiHITwdiXrH6TY
         vNQvB705NvpiIPioqZC4mfyebBFVR2Yrna5FuUIgXl20P04pmbWUQUg9DO5MKrF7yqwY
         tfg2WAGCE+4GO/fyP35hiLWJgXNllQ3AqjzK1Ke1+4RhZxRa0XuhtKbkBxiMgj6QxfvG
         ClDMxzUVhJuzPXJMBB2vvTNjl27ak7tWcWHrc6wfN+nnbfu8DogerwkYhI/1jL+XTGV6
         38pKf34YXcRtAJoYTndXzU7A3ib1AY0u40vla14GwBswM3mtyMJiO7E79bD6R7Pr81V7
         YahQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw7UkqgTu/+A06A68OLJ2ghbFv5rDcDPtcjTIZmkV17jb8lE1GvKg73xMPePDNvZWBXGrJrdT3SlkJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvpofP071o779fwEwjyAK2CBxnTHeebIeKp2zZ1i9v7X0oUb4
	tPC518fE2FHaYrxprMUovzITLJnSr8j9mFKsUUnaLOXJU0el00unchJBK94IEoRJAQL0HMOE3A4
	ny3YqQWE0UkHW6DtOjfKCXXVKTI1/EPYK5qkfceZj8zo3aNHNpZlf93oBqnaWbFkUeTdmMVMiyy
	E=
X-Gm-Gg: ASbGncuIyNwuwoVr5PQt9Y66dzmB8D2/Ge0Lkme6LAwlWvU5fzn6EGB/0NlUSN6s59r
	4cdKOOmsbi/HbforK0B4ozQUdn5KaAO7jq6ZHeolzWdJ+Vr68JOs3YPuEOgbqW/N9z5ttDosFws
	WEpYKUJxvVSzwX+773BIIRU50NGmYsWhaECZkOMPBfw3UbaFPLNHlVfL+OY3/sv5MLyNrwHYJyA
	+myjMhqrIN843y9dDesyYxeHcnS1gjAoESbZ1FWCYkc1xFqjxJISe1tYkxSwS3YvH4xJRQrJGR/
	e0edfkwbJv80XyX2HDQaDJB7irA3/g5hSk476Esn0hQr1mqyiDVI+ajHHwTJR4l7KU1g8KV9L+o
	qhqJowpXUvNHmo6wBL5CcswWf4SGrMnI1Vae1XlUKiRk0Fv5717WKr0GilA==
X-Received: by 2002:a05:622a:54e:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e41ed0256bmr72706281cf.74.1759366312966;
        Wed, 01 Oct 2025 17:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXI3nWOwvyiG/7c7UPYGB+PIhFFGHfgFBcRu47k8DhIj/7J/AoI8j88xAGAc2I79bW1Uyxcg==
X-Received: by 2002:a05:622a:54e:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e41ed0256bmr72706041cf.74.1759366312534;
        Wed, 01 Oct 2025 17:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124a05sm342036e87.16.2025.10.01.17.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:51:50 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:51:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: spmi-gpio: add support for
 {LV_VIN2, MV_VIN3}_CLK subtypes
Message-ID: <tkbhfudaa6oxo2ox6l76vixcznfohwmditqj7nsc2zdb3rxqkp@lgubwu7j6v77>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
X-Proofpoint-GUID: BxjXpubOJKdvUJUF-aZMC0EcT5EqeBWT
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68ddccaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_mxtXHsW1hB_9kt006IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BxjXpubOJKdvUJUF-aZMC0EcT5EqeBWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX2MZq44yCgrLq
 tfI9zXDgVTMUndEMiLbbWcyFYyZQppV7sXIa2UTKllUS6xVpNlHdbumKtvLYX80s2jPtPmmECm0
 csgJqkUqyOUwNsE/1BvDZV/vZKhFtd+OOAyiyqEW2zYRIEXAw+EnbErZqT/PVZ9AxYPHzwpehDJ
 1JQ2161azcf/Wz6W1ykd6ItHxWc7GnX+yjaxcTAdUH9aBgKR6gFrqpNUEJGFUpDnhQJFXfpp1EQ
 wE9gVOSXDbhrijjqGIoIqbISnBrtxzSecE1Hjyz/k4Gu/sMINAOmCJ5//0YtuDFdWgQXuxrDyvR
 8uJzotEXJ4xCK1g69ZGYfSnEAvPBk6qXk77SHCeyMsx/LXbFdbk07GL3VQJq2+5ZZdFvA+yySjF
 iZPmiU7Ins0OKwUW+fmV68otIHVqjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Wed, Sep 24, 2025 at 10:31:04PM +0530, Kamal Wadhwa wrote:
> From: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
> 
> Add support for SPMI PMIC GPIO subtypes GPIO_LV_VIN2_CLK and
> GPIO_MV_VIN3_CLK.

Nit: Please describe why, not what. What is the difference from the
existing subtypes?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

