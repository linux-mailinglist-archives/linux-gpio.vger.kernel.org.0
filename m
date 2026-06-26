Return-Path: <linux-gpio+bounces-39035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QeTcKYV4PmrdGgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:03:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61E6CD463
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kJFg+RMA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QWQvdoXM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39035-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39035-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30BFA3084DB0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 13:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF123F6C2E;
	Fri, 26 Jun 2026 13:00:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710323F6C3D
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478807; cv=none; b=FEVa6kmr/xibHDkla9VqSSYGJ/+207eQOlJZqrtOkIeWdfjCDEzhQbA7/CS+XQzPnGs0Hs6DQ5/yEZ6QvL3Od6q/XDAB9WNj3LLSggiWLv9w2UnsjZoJqRha9VOdqB9b99vuxBLfcNrgPjwUUxIKMkCZFeqlyo/SLfbAjYclJww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478807; c=relaxed/simple;
	bh=1/fsRUW3veDQRUxlOh6pic25VjSG653kNEIzC8v5blw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbCWTvgjH5rZ4e2Xh/cfLqbiKR4at82I1ILDpH2cFmNYI+cgmhKLu+tiVQw4RPX2g39ILC1pLe9qfHYLpMxbftgDo3lCHXhS2KPXednX6GVOqq1pauPkITaeSPZBIDzQg/d9BfULeumijm4ZeMcmtwC4PGUe8EDHgo5SssEU9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJFg+RMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWQvdoXM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAeR6o1073762
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=; b=kJFg+RMAYKBpOsj1
	gOud6KCjxgLH9bEpDtIQrXVKjZ42EfxQOmFpFaEAMdMU27UM3cQxPMCDZFUvPCnn
	q+FqJuetYi0ZJIlA0kgOYNX0eCwIyNwc7m5Xj/APBSGXaKCM/Mofvf0VWHmC5GYs
	ko4ufyHzfSLr6I6iCZ17zcqUojaJoZ+nwfiuSKnxoRwZo8XLSbOVhVnt5REbXsSP
	M7unU1mW0rlINKgeZuzPiFDIcdjM+3Y/hqdXzfMxwF+RSsmdDpJwKLMHIGuBO0kq
	GfhBwlyDtWbTSfr1zoT1To7rjrFUfpe9bnRI7383kp3LHwzw2TIgcFEde62SWV2y
	Ulu9Hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fctaf81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b2ccd78a4so21578985a.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478802; x=1783083602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=;
        b=QWQvdoXMtDA9DzgRERsGsz3epWgbEORrb1xP8JYu7siQ+KnvkvgfK6W8JcTgG2uKlv
         UkzEqwlCVqGiuN3YF25Lpr9cEM3SuvOElzgOPLZuU/cl1G57woYc5bNAp2neS/bTHe7d
         0FL5K86RSq2MJjQxacCyeFGD7yGXDVCKpToGUGyZbmR9Twh4U0yDfjqiYZL0pPkwD+nF
         e+g36Cj5hwqmLOKbZbcYsSBdzlWIA2qkwd2sxbI7z9jdZw4j7ymxbSPKn3dQEStgt/63
         /h3GPcCgkscIQIyXU36TlHWlyB+0Oo9TXV3Bxgt1SESW2CL1NvqfOVfVMkaEGIegmeIL
         QGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478802; x=1783083602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=;
        b=Zmkc3ZP3QNHaMIjYVnK7a5RVlyMCJwIopzOBGXJSOd/zzXIABs/Pk98RjR+JfivJFV
         H05JU5YmFsgMFf42sBCBfR0385usSH5RfV9e7UEZ5R6LVKNoriiaZbMpKdEU1Fq5oDqg
         1EhJbJWApF5us5MEGba6oQPYVWmJBPpeUzP4jRXEmxHKR3LI4raANAAg7CbpJkMv2/+U
         h5AMyJBwsDQA6taFISHB5ZLaaYCqE8KyfC7O4r1itorcLxX7NgCnM8r/ay1yuu7lsj+K
         Zos/PVyqupUuESynu1jrMMgBnMkOnDQLn/Ly3sjOZBxFJCHOfkFl2vweSc8VrKlSo0on
         AeHw==
