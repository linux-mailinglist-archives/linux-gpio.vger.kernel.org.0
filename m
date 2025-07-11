Return-Path: <linux-gpio+bounces-23158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41285B01BD8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E793D3AE8F2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0437299949;
	Fri, 11 Jul 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/6xW1ba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38689299AA4
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236378; cv=none; b=QFK6xyiy221BFkFk8MvkwTXEArzzcoEtXtqXNUooz41osh/gbZKI8gIZyukhz7NnmIcQz7lZApkQ1m73kXcjt0A4F3IvIBFcAuGOORfTwlt4SZ3xON05RS3yyCTcM1riHjGPTja5vEl0nAzjP261nzdfWer/zv5KcVFkqlHsJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236378; c=relaxed/simple;
	bh=LLrYXoDSk+Z1qUZOicihZi7zP80fK++DmxBSWtA8aw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRqd5chL2EzlSo7qaGW6GYJYah0Te8DxDqG73H8BVqRqtjqLzLRoE2qiCMekUfLgJezXIYvCVpRb5eDV+aK5A0yWBRNZOsF2tsHNgYs2licsSP6hRreeF+SnSJ4LAqazTsErVg//ipi8VagmEvW8pUa5dYX36g8QruBzBwvh+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/6xW1ba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB8lTh017109
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 12:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=; b=V/6xW1bar7YxpMdz
	jGzXZNSYsgNxdHU8lGqAXSpNawExd/RGkVrqkOD6mtiqWKNQpTilbpx0dNg7SO6l
	b9nQMyOYUC7gVGE0mLzat8eFRnjfLmtjeM+gtdMh394CzMC8P4d9qe0YTEcJ02B6
	v/uY1Vi6z8Qrt8M4SOwcX0n6pgsc4RJQpZmnJauGSFkhqknpoCnUnemdR9Yu5Lmb
	wL2F/UYVdNDaW1+F4MMpprOjkHCy8xxMNtrwPpEYmgT9NYv0drQ0ddQBQ+YzvaS8
	69imad4Z4wJ9MDC86nnIf3ghbFoHog7HnxWd4mZYdREUAvXClnF5q9q6oXEv7rkF
	oSWndg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap8h4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 12:19:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ea727700so33058485a.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 05:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236374; x=1752841174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=;
        b=pTI2Oecviry2jvZ7qMBZQ9mmkd61gpjyx0EO6sh2z3KrLvFeWfsdGDSOO/tuKkraJO
         vL3RlkHDvymBuj8ABrySm7aHcN96xhKD0IwtMiWCGgttIrRRhnlrze2/oD+miaPGMY0M
         KAMLmfrKAhyiDcTW+0kutsFbpolWHBi1dYPbvTfishO3jB9EYkmKfZ7/NzB4C6h7TAae
         433DYNT5Jh7yf49qiBiGJGcs0g01l3jfXhJRK9/zACEF7VCGmz3eSONMgxaQ5njrqZoZ
         PWEx1U+JdY8+4wEhFOeSPNeKW6p0OqBzz8x6F8cDrExGSq9CEFnfq37iToaXzBX8NvOB
         xkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOUITGXfDbmqauX4dJ5jj7xIpcV/3Mxdun5i28Hx0gEm8tmp5wnXUBcTETzJTWLCT+m5qmrhEKFTAr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0djzoI6ZxrKAVRf8d0Knb1YPfe5iagOG5M52InF2+aoABmPzZ
	TsMv3gPVX9364j3/zqrcWt5XQStVq1g/Pk6iWkyK0GYWQl2pODMC2bL4bRdHsoc821g9NuRJdPp
	FqZJPtgNEa9UXqIUF+b5pkyIS5qv+QWdM8IENgIjEUdZZT10kHrn2u+hlq3qPLyV+
