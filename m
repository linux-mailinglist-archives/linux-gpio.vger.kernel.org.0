Return-Path: <linux-gpio+bounces-31298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJxBAalVe2k0EAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:42:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF6B01D5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28D93300EA9B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360D9388847;
	Thu, 29 Jan 2026 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLRYlXli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/Bp7pGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90328239E7D
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690533; cv=none; b=fclekki+Eujov/HAoO1PdY//2Rsuc74AnKH0hFG0qjGEJaagw1k7j5gctXFyvLdK4nwblUAlLV0nI2I5uGrFbR1c/dY1yAh+dbYd5yovq+FHpL5qIjzi0JuOIF07hgsykmf1rGp5pKwDf7CDLZZeixZXArmztaATxgTMZLTDLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690533; c=relaxed/simple;
	bh=V50bAebFDOGb4RX64dSV6dqyZTtWIqPpS4w1uJQC/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW/AtuevSbff7rKEvj/G7vfoWShU/KefdyubEX2grPMv0nWYy4/+bn8sj5vGsi8G+1zLHqr0Xs+gpVKjgCpb1//nQvxmfPZUYA3VyfZVPCPDC4Tpvs+8grPTCtehSBD+q3Cn9Nl77s17ivH0m12LB4I/GRFQ2IKcWo0IXTBVDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLRYlXli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/Bp7pGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAR1ZZ2502305
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=87UbS2etxduhxKAhxCndhfrd
	t/xqpPlJYUqPn+CthzE=; b=cLRYlXliuJ1n9UKhKdTUQZqdFI4ObLOwIFzksJp7
	lAj9CLCPYtuq3VToihs115/7FroSZKMM0ghd0w9cHzc1ecpPx97nsmVWdm8alAAg
	IO+EYgMeN+apmBkHT6LZMGfcGOgjdbTGpuE84eKPVsiiKwU5wFYfq9XjZ00ML600
	vzOk6CQoqstWu/rKiFr0lwNHGUhrjvyFa6F/xvfdYa39CZ/J+QWr1ZNAmtfUCSVo
	Vhoi8L28cnJGzKU0MkPM8umuz/f5LOC4dXzroXbIF5hlqCgvfRVURqj0GHci011K
	9Ub8TalMwDNfb+Qd2+DTV2Tnbja+qKiL3o1kATD6tDyk+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbrbwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:42:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so116622685a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 04:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769690530; x=1770295330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87UbS2etxduhxKAhxCndhfrdt/xqpPlJYUqPn+CthzE=;
        b=M/Bp7pGSlDAw29w/T3rYitP3lTKPrr42f6BwGgTHjdEXtdgl84RflImw2ziqtqTo1c
         lvfDwOXLwvA/L23sYpxc8o4spDgusnd6GrkqgG/rVhz2SXR/MjGLGVukljTSl20b38S1
         MydYvFk8eyn47+v7ct5GzuTN5PfVlad63dRVT2HvZh7Nh6z15wc8Ki8+ITlW0SKrKQHb
         d0yLLPWrh9H5TQdwHRj8q++p2w9l5hzNnFoSpzPpwKAYmRaZu1uSrIDlVDa0DuI13Bap
         7tCaeCRrWZXU/yQYddcH8+C5tY+5mvzOS4BIfFjzCREr/LukKr1tm+8zroY7oCa2HjS9
         U9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769690530; x=1770295330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87UbS2etxduhxKAhxCndhfrdt/xqpPlJYUqPn+CthzE=;
        b=dtKc5uVsEm8sDyS/UgwYrl5JtQNR0N69mVWlSPGDLNRj+OMf6vOqASAnF4C0vvDcVS
         GQfRrvNBEftkb6Tv2lwvCNsU3QRS0JtHUFAu8vMxBqZorm9IurazV9mHOsqtAmJhQmvB
         n1DqdF7yuXifOmaoTfCTRZ7zUALoUzlbDARXX0XpSqoh+Kc7fj/eATfThsmHpc3b1ccF
         jZSMBnPHqJdxuhNgPTRLLSBz8wHWq/7CxcPO+AsKkxAfVUNuVl2MHYDMpNQVUJHQOCUD
         tZiLIqevIrBOaAS+u8mu4JJGk1fb9mk1whUOh8/G5wPkmarbK1Zf4oRlJVHhgNtgPhQk
         R+WA==
X-Forwarded-Encrypted: i=1; AJvYcCWSD0khv1vcU93wZ8aNy3Vb6lHJlmhoMxgnyQKga+09tev8nIKD4N4o2Qtde2LsM3B1tZ6vnWUXzA2w@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuY35eRW43pTOBc/yvzk/ztZN6Gp5RM5Qu67q9Ag0doYeC0y7
	rGx3hzkH7QbYy6P3sdwfGX8D3hqAuGX7vihMEl0J9vNt3mMrZWzJguthGyoTvI2Cg54BIu4kcfH
	mfWr8FgLVSTr9q0Q4zufiaJH3wVpB4ls8XpyqWwU+WE1+tjZEelf7bUjUbRNUnscN
