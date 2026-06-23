Return-Path: <linux-gpio+bounces-38847-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWHKFvOpOmpADAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38847-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:44:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B26B8677
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HT/954ll";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUqbHVnQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38847-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38847-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4638B300F244
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 15:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3B62E8DFC;
	Tue, 23 Jun 2026 15:44:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A82E2DFB
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:44:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229484; cv=none; b=X0jzHmLGA3PGIQi9uixwbC5KKQZMsxyhfaXySgNBAbUVqLnIaXr7k3oY7F1UGVsro2DcurLelyBJ/kCouxl85zr+Rf0rZ4NvNEGzi3G7PkXEY1axS8z2EygiOAogBMWmDBZ5T8gMMsywETFXScE2Hnuyt6oYJe1Btwu+X9ytYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229484; c=relaxed/simple;
	bh=5ONVug8nAa01E9piHuiJTq5LtimGr/ABGC7Bw9PkVy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf9ekei8LyctAKZ2w+7gJgOh2TTPpMoI040vgZMuJjITGvjPjXYWtQkb98M/lSB8ZkF6CnYK+D+B3Ol7Fg8XaVKLG4B6e5FHyXkWDYGLlbyfnZTOotHsqnepkVklI4+Lhlhs0hLG1KeDkfXqLZGueDE8oYNAXWR+r0LHJIrp57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HT/954ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUqbHVnQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6fCC3744630
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+HIDiWAGw/56UY/RFo6H6mTV
	4Hx0VKXI9wo+A+8JFSE=; b=HT/954ll6kAYDIoyfPTso1ltgj+faAsNz3AN1rxk
	+sHIgPZcI/Hkuy8p5eOk7RKUrmidOaBg+2hfes/zLjAN289C0fHlJAYd2vpRn2xU
	AYqppqBqRUDRxAedGndDFufnKdRvn6/DWgzee8fdAga3TTN3OqDq1/pT+uWQnCu/
	PAs8KwZgXEdw2H+57a0VZE1K0r5ifPKnhihs1OvX666XlEuFrlDIjJfXbuC5Hz25
	cX416VhTJM2OBu8id/uEIAb9SzzuxTBPXeatxtoZQ6dyv0u61fI7oA5fMi1dbHsR
	CbOSCCnTz+Sw7pSf6aTHWdEtcsigC8eLex3PSqfTYNxlAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3gxxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:44:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7403e80b0so52336265ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229482; x=1782834282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HIDiWAGw/56UY/RFo6H6mTV4Hx0VKXI9wo+A+8JFSE=;
        b=LUqbHVnQ/SWeKXTILiY5ws4ySKcWucfgeZ4nXCBQ0kEoC8U++/1bHer05F0DLmeahE
         oHyT006JDwcXVAShdZmxVTN78fEbhPcCOogh6F2p6t1vJPJcRk//XpyIRI+T8KoB6p94
         vxbq04ptRcgkZZLGXX3saLyF/a7locZzObAQXZvfhDfvA8PZRZwyxckKxiKDre9eB1r0
         Bh7wCdyGIhpiBdIkcKOIHrVIXuyzNgXt3C78dHRnNPJ4QMwviicWH75gA5x1/XGe09WE
         kvJv9BdD32ZgDVc7nZSmLXL3nlL2ey5jvQt9YGddU7qyL36RFYH2rWZGIO/CzVzljvQN
         Hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229482; x=1782834282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HIDiWAGw/56UY/RFo6H6mTV4Hx0VKXI9wo+A+8JFSE=;
        b=JBx7k2shPoncke52WFcys7QJmusosUUXP473i32MOx4CCoAqjFeaHKts947pgcOXXy
         bWQr/OaIYW9cDyJM53bdOjz4baM9Cp+cRKD7238FjAOSBztFtBLqfhzWs1C5JiYXU8tw
         4ngJ3oyKZB6JDAPDLdlyYGXOT7zg1tbD7FI8t+c72tV0YUZ3/k1UEbsr1iHCEGE1wACj
         K4SDKyLVeN/IcTPEPC36hKJb1+ShyTVOMModSCfZbbjbHL/s6xW5cW2Ycdw5dR6NYkkd
         GCjH/28CiaNgWYwlOUjMLWd3/ILetF6OMh82+MJW+EDwRinuuOfORnZxybVdhjtVPUay
         J1nQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc4sH9cvIc/jiJNti4gtT2MH4gWSeJAiE+uxfwCHD7d/rD9uTzQGwcyxOgfNGj7+wuHTiHPq00QB9f@vger.kernel.org
