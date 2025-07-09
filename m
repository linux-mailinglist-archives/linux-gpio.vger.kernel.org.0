Return-Path: <linux-gpio+bounces-23032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3DAFF06C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 20:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466885667DF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088A8239E9C;
	Wed,  9 Jul 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkHrX/iB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F903239E7C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084287; cv=none; b=ZcC1eaRMiTudEmJpNd1fZVCUkHSz729f6QSQ3PHGcVYsobv+77bUNLEhkYXn2hSD4ECr+nMVmPAcflqnvxBNmWiTvGAJNwXm5EcDs8y8ldQQar5rleF+T6ILUzlHzE7XawHQ0GyTjphT53IQZaH0QTvfBPCD5XVCcf+O3MQGNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084287; c=relaxed/simple;
	bh=BwEHDnFF8g9BwbRZ7s5wgYOhw4vNQlfGkcQ79zkRIZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncq5SrIHY5hK5BCZM5VHsXns2ma1L5ODaE7Z54qBbhiBK0DqmQhEwQpjNbrkxiRadpKDH7mSxcYXiQ6lOZct5cRLM+INCOgC7CAbax3x5ElT38kz03u6UUSNP2nQw4AtKxIEFKuVAu/Cuxvm+JnHGfDT5Ccyvj5BF+BY/ClJdkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkHrX/iB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CodGX009978
	for <linux-gpio@vger.kernel.org>; Wed, 9 Jul 2025 18:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=VkHrX/iB1owUSxld
	0k+fbo6IcOvwtEYGSSRlKjHpAinC0RiWd73EPPUC6SOM4iBvvYejo9Hir/sSs1M+
	BimAHnZ5h1Bm7K6EukFdGpofuYt4/4mVpL2Pvk1zuKqdOPMAEA0hUXCuPSLOmkJI
	uxhP+dVMdAmPY42H33WwyFKvhLTjLI7hykoi46pR/kn5Hgzte68IRcBVaBSbbEgM
	cHTfSuCq3FFJOsKCluYO73ZuMuweN68F4RZKBYnZjt9JHLQRIPG83VqGx6D6sB7x
	NYtuDq+MO3CE2+WCNg0do2owYKfya9Fs8n2UT5JIvD2kgG7SZnFYVVqX1VOzqctq
	+OrFUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dt2b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 18:04:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so2787685a.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 11:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084282; x=1752689082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=;
        b=ENMb2tVmc4OI5RT27+U6mWvVhvLNM7LT5TNq/Vp9Q0XQ3DYw8X9/VxaVwUWHPqMKfB
         3sMT8U40hw8+LCfdcOok7K9c3w04gwaflBTxBHAIC0FK+l4S8WGy2U+0FzYqWYkGISCb
         iaZI+uypAjN2Mg9KSSMpMbtaSatDgvNTXsV1DolhV687yrXLBlFdg5wq8v2Ap8dii6X9
         HRx4IbAenuJ0sLvoNJBScnnRt7OQ+HbpN7hmOQOn9+qpkQU0rkdEsf8b8GMnucPquCYi
         CV0E4+FFBrk7wyxSxMqP7BuhpKKJwTsPSZ46rmkSvVsT8irU/ebiqV4vnqyeiBPM8AAp
         dGhg==
X-Gm-Message-State: AOJu0YwP5AplDxfZL0V4bNJzGEkGG8fjZkxy157xoMI/kwPrekpbK1b7
	P5U4kwW/0Z6q2xZb9KaJihvnGOxAp+QUlwif/IZADPJUvfnZNh2N58h1uOyhUhcekqRxtCh/MbZ
	p6N++VDpLjhn7GHxiTZPd9Cvi3gIO4zga8H4NP8tIG1d+Bd67zC88GZcvDTlwOfeC
X-Gm-Gg: ASbGncuR4YH73dzmRQsK6D/to3q6DNjebVtKUNZ5aweIMyILIeCiwK7sSJlcdNB7872
	aLh4FTVNnRKUa/+zQvOS61sr2iAmHUwnNOIoN+YD+Z8hkyr2RRCcukw2SwS77m2Frn8JZcPDEnO
	3FjtlHb9UoRUXYjmsyIwXdMokYmuVoDaCogdIijaw4mEE2V4dggyKr9n4KFW0Ij9Hh6lFOLio7Z
	hpxzxufD2nisuYTOgfs27ZAQfGTBIXKK4z1Tksg6bBxaMGyqmarAxbd86Tlx90nZyxKmbTpxOBI
	ijwp7EWKeHqxOPLkRcGlGjqCWGz9EhALv1t0MzAORUC/U5mtjiuzfCYmduAo5Y8cvT2q+yewMmY
	E83o=
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183720885a.0.1752084279982;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdyICFCZxRrKtqyaPtAi/LxAqDz5IEHfkpkf3qpn9haIG2NUFS9hpsW2SKi6yjsOjwAtEOw==
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183718485a.0.1752084279403;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692f555sm1156700766b.60.2025.07.09.11.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:04:38 -0700 (PDT)
Message-ID: <256e01fc-fdba-4006-be8b-236fbbdf9f25@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking
 pin functions as GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SdzWmKCQDQqQRQPBVsBpC22c2ytZZjkY
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686eaf3a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NA2ShB3TTlD8ZNnRZVMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SdzWmKCQDQqQRQPBVsBpC22c2ytZZjkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfX6ZSSUPV3ZV0b
 BGPzix6ej8zf6ZEptvVgXndEoi2J8vm/UvIAy6Uk/TbLNy5560zhtqhofmGSKhQzt+/EGSv2VBR
 UrY5l/huo4wUIMRUgfIFJ5VJdv4hp46rVquM+yTGVgN/IGGmDexGzahmFpyqeRfQDnKJAKs7PlF
 WVJbfdYMP2uElr8s3he2o9v7ZFfxYenwL1QgbHCaZvgmT5wmyYofqKGeJKA44cv2MXqbA1XwKc/
 I2lL09/hbOle1P812JwEKanPodNzHraT9oCzDOc3bXLu1ziIclVqjwYQC/X+i5qnDQxlifT+HCk
 zT+BnNdRue8/Z1gyTAUBgMRmM8NRyYhn4sA3FeQB+YPLPc/Qk72VTj2jJ4LGl7+83eh3d5NEYeb
 llOJFBCIxJBZAkiSuO7s2dZVGDCoGMmgWxmWv0Vqv9no9gn6V71bVvDA/dPMre08Yh5rb6uB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
> pin functions and assign the .function_is_gpio() callback in pinmux_ops.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

