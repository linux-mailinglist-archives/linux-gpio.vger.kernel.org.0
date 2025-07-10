Return-Path: <linux-gpio+bounces-23079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3AB0019D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8DC560CF7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD3C2550D8;
	Thu, 10 Jul 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCBl8BQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7325229C
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150321; cv=none; b=Tg0brDdJOyNpWPmhnz3XhjS5mt1cxqhadjDfbtwCWc9GrQ7Yd/6KoTin86LV/4aIYV3QVz6kpwg2i4xOLcGHiI2B7VR9lfWCUDr4XdkgZ7TlzZfJ+PMmG2PXb3OzoVGaGAZPIXZeJ8e/fsh+NqEVeyUarEJTaftogzOAUg2YnGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150321; c=relaxed/simple;
	bh=FgzRt8ZR7RE+rp15IyUmQeD1Nnm06vrWcpPbcGFEZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHKQde6wDP+r2Cl629bFnTIGQST9GP+mHxPqrr9iVlCoCrd7iT8YEEUiHvWtBr/6u8KlU3ZNt2U/JkoZX9P3XjLTB1ZzhI3OJ06XFye959CRF0XKIfpFlTExq17a2+wkzB0fMWuwgxV1957oquMS4rpTVYChK645N2h7FVoBuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCBl8BQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9YAt0002616
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=BCBl8BQnoib8Svq+
	gfbo5fvs1mFg9wD06+fQV4mO1Yujoh6bcMlpk5i47P8zlnXcU5yE4ZPwbEecRf7z
	HReJSijPmv9Gp6e0mRCjmIfajjbIqmhe3BWdIlgQb6g38Hx/ZsuGU9wx4aia/xCq
	t65mAn4ocuHMxGM3JMLfvliRQ5mq3GSqvx+vUYklz9zLmSMOwausfZgxwXWK+7pV
	ascfe6QsPtHKFrGuwBjcVjOkEd5w391snbN4+StyJ49NENL9SDRm9P/7M6Jw740Y
	ZM2RR9kJr6fV2QFImPUZcizk7Q6lu8vj3hI3OZxb1BKUqfpC/fc5ge10boKpxYZ6
	dv6zdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg67e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 12:25:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a804126ed6so3940481cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150317; x=1752755117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=;
        b=Peuxs6RipmxvS8iwG4kmK5yGGxL/IwbcQkhwf/QqW5nZy8nOne7APpXNZmQV8X8yYp
         xU3/Um86ERF/lw/2/Jg1Wgwp5Z6SnbJ8zVk4Nfy6vVxiO/CLrCp9Ah4XzrH+9qC5ut86
         9FQKRnxXm7k89Yzo1RlJuBok9HwCVYm9+wKF2Y7JmT7TYO8qhZPGJkA/2RQ9q1GYxsgf
         2vkhtUGGbrXPjQQAUisiSRc9WxEIFbUSJrpteylKtCJEcMgRyTl7YgPBOo3s3ra6p//i
         RYTLOSoerkYUVcgHd0+QYf/GNCXBpRA/HkWfLvAf6So/AGw/4adGkhUTPQZUeBQ+4CsN
         Jxbg==
X-Gm-Message-State: AOJu0Yz8PPFguK4Mw9e/d+r4kurkZjDj/EIVjiPqNZywPZYq0uVxq5fQ
	z7gmnNQt7oaJ32S2ePItO+CcmSBbutWKvLItijh3DHDBXH8sd9GdXF71qyhDu6V92kmmF3QD0Mj
	ocC9T0/1FE3+BrNJz3BXzAB1HNoN9qA7Zqbg8zrEmMGed+fS8/url1Vr2Lv3Hok9f
X-Gm-Gg: ASbGncvvvCh242zEtHr9nrk48PIsSBh2ieW4WRTHk83VL6KRjAKzMHryaxRmsmFHA0X
	WMCUsQ8qPXyD7XJDadBQLiGBy39QeYaJsdbzhXerdKo4EZP1VSmuyYeAFRLmwaQn8HnhcRcC6mc
	v28EbtjLkm7IZPKkC2zDGi35XwFlM9/0ouvZQCC85GIOZgbupumm+xsoRXJf7lnEO2lGNHL0447
	XzRk5RJRMR5GIdUORKQA5GoITLfok+hnaM1JYPgT4L+yUZdp8X1RVwgwHKrpX+ySH15Vp5tfcnj
	N06/kWYdV5KKSK/x0LmGaiZcny8jcz4sLkU+cHTbLhII1rFljezHGXckRHROVl4f8OQE6uC2KLe
	7oms=
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061821cf.5.1752150317023;
        Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2upV2JP4A2q8XY4xH5jOb8YXZErvSG6S/PQkLmFjLIJfoL6nTfAPNahLLoITNqEwR13IJQ==
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061571cf.5.1752150316273;
        Thu, 10 Jul 2025 05:25:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d1062950sm455639a12.65.2025.07.10.05.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:15 -0700 (PDT)
Message-ID: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:25:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
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
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX6AUBlBUly/oz
 rfkMDrVslG9IoBsiQSuqip2+HfcJrXhLFGmMKr9fS02hXxIYH439yqtIvW8j1oGxohXoNZTE1Db
 5hNZeLST/zQ583CIpAqIcq8aEYcv+JCGFpWBv+w9WluENtVIVj4EgK9D2qvuhuPITKn/iWJNetn
 j/9wgmWGrWPwRlI1Q6V1xsDCfey2RAov5tO+8iLSdQS5tKR+p7djzPNLEZU84MMbvTygkotWENJ
 HrcZu+EcX91+ZwKiksF8sqTMTfpdhe+Anrn5OSxGKkCG59N7lK4pG46ygEeFBRbGdFqYCXLLBXK
 4vFvPsZa7ZZ5lW3Ti/gKBiAQGSfAWmJwb8mbDCppjQgz0LqMYMM1kW0Mr0I339DoWGCy9N1v+6g
 MzoV/7AFHokamQDbAv1dpQrurjujXOww3czXEJ3qXf2SEISeOSGb6rj63JkcJ5IBYdPVj90k
X-Proofpoint-ORIG-GUID: BKYzvxdR2yJKZCcSxflSOv5PCsGjYQVN
X-Proofpoint-GUID: BKYzvxdR2yJKZCcSxflSOv5PCsGjYQVN
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb12e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=SCCoO-_AHFKZ3jW1OIgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=764 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
>  	int ret;
> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}

It's good in principle, but we're now going to house two copies of
the function data in memory... Can we trust __initconst nowadays?

Konrad