X-Gm-Gg: ASbGnctWaf2yTFpvz0E511LkNnHQQt5V2MyFvkio7IPaTdG7oldC4gaEO8f2dNKrezn
	Mc9uc51+TWxez4A9d9rWaSUAqJ0h027QOQrHwO1dXXXdJU18FX1AGsK2Z9fqlGi+OrSH7vjPYHg
	3PeLJvf/lPq2NZpAr8oVq5KvrreKsTEaM5OtYA9YFS7nG7+cdN48VOGqHvB3ZyTD9GOV9zD9iic
	lfHg8Ed7ZzpOvL3310VYu2tPlEl08IOkULVZIbQ74vg5tvK6yoHtq1LrigtYyVFErJLIvRBRe4b
	+ixXaBXw7XHLN7B578gzbTPQRyb++mqBZs+1mvY6mzQjEOSMxhXxLXifEINf8JWm5/FEX8lYEMT
	Wl8u7vJ1OEGlv+B7nhOTA
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193305085a.0.1752236374077;
        Fri, 11 Jul 2025 05:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWdOt+nw01pFgLOuyNAAOJCd4H7cvcLSPFzBJPJCQX8U74WAVdoJLitJFP6NOrfYfrnxfZkw==
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193291385a.0.1752236368710;
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910e8sm292167866b.36.2025.07.11.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Message-ID: <b9f6f827-78bf-4fee-8be2-74a9c94d9722@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
 <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
 <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=68710156 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RgMTYWP1_r0sjz9xMRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2PYXHCH0vIJLUaQ4y6zylnPouECUna6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfXzsDt6a+DEi5b
 qWsR6ldFQLksu6tdbzbXgGkfdyLtA60IOmdD/S4kUp5Zt1JkgKr805FGqd30V+hZonMjQGDKTAX
 7MOWVnkRqT4bfjKpurPvDg8MPvY1g0ee9QT7vufd6vvdWZH9pkN191hj5jljuqY+RE593GhVYeB
 m+16MTteDckhXjuz3m2MCCsAY+RI/0YVZ4HrFc8QTmIUN3QxyTHsHFMk1RX02M/i78yItL7juRg
 Pez6uKQD+zw2OsYNZXfV6TN6cxEfaUhh5aCMPyrOgWvkdlTJrmOrqVR7NzGtU0MGswzFI7XqC9c
 iXrlvV7N+XxPsOtWoVD8A5f96UmA9Vqj6fL3fPNUR0l9ihM/EinQj/mBsg8EnstmefPeiY+hyJb
 mgGNl2IOhdgnFQUMSW9ED52SHaBYrPqMhHJq/H2hEBZAc/SEvsdXDLxaakwlAmFHFRvfFw8a
X-Proofpoint-GUID: 2PYXHCH0vIJLUaQ4y6zylnPouECUna6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=885 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087

On 7/10/25 3:38 PM, Bartosz Golaszewski wrote:
> On Thu, Jul 10, 2025 at 2:25 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Use the existing infrastructure for storing and looking up pin functions
>>> in pinctrl core. Remove hand-crafted callbacks.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>>  int msm_pinctrl_probe(struct platform_device *pdev,
>>>                     const struct msm_pinctrl_soc_data *soc_data)
>>>  {
>>> +     const struct pinfunction *func;
>>>       struct msm_pinctrl *pctrl;
>>>       struct resource *res;
>>>       int ret;
>>> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>>>               return PTR_ERR(pctrl->pctrl);
>>>       }
>>>
>>> +     for (i = 0; i < soc_data->nfunctions; i++) {
>>> +             func = &soc_data->functions[i];
>>> +
>>> +             ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
>>> +             if (ret < 0)
>>> +                     return ret;
>>> +     }
>>
>> It's good in principle, but we're now going to house two copies of
>> the function data in memory... Can we trust __initconst nowadays?
>>
> 
> Well, if I annotate the functions struct with __initconst, then it
> does indeed end up in the .init.rodata section if that's your
> question. Then the kernel seems to be freeing this in
> ./kernel/module/main.c so I sure hope we can trust it.
> 
> Do I understand correctly that you're implicitly asking to also
> annotate all affected _functions structures across all tlmm drivers?
> 
> Alternatively: we can provide another interface:
> pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
> - would simply store addresses of existing pinfunction structures in
> the underlying radix tree.

This option seems like less of a churn

Konrad

