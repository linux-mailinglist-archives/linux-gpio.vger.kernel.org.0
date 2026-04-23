Return-Path: <linux-gpio+bounces-35415-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNJGH0kQ6mn4sgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35415-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:27:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53267451F58
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E93F30B6E33
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA0E34FF5D;
	Thu, 23 Apr 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNnNx/3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMe3tqiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A333E0C7C
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946933; cv=none; b=hYP40vzahUqfLDfWTuns6wMCGpeMKC9iSQ6PaOH+dKJYjKpZGF+gcKGKK3NvutUfBS83hMYNQywynZ3H1fX5+fcJUy1w9Gwt8z7Ym6+aJbnuENIkRBzH6MCo9gsm452EH6TEweNR8n2rdwn98evmkoKRjRaQCfzoukDiT1eBE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946933; c=relaxed/simple;
	bh=ZgTcnYpnzP7h2JU29dAjUXiGcQiLCCUu+9mbbrZQFpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+NrPpRVtg2MD19MjiAWrOLmVlSe7YoGS6AM8LHkvCOESUlSkpovwtSwXzBmGw/n4j1RMQGttM5md17aIR5Y/YTjjrbs913iri1W9FKmmlvFBP0X9Y6DzPOv+zwXArnXrU0bTa59zn8oUT4Ezm2G9h6BeQ0EFsFtWDWUU/hgX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNnNx/3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMe3tqiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uJHs3413398
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXLFLfSZkrB2VJdLDcxim+DzdJhZCUhTitigdRqnuKc=; b=hNnNx/3Zbjxpzsre
	z5pNe1vZP0ltel6XhaVUCQgTlGzCX7AghdNzeT4Vtom5o6O/wYnFLPkyzQC09Pi3
	9ZuJ+BHhQi7WJr006rhNYI2MfekFLFwCJLdA1/F+VljBqsHGDVwquqs5Z3y+B/V3
	jonMT1ZU54S1vg0B7HIMkyFIui1WIVwx5rp40DMpecEOs4TCwhGPzPDe3pmY/rBa
	SH2O5mMOKzFEb+hQyLaZ2j5qjWXfdV0W4SP0q3aIlF0/kojnwYS+o+naiIs7tK6O
	AhahNSnDNAO0LvOZhO7KheQGFGx+f6XH4HgV9EsA5/fJGfHzGg2QRiC1eLIpkuOB
	BIFuSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6bwkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:22:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6ee26adbso453431e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946928; x=1777551728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXLFLfSZkrB2VJdLDcxim+DzdJhZCUhTitigdRqnuKc=;
        b=VMe3tqiz6o9MS0jL19hCX1P7KyiDtXkqb9Zaa2o/DosoSejch1stMB3enUJWEAeAEi
         NolpUlo+f+jtYCuTOXcqdmsjA9XMDGAF1FfO88MVmX/pQm50xMGn351Jho5Ego9kyH4z
         S0e3CaQDa5kCQu5U/rCvJVvSG5TgwtulqDb4Z0fhcg/oqGj3Nzfoded9eArAL1J+w4Sb
         FysR9is6QHS0dwZTWa073ErQ7ej+mncFsWmeBHLwEqUSKGxfJoKf2QlkXbZDIfV+Z7/m
         IJIp3H+BJJkh91zAfsZcfOF/fEzlT4apieOJB+UVR/xE9ouR1EYfIFEVRnMqcfkRKi1p
         NBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946928; x=1777551728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXLFLfSZkrB2VJdLDcxim+DzdJhZCUhTitigdRqnuKc=;
        b=Aak4MMZq4zwiT91dj/50JVQuQ1HAyo/M3WTBg+6e+Qd94CXRCYLXBP/SWWSwnXZZ6g
         7y9cJR5A1yp+aFy4RC5GJvZN7+vgZbg+1fwoed3BoYoHbKvD9Gqw7oius3IsdIzv5RHK
         SVQe9Yd3w+So0IvuOxxU5OiGhrf11wxcch27FCL+0V53Ejs1IL7i4/1RPKzG6pTZp16x
         kqrwTL2Flx4pzSqKRCvQSpPfSfzTNugSka6k395mB9w6CmCwWGhfkqKqBMjQon+89QB5
         mECsVfKOM5i4mVBv7EZq+NGhz+lJuce++VfFsakkdG+ATArC7NC9HbDH4cVlgrmrK77N
         vuxA==