X-Gm-Message-State: AOJu0YznuegfnMhQcXOZD3qeGscRvrFEHYz1nHRbMapJ0HDLfztcuCbY
	YOCUD2yrcqgC8kseekf3ZQKq1lrTaM+6lYzV9smKrAv2zKe/cdATkMv4rYlN0YpN80+I+vckET0
	Hltgp2E7UegixsWdPDpb7n8XkWJhVQYW8KGhxcTFyGGoWn+XvStP8Z2CjQI1/GerLxPp+cALu
X-Gm-Gg: AfdE7cnbkqWn3luvxqgUxwbzdl6pKwdmfDH94YyF7gl08uEalXfj8m5l3DqpN4IH97j
	e9VC63PimCWe9W3vwM9TveCIEZEV7QeDEJVVzoQPYL9mRtCYISxxDc58xHv/+dp7ym1WTbrBIMv
	OFjL0k1NmFGSiy+1UVUPZ5FTI8L52hcbP8HFBRnDGASLsfWv6Uvcme11Yl4EsWxsq11mhBUPT3u
	1sNfdmAaayJstaQAk4feGuNr2oW9btIRNN92anTyUqsl7BYzSkl0Jwoa4pKHjlBxHN9+po52MmF
	Flbq4wSDEJ9ISBiy6433S0wQhorsw3nCWYPOW/odlfNQb/pd5DgRpcw88A72PkCzEhCHyc5c5N/
	rVm5XtCOebalxCbNUcRK/qc1ul5q4/gz0AOqW4A==
X-Received: by 2002:a17:903:3201:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c7c9968fc3mr33672465ad.16.1782229481825;
        Tue, 23 Jun 2026 08:44:41 -0700 (PDT)
X-Received: by 2002:a17:903:3201:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c7c9968fc3mr33672105ad.16.1782229481059;
        Tue, 23 Jun 2026 08:44:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f85f1sm115165805ad.42.2026.06.23.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:44:40 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:14:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Message-ID: <20260623154435.uph27fs2rhbvmrqe@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX2VmJNPJClN9q
 lZ2E3GTfQ/XnjshNAhvJGKXRO7sMP+FmzuCG8TsQKPy8lr9uMMHkkItqM1w7HngQqeR6I45Uq9F
 xZ+0JslzPxqDRjDcHcPzRYdUsGM1hqg=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3aa9ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: s8-dtDNsJ7JpnAp_wt2gEAkOKgAKvGoZ
X-Proofpoint-GUID: s8-dtDNsJ7JpnAp_wt2gEAkOKgAKvGoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX+GeNpvWYGWoa
 Y3XNdTc2M3qBo8i3V8DxHT1r8hm0AJlRgj6cfHaerKkd+K4dc0lCZujx3yoW2vjMcn0oeSPBXM/
 xZ+0m6w6nm+oGGqsu2ReU3x1EjBOBsg9+enf9tX3EBDFJTqpuzQWmyN3PHzm1ZcOk/9OViKpF3G
 Tvzfx8cIndI1kNzN8VqpillDUYaqzRznU6eCJEbPiZUhT/4HiUiLJWdUZbze0zaR1Fn0+BePnlz
 K5Z8cKO1qk8L3uly2jkw7ePrpBCtSiMcDYE+Ew+zWdAy9Bl+VwzP7QsVj409cc5QEQawwK0cl5L
 N0m85mAFlxGV4XP+zsNMXtioLFlfjnWp3MaaL5OsTEhxTeIYjHAZDni77pE7GGrhXk/PgHKNq34
 cbNMroPugfw2pSv5oYhwTWdSRbsadbRMhgPMnFIx7uBWTEocuxOHWjq8wEo8SoQeupuIa5etsPF
 YT63hIpkhlBe/PfFF0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38847-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 445B26B8677

On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c2938494c6bb..419342ab45e1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>  	const struct msm_pingroup *g;
>  	int i;
>  
> -	bitmap_fill(valid_mask, ngpios);
> -
>  	for (i = 0; i < ngpios; i++) {
>  		g = &pctrl->soc->groups[i];
>  

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

