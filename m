Return-Path: <linux-gpio+bounces-28413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C204FC53C70
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 18:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC4B4A15C3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 17:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E252346FD0;
	Wed, 12 Nov 2025 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXw3yd9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiU9JIau"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6B345CB7
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968722; cv=none; b=FAfwgVayXFcEulDaI6nM+bEinKcC0qqeixZ91C8ePXiONTf8vQ1T0ey88jplAABzeMWDFhsik7X0fyVk5UyAg1UZvwTmByddqgGpC3GUq12ozAsCsggLwvHvNBfN4LKvZgl9Hff1DME1+jKC4i6SqTnJ3SuVM40gA/+vemq0NB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968722; c=relaxed/simple;
	bh=hzVZxAQsYGT+Jc1xNwFigB8FYEOlInLVTTrbWelcrKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcKVFksfHbFIC0l8CcXe+BMcICYVCbG65fVHZ8Wskoo2bKOjnTeXTtLzuorGsXLHQ058TSv+etcnNoPVVC36EeEmZaQob1iFRc+7gqPhsqRts7bxDOKruTtfqpAHP7T1vOahMO26ovKVwLpBMhjTegPIOncoLjsZwNabjfxGWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXw3yd9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiU9JIau; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACF2S0o1614737
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 17:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRq7N9zEd4E6O7kii0K2QODDGUwp+okVrUJjhuRm9ts=; b=UXw3yd9c0V+CqXAv
	Qe9i4LF/MLsW60UiDZBzcgtoCOTc/ZVEKiO9MgbzgjvbHprTk20LPZeI2oolYwTv
	bfhfJMi8Jjls2/z7pimUXEEms6aw0FJc9JuJWkHWoWRvwL7T1wpLYUAzz6bltjoM
	2vgUG9yu4mlzmWV+IHCWXTBjiSZ/dM6YDBC6V7SsGTsRVxHrbi/FD44S5h6jphaN
	+/3M/uHTuwoJhmjeklSBFsTul42ZVMOKRfiBgvjovp3obD8rK3ahGXB47+M2I9Rv
	0k3+RpQkIWz6WJ+oiM8NSYvHffqyGvvUrTZpbN/qJIDPWt+IepLuE89hr3rN219m
	qX5C8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acvhfrggv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 17:31:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dfb407f2faso122266137.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 09:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762968718; x=1763573518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRq7N9zEd4E6O7kii0K2QODDGUwp+okVrUJjhuRm9ts=;
        b=eiU9JIauWEbifiV3OdtEVXYqhd1fOyoba4y/nwcxqnqNaRV0AGDEpARgR1WoojNtao
         2FREh14ULEO77JXp3RtZSou16xA5ytc6qd9jUMcYR/AYECMDqOhXjUmt8LJ6rhc/KkYx
         GWcS6uOAu1CQhjtoGXJtQzifKTqYy3ChrvxCenfeRxzRxeCULTfRmROP/Raa2iYrNczF
         zYLM184Mezg1ykSBVZyJ+IDAOOIpzK06y5vwjNJz+63t/rAfhRSyuGd1zOtv4jqpv6AM
         wkMaOptLti88Z4G6XfI5A9uo/bCW/Xsx1Hosc9Goh55rJ5zZZTp2V6d5gVZaCGsEe2ip
         jXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968718; x=1763573518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRq7N9zEd4E6O7kii0K2QODDGUwp+okVrUJjhuRm9ts=;
        b=lL63hqfYpJG98DLQen8LWZy4JDfpmW21Z09pOG7BPCtoEA789njKRvtZrBsxetEPRZ
         cKEa3mHQ7dbKS4Aq6KavlFBo5HwpVfsgIAG3yvGD90LNcblyOJldsgQVRcmOHuIRkIfw
         KBSCUPTACichTtyq+xuoFlAz4gIPyJZb/bc6EbIXUQ4t9GA+NPmNEll1XanWJYPUS/PK
         fyesZNisuURT4MukB4TF6migd3xBZHAa1vyea6BlVlY/LBD/FR+U3b+VPqkk7YTTrscZ
         NV36Y/uWC/xnEIYgAtiIe/jKjGauISVh8zqgpo3uKvErXlNGUQUBfxQ/8m8P+Jk0RcXo
         Jq9g==
X-Forwarded-Encrypted: i=1; AJvYcCUFZOTypuosLXqmN/aXyYb0YkwT5NRgu4U/6MYUp5tEcJ0rlY2mzj2dYhq+XkQ3FicSnH5zRZF6HZd9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7o6U+XPGVrm0E7I8ZavWTmcSDAxRBgMLBcW4SSLO3fTzVRo6d
	t6fPxdFVRugcP+ZpyLwpuPEkhj6TgbW2F3yRfznAi9Xpd7YzbpluICysv4zHe1SYCW+hT5nY9+S
	mH0DZErCy3yMY00i864hNKSa/doIFt3xbxMHjXXWDXWCfy9Zm7XCrsoeNDdDkdxEU7z6VeHMp
