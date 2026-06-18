Return-Path: <linux-gpio+bounces-38670-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bwxsJZ+rM2qYEwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38670-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:26:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4269E707
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:26:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iqXj3NZi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jHd14Qbx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38670-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38670-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A57F13043FE0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DE23A1695;
	Thu, 18 Jun 2026 08:25:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B231E833
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771140; cv=none; b=IVsNF98cdfb5VOqzIu2yWTwCjAns/mOvdQf+gToz4orObUlRLfZEqQtY1SyhXt5f698tzul6BQKV9p/Xvl75wHmlUpTXIqNFjsYeemARmku+HnjKvS/ETUttnE7DiNZBgYcsPR57rJOsQc6fX0at4zuHEDWb87v88wPt1FKAz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771140; c=relaxed/simple;
	bh=pm2VtnvqcvMnJSio6ia4u9khRcw61jB8oisjRb+xz3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ+deHiRk+6hFqtZplZSB2VxafGQVJuc4k+dM0sxz50+tBmzLmg1Ytta7o5DTRiL9RVlgOi+plE94qv12y24D8Cl0YULOji5qiFgAVg6DVvPah6fBV9bHcb+UJ8Aj7Nn3TJJDdzsvHRwUH/raTNSjd774MlgUmRlsKGTCdZqRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqXj3NZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHd14Qbx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FUhs975878
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=; b=iqXj3NZiFMBRoReQ
	+SkKV0A8A04bmQsPqJqGL1N/ACL2daDUgNmcKQgqVpNraxlQQfhnk5AEMwlPdLCC
	qezhLFZr7gEw6XuGnTXihm60nc7Xk0hPV2E3W9PMtNpBEuJTQj0ILiuDSa1bUCyO
	Q72SOsuD4ankMrubFUkAgfkZxkbrmjJkGMoDF9LOf8S0tOElPOovSnPmi9ja66sn
	iUivhB+ciTxVftZ5tMRg2eXDxf/D3oc3bqKtTT0Kf6xHFgvJ2vriqioAc6cWrUnG
	O7/AVdTqumsWxEoJnu14RzFUSl4bvEKS441ME9TXEUChVK+KnDOkw1n9/pyVTqF+
	V42tUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2av8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so21008885a.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781771138; x=1782375938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=jHd14QbxcEVjbcnJKwM5XDQ2GDRy3YeX+x8CPQ3e5nikXFVVYsfcGI6TPqYQ2kFFgM
         ylyrV5L5gr9BUplxPCpWXLb+ScgxiRxeG91nf16ETiqcLAqA1iz3demvGRBqoe8LuQf5
         0xzpWO8shQQ+TVcTtCV0VXpYxWxEZJLqlOOs7yJzbxYhgNCbdVOHiIWURylANX3Fz8HE
         iCAbzj8VFDGKjhVZ5UnQitbJcmCq3MvYR6NaIAiGtiEJfTdpxM5B9kgqWt0iI7bmjrEL
         jfl1iDh3t4gDrxyXN1gAD/4/25/1GtX0vPzo4SkTfBWR/P/ZfqZGGodtn2OJSu14jPs6
         B6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771138; x=1782375938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=RCYPK8tBePB7zPG3/fmp7GdPZfu1q/JbNQu803g/7eyQ/6OY7A1vu7WFcH78xdhTqf
         8ae5zgCx1boNec47IaDCNufnq1mJQuxaO5uBv/o0ouGX9OivhHy0PUc/1wwFauO4qWvm
         j5bSXipKvqPqvWO5jeeB2QKtORcx/5bwVBQxgZ8soYlNotZjKHl1XN/jLI+IG0nNKslj
         cyix/kWIZMTTsFQki4VkczkfqkyiSZ7R1Be5HOjqE3VFsvPzCzGlJVK5JLUFAOp71t6y
         7/dcoNV3xaUKJTZK5hsoNKw9eeWANt/nBmBDKccY5d5OlUVPWYMdNz+Pmp5SFihP8KgK
         Z7yA==
