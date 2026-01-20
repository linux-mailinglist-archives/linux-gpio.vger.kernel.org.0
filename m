Return-Path: <linux-gpio+bounces-30827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC6NFZINcGlyUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:19:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D44DB11
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3B35B61F8B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 23:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008D640FDB5;
	Tue, 20 Jan 2026 23:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rd9XiSEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm+K/UQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D13EFD2A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 23:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950612; cv=none; b=TucsiKWt/C8LvGfz5dVmZVXqTwsuxFgw1bLgNjn26kATn9f9dPGq7tzNiM9lROXfVKz/OxAGFyPsf/HWMx7XfQD5zAfq2F7bEAnxnb5tdWbA/mgrPGXk0CuVbTYzvOqozanxuJIY/w1+khChZ5GslcbPZkD7uxp16rSNfV+UBys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950612; c=relaxed/simple;
	bh=NIQ/63GUhsFY4Ery9iMkeAbTHqYRbg38gCctqbF4YH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRbE9TOJZVmru2nDjrX3rROOkwyxv78xKwpk9dz6Vim6KT0gP+D3zL6TcQXkB1hJ+zdxBMVDTVhc6b02bt49b7YTMgX5SPOWXWCmPP1SZY52qxnwhPuU2yZr2uTHz3rIRj/P9ysXzaacHchvy1D+Q8ZP3SwCDaacD+65VRUHBgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rd9XiSEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm+K/UQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHTX60824738
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 23:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44UmTTgBaVFchfd+hkGNFFI2
	UCRflmj/K3ek7ABjrvw=; b=Rd9XiSEmAilOWCIh6ILHGKPb+g1/40P2AeOPOu3Q
	RD2MpbC82wpIFBjgNbBngIQ/eK7bF/l8kyUOapiJlWo9seI+detfgG3jutElEHfd
	I5y9UgVom9WQ1l/MIUyNMg1jPxQkE+ydg6gLKUzs6wsC5B919lHRIl5HsFFrpLwU
	vgj8pBknRjLyezqDDPAeFhnj9yrDYCJUnWGIZLKh5DrILZ20JmesJLT/4pUuzhqo
	cVR4pVi85Pobrbx1pSc9wN2cqQuxLLm/7DV4CvefEYfV4p65oIidJLbQxIU8Sqh0
	mRdVIPBeYsRoqJxdexfslTP7PX1A6jwgluhcxOIF13gEKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e14f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 23:10:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso150888285a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950608; x=1769555408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44UmTTgBaVFchfd+hkGNFFI2UCRflmj/K3ek7ABjrvw=;
        b=Qm+K/UQLVgnJh1AMoLApQhrspYftLvazvHgQtR08y9CwSvsb2WOOjW5yVEozPoO3MF
         EtAFfaiqeTH+0XpqLBr4qN5qscYkw4yhfudDNZF5Fe8z7DmFhC1IqECnSFHsjBwLPsxj
         i0NL1ASAu1klsOwhMYDPCqZLSn/arVh4UW94ET3QnNU8vurrlyIb2+rX8IRnWz8DhfxA
         kww5UQF8D2vBANh7oAjLtky8wWFNg8fGSDDNXz2B97mnxBTE6uSZN2GMGTEs8oSLZBjj
         //LOUebkYPkw05sEBRuLuPeUjHNS/42PK6PIOW5EVQZ+bkkdyPHoWHS2qT+oIl8iDrZ3
         /YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950608; x=1769555408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44UmTTgBaVFchfd+hkGNFFI2UCRflmj/K3ek7ABjrvw=;
        b=ryYyrdxRSIp16EvMEmJVAt3ndqFiZCMHNER+3TNJbSp8gz545UhuQFBM6WVs2UBSuA
         wFjIFDAvPY970+kM/erguJ7x4o3LaUsJsQ8huL/941k0E5RuhHwDBeJpB0qoeh+SO7aP
         Rgr1p8mMkEMsAN3AFN1PtfUpS0LDGoiwmIj1vbUniWEYi8V5F6cF5eKIQd8X1Ta0oT18
         Jc7KnScQ9LaRTKW1eVmTPrChr9EYMOXfdG553bEPDJE7bIZyBRwZpXj7N6NYMQjUKAs0
         W3UT13n8nUM3aAMuFkR35zubXhXH+DUxdxW/33uz4whUThj+sAnaA38gtIETVxxAxiVu
         r5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcCsRfAREJng9mOX3ZH42e74zASXGY99slBNUF9tqjc6WjWzA5o/34H1O2zAWinpwnn25CMITohlUG@vger.kernel.org
