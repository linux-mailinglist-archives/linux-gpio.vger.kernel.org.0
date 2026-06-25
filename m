Return-Path: <linux-gpio+bounces-38875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e3V8N/XzPGqzuwgAu9opvQ
	(envelope-from <linux-gpio+bounces-38875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:25:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8346C4315
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SiIatYA0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C7sdDVAJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38875-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38875-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080CA30C9B67
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20FB37F00B;
	Thu, 25 Jun 2026 09:19:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C63374E63
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379193; cv=none; b=nR88/NToKkbUQuabs0OhSzOdmHxQ4idh2xOA58uKb1Te2kkcUSMdDPEwpkYjej0n+cKB+BaR3hMoQhrGuD+CIZfYEi5/C+7ynqbQuXqpqYv8k8MPtRUU2LcJ5zXsTLhtCuDx2oXIY5GcpEVCIOzrBF8MKuikOzJTvBXRf/LvDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379193; c=relaxed/simple;
	bh=JuoEZYzB3ObkgBG4v8HcpqypIuLamvT3Y/kB13uw8rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvL64atxfClK7cyo+xsWhYaIE5S10JQ/jXhwIVD79u0UGkKPJgQN6Y7CLeSj64QH0jxh4bsJ/oiodmPAQIf10206HKhKNSqu875guUODO7sQyv0rBKEtcTZFp33FP0mAkm8hb2Ylc8VuoXdRD/SrKDhVqG6VtEzvatHXmW5IaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiIatYA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7sdDVAJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q7781601205
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=; b=SiIatYA0T4hkxr6e
	ucHbDYwdTVTv8KDasRQXBnTZ+t47/e+aUrsicjfLp/pp7yTZ63EbHyFAx6WWGay3
	cVqPNE02YsQ2Lga/MjgSmC8O5DFuDpBrmQaWQftEXoJUEbAKDq9wCQuFc84M9OCE
	1LDJcY+wNTM7tnKcNdno0cRdLWIslvB0L7Ml8WPFlRrnIwcVmgSfsCsNGBQoocPy
	Tw51x+WZwJOv7zue/HZvHFbv8Nd+/ni0o6RUVDTSyOQUuh2TBW/yvHPLqpRs/jFY
	lOCZ3VAHTyJIItx/DQ6t6QcU2bnSPffDIC98p803RwNMF75NrtOM1QwPEX9fCEaV
	xf4gSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duk65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b71dso1285632a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379190; x=1782983990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=C7sdDVAJNfnAj2+TNAzBVK3RtTZ2Rr1Us5No4RzLz4sKRXo9OCX4Wa+X4puqslM/Vy
         GD6So3/ycT6xZINRVyMvRJOH7VQA+9sog0A7mtgzfULiXduSek8ElajZItcJj5gsctOZ
         E+K9CxPljeCW9eD6Zs8zx6TdtkGQvbuyVjadEAafOxvtPZ9Stbs83BzQRlRLG+ItbY3r
         5bqJPyVme3F7Vty5L5qxpGJZiK7kcddKEKnW2ks4Nq3cFC4lOY2bzpcn4LOWTjF1Cvih
         mZqP1bJD5B9zS82Rs7ndeShcn70B8t30oalZihavbeR4KsUGAokQS9BSMue7x1qmocWm
         ZGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379190; x=1782983990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM9epk6osFgRPk5W+PQdPweHVapvFSWj1NjJgY66wWM=;
        b=h6JIWVpvJbAphZczoEk16YSg6q94B3ubswcfovXpCiov8+fp7p3eN+BhaEMSUYT0WJ
         JY8sHIe2uhnL8Ptf4WEJJKumTnw5HOr/UwsfC+dmABL1z4rf0fqPITKT/nhnVZ63RPkj
         0DBqzV0kH8NkVklMQBZvf0hmfejK+kBoIwwCo2yTo5ft4m0ZWwx7uxYcOnwO3TQbCLOW
         piaT7mbmpmfN2xja4n3sHdw6HobxNPWn10s8QIQotQYziAYd7m6D1HLhNZ2Cj89K/VJ1
         XycbWBvuk6yF0SU7BwXjFw6UVA2msLNkhaUx4nHh2p44vpXi+xC/1MUeUuXvPeuhfZxq
         lcQg==
X-Forwarded-Encrypted: i=1; AHgh+RrgChHTPWWiLbnNsNeKeSgdL+KNJp0/7D6kFJO5VcU6l7y9YqgeiL2QC2R/da2RoEgdiGFh1UZDsQbr@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdFAzNLWTZ6FCrXi7DdZweRcTh8p1M3gUP59UNo4oR0h50+xc
	0Iw67oEnSPAbaONRP+9akNYeunzeW9QpHlw0vS2hvc0El0FO6S3MBDW3cy/RC+DI6iis/imnYRe
	FBjOX+UgvwqQVqa10E+k+e+TmuvxlgyrCaXahhkGpIJCojyLwpoTzcsxFihgU7eyY
X-Gm-Gg: AfdE7clmDGkuTe/IVUM09vmJ/snnSw6vnRTiqeM0mIcZoeLhzQx4O7A4q3ln6chtQCF
	OiaiHnDwYBgQTwunDf10GYYl0jSMxTB+UiUXuvit+gzEhsuGM9EiTk7Ns9Zml3qVv+Tst5i6eb2
	OzRyuxjqMo63OXDqHtVLZfVJ55K1LzgPneqyUixgWKQRKkgPiQyClueKMX76GOSp6JezqRf3qd2
	rIQqZCvheAosfG7ViHrHeZ/+rBxZJGua5vwrVe3Ye2XzXjSzzbRNrnbclBGTMen1KWg+s4lilcz
	hbUUbjIgbjKp4NWcg85nZalEWxBVJZwKP8jVXEQjx4JCyTiUfrDV53gnyPd14prxQuG8L+tkuxR
	hhSRURwKML5R8D65j561levzVamYZOnJC1Zy6uA==
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774270a91.7.1782379190061;
        Thu, 25 Jun 2026 02:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8f:b0:37d:f921:6ebc with SMTP id 98e67ed59e1d1-37df9f381d2mr1774239a91.7.1782379189596;
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm1559548a91.9.2026.06.25.02.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:19:49 -0700 (PDT)
Message-ID: <9160405a-25ff-438f-9ea4-e2a6f5c87eb8@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:49:43 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9KQaVkG_mHKTB_Mmiim1uRy98YbcVh61
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf2b7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2ecveFB43z4dzVmMHVYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXzbFIfnKwM4JF
 NNf4CzczbHIKVC3CTmOKbay46QxkHoPpIDhQ7tJk15dwGGTCBPsGNNV0lxbGRozCaM8k6qxz6g3
 Vl2h+MmGzfmbyLiX359Y2lhPhQr4W4s=
X-Proofpoint-ORIG-GUID: 9KQaVkG_mHKTB_Mmiim1uRy98YbcVh61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX1uxs8SWyS3pr
 +owwi/QCUdWRnfudc6bV4hf8FJ8gZ59dKU4ajtIo7xkVqMTexTWEqNBz/bXaxyVhjhhgyYQPLKg
 OTF0PQfas6gdPY8GryferI+/KtkPxd2IjA6LoV0fcYVvAZUm8qVUahXKxYkOwVyOiETVFTe2+pr
 T874r2QU9Pnr8bZMVGpvslQG1qDX3B3MA6cuuHidTMw8yHT19pCjTuIpYndNxlaM7BirOybha5c
 M7apgZGCqf25a0AebPxH3fE+wOPQcpRj0MZnMXpnhHcD+moEDuTUG48OkcvatWaDyCK8pFUV4Au
 RBDLTEtrx+OzCIiIJFCeD0ZYfmeNTjUQbrpFyU1I1RDTBg0ItgkppNDOjFeWaytX0NaLeWOx04I
 t3IsC1sxhtxYnjXYNn6IVnAKrA1P7UioHx1xqA9k7z8L/3v4nNdRoN+XdH/OTSs36emsofO1Olj
 fg59i3ShG6sFOGJoAyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38875-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F8346C4315



On 6/17/2026 6:42 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
>> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
>> as below on various SoCs.
> 
> [...]
> 
>> -	ret = pdc_setup_pin_mapping(node);
>> +	ret = pdc_setup_pin_mapping(dev, node);
> 
> dev is enough, we can get the np in that function from dev->of_node
> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Sure, Will update in v4 for getting np from dev->of_node.

Thanks,
Maulik

