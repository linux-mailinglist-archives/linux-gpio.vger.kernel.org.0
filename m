Return-Path: <linux-gpio+bounces-31261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEh6KhCuemnv9AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 01:47:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780AAA5B3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 01:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DF68300FECC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 00:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F47F257821;
	Thu, 29 Jan 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7K2Dy2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSBSKRYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6BD1C5D5E
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647588; cv=none; b=rOgqKRu41MlWm25R+XEkX7FUVwrr3gRQ9XuoY5bvduLPHYtnsEz5/Jcb/RcyqWde1c75LFlEtWequS6+ZV0RxBzPTwNS8OgJPlOSCQ+8nAbwsQfvj5wrpr/agNuos+CvxWb+1bp6o75mrZ1rTCCKXiim/6ZJSZVZRAMNSFbcA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647588; c=relaxed/simple;
	bh=tJl8AmnkxVmtzONaPOUMaRuyfFa+3zLHTQjBIOt0jsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKdVPAJ6RfrY1yCnczOnx5TC6UYpWLrzAKO6nHwp3vZarvhtUbype9TC/lNHd1N/ufnIyLHsAGyy6XgeCONyj3DdQap5DIuZqyQ2u07PlWPCeeShIFaK8QQoLRv55blLe8KJ5tla8NWRaCwNKFB1qwthTh2nxO+h9HyZuFcvYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7K2Dy2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSBSKRYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH7Ria1129415
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AtIWJ2oqLHCj7NU8VYbYUvp0
	nuWKS9o2KY3yqQqtkfY=; b=K7K2Dy2G36aDYEkBEnUzco8YhItDhLxt5MDMCjvT
	k0hChKdVfKZxZMGUNlzpmsdXLsRc8e1zrGBCmQGU/5pXTm/38ho5U07Cf3aEEo6F
	RzWGoHHUiau5Fv0pHhUHLnXhezs6VIhQK0dS4ZKLtp4RRvBsj14oVk3oHZGeU3Xc
	rKli40BaUekCHwWSnfjPa1krYTOVZcvSDMatfCuWb94UmksRKOUQ1DndZWu/asYA
	85OwbQVNJ+utqM6G9MEuM8aQf9QeBIve8ROxuZRJTlReQWk8Qw0mi6ehsgZ5Y3do
	DlBXFE8uS7dhJEwTCfm6i731t+ZpVtDW5k0mhq2Jp75OSg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk219un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56623073a97so1507966e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 16:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647585; x=1770252385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=iSBSKRYUzS/k8ccUqgG+Xh7Wh9H9HFbKDZxo5ztnU+Gyoko8072RYz7pmLWczL+XQU
         uSNcKOjko98m4EEg0nSlerJk1O59yZ6h8q5CvSTFYlg78BCMtRcqjBveUfGuOZFWK0tN
         WTZqUhmfu7/4GnluXMeW4Q9PrFijbTYKtYO4XK9KCQ5JgDOY1d/drn1a/53tIixTLV/P
         p75Q8tpJJwXrWHKbn0K6wQoukH/O+O5V+QTrYYZ5KfWYy+YT7zSVvFxIh9abWj8EYREw
         2uJd/P6x7zw6UWp0hU7r0xFfv7nvxm+c6PwhBswu5CkKEm7LMswbowXGbISsevuV5mz4
         2GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647585; x=1770252385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=K7sgfDqHkjMQIKgVsAsAjwYBeysOq8jZm0YrWWNXdQvpY9gfwwP4LQdcjGQqdbryYZ
         as+kj52EboruSgCRvr+dPtra+5nirBPfQ0rW33i9wps/1XTDaKAX/WS1BZSQcmvnsFIq
         6akjgx7k3AswCtoIiQ4cWe3oihjurQQZtX6OEP7n+g4Y3TJSqEYI8bx8ynXFLIbQEXxk
         Ot+pz9XklZbwIBupQmpSsZuvtVL5uku8GJQ30qD1bP9OvUphIRcWZgillGMWb6pAQcRe
         JloEyRbwbjHgZaAMIRI8AuMTd4M5vgcWk3ZLvNcmPQXA4WO8uQsL5Yv0NEIoNv9fvpZb
         1HEw==
