Return-Path: <linux-gpio+bounces-35414-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AMiJK4N6mn4sgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35414-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:16:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B946451D9A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 14:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 225603014A0D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4F03EC2FD;
	Thu, 23 Apr 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9Q6vArf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/dARvtc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309330DEDC
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946572; cv=none; b=WN7+F4prwUURRgwuIhTkWf/Id7026WYY5syz3j9VmsUqOEfUQ34VwFVvjH7O7YfwFaXxbzIZAt4nNj9GoDWsxGuTsHJdTRR0rnTg7+qXNmLnw1cAamDUnAyoztllREfy0nIgxslXHpCj3Ix7DRQ3lcfa0oP4rGNT07Pw+Lnnf/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946572; c=relaxed/simple;
	bh=fkHcFP3UxtP5rwJIeJcymGHyus2lHI1cTWXXknYm188=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DutTyJg9KgqKaMDeu5wmaEh4LpJTyGt+R0iCtOT/COgUd/igX+DmadUWAHflX0hiWhU0QRnwaXEqxyn9QPCnBboDyy/buo6pV44OMK9WE0a0BAbCL7N19PPVF1y5S+0hLJ7hbJ3Pi9lFl7wDghZQzE4LGx1nyYYiULXu61LgmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9Q6vArf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/dARvtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uQYl3044646
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=; b=L9Q6vArfrXfJulh2
	+KA7Zvr93qs0G1+JGWl485tXDu0fx1yRtSZ6xFAB2o+/qm90s1Df+QFgwA+i4HTm
	9DX9Q7PYnSGQwNzk708v1lkZBd+khrmfZbdWnxuLKToICrTzrnzCOCbD+idkttoc
	vytFCTZErENHGlt1Hbr93SLgIHFosEG6cgGPkVI5At+8XqZjLuYHNIPksVXwlRpo
	YBqloRK0kEWagyBmpYiZ090uJn2utMyR1eSVkbboXiq2S264R3kLgKgoMWqMtxhe
	vxRlbfhzPeVXhbJZmzY1siQgdGNZVsVTgZLXgkDIi/wS5egc5tDbzC+Ayv+GM0iS
	bCUEJg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3tr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 12:16:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-610b3dc3fe8so258342137.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946562; x=1777551362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=;
        b=b/dARvtcHtIawWXN4S85ezl0BjIwlBGZFoR4LxdGWX2ioRICEli4Zac+OTrsRHHjtQ
         f25LMKws/wVdJvLK8C4emCjTLat8HY+GV4F0jQsH1hobu7ZlLaR3zT1EmdIkkXu2SkAn
         5hRNpTMBzFKAANk+0phgAofLQGn8l3FJ9pLFsQqmb4mQrTeVymoP+W0whvPfVID7En7Y
         uRkh0O4mWcgwQAatYfO03g+k5F5G7ZZYFzjXwC30onmkhdsktMVZHxxa/XXwQyu98meQ
         +zQqtY5fcS2ibzkQ0D98LkRawtH1wgm/pKVWuNaAETlwbwZ8X8F4DJFhivuGPtzxQP1Q
         HieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946562; x=1777551362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=;
        b=GX18Sr9gCbTUJKKNSpc5Eh3ZNjra1gSmpOM96LNbGxoM7h/JNUbssQ1WpFwob765Dh
         gnGtnqJnHSZazG1bgIxPZaHa5d1X756v0K4zmZvm+sjuEgA86Excb1IxhQ6UcsKep2DL
         zyxx9m8u2aarMh7XGCFV5c+veVCn1bbXQTG+og+jKOPnJjuTNSeMPRoQ5OZZgtgMhC5r
         UPTzChAY/dOxjUpEJ3flTFMYDRUPd+Gqu5eZh5nsTFdh9O0390i5DgQHcQdmvS7j+xhf
         Gx7ZKpuRO8EnHPkunPeQdfUcwgIoVKQrTE/uD0dJjzsmffh5ZYjUCmR4PIIsjyNa4KZ0
         xCUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q05QxspiaJ4ibkwd8KRTom8D2EwXwUxtA2xQ5TKcalEXf/1gmXMyXlD0fWxrxCBOteZnD0ozmuQU2@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHwyP+W1XS5UjpMHwO7Kmq37eWGkpwSOa3PqQkSM4QZFoDU+R
	C8Li3HGGjJYRdDBmSeu98hQl1NmDsAntdvYIOxpcU0zJ0t0DUNc8/AlRpecQRzhA9vAtgOoqWmL
	jXZ8IAeB1FWI+zI/B+HvzZGFm3uQ4teloqn9X888iQi+82YwdR5COyNO9+c/EV/vs
