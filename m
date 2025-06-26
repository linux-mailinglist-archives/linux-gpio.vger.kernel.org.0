Return-Path: <linux-gpio+bounces-22292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97741AEA60C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 21:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF2563AC65A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 19:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C468B2EF654;
	Thu, 26 Jun 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6jtoCF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401512EE60F
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964762; cv=none; b=CO/1TkofYgjTmKBJUPAEi5/cBAUkZvx2X66TmjpxOxDQFdyv1HEmwVnE6hlmQQYkHyIA8n4BM7XFohOsfUCC6I/An9NEw8L6LOG0a/hIu74GjKZpT8RbRCsugnLxstWqIIRPLRVd4nPI+jPSLBN9oyQcDpE9A0vAFYUSF7n1J8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964762; c=relaxed/simple;
	bh=hzWSJSh9ZjdKk+l3TLWOpD9SQ8gWkmCymR4OspvLhfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SorqOle/bDSjH/0TpSlmuxKuOtmO8G0P+QAb3PoYDENl+UdHxIwkltaT4BpFacpER7FuBk3IJoRwLJj5q4Jlub5lSJ6JAmt5niCO3X+fgNeD4ng2A2/T1PRqNUfeB8l9ZfokjhOsGpp8ArnwnHdIGW4b5YO2/LGNa3u62J46rlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6jtoCF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIhhsH027655
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=; b=P6jtoCF7Mjx1xcQd
	ZE7nTkYUwVgkvWEwqHneYaqxGop6RhO4FNLYPfyy9b1eHxzs2QEzJnLPV5dwX92/
	INMT+LbzNNFCU736ixn80YhmoVNQn/4N0Q3rNPhAeEMObna6UneyFSYGW7i4zjFj
	G1kYHN6vDYp/9YgekBJPQwQXJM+dgcjbX8sv3a94h/B+UObVy1ND6bB0XczBsf8A
	GZoTasrdnbacvtTb0IN4gnkmN3rX5hK/RKEgtqEgOl89FlRfSJFvVg9MvXsEMEN2
	MBAPItYzfEv9vW/G/XTNBwJCtpxFVK1VKM9aI4GU5KxrpVpJNEV0cGpxYZg/e1Lr
	O/klkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5wj3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso26636585a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 12:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964759; x=1751569559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=;
        b=C8dE/0NPLUC8BJtDv6tQEsSZpzC1jnAMZcxLlM+9vaTf5Lw4XzGjVopy6/intiraU1
         l8mjK3JlHv8+5ymz31LzzKJu8395MLW39UjFbdp5XhlnDOLEjTnvE8Gf4ywh3l0GGez7
         EpNDRV71M6YLC5MeADIlT8RRgD6ikIbl8gpreehunp/ciC9kMpm110/F54/2DQIEdj/f
         t7eiiJVGDnCUKkl1vITb4QnHynQK5f8zkKmNkMCy1Qdm6prLrlHUsJorOJyt5PZSfZ3q
         OEQjTtzt/ayJgZ+yXyTYH1xhaRzAiPTzvnpqR95u7am8BH0Qkb/lwh2LmmQrVQeHe7vB
         6SAw==
X-Forwarded-Encrypted: i=1; AJvYcCWfsR8kOVG1g4MmlHVCzqX/4Lt0kWvdzTlOFV7HVmYzwYREPor+qwqzYlBRyITnj5HWqOlYyyk1GJzg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOP6K7yGkrLT8414swNi9a0s0u4yewJTMhZf6V06WcNMF1VVJ
	h6GxP8HDmMIcoAQ/Vm/e+PXARPN/7rjFcuo+jzGk1v0ZnBbOpmA+uJrRBpLWSRA3FQGs43xuqMn
	z92Zz1cgKtCChz1kiqxSrRpPiAEqPQ9RNxtOnlIwYdyBGWDTRzlMcmCefEBiwg9dqQ8eRGdrl
X-Gm-Gg: ASbGncstkjRFpUEJAr34IFVjcU3b9edLb1aVwXjS1kS1P5WyQFSzK5nlb8EcGPwP/LK
	oVwRgzjA/+QrEhlEAh+vOIL2SBJoJUyhG8mxZsX8+ZFOvnlJ5hOgkGZg91g/BlKOlZXIBu6izna
	tvkmoA89Jhw8Didw4oF4aJAe6vqh4PFnQ7gWPluh5fbwdgWG33VuuPB02lwDskl5Dg+Xjv9cNbL
	LthH0YEKiDxlrOjapXiwqZIaSxndsluakcTdvTuYAskezQZDKcehjAbHPLIOu1eSPyz4SYEOO8g
	oNs54wkEMblBKG5u3JJ9j1cmhrTJ5ns5gWOfUTYFfnXaoPjk+YAxfO28tadNrLrK9zyMFvCGqkm
	yV3E=
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34373985a.11.1750964758818;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvfCTQdfFP0SCpdMbBKY095dyxBl7NMLUmqNDaDx9nn2uN6YU/442hwfaXLvkQ2HJfXqedg==
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34372885a.11.1750964758406;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d949csm39521766b.81.2025.06.26.12.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:05:57 -0700 (PDT)
Message-ID: <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:05:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xqoTQMg_WK4_tYagv9xaDfOfPQTikd0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MyBTYWx0ZWRfX/Dj/5JNfu2c8
 NyCuwZiFZ7J5XpF+HoWNdKPyvzsgOgB66+4NWwsVO6s+A0KJ5AtMpwvbAIXPXTWXA9fpx1Qjtga
 qvcB1txhYkh9pW+/VsbgPLP1jpyw81cg2fLgrD0k2nyodocQGB3psIxecfcK2oQs0js6z4G5v3v
 XS2Cgx8tV1GwwbKeW2q+F2apK7oThL75ITiw7nWJHxogxfaF6EZPeXI54robH2nH7MdoWL4PSzY
 g8QVhHaMFuHIxiEqq13WbZwJR7HTmduiNlUTZ8B8DIE1eHPmfj3kXk8vjBkuPbE2vmVlVq72EHq
 ogs1T2ThOnAOVVLHRIFyqZrEv5pVONfq32WQbTVYiAeGIN7GBCDoeKZI7w8cTb4BjK/altDPXrN
 jr5EUGpiGgdW7LryIIYhVGAvN1xOUyoV/l131L/Vqs0PM+f/DLfPtdyl+kUAS6tx01gcYez3
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d9a18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=sOBEMjS50dyNa0exkEgA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xqoTQMg_WK4_tYagv9xaDfOfPQTikd0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=901 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260163

On 6/25/25 5:37 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

SC8280XP CRD breaks with this.. looks like there's a conflict between
regulator-fixed accessing the pin with gpiod APIs and setting a pinmux:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)


Konrad