X-Forwarded-Encrypted: i=1; AFNElJ/LaPPVzyQPDuD1kFFpITlDsn7Vhhyf2fgnhKda6mFVnZpRlViJcNOKtZqGL0yIl4tOzkjvbQuXBoa7@vger.kernel.org
X-Gm-Message-State: AOJu0YyUypavP5zAOR7M+ZyUh1vh1j9g7rMU2TJsL9GcnWKvRQp+aQ/a
	Lou2pwDKK6Cx/RuNh7S7UUYdiZR6VFx12+fnRbqPqDyghERT2gLmsi9uNBAeACDVjQEUkNuWP40
	R3HhiC1e6t/jS38lh9Jg80DPilFDH+xgsrGHf4VAG7RKWl+D5fXcZsaqKog1tARVf
X-Gm-Gg: Acq92OFo3YRbhaHITbfHEjbYueT1lGvL8Z/IzAweIx48E3h8AI5q01TftrxcyehLrKB
	/FK30e33Dppoma4d/DopSWao3W69/eA4SEtPuQjmkXGIedZmwGDNWVx1G/W2pb0Y8SwyZJKN8s/
	omlGTIYbp2G4olvMoOEvEqb9EMM+xaAa1Wm6y3u/WjkP7/1pQu95bM2Fks6ApwiyiEBqdtgZgUZ
	W7v74twAK2ThYf2nmQqMhE4ykbOYd25pDTGGsxHhtsQH8JSvl6sOesd+IDGCLlOzRuZkRgaqtL/
	ZxXoruLJBayy7Snp41s0wGWr6gVKh2ef4K4I8Mb4hLqq9po/FsPGHuPoNwtkulX7Ye8jREgyCBR
	2r5CBpTTRRJlunpTbY+gMJ9+IajsRyImyzN8=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259246085a.0.1781771138033;
        Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259243985a.0.1781771137655;
        Thu, 18 Jun 2026 01:25:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954c2a4450sm1871940a12.16.2026.06.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:25:36 -0700 (PDT)
Message-ID: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33ab82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LGoL8ljZ1bDskmoh4PAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tqKun806Hm2yAk3UwCytmYtlXpB1cssC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX5f0U0ELLPIN0
 T/0GNS8VP9yQx4WzWD5F8fCxixrSCYvqcaYgoEqjSz30iF4m/mu6YSl/GVaJYiSgJIfGMb6s9aE
 uvuAn014FHobb2CpbH8BbmpSYZXJc20=
X-Proofpoint-ORIG-GUID: tqKun806Hm2yAk3UwCytmYtlXpB1cssC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX7ihUtVepQUVx
 0N5xtWKoCNuZ2yzNLNavboojJSaMjD7tN6rpYZD3PlnpnWoYJZJ0+LbWZSj9pqLwtxr7ddrRXQs
 P+8fItfiimE3GQHhxCDqhFWTimovUmvcyvswQNU6AmS9zA9if31dg3ztPlw081YHii67G+Hae9s
 DuEKT7rYCBnL8jM8vgRGdJQ/x4ua4x8FkvjW6vEUjzq9ENvepn77/KEXwQwBvSW0nHUl59Sy9r6
 DycjdBoNTIZMa1mxZAcVX8uS7RiyrNVXINz/rkOYw0hvFLyI5jaXTf/eP+KFOfKahvZ3bVc/Kdf
 PNnsD6xNWLpaI90EI8OXDtyY5Y5i3NnARa2e/2FU3F/fRgNC2pXOUTs0ajmYXlsgx+zzPDW1cEj
 mmU3lTtx3KhbZXToFWwf8H8YixN+qmOzZj/Mvyn8/mp7cNcfeGw/t4QNWVJIO4QrWF0T3AjUNl8
 JnIy51PmUMihbc4F1DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38670-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A4269E707

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
> in deepest idle state.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142..47e425003028 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;

The DSDT has "wake_latency" (presumably the same as exit latency) set
to 5000 us, should we follow?

FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
which doesn't sound very reassuring


> +				min-residency-us = <9000>;

This number matches the DSDT

Should the entry latency then be 9000 - 5000 = 4000?


On a separate note, the DSDT also defines:

SS1 (0x02000154, total=7500, exit=500)
SS2 (0x02000254, total=8000, exit=3000)

These are obviously shallower states, but perhaps they could still
be useful?

Konrad