X-Gm-Gg: AZuq6aL7sbzLgQFAKWnLbfFKeerdMwX5Sf+jFiPtXSqqjkyhlgTAr0/uW6GTCP/HO9j
	iqNr/PRDcgWtuIqpFfw4+K5HFjtvd7wsZzIFT5dEN4DQOA+zBTlrfvdsXkiE2/zWzaBU+fZ+Xr0
	OuWbkVaEShTin2M+f2YD19qpVWOX1LOWoaVAUvDvyNw3vsgoni+wQRaxdkYSP93HIuHF5avQV4b
	23wCV+xKxSAL5XHcjo2f4xftvx4kQJ9Ae4jNTM1Uy7gP0sN8FH5ZVl2RIdQQ5fuUYOqIcIJTkfn
	1PeXyXdBq8ioPkHfXY/87vXdYCClRGDSrFBhE9uPe+UZuDyHLvMstnrmpkn1AcgwWn5a+GR8blf
	g5DtjLTX694lAGEVFG9lr+/Zy
X-Received: by 2002:a05:620a:bca:b0:8c5:2f27:1fcc with SMTP id af79cd13be357-8c70b928fc0mr1211209885a.88.1769690529576;
        Thu, 29 Jan 2026 04:42:09 -0800 (PST)
X-Received: by 2002:a05:620a:bca:b0:8c5:2f27:1fcc with SMTP id af79cd13be357-8c70b928fc0mr1211205285a.88.1769690528988;
        Thu, 29 Jan 2026 04:42:08 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm126020065e9.11.2026.01.29.04.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 04:42:08 -0800 (PST)
Date: Thu, 29 Jan 2026 14:42:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <flr35di3ivjivnnkrcnwnurlzhmf43i5ymtgj3jnitexcm45sa@jli2o7qkb4tb>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
 <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
 <6244680d-f6c3-4aba-8e12-61093e51f76c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6244680d-f6c3-4aba-8e12-61093e51f76c@oss.qualcomm.com>
X-Proofpoint-GUID: oLPC8iFeeaUq8aWAP-_BVz-v4rsAtHrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NiBTYWx0ZWRfX3V/4fRRCi4dy
 t8/E1DlSKe34G7AjNXjexxkq2u27syfy0IzLuHnUMhnvnCs9kZAh2FKdkCmDfWJko9ZCJlNgECW
 TtSP4JBXbemcaq0Tgp757r7Pnz7aRyf+F/BvwdZRNn2qDTbgNmeVAiatQCiyeBhT7hB4uIcWPot
 wL19/JnxS1otmcELaDVt1jZMNbJgqLd7yd5/0hZCojYMxJwAfNA1v9vrkHk6gYmbLs82MbSWmoi
 G+gGWZq1YFPiTdkYw9uL9rIIVyr+nOk8WXbJXAIYfJg6GhNm+51QEzISY2gnaJHTFHir0XMteT9
 jmEXSmY5E1oU/Lh+9L2Rlx8EdyimXwc/bTx1jGdET6UUlgUJrTchUnHYRnXmqVbfNtnZHVcTf3e
 b7elSYWxjz8f5iS4ubSC8WjCjmLdQqLK8BvTwifSJHhMuIsq49qfrhsXpR+kAXx7Sbbbmii+frg
 NY/vYbvC8ZD+A0ewvwQ==
X-Proofpoint-ORIG-GUID: oLPC8iFeeaUq8aWAP-_BVz-v4rsAtHrj
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b55a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y5FBdWo5SMmhvMHQH2AA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31298-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53EF6B01D5
X-Rspamd-Action: no action

On 26-01-29 13:04:23, Konrad Dybcio wrote:
> On 1/29/26 12:12 PM, Abel Vesa wrote:
> > On 26-01-29 11:45:59, Konrad Dybcio wrote:
> >> On 1/29/26 11:41 AM, Abel Vesa wrote:
> >>> On 26-01-29 11:34:07, Konrad Dybcio wrote:
> >>>> On 1/28/26 6:22 PM, Abel Vesa wrote:
> >>>>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> >>>>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> >>>>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
> >>>>>>>
> >>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>>>> +
> >>>>>>> +  gpio-line-names:
> >>>>>>> +    maxItems: 185
> >>>>>>
> >>>>>> 186, your first GPIO is 0 and last is 185.
> >>>>>
> >>>>> Actually it is 0 through 184. The 185 is ufs reset.
> >>>>
> >>>> The UFS reset also happens to be a GPIO..
> >>>
> >>> So the gpio-line-names should include the ufs reset,
> >>> but the pattern not.
> >>
> >> Why not?
> > 
> > ufs reset cannot be configured as gpio, so why would it be part of the
> > pattern?
> 
> It's certainly registered as a GPIO, as all users of UFSHC refer to it

Well, technically yes, SW-wise. But it definitely doesn't have the same
configuration fields in HW. Anyway, that is not the point here.

The point is the pattern has dedicated enum for ufs_reset and gpio185 is
not even part of the gpio groups anyway. [1]

Also, are you saying that all older platforms (sm8[3-7]50, at least) are effectively
wrong since they do exactly the thing I described ? :-)

> 
> > For the same reason, it cannot be part of the gpio-line-names either.
> 
> Since it's registered as a GPIO, why not?

If what I'm saying above is true, you can't configure gpio185, so AFAICT you
won't be able to name it either. Or am I wrong ?

