Return-Path: <linux-gpio+bounces-18681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F8A84DC3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 22:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68408174D8C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 20:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2709A28FFE1;
	Thu, 10 Apr 2025 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnkCpYic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820E2836AA
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315425; cv=none; b=LYv8idOYEs0d/tPvKA1M4H86bRLKad4En/BmBXA5jwGQEX2Z4+fJrhMLAINokg4ZICHpy1zB+sQ7+gqDxnAabGOLekGuvM3HANiecfgmk9x7PNsxSfw+bryJcVmqVSEevIMliweIExjRmOTFPB7Rb6WdFderqrk5Jq4pSwTGuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315425; c=relaxed/simple;
	bh=NWcPs9dJlr4e72gBYoopMHmE1Hy8Lc7icWGwbBWFask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCIKu1iUfLuOVflzQcm6CrxYIFYdWfinsdpW3ycpTH5UMIBZUNvwrJS7vH6LJ7hj4t5oXvO5up6wk/zAVxi5TXruPEASr/gvEg1rI12eDeipmHxiodxu63tm7/Hd1V8Or+97/60Oix09ZDs/l9vRUNG6OyUwQjc5pI+f9NAKQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnkCpYic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGFkTG031989
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kkt93pGWQtZDGdDcKrtGNfoL
	msIHhPGO8JKGQOAKQVU=; b=nnkCpYiccI/XZjH9JnufUDAcgWqucI6WANSAKpot
	zfLpHaFRrCKNPYrkkwYY78e2LSADXdP8ovU6GqRAV1b/bNpwbN1sK7KGCjz/GIJ/
	QC0oR5i5XL83I20E+ZtyA3tIDx41jz493ieotQMaRV1Y8LWepaE32Li2vJIe5IfS
	An0TDqG2VwIC75eyfO/Br23b+yykzJkGMxzvm1EbVGvPW25IseKJClBMjjBV7CGB
	xPgXo1P8MQuFq3rbU4UKaH0/tKhKtctdAc1TmRr16Zna6u5o6/Ow7ZMOsiGwWw8J
	NpwNk/61jFYbDvjXsJzG/5r4UhvqBRTc3bhwfKt6St5roA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmg468-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 20:03:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so217437185a.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 13:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315422; x=1744920222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkt93pGWQtZDGdDcKrtGNfoLmsIHhPGO8JKGQOAKQVU=;
        b=hmp4E3IE2goz549uG+YNXnQH89LPCHo5IiGNkqK3slQAg8ofw8QvioKjiI/PLzknfK
         qqyeL8aEzMe8qOQIQ1CT3RngY5Nemye53jxmXAretwCBHvF/zh2aIhyacaIoBAmDAiYH
         5x9G1kYJ6fYt2GAjKLjfyjANc0Cv24/KK1pIDSlX2gmcpoHTLos5NPBQ31VWJNnwP2Cj
         dEWGII04f3f8sFTxivuUDJTz1TNlkzc87eQqDsB3uUQ+r+wer8aMMGTykeSueFkTDBpH
         gwZsPHleE04bbsU4/FKQFxbv3e9G0W/5mY25DXWzMnq0rs6/FLq62I0/9+iS+zOkv2U0
         SYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoGaFr6UCz/H10cIFPPTCZXeENiV4DDxmiORY7RW4OfGwG3VKQ2rbtj1qJ1W6oIJn/5qC4qUQWBgIl@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfpfTh1P1aPnh7/FhD3NTUdS/YS2VPBiLNKdXeWbPJiGzWPiX
	qEVISWbJz/5nDjX2BXaoPTNtPeTAC802LMX8ZLjF4kgdNHuE2/UbRtAWjfZXSBZ4PmHPN7R2VZS
	JHFeeWlZ1dUlh0kLIWVFCN4/IIPiiwoKGwLN+QYWYX7y9D50ZODK2Kzx/hNzq
X-Gm-Gg: ASbGncu8hKF+dCuL/BX5tA6QMgZR7ZQFrGy2bvKU/hexIv+dCs53zP3xKxspv/9HYrC
	SMLk11vWJZ8KFBTHJPjZavQEBEHza5oiyE2m7+cszJo3QtjZzQ0mMEyQyBVumx3ny/jCpAEDYYc
	n4BYh/w5m/94ngQyINU5v3re/nUkA6O5AmqE+CLi0A30J1L6ZSXXpz6kICTWH3/CI0xeDbJuWV/
	WZCtY17Fa7kTriSfqP6Ac/zquRZgIT3iJKlI5c0SNgJWdyQkcWQTU7dIYVk8/Ak0ZM4CPvUVNNm
	zS6d7GUcIXB/Mq19x1/N3vSbjm74BxOoQZ1CzuXJTwcposUVhqa0NzvK71bsHeerdsV2Hjf+6Rc
	=
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44906285a.40.1744315422234;
        Thu, 10 Apr 2025 13:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzArwpma2b275ZwbVv4rcYzwYFQlldzDqMMZoZrFpYHV1BBbany2XaU1T708C9/2OcW/Hcw==
X-Received: by 2002:a05:620a:31a5:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c7af1cab68mr44902485a.40.1744315421903;
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d234204sm233356e87.54.2025.04.10.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:03:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:03:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter
 callbacks
Message-ID: <cpgwcuj3msm244x3ivchkhrvdwzpd7dzre4gbbpcskjxkuduyj@ioazb45ybzc6>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
X-Proofpoint-GUID: xIJNRHxlNljqT9d_vUTtA92J9V-GOZPc
X-Proofpoint-ORIG-GUID: xIJNRHxlNljqT9d_vUTtA92J9V-GOZPc
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8241f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zO7X93q5r17TlLPyEqMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=553 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145

On Thu, Apr 10, 2025 at 11:34:42AM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (6):
>       pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
>       pinctrl: qcom: msm: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
>       pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

