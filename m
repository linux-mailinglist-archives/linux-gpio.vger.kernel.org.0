Return-Path: <linux-gpio+bounces-35720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFmdANDj8GmoagEAu9opvQ
	(envelope-from <linux-gpio+bounces-35720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:44:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66555489363
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5084D30C5F33
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB8B43E4B5;
	Tue, 28 Apr 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTc8psaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0Y+5eRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A747B408
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392857; cv=none; b=BaHMomZQtllChckxrMoZLyG/+PNHMg3VGQCUmk/we1NRf7pHx06I/6ZhSnRBShxlk9/mWNF6QNpO6HDppReqe3q/Eev16xGv/KlpVvqu0qqAP3kj4CVv62BHlm38PbZyqtSyHDGbFNMoCa2pGWEa/dBKtBMGQw/tZegIVMZ0xd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392857; c=relaxed/simple;
	bh=OGGx6Juc3+wfrS3W7vKIGdl7XlXSnp2EAZG1ceHvcEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP9PoJYAX2fd1/SoEo+8QrbQ+yzzUZ/6N3SVqxL1PZkAxO1qNsYFO5d0O1hI26zblEWpPHh8lcTlycxXL1I8F/tjjjwKnUzvZAj/rov1xIz9PQ+PnixYnEvxtgJ9elSNfO3DjKw/d9ynT+mX3r+SbfPKAy+JPymhnPF7rc/NM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTc8psaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0Y+5eRb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsbGi2890730
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=; b=nTc8psaP9spOnEss
	BctGpWDa4uTwTFgwV8U9Ue07Evsqz3mnp0VWoyj7GO+XljHrfVTFmQSfpEuyW7A4
	FCGerCp+k8eboHHdPbxDTFwHxPEHBHhaC2xwZKR9rRoPrTlWaaNJU3PXLBFLxaan
	lptvdek22/FiC9Fp0X5rQ6xqsgMcxqOEvtfbD3is+mCuBTQBhDDiVp4QhODZ+60t
	CfDvAD9CllFbXszsTufAR060TKWVVSXM3DurLdW1zE88X1hzG+OfhKt/Dg0ZSq/Q
	v8165B/sEjszvuQxvZoZMyxc9HMMZV9NdkJrur05PIeuhRJgXuUnOA00t8ParNDK
	Cwu2HQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyskmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:14:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9278587bso14015835a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777392852; x=1777997652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=F0Y+5eRbvZbHDAWykbZOEVgYqr1qlZLF9ICiwpqdJ6ND8VpAONIh/05IZb+JmvOQP7
         2u7drFeAWH2p8ccbkY4CJCxdYDoh+ma5DDgW++/gsRiz899C0zuTac5r7FoOkUFgrrYg
         K1sRtW79uMhgzgq9bm0GUTywucn5ibPsG2bEd54FjI7LIQNrzQ1y5OzShMEBewgBc/Tf
         M0E80Dp+XtUYVlxUoQ9xrORws6gpvjS/MQUCQIQab8MFnAEb4iv+IxdILWHLNGW1/iiM
         N002hiNU9uF27HaYaSevPeW3rqZCvVH/+Jh7FwPFPlOJCt16oe3lxVbNId7Np/jMbvag
         c0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777392852; x=1777997652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6oBcVBcyteYW09E2HTiBvm+oEW8wd4V4D6A2fwJL7g=;
        b=hh8H1HkxBNf+sf3WvILgjKa+5TcbNiJ4mnQHv972STsspJD2FkwZCC7f2afRy4j1Cn
         mDHkKMAGkTYPSTMc2hhFnEnJIHDE62Qtce8WlOToK9alhuO0iIw5tMkbC3aYxW878emB
         EHP6Bl9eP2AUf3wf4Hg9k8BWGJ+8AyUodisStDK1/MOSuq7+VoNXaPy4gWRxaZTYmK86
         9nNDrDDf3j3IejuK8U4aiaX3HDjy4lGwng2vyV114zzzmjoqzgqWD0wogHPvCbz+ssq5
         1UoO05s0My2aHSDYcJcNAvFEnizt1B/X6WVp6FE17+K6od4c5KrlXIEY4vSO8VbvvVUd
         RKbw==
X-Forwarded-Encrypted: i=1; AFNElJ8Z5DZfhb3NIJZ99iXmQKEBRiUKr+stmC65COPg0bm9ewsMz4gFMevdpUfM0S55MGJsESUjo+leCzMR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8HoFjT+fvARo9Bi+SVBdt+LR6smOyUlDxxvnT/uV49VAHn2k
	ZvGDHNMLlKjCeIqFVcHsAHLdD7ttMLIhI9Xu8WZ+wYQpydoJwaXmdffwB6xMmptYh17X5Lg6DY/
	8cHK/d87X2fuqv7T+VE8U9BaFw6r5j8gUmMHM3gYderVNIrlCOcf9Lx7zxY9vMyIp
X-Gm-Gg: AeBDievpC97t9Wd2Ei+AuELAwq9T6z3+jX2oiCr40bttJh9Ihc4W/EvYBRjago5/iGt
	5qw/WRBZZXLj8izuyis+AQWsRnx5z981nWByQO0yZr3w0vgDnvgw31TyDCklTrQhrrKvu3WIP1C
	IQmKRHczgRfjzwsTb5QRq3uyPV4UPUkLIa4f5lzItYIk6epJun8iVz/wHry1vDK0nzGmsMCUcZ+
	KaR4ocz9/KX3+Idd7AxZt8RangYbrFqiApm8wo9vlQH2A8VXCx7lMGyJAsiQMgcXTWv21czEr2p
	KMVp/qNt1o94wOJIwVF1nj8FYPVQO2ynlntgdV1LREjP1DEFtiM+1fxtEZDspPl1rCXIbTwZzno
	zS//E7kXFhCDtD0NgPu7e1YEjcBrfyUUAvwn86XPidkdZgz0eEMl0eR89t+yhk1zdpkIpvZhCM6
	3u
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8510a91.21.1777392852124;
        Tue, 28 Apr 2026 09:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3504:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-364a0f23de5mr8470a91.21.1777392851489;
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Received: from [10.48.22.70] ([110.224.93.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0213862sm90551a91.15.2026.04.28.09.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:14:11 -0700 (PDT)
Message-ID: <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:44:06 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z84Pqj-NRECSKk_IviBpGRFbM5YBeyGB
X-Proofpoint-GUID: Z84Pqj-NRECSKk_IviBpGRFbM5YBeyGB
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0dcd4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=m8rBHnErhwdSF42aeuMaWQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1NSBTYWx0ZWRfXxqW7nVMf8s0I
 FHqZnzdmuYhq0angLO3pU/t4WR65R/quwttmx/tohodIQgiKKl5UbO8yb2zDp2bSAT09eIc8iB9
 t4z+IowY9F/e86AqSeIBA8au4QMoVBoZgwA1Igz4VELog8yv2slOsQPkiptwtn6KbR+Uz6HmKRY
 VWPRAKUKiRbHo3GfBai1mD7VXk5i/8mHr3ZlYolNHOqXwz9tfM3VcbbeoEFwmj29wTDatlJLrpM
 V0haMNTYq5fkrWnNCOHwF2ep9r5lJo0Kaut60MmBHE/HzbQ5fxz67f12G7aCUfYoQ0Yhcge1N8I
 E24KkQl/oUrP/rOxfKPnOWvNj2pyei+Chje308bi+Zc8aptEMEXF3Dl+VCSAfP54hTcVtFMAL8t
 HdCTsJOLFqAm/O9pvSntqaVId6pHB+Nqr9aPef5zWjJAkSEmPECUgBeLdypf7VhWwDXh+W1u1fk
 ci4mg6dGXI3MuPQ59og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280155
X-Rspamd-Queue-Id: 66555489363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35720-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 2:57 PM, Linus Walleij wrote:
> On Wed, Apr 15, 2026 at 1:29 PM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied for v7.2!

Thanks Linus.

To align with Krzysztof's change[1], do you prefer me to send the patch 
for IPQ9650 on top of his change or do you plan to take care of it when 
apply his change? Kindly do let me know.

[1] 
https://lore.kernel.org/linux-arm-msm/3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com/T/#mb046f22f0c90ed7073e17073dc04daa931e40ee4

>
> Yours,
> Linus Walleij

