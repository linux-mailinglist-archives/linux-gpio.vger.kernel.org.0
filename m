Return-Path: <linux-gpio+bounces-37898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 65buNE00IGpGygAAu9opvQ
	(envelope-from <linux-gpio+bounces-37898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 16:03:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A003C6385DC
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 16:03:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KQuj0fq/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=USyxEjPK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37898-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37898-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1E2030990D9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 13:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB85447D932;
	Wed,  3 Jun 2026 13:58:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DF043E9D2
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 13:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495123; cv=none; b=tFg7IhVcahryw2YWQRKQHe9srCvBpsrx0nm3Xa3qoeMZQcpTIr04K+14K/zpU6D6S/A56S7Bsz9fMf3si/lvhvyXE+pXp7rGEHv5z63InZc47pwKNNj/rhX+d3/GVJlHRy9qJLvNFJpJFmIsQudhLS44jgOl4eEqlXRNUyDtK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495123; c=relaxed/simple;
	bh=x8J8/N+2R1uvmgb9p8RIKLrLL3NV4CkdX/BgzqZfPuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrAKucE+Mh6JiAWRpC4QzzTLURcnEbIQ8eCyfXsmt2MFmF1hNzgHf9qF/MSuIiNTQdk7enJ2x8dKWBtaWqiRYpMpH6uTrPpG3ggbTj7v1U/MGw5K3Ta9dG0SO5LsSyXZEO0NgHphOk6OwxfYz1WWuY1bxFB4eYyTbhrqFGL+v7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQuj0fq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USyxEjPK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CTgFf380656
	for <linux-gpio@vger.kernel.org>; Wed, 3 Jun 2026 13:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=; b=KQuj0fq/FNlCX7s4
	0zVooYxNnJTlsmaulVFgXMdVtsEkF4D4a1mmEl4YkuBFHimPm00cO4Sp2x8uvd2M
	SzT0KOpHDmUgKEx+0fLs519VrHfVQ99D2BG4b7j7fT7HCjNs8717Xnkzd5nXBr6l
	CTFQZNZEUrUuxl7Jw4P61MfRgK+urr2hisbLmEAXf0eO5OCUxx3iltDcPKFmZGXl
	vFU3GDIz2ow/B/6VrWbRK2GxxIM7l84ZFb6McHdqS9s7kMEDPP0Hb0vGgBTqWdGV
	QhDD6qkPooZMdegS841a1YekNZNq+rB6Ect4skzIPIS0hdL+vSD4rDHnouDgFyQb
	XvGOow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhss6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 13:58:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b8fd12aeso240001785a.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495114; x=1781099914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=;
        b=USyxEjPKm+QdCXUe60YwTqErfYX98UxDa48f91HYpVRQ+oX6KFt+vfENggEPRZH6n7
         BrL/QaqF1ILfod1VyNuKqRQJf39ndHD1mJB9nSdFAl/0kHW+9frZ/DuBsFt9g4Mcz7oE
         +OOjwDsJTk2AcpnOUkBWOIeG6EGBXi9eul+XuFLvkd7drHOQ3Vnh7acY5R/X9kyACH3a
         xmz08Zu/U0/nGX8MPwfCLxmUOzIqcMLrRiv7KASxVMqMO8Na5/GkrRfXkCz6Sk2og51l
         JxJ394vwCbX56s4rlQRjvBfwizIOjoQZKW+cOk/nO1bFlen7MdIHUCEWHjbRoPNuYRyI
         UTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495114; x=1781099914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kfz6Dv68L4pwFmiCY3LaHQ0LYxLmU/e3hNomwI34hw=;
        b=r/3cEJdQ+5d/pt/K7yVTNPsptaAsx6Ld0Fpsp30xw0PC63MhJuN7WaD/gncON9zv8t
         hWzoq3aPeCfOdNFaytpmJJFGDKjYIJqU4S/Mti3fgaHsEZFw8UMmmokVPZIT6DkBGGcR
         ilatN+bzOg22V0D3urhslpv2T57ynQKg9Ct1PoQaVC6rKo1c6XwaQzAZuSsR6ZgjEjXx
         XP8POH/KYEykeUB00MWfa2kILIuOdFwIIJD08iXxSjUgKlXvzaDeLnjHd5OJdKgAj6vD
         /335LI13WxXusGHk2IrnVk7fuPNDtalvprJvULp951JsjvdRNKWMRReRzIl5afVtuDED
         VJ6w==
X-Forwarded-Encrypted: i=1; AFNElJ/0QKBEuWN7vI3Io0nkv8APfmDGrJPPeYVnF2zuQvxZAaoOLvH1iVe9iEckwfgXGUktB9/8NTq2RJox@vger.kernel.org
X-Gm-Message-State: AOJu0YyWtAH8z2IDPyDzW0DPOumXkMWutB7CLh7JKELz54SGWcNEUxpc
	cras4vof1i0HnfkNHnQYMlR1Nu1NQTCrSVvB+J0b+tYXSWwNrJ1c1IP15ai/eaHuS90Vy+Z2Cup
	ASM2jXUTio5sQzCeKYCzoOGxHObzauSJQEBaRTtsmQpeVmjXDQb/5rmXLC7qJk3KQcZMMK3E8
X-Gm-Gg: Acq92OGe2DinnY+G3yNU3o81RPqMgKKZO4OHqduWWLFzdtcl7TUaTQIVmUzRNhrAds0
	NTZbaJitP18TsxmJNyFWW9Qx/1gVOC81ryKDXAWSJ8AjY3YnLuBjECrZ/y7kE+ROUfTPQ8N/Jr3
	TXf58k9UG0Z1mKvj8d7l0U3m59855JnbqB384OjB8GOweRxV3QFS8wQWLdXpQdhjwNJQnrhJpGB
	PPxXD2XhAozAJWYOn15inaBp8m8W4ODMSXVPvsMQ0JxdPpkEDxfZhuD5Zh5oBjWAyoPkvjONXm6
	HEV3NsrIAhaxIO+WOzHNzbT4CqYQTbEkEH5t2Ix9oOXVqJtxnmEELGEnrN1TUSQzqxqJgIPjVcH
	VN4WaY4H9MjcxhZD2RZ3eIuTOuU3jRiIJDW/Enz+etD+cACLhrwo4GgD++lxNkJWNoXqWanhsv0
	iSHoRIycGLU1Q=
X-Received: by 2002:a05:620a:6ccc:b0:915:7c1a:1388 with SMTP id af79cd13be357-9158a3ab0bdmr408457885a.5.1780495113833;
        Wed, 03 Jun 2026 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:915:7c1a:1388 with SMTP id af79cd13be357-9158a3ab0bdmr408453685a.5.1780495113378;
        Wed, 03 Jun 2026 06:58:33 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2d2bcsm1227544a12.10.2026.06.03.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:58:32 -0700 (PDT)
Message-ID: <bf77fa4c-168a-49ac-bfe9-87880b0bbc9f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX3Jz1mKpM2CG0
 VctW45XkgrsPgQ1YNitJF+U02dr7ZphGlWT77SXWpMv6sBZRRcpLfpMm/2WD7C8EYvnMVpYWJUJ
 JTQXydnuudbOEBHLu9Fqrie9qVDFhAThCPK0JUreDnWVpY2Hvf0Wxxfx5zQgxmprwXosW4R1E3/
 W0IOxUvnnJrxoDE9R/MdMnDFBNm3rqglyvwQN0d4VNNpJMK7CQhmVQ0b1u8usQhjhLNsNHjzxTh
 647M40Vyk1pFU76FbR3dMNfOjygeuSOORxkYoM/tTGszCzDw6Q2ELgEfwTkyK7q1aGv3JWr2mA+
 ONe7kJympcdl0gtJy3wljDCRibbXOYtkphUqtdugqcoYkx5Zp/c8Xva7A52WpHXGeuNjnPt1r0D
 Dpa2EnJyTbZwj/Ej+aby0RvpvvZZXrEUb5d9bQlZg7fS7P0xwYKIV52QVL2b/6TOgpC7IGaA0Eq
 oxYUq49rjl4NEYT+1LQ==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a20330a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B2h_tRwOUKtx79AgloMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TNPT3DufGqmh1wMUA07fSbRMjQLvH4RB
X-Proofpoint-ORIG-GUID: TNPT3DufGqmh1wMUA07fSbRMjQLvH4RB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37898-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A003C6385DC



On 29-May-26 14:55, Sneh Mankad wrote:
> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
> variable is only used by the threaded IRQ handler to control the number
> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
> register a threaded IRQ handler, the assignment is never used.
> 
> Remove the thread_op_remain assignment from
> tlmm_test_rising_while_disabled().
> 
> This does not cause any change in functionality.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
> --- a/drivers/pinctrl/qcom/tlmm-test.c
> +++ b/drivers/pinctrl/qcom/tlmm-test.c
> @@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
>  	unsigned int before_edge;
>  
>  	priv->intr_op = TLMM_TEST_COUNT;
> -	atomic_set(&priv->thread_op_remain, 10);

Should this be setting priv->intr_op_remain instead?

Konrad

