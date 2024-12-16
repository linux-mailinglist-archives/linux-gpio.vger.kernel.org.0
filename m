Return-Path: <linux-gpio+bounces-13914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01BC9F3090
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 13:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFAC316372B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775362054EE;
	Mon, 16 Dec 2024 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAOz7yPO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E36204F70
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352318; cv=none; b=KKtXi1AVdHh5X9pfHzG9TvNJxcA2Gku9ocLN4fmkmdi6A11+xk2xk1K03j8Fuj6cUr3bKbjwR59HbnebYm4WQZ7cHPOVPayTcbNfxc+CA+Ph4W0n8KNdntz2F+Pl0UTEA9YkfbgKn3EFg0Mb+QMDPoRJuS4KDKOE3Vcf4WDZQpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352318; c=relaxed/simple;
	bh=NOGmwuUhx41uLN0wHBW0LLXHIBm/+VxTjHL0qIfPIxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lb522tbxtb8e7/Nxa11o3gZdN9W7kxqxI3Y8y4eyjLJ1F7uoB45zC+8JVYBp4RpxllbjJP2xtCpOWHUQQcFQrTzXyC20D5HVwZ1UAxwfAnnAogHiC1Bzb586wKCSTEimlI2lR7AO8Zq+yv5F24H8RWv8xGlXhRFc98RwD8pud7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAOz7yPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG86xXQ008755
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WeqvPqxs/zm+neW3dpwcGc7WggbqVo4nB/s2S/wzmDg=; b=lAOz7yPOamfLxjv/
	ODjMV5+2Kb003nv5eIAiAcD0qLYO56rc/VB+tbw7aRnoUGG8/Dm1/0Et8FZuYcm5
	aoPo506w01Wt5nshlTRiNec3s4xm/Du435v9FH7MISnroT/yAwcubt80H3Bae6xU
	NMok72cGviDIFgvgNmfeKhNTAtvqi7XI7L3pbByJXhhR11/pGYo6PLArEZDeQ8hB
	FbjV5hP9LuDWrmriFIA0dV1E07txNVzzjLEbIpjljX6y6MomInUIZFeGBX8oCOzD
	WACcOX451b1oLqdycuhiSLNVMGwmg9jjSXeWErLlWrAN49md/bv0HIAw/Ew3Ti8j
	U2RfEA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgdj0r9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:31:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f77bf546so14114776d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 04:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734352315; x=1734957115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeqvPqxs/zm+neW3dpwcGc7WggbqVo4nB/s2S/wzmDg=;
        b=Wp2Ig2Y7Jtydo04GqlDeFkCLzCUgtrNF/fLStEsXAv/6Y/RvQKqa0rbhnYeB7P6u9J
         fd57SRre9/U4D1o7IYZkpTdcEjiiJYs4t/wFE4jyNYKCordDTUcTDA0b4AIsJcyL5gAT
         AePXvMffyf33Q16oi8G/9aM5FzMrXVK6f2N7dumOBvrEteFvdshUpcQqhUbTnhMP8eqN
         kbPUaYGwP7OUawojaLYTbzyzxMor9HaTBxPtX8wMik4tT9QncEjqFAAVdpoY4op6EAYZ
         oICyilNqlVgR8mqw/YXSul120mtDW49a14fWivkPLIcyBQIbcuNcTJ9POkgQ2qjS9Gbn
         cASw==
X-Forwarded-Encrypted: i=1; AJvYcCX92LiGQkttraOUJTq4lrnlN3nASyhaAjyM63g1s8TJEM9smcKkQ/waZXTcJgWrB6uOoclKD+xuINVS@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWhWSGXBJGX6GOFyEVpGf+/H3v7+8et9yoUeH6ks3y3OEFlyN
	w6/M1hMNoECuwlhA+CRHAm5lFxPSoVKHD/4QCPriZzlNIsMkiEAIcc0P5hozsa3wrhKaXr/nbvp
	cXoLCc9Qe8bF83+bBJ4Mp5IJEx9x++j70d6F7VQy2g1XE6JGFcEYqjfL77mOK
X-Gm-Gg: ASbGncuDUhZRl6kKtcGA1FVhZRqjMXp5iKgO0nwVkjiAWkC5RPdCAeBWwUzJX+LYiLq
	PVEredkYpP/9jYkT3E79VvMZmmaVV0fPRn2dttPuJbWWcev2HXFWpisrq+fpF/pFTtpmbkWo2Cx
	GIokfBgXr9lAEJmJsIxeSNhPj5yCsbJ24GzqgpISjphnlJuDFcV+mcNSIAUD3bcxUJ18R6/sjp2
	8SfHg2YO5b3sghW2sCkcNXpjSwvm34Vyqy4/9x173aU3VaJpINNs4D/yUOt9njazk9H77h13bKQ
	OSjCRgQ/U1nXO5iBncXBpszDVCnbwR2V8y4=
X-Received: by 2002:a05:6214:c4f:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dc9683b11fmr74596546d6.9.1734352313550;
        Mon, 16 Dec 2024 04:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdrHVfyoU2etuQqyfIbiSLQe3FMVsNgCETbPhLwAWfRSOxp7xzi9URabDJLwUjep6ho8lswQ==
X-Received: by 2002:a05:6214:c4f:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dc9683b11fmr74596476d6.9.1734352313221;
        Mon, 16 Dec 2024 04:31:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5198sm3112039a12.8.2024.12.16.04.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:31:52 -0800 (PST)
Message-ID: <ee5460db-2459-4ea5-ad35-e9520247cb98@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 13:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] arm64: dts: qcom: Add initial support for MSM8917
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
        linux-pm@vger.kernel.org, iommu@lists.linux.dev,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
 <20241215-msm8917-v9-6-bacaa26f3eef@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241215-msm8917-v9-6-bacaa26f3eef@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Gs_PfpV0HwHIDYrueSe9in530Nldx-wg
X-Proofpoint-ORIG-GUID: Gs_PfpV0HwHIDYrueSe9in530Nldx-wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=974
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160105

On 15.12.2024 12:15 PM, Barnabás Czémán wrote:
> From: Otto Pflüger <otto.pflueger@abscue.de>
> 
> Add initial support for MSM8917 SoC.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> [reword commit, rebase, fix schema errors]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

