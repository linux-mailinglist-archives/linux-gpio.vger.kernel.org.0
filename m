Return-Path: <linux-gpio+bounces-38063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jOcACEo4JmpmTgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:34:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5B652740
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DU1bA8eA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BIVro8Sb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38063-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38063-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13DC130028F1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 03:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F61134B669;
	Mon,  8 Jun 2026 03:34:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF83348896
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 03:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889662; cv=none; b=RF+S2ycMoz4X7JnmA0BtYYbiwtKCYqDeIGNGs8GnD6N3uhAKcoP7uLm++S10CILouQxxjDUTFHYwzGLjNRQftIZTAdOS8MinCPXrbZnr57YOLiotLOXLh7NvC2NEszykS6poPPHd5f0q3sjyux7K9PspEHZFQOfxgTfFONOeI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889662; c=relaxed/simple;
	bh=3JWmxHmT8BV5O00wC/eKX2wtjzi5Z9sf5VibQC+9U7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW7rprQkrfqvn5iIGaLvlopejKz3Ix4r9k6wEXL+AiSAn7C4889LAdvdBVdXlYhvcfZMJy21cgb5e0d8JIi6F5E6fcNzWUi8FyBWTcv1nqlqJceIv4Qe4AgFpXHjVbkUwYtbl9qKjdTFQrRwgxhyI3CngvE0nfK0VvgSlu+Ai/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU1bA8eA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIVro8Sb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580ENhK1469414
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 03:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PAVfXYzqkLmqdlF6wMfSABTU
	Ei2iQ1b6fy646y6vNgE=; b=DU1bA8eAEFBEHRi/OMzTnnFmH5ib0Ik07AABrMqN
	HtQXQWBuvmztyaR5mMVnCgzWXy2E9nzMu6dwsKIT6nxy79bUS1u5A3kQiUkcJVLZ
	SPUoIYjJay3SvIH0HpQ7Q90IB1mTBnZ6WPqHbKm3eVAOXFBny4X5vnvMJdRTkZ2B
	7RxnwxvvyV1eBqcQgJ6wUxPAaeB9Gd950KISi/qssr/toJy1BBvVAZPxQ+fdZtkb
	RD2SA09rW2cUVkJ5bVuZr4XVIVP1gRKJ6brGz+ehd0lMZQYii8Sv0QdwSCZxcwkz
	8kbqF1W+YCVIbLfTZi7JONc1VBSwKWPK5xgHHyBSh5VEBw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwbc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 03:34:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c33d75153dso1540779137.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2026 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889659; x=1781494459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAVfXYzqkLmqdlF6wMfSABTUEi2iQ1b6fy646y6vNgE=;
        b=BIVro8Sbr5Vn+JTSDqsyH7sx+541/eBVrlrypCLKxxQe5YnDL6NLrQmbdQior8SYG+
         rb7aH5nFeHod/1K531PgA42U9z6QLM0NWsjLUoEo3dDQXpn9FK3017lN0xLK/ZBAqG9Q
         Onn0CTnwY0aFIAjXC1hjo1cGqR6a2hv1iVzNvByFbqbutXCjiJEZgN9kDq/ywGPOCRMK
         gSR7GBBFnM9hKLC0b/FjQDhi21foUba7avz3oShcBBZcm+sDd5+BvNJNRwaAIXUhBghL
         zJB7z7gObitTzLvAbeVHEqa9S7pBLmduoPB60jGZPDueDoggNu5kFeyVVZ2xL/2y3kLZ
         lWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889659; x=1781494459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAVfXYzqkLmqdlF6wMfSABTUEi2iQ1b6fy646y6vNgE=;
        b=hC9kCOgIWfUPTrWzZqj01LfyMi4RFIoh3NJWQBArpNQzItFnPhq4XnbwOO8ErBkqrI
         bwwmSPqxYwKlgFFAfhVoLFp+Mge1N0pAq+06MNSz+2Om34FS+XRYa4Fc2vYR/6a2Og0t
         XNAWQJPFAC898WUGvKW/gSYIm4MT2oQboT21TAu0wZjgilXOJ2zuizUH3CXiUWEmRfhS
         1WX3aJvQ0aX6+2n/yl3MS5iBjGSLqMJSFUGjts72sHuzEdEnm5rF17Ux7VoyoINXS7vL
         I4Qn2knaushbQXJkdIuJgB+7eaIEo2XvlaG4kCC7zNDN+VetzGJHFwG3H1P7hSjO1Izw
         kxIg==
