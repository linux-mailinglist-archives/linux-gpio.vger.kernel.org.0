Return-Path: <linux-gpio+bounces-38425-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pnz0HeVkL2q5/gQAu9opvQ
	(envelope-from <linux-gpio+bounces-38425-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:35:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79903682E3A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=djcq1xGx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hmovp1d6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38425-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38425-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B848300290C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 02:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8915258EC1;
	Mon, 15 Jun 2026 02:35:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9F405F7
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490906; cv=none; b=Qyp2UNE9gRu2EKEiCcpmS5OxC2KT/kAxVT3NOzUweZoidprQJ+xD0VO5OJpzkyBqUs/hTD3ak3fMmB5duVEreQ8Tmav1tCzgaXNK9S+TIiSwHmIrrmWIrbF45U++n4U+csBdfLd5yzvR9k9roBsdAefWMb8gb18d/D+ch+eRpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490906; c=relaxed/simple;
	bh=W/7n9BTsGPXhC0kfTEI8Wgc1IM06yj89XCro17EXdkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL8YZxWhXkUDC4yOg3sxYsQl9GDN0kFma+behTrgJysGes8VrdJXYJsne80PKBBD3DDT+5NpgCMqy7L9MZOZngw8gfqn1u7N2pksstkWuzSAEqFWEDzdRAfys8dN9xrx9F9yiHmZAvihYubJaZfuid2ewJyhd5MfjvufHVb1myA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djcq1xGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmovp1d6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1irnu2648614
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=; b=djcq1xGxm+uCJfKC
	OhI0aQux9VkqjKfzDrBf/QPCU84kQmsZTVG03jWAgqQIgU2NaXuHHLblHdRmTx3c
	D0RdjBXidrixAS9QpEOiZYlu5vU8UkK4muVbNLoRyTmjo9kqZOC2dqfQNWerzVF8
	HsNHTKxfUYjMpKIt/w40D8ODJ2zZIQhdgyI75PxlnddmnOuOB8rJTbi+4kmsNkiV
	6cIPjKY1R+on1GDuH+80t/GziLm7MKJ6ysRVIM7SCbLZNzN4zXNRMsFS/SK3WUD2
	XieavoyNbDeThcgZL2DfoZjguKpPhQLpYnn60bIuhUTqQynIK7xqZCCsqyVWOv9Y
	uVYJBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybw2kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso36288355ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781490903; x=1782095703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=hmovp1d6RBPNClxxpX9TNYZT8/R/FfPCVBT4CSm+yBCXCSlItT7v2MvYCd6WjFahu3
         i26NkJECJn8A9esSKcco+NtCqXyAjE2Rey921YQB65FSW/wp67v+eqkbhTDXubF1C00f
         S9ieaOfo8adje5KmjFkdVKNXNc9/g6W1Glz/drmgGNCHNspsjkGkIufko49pKLoRmQqP
         um1Jgz+pe3aBiEoU3O1S9+Kgxu3QoLKJu9iS3kiV+3gumQn79knWoPO1gjF0hnAPLpix
         wn8WUlCkwSFBPcsptidXGvzgfIfKcCzy4QJIrAahtGetciGSX17mUi2wADqlCVNTDsJR
         AKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490903; x=1782095703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=LW0Z4Tof4eCpCFE6I9jtFryp5Ahsb+ihc4DGMxQ62epJDappopknu3Y5XlM+rgY5q5
         zLBf1NJbo6MAZYPamttQEezzVosyhDkkJiR1K2oNPKxiVzXDmNVAYYkAO5vI/ySCKMzT
         SNV5cHCW7FUNvaiSZdHB8uusxP3yd9+aG4A1GWX0imIk6zYB5R0m/zurEs3V/d4z2gcC
         Pjl27JWE0oJRCJ9HSn0gyPJ4d9xE9YNleaBoVMqQ1kSrE2kTyuXLX/071pWjgK1jjW/N
         lYzyoVhip9qTHzTRAgx1eqaNMWdR2w8qOObulWhqETbWIA+gw+cIOoZVIaVGWwIuSdH5
         Tn+g==
X-Forwarded-Encrypted: i=1; AFNElJ+oBMtDTud/xv2a/gki5pVpR6n9GQTIBvixy7mih+0e2tg5rmkproJ1JYZNNmD0GDY3EoiT+u3/9O/0@vger.kernel.org
X-Gm-Message-State: AOJu0YyqEKs6NKdZRZVVVjIw625M7Cv4ni+3WXFLXykxWt0RvPRxMqMP
	45pdZPcrliSWTcX+9z6T8gz6G/D2dCieNUolFmYMtGgWcl2iLLVn6qhnx1NU2qyE12HmXJWJ4Le
	6FbBYspCHjNCSB0mVWhD9il8QyUpivd4jbTQ0R7tVo78E2ZWrx5H1sJQUFRl2WzV5
X-Gm-Gg: Acq92OGuZQYW9eyq/hOQdpDAFwoHKrTizBj7lfRemC7X/UoXAXJdDMaeyVei/l18IdM
	rdm+8yUAKv1gfR58rEX/o8QdHOpUF+VIPHOZz75lXVuOaTM/AwvYa1aqyVxxM4We2aYxSEJIozJ
	FH64gC66aWBOgURfScwnJZglgyTfIV0Z3W7wjIoBJh+6M6OB1g1BJmdYMTXs/1GhpmOozxnsucx
	anAbm8N90OXBfd3Q87wambuT00O9tPguE6hlrpOTEEl5qCM8exazcO5InPkY+YE7JXuEVVidb4X
	s34lIYtC+vI2lF99lwsEgXiAJZx0VQ0s8Hu6lwA3muGjk75wpMoWON6nOZNlxPoGJSvI/PbwaCZ
	DD/NunCdhG0GD3Z41wlYp83NoiRKnDCcQetYye14ZbldYZ8231LoTISE6dl5YIU1O7pedeHGYhj
	gpErLJ2GO6B7mRQEw=
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148068085ad.5.1781490903531;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148067615ad.5.1781490903072;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52c0sm84925985ad.13.2026.06.14.19.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 19:35:02 -0700 (PDT)
Message-ID: <d98e7611-4d85-4559-bc6b-79b85bf8dc23@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260522-maili-pinctrl-v1-2-0a6636f5c277@oss.qualcomm.com>
 <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: txqY7KTOOAE93sgqYmcUcokREkdBEL8Q
X-Proofpoint-ORIG-GUID: txqY7KTOOAE93sgqYmcUcokREkdBEL8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfX58l3YAi5SW7e
 BCB9QvbjrQODKHNw4Qg8GfZXLEAkFx9XpbqPa93imZSpq3dc/QRhrZUGdjAZ2oQKrB+vk7hi4rO
 gnDKI88TK/hsmvU+1WHl6T39I0GIM7k=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2f64d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MkT9_aAdxBhyvtWCMUwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfX9hx89W5fYDWE
 5Jifm6BbupCScRTznrGOtcJ8P3c+QwhMopyGCyIcuXhUFoSe50Raj4+Qfw/gMzVyh1J/L0a5WfV
 fqERKwY0aLw8AyuXUsl7aK4eMZicXdoIOZT7BBzdE9A8aRLqu1GYN+Y9surXARSd+8Jci11vkhc
 2KE27ir64yvrdPkcpPCdUL1LUxUIveP21eTSnk0TaUBqEck14HMlEHRR+jWkaDLKi5ginc1yyY4
 CPoeh0gIMsHngL+bBtQWZy8qtNwuvqT+23VgNmcv37IoCpvj6t7+jXvtFvX5tIM7hOZdENOP0hz
 e/lvOLEo9fHHnu3mtBfP24Sf0gychbjHjGwLFTTCpH4RterxEMGdmih4X47lOV35ZZBict0W67a
 0FHtuEDoriFcl01iU3Eq6owkXA1EGwgo/A/uhyA7Sypm/JbsPyA0zn4SvpZ+NA3GgOvt8I9ZxM9
 bjued7M34eFkFqC8ujQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38425-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,vger.kernel.org:server fail,oss.qualcomm.com:server fail,sin.lore.kernel.org:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79903682E3A



On 6/10/2026 4:08 PM, Sneh Mankad wrote:
> 
> 
> On 22-May-26 1:12 PM, Jingyi Wang wrote:
>> Add support for Maili TLMM configuration and control via the pinctrl
>> framework.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>>   drivers/pinctrl/qcom/Makefile        |    1 +
>>   drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 1641 insertions(+)
>>
<...>
> 
> Can you please move "MODULE_DEVICE_TABLE(of, maili_tlmm_of_match);" to immediately follow
> the maili_tlmm_of_match[] array definition, grouping the array definition with its associated alias declaration?
> Please refer [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Thanks,
> Sneh

Will update.

Thanks,
Jingyi


