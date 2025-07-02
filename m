Return-Path: <linux-gpio+bounces-22602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1AAF1329
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78EE41C402DF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D1B25E80B;
	Wed,  2 Jul 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOZImIpD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001F264A9E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454199; cv=none; b=vDyp0A5sWl2NiEr/C3/KU2nvXdeFTFTv4PtCRjccl3+4YTezUj1sg36VKhshxZfoOJ0cHwoRF0PCAlaIBAPNsPdBNaGJ35x9EBo50ZleFbGxtPgllWEzYdX/FYtz6WRqqWr0p+lrzg69l1qo+M0GODRESDZ74QV7taJujLOJLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454199; c=relaxed/simple;
	bh=UqsOoiEtRgi2jrNVhPu8IraMKM1WqaHrnLwWkgQObBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncGhbRfO89LppTo0Y4fPAP3nREEeSZ5+HYx+QUsf+hYFNMF9v9ElnKSd8fmAiZeP3xEJjd3KwmTemCe0BuMEpR6cu+oh5DeE9KGeaPccBAO9J80u/PEK1Iyx7zd9yq1z2+298ewlGlP5ny/aZx0SIXgLJUT9Ts+VYOfmYjLbyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOZImIpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629VCXE024441
	for <linux-gpio@vger.kernel.org>; Wed, 2 Jul 2025 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=; b=oOZImIpDzQ5d4D30
	AfrRTjcIPEq3Z08qYVXJQF1qDlcB8O3CKRwR9qQaPLEDxWfdbu0d+XhbN3Fr4hXa
	pgqKNrLyujH20Kr+A5zoKjOnCohjAEXmdB9EG+gYDKg20N/p4JsMFedsljJVbH8N
	YdIeKwuELqtPJMplkT4/OkOoK6d6Y6Bs8UR/8siv5IBE7ftjs3Fkd1aXFrJ5cjwR
	oE/CtlvBTKmug+LTMvbPCjD7soNQ9xhUp3svfvBhiUAO5lv/QFDOj/+KJUqw8D09
	Lf1XtNEh1ZNorFHS8pzQxFg9iGDKQeUFwWHR8PExmXfsOX4fh3Z0yD0f5ODgl5ys
	UY9NzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvvav2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 11:03:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d440beeb17so71189285a.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454195; x=1752058995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=;
        b=ukx6v7NcVMJPrr8b2jjthyCd2R9aFi1pnsrF5dbut0oQuieuh0KnQOoBBUYyPhEvt7
         D7fyqEIAUjAYDgVVLkafxn5/EyWlUSjDvPFIOQDca6AjoTYhacchwzGBFgDeB6gFJJuT
         VpNWrKLmgY5+aLtnPp/kU0vDazhv0aiIpCdAtdLKxiACoggrhUGJ/FMfbjzinquK14xn
         SPsc5G0xiTfs5MnhRwlq4aiVlW/egKjdRqlE3ZI0wP5RoBz0lX359FnPa7EGEcoo6Q1M
         SX0ZAz8J/kiP0+IoIgjyIq9d8ern/Y+w0/WoKmN2+q3KGkTY8XoTTJMEJnGOGdmobvst
         IKNg==
X-Gm-Message-State: AOJu0YybgXDZpWRUW03juetHVHWu2p3QRirH2wDfJq2RC3AyjZpIKM4l
	51NcmDaeAG1XIwpGKfh9dtT/OOZoEzl6RQ3hsDv9Vic3v8MUo9U7MbQ88YV/41t4jt8fxKYiKDG
	ljxZjjAdJFdWXQSdo4TBkGbqfHlMG6NIqbqyPn0wPSnRJwTVbp3fA5kOPYGpdaFL4U/VZNSnK
X-Gm-Gg: ASbGncv4DxkrivRYV9qfv6WHWEaynjN9eqkaaDUZsbOpXfS9s0pIFkTG9303eJLovrV
	0G2C8SGyeDbtf/VRRsf/PpxRQ8oRToLufaFTc6U2hm/FhtWHcUVVPX638xcbWBFOxgIOVhhYnqh
	XeFGFZihQP14t2YRusHzjEmpuPtf/0nj5dnm7XvHSuJofeHWU1VJODJn09G2fPCMWufAnJXOKMd
	W6/OjRTrWaLDP2DUrhmEhYbgMyP7WueuJ+Weo6AvTV/kteOv8TWlsBe3lpf9R2KtVw3bkgcbwXo
	O0c1B3zp5HrBMPtBcUprJWE8ohbNuUJeJfF+VaazrdYs3klCx3Mgj8Bn1CX1I76YqqXFDBS5k1V
	xzpo=
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120699785a.4.1751454194957;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJmVaoky9zcbK8IX4+0F2FowsM3fLObjXG5U1FlDD2lNhegepSkRgmdrUwoNZH1FaJWrApHQ==
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120698785a.4.1751454194496;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm8869551a12.34.2025.07.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 04:03:13 -0700 (PDT)
Message-ID: <5a58fb6d-8ddb-4835-9da9-4c449825367f@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 13:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NKSoSCirz-i4BQic1GCWog1nAmtzybB0
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686511f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FT0SUlyUvFbnnB8yFIkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NKSoSCirz-i4BQic1GCWog1nAmtzybB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfXxHluAucuX1K4
 jtozeMajD6OqUcYDO36LTyicCJ86EWDGnLs2UeYiw9gZe+t4/5+a3CdOF+8/da101G4L7D56JR+
 vbvhg8nwDRmY2Bsw7FETCS9klxohaojx/juL6zKKb6d407PEmScsKeahBbrCqqafFnfhyiy5pFa
 9wz6S51osZnHiS2OdA3AbvRdEZNO7iAsSZRJvu4BwbR+810FYTmLHcup57hseqS0MUqRRhw5WsN
 JVM0AOf2dkmS7uxB/8MHl+bUflidvEyePVPO+kwciJKhhuxnj9KP8dPAG/1rk+wH0vWhqI9hUNJ
 f0KC69yWB+yFq04G7h0SfH+sh4tLbQTEPBet8qiWNR/SyxyOAOAV+Y+/ZI5KVeZuqvlQ5jRBsWS
 ysi8RClAEcAre4iI5dqCzSDvBtUNXWM5F4G4Bt+MzYMCcM2K7cXOqFqdhDtmUcv3qaNHfy8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=764 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020089

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first. Also: while I tested it on sm8650-qrd and sc8280xp-crd, the
> last patch cannot be applied until all Qualcomm platforms are converted.
> 
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
> 
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

I can confirm the above no longer appears on the same SC8280XP CRD with
this series applied

Konrad

