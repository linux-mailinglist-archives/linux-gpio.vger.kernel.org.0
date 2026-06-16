Return-Path: <linux-gpio+bounces-38517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /jq/IrifMGo+VgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:58:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25168B1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h+EkXO7z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VCTB8CZR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38517-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38517-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A94B63056FD6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 00:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6286261B8D;
	Tue, 16 Jun 2026 00:56:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0F19CD0A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:56:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571364; cv=none; b=spOEiYRCV7FLQ1eNkm0uhDOilBEgOD5BCda54vCWjNMFHduGBUmhLTKolWBPOQHLr/fgd7g/828SqcRXi1EQyHHmh2L3iUtQjYqPaWVlG58SDBRi2SJk05iPVraqxQr2qQ36A02Ss5dtcKTuJDSyYm9/VlmAQ7aClE9Ka6Y2tSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571364; c=relaxed/simple;
	bh=Le+5z1qmxKswaaH2tm8lWknAiQ833FKk4wBZh6IX6Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfFvC45Heto0CpDVpLaJMl7ffh3rS7OdYLgukopsuz/bQ4L+xkjm2YTYBthRJ2UK/3Bmyy7rp98QIIjLBzeNejxLOeeoxoh3nH0hH7ZoPTC4h/SOnFXQxn3g3Qj2egI3AyGkbUKh8s3CU5KGzYDMfUaJqiOuIVcXubnniIdGK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+EkXO7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCTB8CZR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Nwdd091267
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A1iD0hT8gPT6LyNlMAYMTMam
	sqTnUn9lu8xXjn/UQ5k=; b=h+EkXO7zrlnwszqh0Cm99Fgjtb+4bIFzTiwsmgty
	duOZYcdRvTQy2eg32tQjYaF8HYOzKRFzsgTYuzTIUVDu4/K1zmiMO1uWCNF+qexi
	yxNvexShMLAOF0BMc2q0PvNDALV11aud296i69TZn5XdNJZc+MhXi9x6gaOgC36l
	4tmvdgofzdtoY7sl4adb0BUAJHG+sed7XldF0qGv856Y34kr5BDFn2DgDm51Dnk8
	301uziC2XSBEJInx2sfNJ1lBmxyATk0M63li49FOZmqSjji11URs1oNzTkIRy9z1
	GWcppYHIFyAkeuss8NUBZWwt2auMjNmmNi/IVthDH6Mb2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete9840fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:56:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157de5360fso908096585a.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 17:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571362; x=1782176162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=VCTB8CZRsYUUNm/FsxmJhMOktXwONamNLr2YzXNijcWXG+17v8zhfqfyylSV11t0N/
         WVo4fbJCNr6BeEGKGADhnThD2VTKGOklDV3+Q94SWZ4Kwv7juCmLX0eoAkKg0vkTg+I3
         9QHd12DCIIbPrTTf4g3gmqu7+xne7Bve8HXcRHbR0Qh7o5rjP4z+chry574c/kA6Noav
         k5N1ne+A78q9iFn48FJseFmYqSrM2X0U7NeL+vrUhH8gGgiYIz8RFYOZRXWknbIicG6Q
         /j2mMF1hq9OqE8sZt+vyCTz+KdwgXRDKzGXcLRJYiGoQPWXKdxLEbX1dTMbMcdOTUedT
         MDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571362; x=1782176162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=QN0CQfxoKWZbn2p3fjnYsoxuaPfS+1NFVBOsGjj1B49CoD2/61tI91ITlCq020CTOV
         kJRFZUXXI/whgYO9oK8AGFVK0i+AaedNNSXZRsvav/7Ov6PTjb/uijkAAzMM0fZumw+k
         jUkBXFTLNyco4N7Y7+axn72xrOCiHW4oC2EF5Ac2d0rlg2DsWPJaS/2QZW8pB0yvGUof
         70G0bW/L5fRArtQnDvUxX1wgPb/9R85nu69/nnftW4BP/pbKh5FFE/aBl+cUIQs4+/b3
         0ggq/HS+lZz9F1vlfbvnXp9UYdvj+t7VqxVVQ7eQ6QqWznWpBpzQSQGs3BJMDj2qK9dD
         M/fA==
