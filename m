Return-Path: <linux-gpio+bounces-38351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dOLNGtnaKmrKyAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 17:57:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9567341A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 17:57:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kEGc+5EV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VjpSuprW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38351-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38351-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDA3B349D28B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDBB34BA5A;
	Thu, 11 Jun 2026 15:55:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167132D739C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 15:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193316; cv=none; b=kgF394zYdtbe3NJ/tZp91nUh7uzkWHU/ViNKef5v2aH3GNrvBBc33pceJIv8XN3roviTysjpl3OSNCsQimmMYmWa1VOK4y1pGvOGjkJDKYbFXU22SGS8uTTICbnnSyKB5JhamOdV6ryD7Fs0M9bWzyqA34KgrOVpRnsJFnlcovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193316; c=relaxed/simple;
	bh=avkg9TFKpuU2Qu8wzOPGfAq1uMzxTaGqoNOBxxhNwhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWw52/BUcpalVUZ5fkxddmdOPzcoBN6QpwVygOvgci2RDeJlIMLq0Y4ypSKni7EA8nuBNqZ21fjXXA4e8BcZ7ZYguuF6wXw0CLlaiI/PRvwE58JObu8ZOBkNkWsgLEosbJnLUhZYc3RwKE5DEiPVxMEjW06Vm0Ia3yhpIDaGNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEGc+5EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjpSuprW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErmj1925914
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 15:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=; b=kEGc+5EVdD+n/3p4
	PYHPGd2a/ejc5G3gxlnFdNd7ZO57JmfPNGqGLTv4wyyqkwiYTbGJltHvyM8RVYAV
	EBb8G88EzN0vNF8uRsuQcFaQ01T+KsL2jAGKv7JVNLCbEHw/9j8+qPb4TCnK8YFZ
	qXfSc+zVkiGUZPjQBOPykYxgd7L0ktQTHRuEKy/IeKUe8J17GldnWN4mRpIXdgi6
	4E8KLRv3tyVhm9OgY6wLCsobLI1/6gD06c2XLrolLrVqbc9jAp/uvFErI9mWbbyn
	sstDrjCTDxBrTVZUtK4eDXQmlzzM/0B/MeTU4sB8swhVDzkng8S3LQGMW8lYe5HG
	gXq5vw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u4am0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 15:55:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so4179159a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781193314; x=1781798114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=;
        b=VjpSuprWEwUJBIq5bPFR4Sxa2YKLNSfUokA8XQypWLKsX1aLIkluVKcLAdq9GwGWSs
         H0s6NH72v4Ngqcy14TxoWzdLOk29MbmAwAOPcCHgfRLjg5uB4nb0JFP3JxymmQXt5utf
         wnW/aCL7DYJUgivo3SOnHIIgY3lY4Q4jbEtNClsgwh+VTT6JL3203PJlXiDaSS0opNla
         RRjBmK2HNtkusGC7IuVqtzo9b50VjVM7WpulYNvpHKLoDMd9XBy1WgwXNdWX/HxPebf+
         HVS1TbFxy7SAhHdjJCGpIe5gktan9x4RS8gXS1ixt6wXYCoAz8qZ26rnIuFFD9JWxhBp
         jXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193314; x=1781798114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=;
        b=WGHg4fVHtUlDhc0Ibk780WtmLY0nklUxxprCRZjkiv3+9S406LPeXPDEXFRVTeitXh
         T4kE+DXjPLhnKNVbbImlAzFX9S1slM4JFuqyysdSWYKiula021lnf9uayTzzD1xZgVHw
         vGmPMvBPaiOYoKa0tudABH+O+/qDTZzgFzo/DAYbG0LUmYXv3Kp0GArtZFlDGb3teguH
         ROQfnXAowgjg1HVyq6AXe2IgMlFwE9NHn5/BJ9a19IxMVpvwk64uNrvYBr7O4YczXNoc
         A8x+cxwFK/48TplJ70tL0O99CJsQlls/0rhD6OKyLlDQ69/0ewRXBqi0h8alteFpYJEq
         4glw==
X-Forwarded-Encrypted: i=1; AFNElJ9qL54YqGNAR8czlAMorh2UVIfQVcxHNB9UQfFtnnNmD0C/Hk9rpSTKYmzbmZaVuLUPq2biT81sdfyL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7I8MLpz+lAESS//7jAoV2l145DmMWkrUIRx2aG0OuFRrZnaHH
	l1Mp3Ba9HMkMRP0HCigB3HHHyLHF7Esxs12rYvPY//OyQM+rYdDcG1RtlxNl7mqrSQi00YB/QpZ
	g+vmoKXJqUsbSq0ghMUFBzq2gGBuVvR4DQ4CkEDsfv8tUD8ltqgMkLjgmge2rFnJd