X-Gm-Message-State: AOJu0YwKgSS6HwER4L9LbLCvE9T2yhj27LUqr/7kskYIPtL7iRgTLy5O
	Xt9RbLurGKE+huZMIlQ32OUogG9nYSMZWJAO6MoGHzYLkT/h8/QEIjwahjpqtHZbsj8p8l/ov9c
	ZFHrN4lvQh1eWTJ3DB4ZimBK76M7lET93UlJCs4kI5rTEwjW69lz/BujWwMQwlw4s
X-Gm-Gg: AZuq6aJ6G3GHvbuAa0afN0DTRBo0Mh8UGshi687soAEnuEq1IUZENE7P7C+g65wPQjo
	RR0a6uYE6JIapfAo42ykOlau9+hyZoNMURXqTvCI5WAAFLkdE0KjMho0s64TWPI2fBcdoJZI6wc
	Ra9BMaX/5bJUCEg12guYgSujH6M/gwMm1t4nawUcQDdMARgvcdAYpdCChR9hQqIXNcYaPLJVlu7
	/dzXV0Vup+p0PqI5VYz+XcEUfOHItAaO9TkpbsjwLpOyLXss9p+3E3912ixkMxj+V2AuUZJmboi
	Fvf36BsWwYZvkuX8RKbkaOSqY7day26eKhrglkwql9zoyOMSUysYBhPilBS3S3wkZewP+RvV9Vi
	j11gIXs8CR2Z22uZqtJt0/RxiQCj5GJRdjKsxNiKCl5cMkFqv+8weL/xBoJFsykJAToS9Dyboza
	SXVGhUKdM1wTHUSa9o6Vf2xMk=
X-Received: by 2002:a05:620a:254d:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c5919e232fmr2803739985a.28.1768950608082;
        Tue, 20 Jan 2026 15:10:08 -0800 (PST)
X-Received: by 2002:a05:620a:254d:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c5919e232fmr2803737585a.28.1768950607693;
        Tue, 20 Jan 2026 15:10:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34ee9asm4427103e87.31.2026.01.20.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:10:07 -0800 (PST)
Date: Wed, 21 Jan 2026 01:10:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: Add Eliza pinctrl driver
Message-ID: <65yantz2u7ahritw5nvynvzsfo7zwy5kycr5km3b3izkgngjsz@jvfzmnw2mlte>
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=69700b50 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdvXttJtJ_SF0rQpgKAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E7NdUmmi2Ky2jpmrGuOWpFHnDT3aapBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MiBTYWx0ZWRfX5X4gPNwRRH5H
 d59CvUixCDZjXTmlQQDPJvtww95duQjZ9Jsohm29DzHCJbHkz+S0JRjbfkfBk6Xv8bnCYKOf8I9
 wHvdCKMP9AKIhITd+Nk8TRDVtTa5XwezjyVpOBv/bvE33X7NuBJpV2dgjwm6Y0ebz4d1sZ++5rY
 BPNoNxQkxLfnK1U6Yv8ela8kjpvVY6WI/M/7wusxm+8qRfEBsE0EhusPWpZxo3QTxCXRBJZAfgg
 /NUqYkqV5n46VJ3wluqUDx+49ikX3QZNPkQsh8cM0z0pDCzM5BRXn3NCFonud8yZei1LrU02hjo
 133KEFT8G8zmqpWA6pGxbMWhtj2MBlhowFU/Dd+JIHWHF0PIxif5RUbPqY8jOnY2zuWiKoP+lqb
 FGOsG7eaq9Uwf9Dos7TOLND89Wn0rorijkffhx7fxvwXz0xDrq5f1wdEU+INfKhnIse91pVEQ0M
 8byCnX9ft34j/3XnaUw==
X-Proofpoint-GUID: E7NdUmmi2Ky2jpmrGuOWpFHnDT3aapBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200192
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-30827-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B41D44DB11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:56:41AM +0200, Abel Vesa wrote:
> Add pinctrl driver for TLMM block found in the Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-eliza.c | 1548 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1559 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

