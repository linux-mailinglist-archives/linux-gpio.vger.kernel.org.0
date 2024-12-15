Return-Path: <linux-gpio+bounces-13886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 686359F213F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 23:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EC6A16296A
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 22:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC531B3949;
	Sat, 14 Dec 2024 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxq3Bxan"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D021B394C
	for <linux-gpio@vger.kernel.org>; Sat, 14 Dec 2024 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215191; cv=none; b=GJHGTdBCBxgVgVcnbVUiVwtOMEscczizLXMZcDAEH3c1cZss/ZI39zG0WVrtrN7d9WPUbtpjSwjhgwmHM83wDBUxZlf1sPkepDii1n8MD1067pNuuY6OkwbMm8uPgj6fka3u4CqhPTk6YeomrGwKf+9XRf3e+hQVykcOJPE3ZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215191; c=relaxed/simple;
	bh=ZrDNWfmtdISpMYkUeSLoudxH2n1f4p59UXdWu7P8JPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kB/RKYaZJO86Gq1csgKMb1BJ0jynsMlh3tfTqnc0gYYr6b+6xRt6ZFNnJvre0zPB1OeDg1u3mxPOBmPEyHbAtvaEpbuVryMPT0mx0s6S716HEF2Jg1+rB6ynHC8M34PMwMUPqPUohr/mlg4I6a/GMhBLWMhKTPhDMHheHQ00Ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxq3Bxan; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEKxmwI031506
	for <linux-gpio@vger.kernel.org>; Sat, 14 Dec 2024 22:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4QqG3p2KHd1ypOB7S0ihhuqmQZvhM442cAt1pqnT+Y=; b=Lxq3Bxancb7SACUk
	clsR9K1LXjuBbocbljgCiNPZPmfeMPSCi7woxM4AQEH4Uv39kos8I81ayn3y0qtl
	KYQ5AFs4sZVqv5LufmzZbklvhTrBvNhi59lD6z+9xTMt05rXLqCaXmXl8f4Jvix2
	px1qjuFECFUiTBkTw8i500HmOHaRUZCuKkMzH5cN0OisWt7ccBN7zlbgo2uKZij2
	J05CVpIHjrv/OguIEO/ZHhvlFiMDddl7EtzBmWG3A5djpcuKPvA2vd0GrUsVi/qA
	4kavjt9e0d7Mi5GHwSLsm8KDBg5WGdUaZBwoflQAKKTgoYecj5CuVaJPmI2FojDi
	1xQiUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h33u136d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 14 Dec 2024 22:26:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso5672281cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Dec 2024 14:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734215188; x=1734819988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4QqG3p2KHd1ypOB7S0ihhuqmQZvhM442cAt1pqnT+Y=;
        b=Afsvmu/TTmAso1l4P+4SHS9zWWVzOp14b7/IyjHTVpkHftNYfLILIGE21zFuSaQ4xU
         qULInChKwxlV6ZwC2/HtYTnmsizQnGw+bTnFoFvAgl7KUMTXPfytzjSXo9lsP0ams9J1
         0E1mhi4p71yDH9aIJ0sovtQSjtCFzu2tNf5BRzcDdfCLsHU6XWHSH3J0HB9FKSLgpzBY
         NLnovAXN7naaF/t3wiOXYxpCxEiMzxHmEmux9rytWpjhvoOxNOeKa8wfLJR/weL6Zjn4
         +4JvE+dQMv41UqY8+Rv5CDjlLSEe19mP2aoQ5hxSp1kIeIMYuf/DBqpaybrQePi6WeWF
         8Ubg==
X-Forwarded-Encrypted: i=1; AJvYcCUrCVeXIMhNCqKfQpFlZ+zMjb8rInaYAcWmrAZ+dHlGNiVY71fUH3b1/kVR49jBpbndT1+06dAwSBJs@vger.kernel.org
X-Gm-Message-State: AOJu0YxABeJYBRfYO6FLE+o31XJFsruYNEVvWcKo4JDC7jc8uyQAj8IO
	0uj3nuwbJwUBaN+zIs/RbPy8uRAOFF2U5ke7A29ATk21nXOpOQb5tKDY+LSESCjIdcTISoKOgDl
	LnGE9GP3b0qIWMLr9rX4mognVImB2AVH9VZFTW9DGd7NA5lmpMoN8PBL8ON7r
X-Gm-Gg: ASbGncvWVA1WrvJatCb7Ijr6E2eJc/Llsk5EY1nIjeZdJAtgp/b1GIm5fi1DPYI9Ota
	O/t3fVcbpqhlTqTpMQaTeb2iIFsSefNkOBI865lA6/1g/7YfzqoegnPstyRcJiSOouYBGaJqTat
	73bjr5gn0D7t0rD5ByAgK4CKdkf3iJs7Uk7/Xg+0ONjX2fGETZDp/oj/ms/3PDpA8h19HGEvT8Y
	bq03P3qLvzNmVsHp0VcUzrc/kX1j6mJmsW+4tS6YFIyzN1q+ZUneyLT4RX8PqkWkI+FG3u2nZQu
	qHq9rnZu2AVjIKiZv9Ub4+6s63aFmpTG3b4=
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr401376685a.7.1734215188036;
        Sat, 14 Dec 2024 14:26:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHasR3K6p493DFjUDFsgFM7Uolbcjk/4yrc72sMuH+zSyIX6k46ZL84uYVCjvNS7JZ/TSFgJA==
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr401375485a.7.1734215187709;
        Sat, 14 Dec 2024 14:26:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96006b29sm140887466b.28.2024.12.14.14.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:26:27 -0800 (PST)
Message-ID: <5e33ecd6-1307-47c6-9f57-2f7c98ed1272@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:26:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] arm64: dts: qcom: Add Xiaomi Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev
References: <20241211-msm8917-v8-0-197acc042036@mainlining.org>
 <20241211-msm8917-v8-8-197acc042036@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-msm8917-v8-8-197acc042036@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pBHZl4uxSyLkw331tOpFrF2hVfX9mF0z
X-Proofpoint-GUID: pBHZl4uxSyLkw331tOpFrF2hVfX9mF0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=760 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140186

On 11.12.2024 6:59 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 5A (riva).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

