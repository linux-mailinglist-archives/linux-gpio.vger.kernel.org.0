Return-Path: <linux-gpio+bounces-39554-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5EOnGRejTGrLnQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39554-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 08:56:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B240E7182E6
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 08:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBOTGI3c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D3Zz13NW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39554-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39554-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADC5E30A8883
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 06:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4663B3C06;
	Tue,  7 Jul 2026 06:51:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE193B6BF0
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 06:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407074; cv=none; b=TOtqr8ijaId8M5rdsRa2RLu5hMp1O3DJcM1yuc6iA78y6e5UI38hZlnIiyCStoj+Lm4PDqDTuiBHk+K+EIHZPnzSfEhNUJ17p7KI+7wIDI819Lf3OW5xsyzeQZc+CjRGhgzQUsx5vzdTO37cGG58F1POEELsJshmXMbMxv2LXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407074; c=relaxed/simple;
	bh=g+2xhVag6spj4YNFX8Jx/a9MXzwc1CEg6FaBobY3B9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e7z1NyIKZ9XDUyLGHanWK29K4VIYRGJOYtp++flOaVpr+oWUA2ErZ9Rzk2dLf/G2XK/zp1bmSsAakvFI2sVPpKg4Nhg9oCxao0F7MO2uGOeubnRKk6tsIh/yGYgniAlWAFORhTIhrN1cfLohCdwEEvSAHTiJJilejmMROnXRGJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBOTGI3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3Zz13NW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748uUO2688400
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 06:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=; b=kBOTGI3cGY5uuBJw
	nbmu4qxX2yCl8l0D7j0EX+FXMdVNRxRYznEUbjsuwK9ntDEd9dEpPT3arFbD2xcj
	QBDX5h+3EqNpcimdxYVjZtPicedOsQ6/qFtSe9dzPbcqEigB9+3bs9dHLLg8wkVQ
	Irnx23chKPAh8JnvA6BL0CRuGeBfCkEIEDVspYhZ8WaeEFOQ3ae1Q+V+Z7CYKnec
	SH7d80taHVlneKgwVKYcQ+oTKV4xum56FWHWgQX6ix0WaOF8z11kbEErcm9nTIGP
	q8X5xuRStivlW0N6x/qBLyNBL1ByfzMvPhn3/kZqApVFJwAtb+j+8AqIfSv/OmpL
	6ex9Vw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvkq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 06:51:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969208e497eso3769015241.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407069; x=1784011869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=D3Zz13NWmU6ksPiDAMcr6daMGrj4VgHe7u9C3wI96IxGs1NDVZ1R0AFS79jPXr/fZs
         X8iHmrr+FoXYYQKaE6c0RW1RgiBcR8W122ihr3ISG5H/wwOPNIzrExIi3VzDNtJjx88H
         2zLNElTadLvMxDQP2k3wt6U+Ds0gTNkAgEHpziatca8wxBvWWXtOot6JiO1EfGkThS+d
         xnMaMYn5XrvwMyfAo8A65Ivnf6R7CsvGvG7x+FnCzQNwpNdhON5zl8mKr3j1AhgIYDAr
         r7gYsb4wRbajQUC3VwjCidMbmhEc1lu90tWMDivHN9XqXF6tw0nN0lWkKKaPCgykaI/1
         l+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407069; x=1784011869;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=equppupYDjoOTcocYFBmflcXCUpXZFOTfBlCyBfEzs0=;
        b=sed7cO70PAxKkEGZz1eAQUWW97evd5MPkpO8QlXWigbr53q0dxEv4X+Lc7xli1Zw2n
         seRrUGfTJlzleXLF/Jgvt0Q41sWkC7pgfkxUtMlQpEiKWmSURKUaZh/n2rlXdNqzqu+c
         c+1KwpeenX1/5JA/kotxDO1Bn+M3H2W5oLfOfMvasRWoEhLshcoP50+zOYpyYEq1vEhW
         CnDsfDRAaBB3EsDT3JZCnHrsjLJJGS/JvFLAWNqyMQaERoPys36zGUIqSSpdFZWeQ19S
         XLhh++lygUMGyYvQ3Pd3VhmHTijh50y/3oTlD63VwQ10n1/DtKJZITlBZ6jxiBiIBaIy
         X3sg==
X-Forwarded-Encrypted: i=1; AHgh+RqifqoMIrAHDUxEJ22HLjFCKE4dg7KM04q87+DB+Jg9qT2/o2ewYplqXtLecy8jY3tpKKgrIrKvIVos@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYSrAMuVmwOMtJeAtF6qXe1heEbpUqD2ynQNfSL+6qMJZga9f
	6tFObHqvuCH7Ema8QJPuXgFIBZS2vzeK3DG5kVlrRuu8LdH+ylaQLeNe4Gq9CRpcDUg3Cp21RTq
	QmKHrvbZz1PnqFng5L3vj6ezBiBqG3V4WddOrUJwRmv1vJlpTrSF1R7j7fywCP7TTpLQrBgJ/