X-Forwarded-Encrypted: i=1; AFNElJ8EJfOj73BZ32hxQlIPmQQ5ie13muA0kQzSgiWwKA1aDcGgYAZzO0BuZGdnt5KLX2RZYs++CZ8nLjth@vger.kernel.org
X-Gm-Message-State: AOJu0YwXKS6lkVYkcVFUssTKNV3Es7YtnsXyOusQu+hdPmggnG0yMpeJ
	Bbyo68pndy00XDLaMN5oWuEdqytB8oQgpk4Ob6Mps0dGQNOUTA5F9aoJsjcRK9DdCuTd0RNLVss
	6UGBE2MMLpONaL4N9OpYKgUBlkaEAcr47muPvJ8TB+pPSjFJvrFHAWdTCP5i8l2Co
X-Gm-Gg: Acq92OEzZUYe/br3WJ+SJNuI5NNrgZUORhwceaGmEXfH4fZUlhXQiteCJFnzkhWJXBC
	SaTajpRshJlYOame056eR1r70kls1nAk2nFMWXBrQBK6zLxelanZeVAqNGPdZlNEsjyXO3hUYHb
	bcfQpC39wB7/er0Gnv5/SpP65SlHWS1iGrrJC1hg3DA/Pny7YqqC5NBwLqd1XpIbZXQAtW3EpAL
	zcmaLYGQQzwLy5lW9mlzlly6E3o+W+9mSPzbYlVJIYM7pqMSavnb4DLl1sMKEhfgTCGLXhVoteG
	SROmWUmycyvgKLkoSIO0p2IKOUjCC4DllqbOp0xpAC3JiCsLasZkJ4CXWlOw32c3iKXnp3D5uKK
	p+jxVk8t6LRr8SVboIf2UjqKluI3vbht2OPV8Zxne2xxhzvg5wmHN/SVEzmpQU78ehKlUdLBNdd
	9rgXYhdD+T9yHKpdWsyDJJ5gg374xv67efGgg=
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261733285a.39.1781571361976;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261730185a.39.1781571361503;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7333sm3082627e87.52.2026.06.15.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:55:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:55:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, g@umbar.lan
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
Message-ID: <5fwiokm6dgjulxp7gkdld4nvashsuzmaij7qr43tsjdg62vsph@b2ogs3jmnkek>
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
 <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309f23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3KcoXW5xE102B6w2v2sA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JBxy3-4hOk3Org7qSdtT7c5ydy3K4GVV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX5PJgQyl7H7jl
 2hBH1i3OuxX9b9psHBgVX8tBhlUGe/falUceKEP0OuNgGXttw+J/a+VqcdSdn63xpBoEsenkktZ
 ISuYLODHx+HdOfRcXLVPap/6qnlinA4=
X-Proofpoint-ORIG-GUID: JBxy3-4hOk3Org7qSdtT7c5ydy3K4GVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX15Id+KHtFxDZ
 hiL3JvXoABisCIjsroA2p924o+n1crGMhM9MNtNbO/tirVzl60MqU1RcfxxzkjzhVwJBQUoM2YN
 e4WH5DIR5/brJo0UCUFRGaQB0Z2ZKsQfijnCKtaZkx1hZBwGXZRqx1Jl7dHddCszY/5R5cPzfAS
 cv5qdgPyKfAaJYaj5jfZxHzJSnqTn2EY2Z5jA8sti2f91+bfeRCmY9Xm+JkQWyXMdQYKAFsik6X
 ShT5UTlIlQR9rBOy0F+EbsLGrH0Ww09HRtNGxQ4a00ejrczXrAma0RARaf+YJL7YKyzPSkHoYGO
 DOeAaH9Ii3SCtNaS1aTnpnMna20k6QhvoAgXjzzywvbyi3xd3HeibkxaY6oK8TqGFk7drcv1mLk
 s7j3YtpFuncu3nquMttTG/EJ4UXEYYG09sF9nkPlhiicmaknbTR0J+RXdghCoqFDWii1/8jKIl6
 x4jCMQ6VKi82y6OfVoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38517-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,b2ogs3jmnkek:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:g@umbar.lan,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A25168B1F9

On Sun, Jun 14, 2026 at 11:55:04PM -0700, Jingyi Wang wrote:
> Add support for Maili TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1641 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