X-Forwarded-Encrypted: i=1; AFNElJ+IiagYmMx/G4oFFTfUci2g5GGRigd0LexHR7bZmMUfmv954nWe4MY6CxjTDrIVWzIMJvBpDoqT6Fu+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzptnr+oBE0GV2nuOWzXPiLKSgFpcsuiAEGdyPKIEzipqUugk2V
	B4uUSN+SXJ6GGiL7DYDsdoxMz3GVU/kNkvuGbTWe7WL5B0f6MVVLJlW2/KHcwMJQsG8dwkwq741
	mgKfe+hzuDb179uMV9kZ3AwlKVzPWhrY+ALoozvu0NGkF/YAzTXQCfC+8tI3ewY5c
X-Gm-Gg: AfdE7clO1sTtM/JBlMLe/qQ5hcG7tA7pfzXjvPLMT5yq0gT/jO8nrdcJwK8mnPfZgzx
	Q8HmrCJFbdh9OIXW4sBpZFgllWPyEIRDV5dkCES1HhoEg8jF9JF2Xz54ByISHGfOpbfJQGhAXf1
	0EIq9L6+FOfUHZc9JVA3gJoN/ApOWgyNLRp0+jzpiOhOtmbQIY9qEKWrZWVtjlWyVe0paNP8/QL
	SxcCyVTg5wNbbRGLGZfjri2acH1TNJ0pziRdNLaCiaIVlFcD+Bj2F2zgfDpsF6zciQ+Ix73xytl
	EMUvLhtr/uwr2/fHEwEzg3UkURMEGXoAEYE/FP7tUSgM5Vuk8bj6+AxY8jJiNSS+FD6qInIlRmT
	dWLLUz8vJ0lDvLPq5q9pTiqkLFz7OljC4cB2DIvuxTgTZHGkEqn9G7JI0MSsmYg==
X-Received: by 2002:a05:620a:1a1e:b0:921:24d9:a953 with SMTP id af79cd13be357-9293bb44bfcmr1005967785a.18.1782478802273;
        Fri, 26 Jun 2026 06:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:921:24d9:a953 with SMTP id af79cd13be357-9293bb44bfcmr1005959785a.18.1782478801736;
        Fri, 26 Jun 2026 06:00:01 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46caad603b3sm23106634f8f.7.2026.06.26.06.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:00:01 -0700 (PDT)
Message-ID: <0340bed1-4df4-44fe-bdcf-94fd3fe98578@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] MIPS: TXX9: Clean up txx9_iocled_init()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <1b51ebc5e63ab41070e099bcc4ec1e8d9b85add5.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <1b51ebc5e63ab41070e099bcc4ec1e8d9b85add5.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MHiIqpGyK40yNE3nSfeRVnuXgj2HNBF7
X-Proofpoint-ORIG-GUID: MHiIqpGyK40yNE3nSfeRVnuXgj2HNBF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX/L2FVkj0nVhq
 MKfFC9PztGDENNsDqDDZuTEN1yV1F8wiPHLceD3wxAKSxunM1PhS79trfJ+aLUW2akNy0kHzcTD
 +8EvFKVKRIEXVDvN/n6ts9YU0OXKGFUvvlRC0DTH/E7HmoXhE0HYTm4cas2xx2UxyA5RDxzgGE6
 CL11tuL99eBjEnHUlzwcuAzovdVP19jfvGMTUG/GcsrLPp7EQSyP77peBNjB9fnDKliG7Q+oBmP
 NjLSF2oMHvPfj7KpICEOVJrTTg48h0GeVeld0QYkmIerOnM83gkw6S6ZXUdGKehD6ePGtfZj8Lq
 00THi+TvgUh/OCABEbflO2UPwJ7e4qNN/qjq6wU69hDayPo964tYQUBEkcEXyA/56njJ8rzINEu
 +VOun4ZRjCsM4BiqVlzZV7TrSttaeVqqIUVbnKpUDS9isT+r04zfiwT+vUgj4IxbAkvfT6EtmFR
 kCunG5VXNebY/zmD7kw==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e77d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfXzHBI2ruEU0Sj
 Sjz26a/lwi1Q91KcrJdVSkKLlS5KyK6lWWVt11rDVsY72saHrZHxsS/O0+7fWw3a+6dIgw5G1Gn
 f4KFFdKU6O1N4Hkd0j64W2fI6WO2MeA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39035-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[geert.linux-m68k.org:query timed out];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E61E6CD463

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The sole caller already uses dynamic GPIO base allocation, so drop
> support for static allocation.
> While at it, drop the no longer used "lowactive" parameter.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/include/asm/txx9/generic.h |  3 +--
>   arch/mips/txx9/generic/setup.c       | 12 ++++--------
>   arch/mips/txx9/rbtx4927/setup.c      |  2 +-
>   3 files changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