X-Gm-Gg: AfdE7ck+OafOu9Eo4pvY0hLM6EVpo6FpM9y5X8TrfVbvQxcoAmApSgOHsS+Re4++qqY
	o6zIHf6hFeeQ94/7cUn50392MGoqbAgcxv8Z/uBeNk4Uk8hcIoR+qcW6AO/EOVajeAYAmzFFoOk
	LULVihVICQXMl8uGTWDJoii+KUGuS2JHUysROIfgPXFSC3jlKrckt5I9zM5RzKQvOEdzIOjW5+b
	8MiUYBHbqnQVumHbwcjIvaKZ3zBo5Dj4m2sNXHZhz1sA1AlGZuvplstEdPLz58/MWQHaYkIb6uw
	lDs4SsWLVU5MewmyFp0ySlMqJmYMuVpwJzfDpBl3sUPnrZKERu/E4+IsRVi1/s6Uc1QMPpGLBdK
	MDAyAonoiKNyeWkNvX+78kQMj6FhpkHd4CZ6lDI5H
X-Received: by 2002:a05:6122:c81:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5be90865de7mr2306030e0c.9.1783407068975;
        Mon, 06 Jul 2026 23:51:08 -0700 (PDT)
X-Received: by 2002:a17:90b:45:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-38757b81a3amr3675113a91.31.1783406719846;
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a32e3sm542564a91.14.2026.07.06.23.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:45:19 -0700 (PDT)
Message-ID: <3d12c33e-6aae-4396-bcee-f4159a741cc0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
 <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gw0SVX7C1ohYAWwfnNFg6Y00GWi_RpOx
X-Proofpoint-ORIG-GUID: gw0SVX7C1ohYAWwfnNFg6Y00GWi_RpOx
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ca1de cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hcMOYrp8kfDHR0m5M2YA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX1DRdLxlZQDY5
 cele1wM7GSksAa5icY4+0YrhEZnl7yE1Urek7b5oJOJOMrLrFLqTTPVtXGt2CQlYOFI2tW1wHUc
 NlFfCZ3xtzI77dL6CCfOulGrF2GdHral04qXV51WGAV5GR3nVMwq2cTBdO+VIjDef0IJHoB4Smx
 eEM+YZd4kATrmaXJF9d20ijuVbHrnogicF/pfMgpwDN/lZuaGD2t6vHiDSbXVJyneuezKfsJBet
 JmDyntG05EcCiYPn1UdxzRzddO6elGhzpqmz2YILZA/LsxZtHn4+4um4jTf6N5zKOZqRyGlnySm
 /L/Fw8xinYOiwTPU1QSenGxXWDljCycNtn4elreAg9OwOA/wL4VZDM72e1Sdy2FaCVOO+f3wyDd
 TD2zqFy0qQrcwGLGDe5fcPhkeOaDjaZ7t/mx1+KEQuXmIyd03W2pl6pSRXlRujiBL03DD4MnF7g
 VKGsHVEQmi1AjlUiToA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX+jyu7X37guSw
 OQU1S6++fhyKcHrWtPZHkHIj7tHDqsna2gMJbXQPisVZjRgyUhQjhqScP0Lpag61Fgr2K87VsbH
 rP4E8FtZgh5tIom0ToCM0Svhf44UTSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39554-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B240E7182E6



On 6/18/2026 1:55 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
>> in deepest idle state.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index 4ba751a65142..47e425003028 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>>  				exit-latency-us = <4000>;
>>  				min-residency-us = <7000>;
>>  			};
>> +
>> +			domain_ss3: domain-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x0200c354>;
>> +				entry-latency-us = <2800>;
>> +				exit-latency-us = <4400>;
> 
> The DSDT has "wake_latency" (presumably the same as exit latency) set
> to 5000 us, should we follow?

DSDT wake_latency seems to be entry+exit latency. Will follow DSDT in v4.
This requires update in CL5 latency too, for now will follow 2500+2500 split,
which is closing matching with actual entry/exit latency too.

> 
> FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
> which doesn't sound very reassuring> 
> 
>> +				min-residency-us = <9000>;
> 
> This number matches the DSDT
> > Should the entry latency then be 9000 - 5000 = 4000?

CPU idle states with arm,idle-states compatible allows "wakeup-latency-us",  which should match DSDT given "wake_latency".
Using this will avoid such confusion in future and will plan to use this but in a separate series.

This needs some more changes for Cluster idle states with domain-idle-state compatible.
(cluster states do not support the "wakeup-latency-us" and still needs entry/exit-latency-us)

Sneh is already working on this and will soon send out a series.

Thanks,
Maulik

> 
> 
> On a separate note, the DSDT also defines:
> 
> SS1 (0x02000154, total=7500, exit=500)
> SS2 (0x02000254, total=8000, exit=3000)
> 
> These are obviously shallower states, but perhaps they could still
> be useful?
> 

So far SS1/SS2 not proven to be helping much on power/performance for Linux.

Thanks,
Maulik

