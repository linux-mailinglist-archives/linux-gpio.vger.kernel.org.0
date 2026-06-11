Return-Path: <linux-gpio+bounces-38325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gLQuHRuTKmolswMAu9opvQ
	(envelope-from <linux-gpio+bounces-38325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:51:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCA6710A4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=msT64OzS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LxdeMk8s;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38325-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38325-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DDBA331B3D1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5393DB303;
	Thu, 11 Jun 2026 10:49:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165A3D565C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:49:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174943; cv=none; b=gRirMw6IG9LW7OQ7ERcpu7tJnOG/HPmnQDXxVCSr6gVR8n82GV728LO5CwvRAL17BW/nOUNkYzUxpIqdhBDP4yb5Ew4FsYysHeWlvqLbkOjLcVjF3JvA+QDGWzj/iYNfX+v7kNMzMB4AJRU3OfhhOb0PdGVKxd8kExE4DYPflHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174943; c=relaxed/simple;
	bh=GBkrhv7d64W4h/1OBsfcnntVKPA+JRwLwnMW6tdFuKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ic35gx++ip+9cq4RJdOvCd6wMNFToQ4RSaxd5Qzn+QmL3W9s+F5uoDESrBsg/sCPkXQGp+8bTJWcn/InCb61MMc9vP3jwFfzNKh2Y84/iTdm1wrDiJ8gLYcR/ZKQbSdJDHgxv/2LTomGEBAq37bR+8xd3S3Q0HzsMjggkkrr/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msT64OzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxdeMk8s; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xR3o174158
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=; b=msT64OzS7I+w5IY/
	/a5HZvJ1DfrwjTpEs5aY8myJ+YeHesMzS1Y2kTZCPSle+AId92xhvDYwIElnp32G
	NDUBjOLDHA47My87sQ90+y/3guPAdq5g1ogTfFlNGw89BZXxAFMINqUg5kJ9VDGy
	wydLpadhqBLZTIQECp7WcmLn0BRuczYBCQiG63HRxTzv+v2ThYOAyPJndaQJ2lvO
	MEeyMg/NtAUNsGHfDks5ycbPK5Ww7JXX1yc8VV/r4luCU/9EgwKanILj1UshsFmK
	ptpL+4tRADcHpmZhS+9RViD+ifdr3qUV1d5ebDRqPAzGjOQBizHo4LpTaU5gzw9O
	AMwOjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vay13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:49:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so21200701cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174940; x=1781779740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=;
        b=LxdeMk8sBasjJCayDRHJbcbSq51xAHPjpBGncgLs55EtJUVfGvFjFTjqwDifyCjB0j
         e7EWqat/SrSvju7EotZtaCEIMX4VOuVzbto/TVQK8s4vlkH2rsqOYUMmjVNNh3T6q87B
         z0iRYUIYd1QRu7bl4lm2HVGkAMvdNQXhy0MnKfFGvq0aT+0alh4iF4Z712Qa1Yfvzl2H
         gXdf2AAZ9GULHTWsOvc6G7NZPMf20NdwDDszdhjYTSZjyini4iIlqCuNEGfU1dnh22x4
         DGgywFqJ905YzgQ1M+7I0sFII57sd3lh01MuZ10XU+D45nOGYd3wbgspXy3PeoF0if9c
         CwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174940; x=1781779740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=;
        b=iiMDekZwv1gkdkrKmXmAFlfgIHbUEXQunle51L7jLTclGXUEz4teHSQqGKSlJvD3X+
         IpW+g+Q6jAWa5xOT/EiOLSJN4/caDYI8Yj+OU5v6H5voeKEHMMPhcXby5pfh5J4zoj/K
         wPG2zxY7hINaRZJS2nRj8Xs9xK8ciTY35cqXAbqtxquTxzLN3RwArBpfPWMumRv44yu/
         zg0P7gNw86F2b7w4pREdbX+iBoCV08W+uZ7vwbsW4vOcCJfinCCB/Gbli98H4t9PBhrR
         mPTgP1n9+1XtQ5DHC1csQmcVfGZLQQoGvL0c/9rvFalo45f7WLO64L6siclNIIL1Bdg9
         QEUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SC3gwDR2cxFFkfXeXbSDWlpnQimp09TyHpfjNiJ7o+rMnungCWKs3nde9E2AZFe80tw5i+0arbBqn@vger.kernel.org
X-Gm-Message-State: AOJu0YzHs0fNpG64EXo8FKdiUGR5BXDPpUJ+52x7Kqh1J2RGGXfjf9Oy
	272VyVI6rJAupyED6rfN+Pvxc4pwqantHaKey9WoWVTW2ssbsWPxYEe23y1M8fvtwIrLNqNKcWd
	RCr99cP4LGi5iKqLCfN04i8vmYYyhoI1t5WmnzBHTvIGSX2PkJmqxUNTk3zYnIcP4
X-Gm-Gg: Acq92OFsb1UdyRoZ1AMv/J1qVPlQELbCA9mW0iLKdZVzS/xqgOWWjZLeJHYFqgvPYXf
	B5mIEx1IHJtjIV7SoXmXOLDNH0mqsk2ySv2ZZW2dkjDhi0iJYcMDmJWpAIGya5mieL1MzHiS7M8
	aOMhVR980R5zyNpHsy8DQvlhzni/TY2h9HzcGTPGZOf1UNwHOgmkklDDIGyABDYW0kMnsayJMpE
	LRmIC179JDJXo4qxPgC5GZa1VhOmcorguCct4zEYlkc1yuBn6bJgDm8mkGUTvfeCGaEDmqhJ00h
	EdalCB0Bb7K5Ed3tCnT3Lgum6JYOi5OlOJ+pxEffID3jxqNqkGiW1DYJ2bDML+Qm7w0XvfPSId2
	jnC1LAO69Z2OCI12Gb8TlnSdU3rDMMTDqO0HYil43hed+M+h1tb8Ealzp
X-Received: by 2002:a05:622a:4813:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517edcd94cdmr21330491cf.1.1781174940197;
        Thu, 11 Jun 2026 03:49:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517edcd94cdmr21330251cf.1.1781174939813;
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb6785ee3sm48945666b.58.2026.06.11.03.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Message-ID: <e159fc1f-d4ca-4064-8c0a-17b75988f451@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
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
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YxBGoMTH1mmDZ34KA8C1zFpSqVu-EFMq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfXxBDLxaqm6nic
 OPF0wv9rwFZ5cP+16wgaGVWSmDUM2cPrtIwDX7mWaF92vwdwg/pLa0q84WDL7OgwbqlLrX2mRmY
 bf/zLKXdFvWF1jeeb7lMrGiVwm+fDIk=
X-Proofpoint-GUID: YxBGoMTH1mmDZ34KA8C1zFpSqVu-EFMq
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a929d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OlIdmLjaEo8V13lRhzgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX6sr+RTn/EEgl
 AY8HDrMfTs0ZN5k/vKzTcbyL4sSBNqQUwVGK3ElibuG0pblQ+9bWx1TtO4vAmgt2/4SB3ai87Q8
 Hxl1nsHOOAowM2jAnMm6FPW/nP5qx8M+i1+5bOrhnWn6pydnJ0ER3ddGVHsmnFO/vpgZNeXjwFP
 KZa/0TiZNKYlV+OKa+JI6a6n0iViea71DSkRnfjQ0ns6CA9Q/Fu0eJml6PWlewm/Pq0N+uZejfJ
 DrhvNJieB2h5LCdAkChr09C2TWPGOlB6nq8GY5kLRTJivmYOkfpZdlxha1hjqdVwy5EkI68HxKs
 D8TIxxSzROOY5hsZHrpDxXmGT0kRlKaq7GPPrJQax/OXkE92/lA9s9u1N1YudoO4i6GJ5O2O/WC
 Ifz2un1l7iwfIp7jWxD9cTC7OvRBcwlX6AG3Y4LW2/iCyxqD+cPP+7T5fyYUy212Ze9kin7UwCC
 e+m5EJJAVkpdPKAHH1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38325-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: CEDCA6710A4

On 5/26/26 12:54 PM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> +static const struct pdc_cfg pdc_cfg_v3_2 = {
> +	.irq_enable = GENMASK(3, 3),

BIT(3)

[...]


> +	pdc->base = ioremap(res.start, res_size);

Can we use devm_ioremap() here?

[...]

>  	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
> -		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
> -		if (!pdc_prev_base) {
> +		pdc->prev_base = ioremap(res.start - PDC_DRV_SIZE,
> +					 pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);

likewise

Konrad

