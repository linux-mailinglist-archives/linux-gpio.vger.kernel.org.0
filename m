Return-Path: <linux-gpio+bounces-36017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDRlEP9Q+GkiswIAu9opvQ
	(envelope-from <linux-gpio+bounces-36017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:55:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A54B9B29
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C7BF302F99E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E4030FC12;
	Mon,  4 May 2026 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cbixuad5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uihq98rp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B1311C32
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881055; cv=none; b=HI21QDRg28ild0KqA+o5PKL+DKnDKzkdCDTbdAFvF3nawMx11vMgsqYfIvt1TKSAfKLICE5R79wQt5k9IyGU6O48SO87QpoHNM6yzkQyGQfHsgDBDZ4zfFLTBqGQ3NFyFReV7k0P6HKE+oROSXlye8wDbtc+jbF/PHDpUuEKcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881055; c=relaxed/simple;
	bh=3H3etX6ScAXZ/9quxEfOPdhOvtsFMMWW6RKeM1++m9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGhk/V0jospifvrIAJsUulU9+B+lImeEkm9pLwuGrzz4v57ERxVWX+oMG3lCNCxxnxWt5p2owOgsqcbMN61ZCT+tjCINy9eOLz/BgazXZ+hEWQOneNnvfp5h3vBFszobfKN8gGxJQK3FxDBnLSv9gY+29HylEV161zSjTAvR5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbixuad5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uihq98rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DBl14174218
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=; b=Cbixuad5adyEsKdv
	XrMUbiA22ZIGHLppkOSQM+DXlUjWJsu4yY00xZDAXC77fHRgonUt6kk3lqYk76on
	4LljjPqWIZBxdoEoNcP+xLZmzD5q5ONJiLElC7akD0bqRrwT6lGjeeLo85dGtqjz
	vtjfB4BMFz6TejoMq71ejj0w6jfkcVfKqn8kNVImsqBRBxjd38akUIzzdc/QOvF7
	YaQUquGW023EvbSJ+Ek7N+IZfYZ149/GiP0JDDiy/+YRuFvUE+vLCAIy1ar8EfHh
	WoKELgnZvKFD8ZV3hMNnMdY9uzLYs5+0gDAHN3zMbIydfFHtD1bQ0fIpLgIj3rbw
	GAGuWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cpqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:50:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso38220545ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881050; x=1778485850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=;
        b=Uihq98rpcxwwCUq4YeRJK+Un4PdttrEsClq0DH9Iv0/yRK4CZ95Gd8CRLlxwVcc8vv
         0eMFDlv4jn/JGSq9ID3S5C27ZmKtQ9fBf/4HS01GwIhQhcShLUPamW5DJtrklxkWjzbi
         0yOrRgmneCr6Dfi41m0BtJMXrBYFdjhht+BksFakUC8kA/SEgSTKuJTTdzJYGJhNOn0Q
         4eDaQ6qZLkZJox64B2UZ3EyIxyTTh01f4I1/mz//7hZT1uLhf0CCDKotArvJ+tHlkSLd
         F448Q+fY2X77cyJoctwNkY6rDulYnLFVh5UXQEnxbZhULAolo1hNdks4Mb8pJGMXoc1B
         09xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881050; x=1778485850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWhWZkkdYztsk7q2EQZkWe4rPMrdeAsMOgYo43K2FPU=;
        b=pEbSHIlgKQ4B4uiNAMpTz+cxhTiQgQlCqIZuFrP3apEzJy5mRkBz5QAp3NldWt3jpk
         ZehO1pko56yC4qBjSY11NcBSXECibwhEUj2ePVGjfgU9CkQtjPjqsGcBeKVKujZVTVNk
         By+k3s1HqOqh+yN/uExffcX2QlptVUF7tABDsfjCNumET+Jz9uy9lUN3YQjJvbwrRk9j
         jpSYEbma+SguX6JF8AMHasf6oGtmKcFcOqbN6In+zzbs/5sHZ4jdIS4aawYtiI0mop8I
         ynzPXYIYAABLsVOytk4c7czAFdIXWGhklUVDvjvn3gtbZzqwIXHx4+OhvQQ+RKnhc8vI
         hSaw==
X-Forwarded-Encrypted: i=1; AFNElJ9I0pbGJnNnsuopwYLvyJKzOieZ9dhNfZX0n0JW7r5XEDoN2PeN2ulwrsy46dsRuAxIx32x7PIhknvm@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/uR0ERUMlKeq10hsmoLMDxVP/TSlC2XRy3l+7L8WZNSYi8XD
	6ADBYnAY8Q3N0UnEZv2ZZSOtzsNO6Ribni05ZTTX23+9HJUzAYG8HEquczSvor1fZxPvUHcljfc
	iHTsR5Jfss9kIsRV/z1Wjvfah5RWUkS+H+f2quwQQvQIdF00TkXDtM/UenqU2RKWL
X-Gm-Gg: AeBDievdmpArb3Bl98SKxqwEjWo31CmTLUgb6AGvaYfqOqYBQFEWviIHhML94eOmCg3
	aPcpKSAwi26xJO3Wh1//vAAOYbp5Z5iKz7uW3p/XMSim+DgPc5Mc6h/y1EyV4/xVWWV8DbHAaJV
	uUkfWq+mX4kWyyaPgl7N/M5cNsRnp31XLSxLhzIJeyAZe7Oe9ddpsUcf9SIfsOHkPJ5AcfPn2cW
	lfWjmbDFAu21WkYszuF+4PcDGcmC8gNjPCjXHxT/od7h8Sg6j8M3u5eRaI+XApG1eybrXSiV56W
	bQKM5cWkfLgZ7jt1xcQEbqEjq6M/SLhfm/HDfvmtVS1Jp55sPorePBRoiXd6mWW90Vz5hqLTUaV
	Fq7enFmNcYQPoXWoQogULwxkWKIyo6bVod7YUefnsTBt7dt9Pz5ZTpIET9rk=
X-Received: by 2002:a17:903:3bac:b0:2b4:6562:642b with SMTP id d9443c01a7336-2b9f280a3bemr88539035ad.35.1777881050485;
        Mon, 04 May 2026 00:50:50 -0700 (PDT)
X-Received: by 2002:a17:903:3bac:b0:2b4:6562:642b with SMTP id d9443c01a7336-2b9f280a3bemr88538885ad.35.1777881049984;
        Mon, 04 May 2026 00:50:49 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7ebe8sm110471485ad.2.2026.05.04.00.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:50:49 -0700 (PDT)
Message-ID: <5973b8ad-819c-4d14-9e7d-415e2605fcc7@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:20:42 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R_wsDOq_IHEhgbbFdgHKPBTp7xqmFEsM
X-Proofpoint-ORIG-GUID: R_wsDOq_IHEhgbbFdgHKPBTp7xqmFEsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfXyGLzlawEd4p9
 WbZLFxUCefrsTskhcByBVCZnF4l6xQ2komgvj4N9faq1AGtOV603AcnPdYzph7hafieXTQRxdXJ
 UDeK+h2EQPEkr4Fcf+xIxR/kJ2zFQgRae5vYbzw3n1P0ugPP8wfl+nEnt1UQa8+73XqBEDeiLVE
 Ax7rLD55auw1h27nsjiCk/h79N5ypVBjnjRdiFolws4TuDnVjbrZtWc1Zn8OZA8GwqqTDVrv/cb
 d1wPOQoXH33jsSRUuTXAf0JEzi/yyFj7pGAVKzYqERCT639GUWb4utiNtltWXdKyjZqefsGDPXY
 k9ltI//GtXI8a+WtSb1Ic+9Obbk3cV7PLc9M1WztYQAG8jnRQD7ecL+0gAz5byYaAQjEkWvqxm0
 jxWuRSKsVp1A9i8EViTkeA3tud0Jf1+mRy9j3lsH9sKV5vrrSM7rev2Ufot09d0mEKSfYVnrt3r
 N52w9fSi/yx6Sj6bJ6A==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f84fdb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZuckWHwAq6i6U7-C_84A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040084
X-Rspamd-Queue-Id: 920A54B9B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36017-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/2026 9:36 AM, Maulik Shah (mkshah) wrote:
>
> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>> Add pinctrl driver for TLMM block found in Shikra SoC.
>
> [...]
>
>> +#define UFS_RESET(pg_name, ctl, io)			\
>> +	{						\
>> +		.grp = PINCTRL_PINGROUP(#pg_name,	\
>> +			pg_name##_pins,			\
>> +			ARRAY_SIZE(pg_name##_pins)),	\
>> +		.ctl_reg = ctl,				\
>> +		.io_reg = io,				\
>> +		.intr_cfg_reg = 0,			\
>> +		.intr_status_reg = 0,			\
>> +		.mux_bit = -1,				\
>> +		.pull_bit = 3,				\
>> +		.drv_bit = 0,				\
>> +		.oe_bit = -1,				\
>> +		.in_bit = -1,				\
>> +		.out_bit = 0,				\
>> +		.intr_enable_bit = -1,			\
>> +		.intr_status_bit = -1,			\
>> +		.intr_target_bit = -1,			\
>> +		.intr_raw_status_bit = -1,		\
>> +		.intr_polarity_bit = -1,		\
>> +		.intr_detection_bit = -1,		\
>> +		.intr_detection_width = -1,		\
>> +	}
> UFS_RESET macro is not used anywhere in the file, please remove it.
>
> I assume the macro keeps getting added since the file pinctrl-<target> is
> fully/partially auto generated. Would be good to fix auto generation to
> avoid getting this added as default in future.
>
> The unused ones were removed via [1].
>
> [1] https://lore.kernel.org/all/4429f44e-f7e5-449c-824c-83daa339b383@oss.qualcomm.com/
>
> [...]
>

Thanks Maulik for review, will update the driver to cleanup unused 
macros in next version.

>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
> {1, 9}, should be { 1, 9 }.

Noted.

Thanks
Komal

>
>> +	{12, 22},  {14, 26},  {17, 29},  {18, 24},  {20, 32},  {22, 33},
>> +	{25, 34},  {27, 35},  {28, 36},  {29, 37},  {30, 38},  {31, 39},
>> +	{32, 40},  {33, 41},  {38, 42},  {40, 43},  {43, 44},  {44, 45},
>> +	{45, 46},  {46, 47},  {47, 48},  {48, 60},  {50, 50},  {51, 51},
>> +	{52, 61},  {53, 62},  {57, 52},  {58, 63},  {60, 54},  {63, 64},
>> +	{73, 55},  {74, 56},  {75, 57},  {77, 3},   {80, 4},   {84, 5},
>> +	{85, 67},  {86, 69},  {88, 70},  {89, 71},  {90, 73},  {91, 74},
>> +	{92, 75},  {93, 76},  {94, 77},  {95, 78},  {97, 79},  {99, 80},
>> +	{100, 11}, {101, 13}, {102, 14}, {103, 15}, {106, 16}, {108, 17},
>> +	{112, 18}, {116, 19}, {117, 20}, {119, 21}, {120, 23}, {136, 25},
>> +	{159, 27}, {161, 28},
>> +};
>> +
> Thanks,
> Maulik
>


