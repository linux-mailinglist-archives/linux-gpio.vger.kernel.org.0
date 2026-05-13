Return-Path: <linux-gpio+bounces-36758-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PKlGb2EBGrVKwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36758-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:03:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEC534A22
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74B79305AFC6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6A82BEC4E;
	Wed, 13 May 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkuFHDI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhODYWjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF0E3F4137
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680440; cv=none; b=SknGJQrCHQNZu4iW7F+vbcZlby7mKI+gvQiTeyJhvCQ+bQYQTsc5FE3T1uSsuuV8BSEIe2GzQi/aSya83eSq7Pa6+QEXuLOHAC/Jfcv6nvrqnFImQ+Gq76o7/br2VRrxVShF2tnF0y64SS1t3sleU5v2qEsNeAZfgxAdwMDrpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680440; c=relaxed/simple;
	bh=XYGdoRidFMjiq6rKlhGtSdZX2v51fzcculvRGm/mbuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGKIpKQawCDrLIv5xw+9JcUeX3iKesJ4E9jn/BIZ0oZwkDO8wnHBiwOse6u7KMjQh/T4ppzJAdra3L8GndWThvBlD08h3IfcvkYScn9eJTm3XHgZW6Lv+9wduRrdgeuqxrRfyth2d5DXYWjHg0JC9GYDUGehxkoinCCHP1V4zpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkuFHDI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhODYWjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DA9mFN2339070
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hs5P7u/MpNOgYLnxyt/wcmDt/oUTdWmSA9NpPH7AlyM=; b=BkuFHDI8rti1TUOF
	4jCUWxIjBJ/0+OFK2IvsIOle9mWGiFxti8K2HtfSwSstrjOZCukILa9UlKAS/IqY
	Srt8hSyiIBsNjPjm3dHYQJXdotAA1LLbsasFTHdEivYGgwNld5xHcaaIm5r6CDe9
	PKug9MGIkRgKdieoJNf58IaHZ/bAWeAJvVesvnvP1dMcYiKqolyY6bMKo3H3vGgp
	7lGqUEpc4qLW3lazgw2WXxDcBFv9KnZsHTRV6vr0fldDB5BC+lPf+abIjezcbw8z
	qhgNrzQEZQJGNwcd+KqxmvghuiIU7kbm2r6M72mNhJ0l0tryQ00F9tv5bS6Yrsf4
	/DYCsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbqqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 13:53:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba86e35aa1so105670555ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680436; x=1779285236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hs5P7u/MpNOgYLnxyt/wcmDt/oUTdWmSA9NpPH7AlyM=;
        b=GhODYWjBz4Lq1KxLQiO28O8N8m3c3Js6SaYoyXgeaaFBkQCb+1oNkFD1o0LsvZ0s9r
         zu/sMVJw2go4XpoiYegtiWrOk7p3BX2eXp/ZV9TfWVyKiuB0ekvjqyBlKV1pgLFd6IO1
         FsZJSZkyaKa8EgvtaVHiUmyYvPwI2BBuHVWEX+tWlEsardjDP6jbcmOORvPbx3wNkVW1
         77ttrZ/JtBSr+fLMJvM9C65kRvs0+9PGmUQVrBH0zO9d5wuOIIYTv5njg3DG9IbCtIDf
         TkVrbhW3IaQ9+OYloE18YpbD1uCcKlLbxcshG5b+9dPEV/UXmXXTrhuirz1m3ismooVW
         NFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680436; x=1779285236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hs5P7u/MpNOgYLnxyt/wcmDt/oUTdWmSA9NpPH7AlyM=;
        b=I8hV0uSwahGyObeRG2gaFBt6+/kFxVYm/Eg22lFR7tLZDbMSA72Xz6UrgOJZCT4DxA
         /u+VzWtP5fJjOhbAnoq63resJ97Ci18JvW7xl5o5Z1bWMj7b9AaSmieUSkYX9lNvcFHU
         BZnw3aw5PDFE475JBkEA4Pyzm5yQx7IAOVQYiYniy3Rz9Nr7xl0qYsZAFi+DVTrwErCF
         FZUL5A9/PonkVc394YuCFkK579yrayZWzRUP8i7N2qrV6W3OLlGHGabFH/ijD8Xepg72
         ysWP6/54bflde2r6bmXygJ9xPtwcz+D+Bls9uoqfNbneAI3GQRhkUcZzt03Qjx3ZUSic
         7fXw==
X-Forwarded-Encrypted: i=1; AFNElJ8kGSpfdmL7XKXJsc1UhFu4utitUGUtnbU15X7hwPkIx/uX6ENddDXnkRLGpTWFr8nErY9OcfgeGq8Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VompJoqu8POmW+Rbr6It/afGOfOUHhh5EDXNxFk6666dXYwF
	Kn6VuyK7aBhp01O0mirnvERtXXj/y3CaQnEWKceRUnIMf0St8HFzBqVGUqeYlCmMndqXYUWNo05
	YjWxV8+ICR0yvf68uCkxWVXiFCbnRsob5919SdJNVZeFtjo0sVT16I5rvxapWzwQ2S8uHaF4p