X-Gm-Gg: AeBDieuv+AEnUYpt/33sOktduDsOINCYM2NK72up0JgG7/TLpRrzwm+tPTn/nlprKr/
	8vWCqqHWoP1peHFPjHA/Sv6z8o1zdU2f11baqvOvmR+z9Ztt8VuFi7RU/MxdjRufxFmEjzTzNuo
	LJz0vN7pTeGuPsZ8MvKlf6AZWnYuygOX3WXSNcA1k3NwkuXqf87WaYGaUmdHd0Ap1PQ+D+V77oO
	ozkX/LF+4h8jY9S7yR2zGoGje6JthDcqTNmtDVeTyuyrfITd/Pbh+0lmUQfiKhyh340Mxx3RV7j
	3dnomr8jJq68tKiKXtswl/4/9RkyVXcy8TCKHxmnEm+8KP3wvF32+T15p3JGfI+3HXI39n9MJtD
	ZtDlLDVFDsh3971B+KZjNxMwc1/1htomg7QGub0hI8x0oeGu3qBIEgBN/UPGWl2j/V38gKDoIaN
	3s+MSmW9KwTv/5mQ==
X-Received: by 2002:a05:6102:2409:b0:604:f07b:efbd with SMTP id ada2fe7eead31-616f464118dmr4446038137.2.1776946561672;
        Thu, 23 Apr 2026 05:16:01 -0700 (PDT)
X-Received: by 2002:a05:6102:2409:b0:604:f07b:efbd with SMTP id ada2fe7eead31-616f464118dmr4446022137.2.1776946561218;
        Thu, 23 Apr 2026 05:16:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm653058566b.49.2026.04.23.05.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:16:00 -0700 (PDT)
Message-ID: <0f57e558-bd8c-486f-9abf-d4691d8c62e6@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:15:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMiBTYWx0ZWRfX4/X+JDuhwRvS
 W70NZ7PFl6uencD2GLRnAPKpQpW6uhadfINIxQ0lHm6P4gMhOYovJ4Pir1pTQkla0QIlFaFbW+E
 vdqykf1x41HNK7TRV4j+rPAztI5/djRIfERO4w6B75KSxjj33+9CfS8nPZFvRuY/aPyTZURgTQw
 IaT0c0TJfRe5F/Fz1rSOn42BrZx8+mg3vt2V6Sur9Ucsdc9Ob9oYnO9OMsy0C42TfJWf4RVF80S
 MyB2HDoxpsK7mbNGSjO6MibrgRgk5magwcAhO38BWmAWx1mxBH5TvUgV2rgnxVtcBAuFMn8yC9z
 31lYDJLqkoAA7a9BbFBfHjdol1d7RcDCZTWuwzo8kz7tSzUxKoyu7iJJttHAeM9UVcWjec+8VnL
 wErxzrhAc3Af5VbKBcjs+bG49+Lsg/oQlCV6ANg8OrL7ljgJg6A8+LAxeCRtqDXpUQbOu8sY8FU
 nFWXPiD9uAc58zbpBXw==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea0d82 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zherij5Z7axzGqeR70oA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: R54OXnL-EfgiPTtJvgW5Py82-i1_Rgmz
X-Proofpoint-ORIG-GUID: R54OXnL-EfgiPTtJvgW5Py82-i1_Rgmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35414-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B946451D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 1:25 PM, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