X-Gm-Gg: Acq92OFiKp4pX4BH3Ns8wIwLqYKGYhJ77rMHCacVxKsPlINhA/YMLW8VCOaY0CNjkSE
	7pDuecUS1U3kAAQ2nZJpEEYEli09UA6ht5SVwKRVxmtiflW45bEy9kGN+J2A83r2G+DlZ64EwYW
	FwUz5efSSlN0UlegLS7vJNXLA7GStX6ptADZYHJxuPkYtgYSNJn5eDPgPeM+qY+V4Gi0GKY6GPd
	VKcHJnDF2V2/9M+EvEey+Dpp5S9Tkq+VYxEPwbz99QRjc0y0dbbl7eQS+O7BFDZP2F1ZM26E2ha
	SqHBK2YEN/XNQ+BnSK34SXMz1WaLwiCzobGR8uJBFdgJLA2/f2CFoSSh+C3Com5w+eyyzm3LLuD
	+cZwEl36pNjbc0fdzsE0VjFpAqHrK+VV+PlB4IUcJLv46P71Y9UTOQYvuH26W
X-Received: by 2002:a17:903:1a26:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c2f092f624mr37182715ad.11.1781193313589;
        Thu, 11 Jun 2026 08:55:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c2f092f624mr37182305ad.11.1781193312971;
        Thu, 11 Jun 2026 08:55:12 -0700 (PDT)
Received: from [192.168.1.8] ([122.174.150.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm360566745ad.65.2026.06.11.08.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 08:55:12 -0700 (PDT)
Message-ID: <69a97012-f807-43f2-bb29-f688f4a0aa53@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:25:07 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: remove unused lpi_gpio_write
 function
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260611130308.3415258-1-arnd@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260611130308.3415258-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u99XtAV9IA0tSOiSdhfuXYoL4KJDlTUG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1OSBTYWx0ZWRfX6ZcHCfsdqBlU
 KOOzDZL1ziaS1Fk1Edzf/890OCBMC9tKRzsLwb2oWmJ0SWO6JKML8lei4p7zU7cGWXnlNRvepbK
 vXyTrRQYZSMfC9GwxdzzNuFiRBXYmTU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1OSBTYWx0ZWRfX4EHK2O2Gn914
 jXcoE6Cm7CgPXipsJmgL89uWP8B0yDn2NdsxeXdWmIVWdNaXfK9m7ZvasILB6vyORJdDN+9nptJ
 eRhdb+i37JGbgMZ2gAQFLAFscnCXvbigfLLQIUV81jEIRMENEx0r/gMdD3pxxR4b11qU2V0+kIz
 bbpd+9WpJYvkKqiE+zaYZzTcPEQ5tKbvFKLSRedOzxTYVgKkS9Bt3oFehBpdQzfZNjo3k9jKnd5
 Oxrh6KAGYBJaiQlA0BVKkUIFW9SM6Rcs68rtkTHpMSOiHPj89/T+2tPiGsLXb2pZ6ebBhHMUINX
 4yq8fDTI0gXYUUNdJW42IdlQb7plhRrJCbz+T3M0iCgzH1CW18OCSMWCpBbT0Y09H+f/AyGhoKo
 2nv+ARiZQqeue5yD6WXKi1Cv2drg6fd3rBQKD0QrHcvgiGpR+cfdTvnRjuf5bxWMy72wLgxcn+O
 15SOmZkE3cnWIo4Os0w==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2ada62 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ph9GlEvSy1Vz2RjkXBjw8g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iL-JmrzYUvOobxPIQykA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: u99XtAV9IA0tSOiSdhfuXYoL4KJDlTUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38351-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:setotau@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5E9567341A



On 6/11/2026 6:33 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All callers of this function were converted to calling __lpi_gpio_write
> instead, so it now causes a warning:
> 
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: unused function 'lpi_gpio_write' [-Werror,-Wunused-function]
>     82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> 
> Remove the unused function.
> 
> Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 4d758fd117c4..fe7ec0176081 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>   	return pm_runtime_put_autosuspend(state->dev);
>   }
>   
> -static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> -			  unsigned int addr, unsigned int val)
> -{
> -	int ret;
> -
> -	ret = pm_runtime_resume_and_get(state->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	__lpi_gpio_write(state, pin, addr, val);
> -
> -	return pm_runtime_put_autosuspend(state->dev);
> -}
> -
>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
>   	.get_groups_count	= pinctrl_generic_get_group_count,
>   	.get_group_name		= pinctrl_generic_get_group_name,

Hi Arnd,

Thanks for the patch.

This issue has already been addressed and the fix has been applied:
https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com/

Thanks,
Ajay