X-Gm-Gg: Acq92OFYLzyorcsjJhanUI/cMebJa4fmnsBj2X9nFVDszFurormJTvNV8+X0cIhsVy+
	M+M8TwkcTdrfPtmQhE9UdA/4OlfkihJLCTkAn7ftr7EOi9BT81Yam9Bxnl5lkU4YeQiY4w1p+DV
	B+GD6r1NeFQkcnU5DPFyAdGu57+4z0swEnrRGzWLiqLB6ULt0M1PVwoU8OWXUnlzhuLRHzRkJ5V
	sb4R5tpDATas/QO90vvAY5TL4BPlaL6Pk6KrDajKdrCgNneq23J6coT6Q4/o6BiyzSzMZQgz2Ox
	LcnSgByUNYBouNgR6b6wdwMRw8UXAzuKGoP4QUvaXsZV0ji1YDjy+z9W6EQgG9EnqLOi3TuAxl+
	sMaFen1WTpIY65m/9FL/iBcQ1ACdiLXVMzvUY1dtXiQdENuD/Mw==
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr41796385ad.32.1778680436472;
        Wed, 13 May 2026 06:53:56 -0700 (PDT)
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr41795905ad.32.1778680435955;
        Wed, 13 May 2026 06:53:55 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405efsm179171335ad.23.2026.05.13.06.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:53:55 -0700 (PDT)
Message-ID: <e7c075bf-fb7b-4769-8ce1-aa613ef26acf@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:23:52 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
 <ucmpc5hkbjruix2ftxys2zfk5blntfsap3fbspqta6ihyigrgg@3nyghgnonxvh>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <ucmpc5hkbjruix2ftxys2zfk5blntfsap3fbspqta6ihyigrgg@3nyghgnonxvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7Biw0jcXLQPJ0-4D0ZjU_NDuPX_vUhkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX11sH+NLRM7J1
 A37Rs8Jwjk12TC4die3iCEwZp1c1qzGhvHgAHxcbhVnJMnWt1EKikKSujPsBrOLvd7tIuMT6NEv
 TYGYvNygp5tYZuDH8ZqLwv6+6A5aTExIo3WN7Pw2dnGzPNEPMUUb+QNeKdN6cyDUG6AzoXQV/ba
 F/KnAgCQzUkCpyrFJ5KK8k/gjQxRBwkOreesbzStV35GsDfPjoGVT9xQQOEX3rktOKdFheHnYS7
 CRTHt6KJla1anO5I/het01ib3JxupjCvwUOKne4UhONq1ln6wPKFw81zRad4Jv0kt8w3Cstzsyt
 TahQ/Oe/6i75NZ8ZNku25+dBVYF4feNEVO4po9nhIa5Af7+2OFT2KC1MeLr/aIWdDM280K8kky6
 uE2vTnc4e+CrUL7jfGcjAgIU6yis+N7LiiGeCpPFMahlmX8DOg5irQQai2KIS3HuyE5dSGHAUEr
 82rK6r0fS4Tr1S9ExdQ==
X-Proofpoint-GUID: 7Biw0jcXLQPJ0-4D0ZjU_NDuPX_vUhkX
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048275 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3XSISe0faenqoDDrUQoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 06EEC534A22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36758-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 6:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 05:55:26PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Guard GPIO register read/write helpers and slew-rate register programming
>> with synchronous runtime PM calls so the device is active during MMIO
>> operations whenever autosuspend is enabled.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 118 ++++++++++++------
>>   .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
>>   2 files changed, 88 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 15ced5027579..d95e28926d38 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -15,6 +15,9 @@
>>   #include <linux/pinctrl/pinconf-generic.h>
>>   #include <linux/pinctrl/pinconf.h>
>>   #include <linux/pinctrl/pinmux.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "../pinctrl-utils.h"
>>   
>> @@ -22,7 +25,6 @@
>>   
>>   #define MAX_NR_GPIO		32
>>   #define GPIO_FUNC		0
>> -#define MAX_LPI_NUM_CLKS	2
>>   
>>   struct lpi_pinctrl {
>>   	struct device *dev;
>> @@ -31,7 +33,6 @@ struct lpi_pinctrl {
>>   	struct pinctrl_desc desc;
>>   	char __iomem *tlmm_base;
>>   	char __iomem *slew_base;
>> -	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
>>   	/* Protects from concurrent register updates */
>>   	struct mutex lock;
>>   	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
>> @@ -39,29 +40,47 @@ struct lpi_pinctrl {
>>   };
>>   
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>> -			 unsigned int addr)
>> +			 unsigned int addr, u32 *val)
>>   {
>>   	u32 pin_offset;
>> +	int ret;
>>   
>>   	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
>>   		pin_offset = state->data->groups[pin].pin_offset;
>>   	else
>>   		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>>   
>> -	return ioread32(state->tlmm_base + pin_offset + addr);
>> +	ret = pm_runtime_resume_and_get(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*val = ioread32(state->tlmm_base + pin_offset + addr);
>> +	ret = pm_runtime_put_autosuspend(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
> 
> Just `return pm_runtime_put_autosuspend(state->dev)`, no need for extra
> ifs.
> 

ACK, Addressed in V5.

Thanks
Ajay Kumar

>>   }
>>   
> 