X-Gm-Gg: ASbGncsPLCx4e4cSLEjw6Gi0GuwRYBvgKdMMKZK5e6DIDBAys3+LbefCdYk9J6mp3iT
	OZpMZhd0auqvxt8h8L70tUgZvg2fzPtwGME8jx5WYlScY/21QXgEXI1W3mus+/ukBhsCAebMWgv
	vYKRyC39vco4+kRwyErzsRmJjEZQL0DzrhZnS0f9wG4rtpGXqvjmCUWUJN2oBoaojFiOP+Ax90K
	toj+eVIPYKZqGCHnNdWx9Ir5rn5lfMDToVgd16ZEBEEk2c/A6UFgQ2fHL/88RNb1+4mga/XHuGH
	Nh7X35cMP9SsKB/v32q/fEWPVwtAd6tYjKiTiRe13QldytCGak1fxECqpDNlD/TnKjnhhDK2Vqj
	OQz1upYM9i09mrFo5dVnmPd6tgg==
X-Received: by 2002:a05:6102:4414:b0:5dd:888a:5d54 with SMTP id ada2fe7eead31-5de07e67c33mr1391610137.33.1762968717586;
        Wed, 12 Nov 2025 09:31:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiJyUMMrNVOX6ffx/lvBQ51RUGJEu6SBGxM1Dx1h6AXQTQL9O09CpizEhbeAdj5d3AN71GVw==
X-Received: by 2002:a05:6102:4414:b0:5dd:888a:5d54 with SMTP id ada2fe7eead31-5de07e67c33mr1391569137.33.1762968717168;
        Wed, 12 Nov 2025 09:31:57 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47787e3a62esm47050655e9.3.2025.11.12.09.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:31:56 -0800 (PST)
Message-ID: <f474c182-3a9d-4540-86b3-1f84ae3d14de@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 17:31:55 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-5-9eeb08cab9dc@linaro.org>
 <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>
 <DE6W0RIF2Y26.1MENYDV2RIAIP@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DE6W0RIF2Y26.1MENYDV2RIAIP@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D49K6/Rj c=1 sm=1 tr=0 ts=6914c48e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=Kxc87NqaCDsCGrhekR4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XJmRrBF06NZSO8nO2B2jPgYDuVl_6Awj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MSBTYWx0ZWRfX/1wv8wL3vyNc
 9Xr6Nhp7rt3fffmp8Lt9DJB6/gcSjGyLJ/7FPnS8y2yLubDvHEwpAU5fGiZyhJKPTIa//fdazPd
 IR/g38NoHqI50UCDG5r4t5McbqZmuQl8DZqRDqajLybevKCoVoJJ2PzxfvSUvo9+EnbeXH9ajuH
 w9pQd+5CPYn9+UH81uFErrWQWrjjclk5jisdG7jJgsjtGwRAPxgf/CuSLQkO+vtg1I7SFtnNN4r
 s19Sh/4lRnysQuElGaWHjOuGBDbjm1G0PK4DcYVeYR4jpzGJIHLLU98P5bKBMybOgmRScrol2CI
 ZJYEphWczseNKpuSz0pcaRhWpFTcAaM+QdnH4N0fhDxMkoZHRRc+6opg0+YLbbns44w21yGZX1u
 feFjY6M/aVDgZN+ssoTUeAc9n0mXlQ==
X-Proofpoint-GUID: XJmRrBF06NZSO8nO2B2jPgYDuVl_6Awj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120141

On 11/12/25 5:21 PM, Alexey Klimov wrote:
> On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>>
>>
>> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>>> This is required in order to introduce wsa881x driver that works
>>> in analog mode and is configurable via i2c only.
>>> Functional changes, if any, are kept to be minimal and common
>>> parts or parts that can be shared are moved into wsa881x-common
>>> helper driver.
>>> The regmap config structure now contains 0x3000 offset as required
>>> by soundwire spec.
>>>
>>> While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
>>> register name and rename wsa881x_set_sdw_stream() to
>>> wsa881x_set_stream() and update registers description in the
>>> header and use the new defines in wsa881x_init_common() and
>>> in wsa881x_digital_mute().
>>>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  sound/soc/codecs/Kconfig          |   4 +
>>>  sound/soc/codecs/Makefile         |   2 +
>>>  sound/soc/codecs/wsa881x-common.c | 193 +++++++++++++++
>>>  sound/soc/codecs/wsa881x-common.h | 458 +++++++++++++++++++++++++++++++++++
>>>  sound/soc/codecs/wsa881x.c        | 493 +-------------------------------------
>>
>> How about we have something like wsa881x.c wsa881x-sdw.c wsa881x-i2c.c ?
> 
> I am totaly open to suggestions. Splitting to wsa881x-{sdw,i2c}.c sounds
> good to me.
thanks, and it makes it more aligned with what other codecs do too.

--srini> I kept the original name to keep the changes minimal.
> 
> 
> 
> [...] (the rest of the patch was quoted and sent but I didn't find any
> comments there, please let me know if I missed something there)
> 
> Best regards,
> Alexey
> 