X-Forwarded-Encrypted: i=1; AFNElJ+dLxB2QQS9PWx40l5KZyaC9MMiAPESfS0mmtiAOI5GXZtBy10KMegYSwEeF7J36Nt94MF5AuWDdZSb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr75h8SvoXkWCxruNFE6NQRSCmCOIwNk4uoiBa/ZltwBgEnW7g
	uL8Nniqp8mkj06/ez/CTVrGT2hnSbd0Cn/hxgdhr64cRMfdgu3zrWAH2Frw4hlBdpcr731zqwSC
	NSig0noC8a6JBT6vK6fSeFNVUzL1UEC69NfL57iVpHHg47eZiNgAJ21cdxh6skaVn
X-Gm-Gg: Acq92OHVpk0T1I5rzDsc5X37lyJiyIeLgapE2f93Pj06ZPdr5cw3KBDgEzeK6oXn0Hr
	OKy2t4plsjU+x0P3UPf6lKIIbnXZex+j/pKNsfg+4e3j8J4X3kQN74HAV+PDo87uyxYBJCBIXZj
	VqXNuAQNT8u5UAg24xmdrGjhcXweULS4Bqop+QMdXQPIWkf8DY/LlAlRgw7ZwSyfbqcPF7yAzzw
	LfX+OwVxjbKZa4QK+5KrS+JKM2PwgbfxPsXig9T4c+7gdLym8wsk3Tfm1ISA6QynFaI2ZuLC9Ua
	tDJlf5A1MLt/pLMpHSihzP+4lpKR4qoOUBKoNl0Pgi8hfePVPctbqrXfi7kSsXbFUR7Jb7lzUko
	boe7eBAxtP8qUw5lBF5WwLcAbA5J1gvgQF2pVMKbIsBaPN+HuuuC2ScP1a8TK/ivq3l7Mt8lA44
	2oiaLoPJRA+IUpYxcjhrMminFp+kd+Qmhwm1qpuHvZizAYhw==
X-Received: by 2002:a05:6102:dc6:b0:6de:3c29:373b with SMTP id ada2fe7eead31-6fef998979amr5596488137.15.1780889659485;
        Sun, 07 Jun 2026 20:34:19 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:6de:3c29:373b with SMTP id ada2fe7eead31-6fef998979amr5596480137.15.1780889659105;
        Sun, 07 Jun 2026 20:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8880basm3460246e87.0.2026.06.07.20.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:34:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:34:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: Fix resolving register base address
 from device node
Message-ID: <pqn4tyd7zo7drs252se6rhcw5lvetlk5khmm25eexqq2bv36fk@lxlsbqwuvuyi>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-2-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-tlmm_test_changes-v1-2-88bfdccb4369@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26383c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gs58SK7taYNcaTCiRREA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: -Fhs_qXx9KqkCVlOKF0F6hkugLiQUj-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfXyc0qTGWj1FvT
 nGxrKi61VlvfOA86HkWSB9c+bMyTssAZm7683N9U/58jSaTXqJVA1BYwEDyqwrKiXJc+1ERC/Tz
 8HyAM3aqHcPh9vYU0oot8f89Pdhg7fSmHr8EwVLPOwJPxS2uQlrLvf/ixzTsAyfL7aplHYCmTcP
 0NBPrttRSrC+Tfe6aDOx2BtxfrO7FCOnKEbyZg3oFwz0ArGFp2CXI6k00TiEfBoocvh7uxTWPGP
 Ah7RaQR4lq0eEfIUXhnRaqYcbeNdJ2/3/ENbA287vm1qanBGdw8a/B93XyxwOrFe231WPYcstc/
 C6oPSRq91gYXMlz4mYNW+5RVZ/uGVzXO/i90ZkFoYvx6u0+tgV8zJXo4U6fv9Pkplgi382PoQqm
 pbioQdHyixeNm/9ZWP0h/vOVffp5RdP7yPq16Rn9rp2h/IhBrag885rBq+FwNjI2TJVfGUVQamb
 dTYRxBWHw5rjJp8HgBQ==
X-Proofpoint-ORIG-GUID: -Fhs_qXx9KqkCVlOKF0F6hkugLiQUj-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38063-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lxlsbqwuvuyi:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FE5B652740

On Fri, May 29, 2026 at 06:25:45PM +0530, Sneh Mankad wrote:
> Commit 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> added reg-names property based register reading. However multiple platforms
> are not using the reg-names as they have only single TLMM register region.
> 
> Commit tried to handle this using the default_region module parameter,
> however this condition is unreachable as the error return precedes it by
> just checking if reg-names property exists or not, making it impossible
> to use tlmm-test for the SoCs (x1e80100) which don't have reg-names
> property in TLMM device.
> 
> Fix this by moving the default_region check at the start of the
> tlmm_reg_base().
> 
> Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