X-Forwarded-Encrypted: i=1; AJvYcCU4GoJsN8Mp0auTtaR6gPOBZgCbAIZRznE2bTIf1iT+9P7KhjPDY/xrVJmtuAaRaOX/V5fjxk2Y4fbt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Tzjwb5ca+tIkKihnMnktcBJewzllRT95uShSq6wh9g3Ysfib
	Y9vlxCm1Lz2aF602XflV2vew8XHiL7nrS9snpwaa956Kw7aLKYjxdgmTvUSAh8TpzL6xiDgkL+/
	4EsknObGQ0MIX4obKmejCBvZL82xi/gwV8eGWEQe3h7M5OuEcKL5JdTGi8znAWRC/
X-Gm-Gg: AZuq6aKtTvK7FBhNNlDSxDfdEFW6Ibd19ttIXSoHh+IShGC3aQpngUd0vCEWIN6vIs7
	Ghk+LjzT0WmqF7aQ2mBabeO9NvOS3Yye1eRt6QhbsYQuEeBPm90ActEa9odtGGBcWpv47Vm+HAW
	+mTtDFcS2BbvLj2tSKlKIyV5TCIvbEy4DpUH89KdG/iJ8huWqhBWijw+oWFqSCxER2xbkXbtBSw
	QA4PojcR1padAPl/kEYDq7QhasrJ1ALWVKAL1kqbLbuj5uDKvWMKfN898D86jfZH/xhLykh85A7
	2SFrIomGojeP8F0Sl50rQE5//cu8Xf1Zknr+U50Hl00FPD16kWHF8S6YEArzIEjABygMJ0yXnWn
	MJtEdFP0n/AJax7blz89pe0SkCTVMGDQxo6vMFEc12bvBWnws1aw27wI0KslWIWfb0ulfXfsyv0
	5ULUmviy5HnDnfrCnRkP9Gca4=
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194507137.21.1769647585522;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194497137.21.1769647585118;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7033sm821873e87.68.2026.01.28.16.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:46:24 -0800 (PST)
Date: Thu, 29 Jan 2026 02:46:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
Message-ID: <imqu7bovwwqycci3w5myjgdbdnsz5ol3meavdu6tgfixpr7hvz@hhwobvjxqoqb>
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697aade2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KqVGvLWFIAZGjLrJOEQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2Bn4HoXz0HnAQNULpLCOXllcbxDSRncW
X-Proofpoint-ORIG-GUID: 2Bn4HoXz0HnAQNULpLCOXllcbxDSRncW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMyBTYWx0ZWRfX2QCeuzP2z+tm
 1RBtD1H5qvNhbhM8Ep5qJUBjwbP6NYvV/RNQeiPZH4t2VpPg0lWAU6Oq1D/7cAboUT0Th6ip1Jc
 1mCDvDd7372sBpeSrbrhcfm4gt8wc2aw/G56AebMe9JWVueRh11GLTUzSqXxTUEVS1GJ7Cx+WyB
 DQXkc2QxsW/PUke/4XitOMk9PNYjRmSTluG7ZFnQO7yKgYJIbMvdBPAAjYYBWjBdBmP3+oeGbS4
 fBC2ufsTObmaE4TVwZdIDdOFb/Ada9hsgsne9EcrAk6fr2NB2Z0m1AWb1DqpyFY261/Vkq89Da7
 C0V8GprvKw254J9ot1218/UWov9TF7eunBMgkeL5GltaAVAscxCEtYJyj1GNlii/kXGjnOs4J6U
 SStgSP2HyYS45a4muCarB4fEIO+V3Zbh//86Dz5sU9W+4G7rH0nmARj6TQfPUmLMyU4ASI6ykV5
 99ItIdP4UePgq0b2/uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31261-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3780AAA5B3
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:22:28PM +0100, Luca Weiss wrote:
> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