X-Forwarded-Encrypted: i=1; AFNElJ8O91H0ldVcfj8ogF5JtpCxSpu4beam+tgtLa2ms5Sz9SmQLVkB/gZFHfKSheIPf3y0gPtRTcwxsZmo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVctrHlul4Pg85CfXA2PDlhJOdiminKT49nvMmssLIwpOiYyQ
	iB26PtPLuzG47nKzjM4e53UHePsSzc6Ha873znrND9r6ipwcPZ4ZvjJ4ES3lKjr7w23bdERt53e
	rSPOtp+FRWqS+f0okrYNFUcvFIQJqW5/UFJiRH9kSShs4nwWN8azPMIQIzd3ZSJPw
X-Gm-Gg: AeBDietPeVr8cmH63/uarMLD4sQ3dVoy1rLnCXljT93XaVc5zcv8IyYqaIC4TrfLuD8
	Z4b39yomY2f6QbdI6nCptXwDooTPziXAyWHrAurfixH42isYEQOaKIZBqzoNhwdeC80YFO7IfvX
	rB7LgPI1PLs32mK5DYBeA5j5Q6Ay5/jARaadWjwuJ8w6z9L12CuO2hE11LR/zp1Hbws7+nY4fGd
	QDvLvhHRb9FRcX73CHjsls1v+yuOjB7Zz896WrjpV9PFSa8RQeFJ/yOJ5KkRRuT5B5SkXxvrtdh
	9eBUrJ4pYAwiRPBjoaVi8v1OvO0hZks7DRWT6nNWrAyVs7VqFt7SdwDg7M50Ug1jValVFsZfbKK
	XTjc5/otOXo89aUsa9+6nmqr6ux0/w7HvEFE6gDV5ZJ0SBATFLX0969icRxjceIUeCCJtAo+zqB
	PlpAcP36vu23wU7Q==
X-Received: by 2002:a05:6102:31bb:b0:605:5c61:4376 with SMTP id ada2fe7eead31-616f8064009mr3859208137.4.1776946928518;
        Thu, 23 Apr 2026 05:22:08 -0700 (PDT)
X-Received: by 2002:a05:6102:31bb:b0:605:5c61:4376 with SMTP id ada2fe7eead31-616f8064009mr3859198137.4.1776946928039;
        Thu, 23 Apr 2026 05:22:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm641177366b.38.2026.04.23.05.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:22:07 -0700 (PDT)
Message-ID: <4ac5879a-8803-495a-bb8e-76f75fdb1011@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:22:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea0ef1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n-5QDBJNWlt_wJityfQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMyBTYWx0ZWRfX9RPbVmiknfzT
 0ku3cACd/hULWUZy5P8VhUq7soukPyXSZW9xZeJISBrr5AY1S41OoDeIXFY3aNtrJaG4sAd1DCl
 ukICjIDk/i7/aj/OA4a3LCZYH2fLsDrnDfeNtgEbSsoBwyE+xrUBLpUfF1ZfFRF7Zp21JaVn6NO
 GmPH1GWgAaXlhb7vYnu7MiAV9Ldo9FMVZnuTRw1i72qqtD1ZhyRWTIgTOIN/Bv+kcznWKoKlSQ/
 kS6R+s3ojN9cIoz+uTVkforfGJbSWdVPZj6O6FtEQbLFeVLQmXq4bkhaHiD8MkQ/w/yPuPN0Z0r
 Toeko5ua3gvV2Z/wW7TyoBbhc8Y7H/pWC3rHDp9Ncohl7rP/3lRhzVPWXeZzwbaYS9408vo5d1o
 D44VfWinN8x9sa4PS0pEXKLh5z4tPfJtMTHNQDGgwkPsz7nBim3oXfiIhxH6FXaJ2pUaj79fGWv
 4CUPdWWY0be5GFP4ouA==
X-Proofpoint-GUID: YoF2mr-jimKE7Sznxq1qV859431mp1IM
X-Proofpoint-ORIG-GUID: YoF2mr-jimKE7Sznxq1qV859431mp1IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35415-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53267451F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 1:51 PM, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
> pin and already reflected in the wake irq map.
> 
> Remove the unsupported wakeup interrupts from the map.
> 
> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> index 0767261f5149..81c08b18ac71 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> @@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
>  	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
>  	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
>  	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
> -	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
> -	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
> -	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
> -	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
> -	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
> -	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
> -	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
> -	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
> -	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
> -	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
> -	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
> -	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
> +	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
> +	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
> +	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
> +	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
> +	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
> +	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
> +	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
> +	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
> +	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
> +	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
> +	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
>  	{ 152, 108 }, { 153, 109 }

After unrolling this diff, we get:

1508d1507
< { 39, 125 },
1517d1515
< { 51, 123 },
1534d1531
< { 88, 124 },
1564d1560
< { 144, 122 },

so that looks good (provided, within the two possible mappings for these
pins, these are the meant-for-i3c ones which I wasn't able to confirm
but trust the author)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

