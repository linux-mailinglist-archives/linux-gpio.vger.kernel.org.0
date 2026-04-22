Return-Path: <linux-gpio+bounces-35319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCFPE5Ad6Gm/FAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:00:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF77440FC7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 02:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABB4E300FEC8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 00:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2C81F8755;
	Wed, 22 Apr 2026 00:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHyuQXwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3VqAByc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48101EDA0F
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819589; cv=none; b=XrWgMbZWjzegLhvNej9WtwEa9LtdoZkZmpQkpdrdyhCigMwu/ptZ0RNW2jFBiPcER+bqikuC0md0CiIgnJcBYQbjemqMbNS4k+wrNs25a/3Qgf97tfMFngGYjxl1whh0yGV5CjpKB3buTZvAOWfIZwCVynx0rz33R+kmxV45t0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819589; c=relaxed/simple;
	bh=lm+XVm4LjnA8m8Tpd4f94amRR/VqY8aEivvhQWHxa20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVkmtT+PIfQkzfFqM9qgN1KN1eFnE0hR7IzNcjD44XxGh6+AIbWLmnpfagKLTXCAbFdncULBVw8e/QjPYOdNYjUOcA4zqiZmMiEfUHVcSXMcYZT6j2DpI8YhnlGe54yW4O+l3rgtiMYcDF+YSPnz6P52mwKmkc5ABRzk5lkLcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHyuQXwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3VqAByc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZlXO4051048
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cDtdgFx/StWBvO59JHE0x9HU
	NUeMZHcq/ZWbreMj7zI=; b=mHyuQXwWo8yIC8ppdpSmRNIyZiWKlMoXtghSX7Tp
	IClA6DEnVPUXlISYKl96XjpgHOb9fF2FZu9AMA1wiu6+M8Mf5zNXerq58LZTMJsw
	euL1GszBidd73T8k+czLdYGEatHpRzEzMkSI1xw5JTvnm3T2N0Na35GRGELP2OeV
	oegcjCFw4m/jyTsVKyGsWhSv6c/hGwvnBI5FU5mVovnJxJIQmmgEuNZvqx84AjZB
	vjixcHzzWD7wpXDJozry3BQD0UP7OqPgZ+fAtfsV9flQiYWpoRHzYhnM+85E6Lv3
	5bk0QSZI+D8p5SjqXAXV7nwotgCGYjowss8a6YfLl8MI4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh0sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ae6aa148a7so38381046d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 17:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819586; x=1777424386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDtdgFx/StWBvO59JHE0x9HUNUeMZHcq/ZWbreMj7zI=;
        b=i3VqABycCsQVBhGWbxuuLrtzoD2NRlZIWtDJ5Ozo/ZzY3h5s0vw0jN+3m0bXSTNk+t
         2uEg1l5ZFSo60885b12D3qbouDDH+AcQtjJ9gEnJCw+ZsXJXDDAu2s6l0iULOte5NOEi
         8rTs3heF+TovqsieqHd8jvggg0Lae1qBF/pwk+F4Derl+q8vHX2SSAHhy+d+bheK9AkF
         djAQzKJO9l8KJzHvIGC5ReRQAzdA9ZL5CjlkdYW+aaukQmdMEpax0yeTWGNLwsgMkMC6
         4Cb+ndy9/mKxw7Wck10lTOfWMU++7USplOL18G3b5sIRJGT5N+tqxIx7h/EEI/e6KVzq
         rrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819586; x=1777424386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDtdgFx/StWBvO59JHE0x9HUNUeMZHcq/ZWbreMj7zI=;
        b=kO9O6EqkCRCVdyLIqqi3mKPhwT/UUGkXWaeiLlwrQIDAuUnwwCBWgO2jAfwORlkU2B
         PRsEz2WIMgD61p6wHnG9PP1StpVUy3GgSu5xeXAr4b0cAUc+iBgGokY4f3a44sgZ5MXV
         5GZiutuhF30JClZTo7dOzIpQ4oKQzWhQIvP0UL7Is3o1YWtZXZyfEuk4i5d3Fy97sKYG
         bruBkQOnItlUfNmfPQE2eFhrfjbXklGQyz9Mr58+EgK8VrGGnT/ob7SB4K9+8YggFJWq
         OW+GXQpVSzNytIGQPfdchBOo3pkx+8H/9IiiCKkHQVANXnDIBz7mXEAwnjTluC9sQmYK
         QiMw==
X-Forwarded-Encrypted: i=1; AFNElJ/E+E4qv5o0+cHej0Tr5jKobpnNSPz1r49EJk+lJVqXDo/AJqicns+i+NfMU0MEWpQikTZxLbU6JOj5@vger.kernel.org
X-Gm-Message-State: AOJu0YwacF7Z/zAKGPhDBfzr3gdXXeho/QjhnmltKcjyAjsX/TQ6a58f
	HexTNA3m81RVToUKATe5sQnECjgcHBA9Yy7E6nMTRYDIVXCS8eRx3qLyqO/nQR4vn7AJHFnQGAI
	Kr29ozVVgHXgTfi3GtL0sVDFnCLiKKZ4D9UafKIGtY3WxfpHFXNULkIUr3i2bmZPV
X-Gm-Gg: AeBDies6l8TPMScrjaFxyS3FvEH1IZWnMaMM28HeukqBezYMbzlfCGL7yJl9wtyFOQR
	M8aFbRT9t9Ty6wSypR3e+AC5WfX/zgTD8uHZ5Niaw0LXUYnU1HnJh0OpJJliQN2oGrP7KBJns8c
	bvPVNgDl3nwHaVjjM/jS0EJ6skdBrMG1E8qtqg5gGUFLpU/UsCYedwT9DBqaE3r5MQaPCKFUh3j
	dKnaoMMiyhRZfpERA/E9QKo3Jn7tM/0AIza1CgPrLRB+IuGlSJ90wD+rhVqdM3XcK+Xt4zOv4tm
	LCBCd8FffpRQ6/WU7LEbkgeQYNmI/wjaEntsZ8aC5Bm3xhftNLOG4B4RmqdvmuIpr4cxgxgrTTQ
	U1l8GV2kgAeTQXhDH7BcLR9kvY/kQasH1PY9r3AsBrczVZZsdH6r9n17NvO5n43iR2rfVrTdOog
	Feb6jnd+sEjv8/4quOxjI4oxSDOVA0qEF1f0W2B9moUl4CZQ==
X-Received: by 2002:a05:6214:4986:b0:8ac:bb62:fe65 with SMTP id 6a1803df08f44-8b0287959cdmr316609316d6.23.1776819586092;
        Tue, 21 Apr 2026 17:59:46 -0700 (PDT)
X-Received: by 2002:a05:6214:4986:b0:8ac:bb62:fe65 with SMTP id 6a1803df08f44-8b0287959cdmr316608956d6.23.1776819585633;
        Tue, 21 Apr 2026 17:59:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad138sm4064885e87.9.2026.04.21.17.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:59:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:59:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 4/8] iommu/msm: Look up masters per IOMMU instance
Message-ID: <g5jfi6d4e3osqe3255v4fzr3eqduaxss42dodogfsn6rji3znn@dlk3tey3p6un>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-4-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-4-bcb0857724de@alex-min.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX/sTE8hbiZO2z
 5/H+6KykNdPcTQNlW8q1t7f9KmabkCjex0XNqe2KzzfvdiqSKNh8JCEgFkh6pt+bGqoSV95pD0M
 cxTUFKg1uT43dXtU+L6u0+Y2oM8qJi9SSrDiL0av2X4x4POkMYktfJ1yUDwgxmPFzPnWBJ40nJf
 bzBwqhuUiZEH/fDl3QNyUvY42WZTCQnTwtw8Kqt4HipeTiDlt/p9k66Sx39ukKLU4mGcuJYfcsL
 W0OwxaZEh3rzQWla5w5fr3GKengbT7dsXiAfo89K0fBvMeJ/gSGkqzF4vUq3JQAZjWIsrsOpknG
 q4ZcZFAaJJ2b+R98joH6lLr0Zur/KjeNUGnb52qCzwrVOODmnGIetTm0jaLb6mUX+UFBENJ0MCi
 Y0XcHoIez2uXocTg58VvSiKjp+z2gTF1XT1aIwoFhbV0kNGO3ITBM28Zf2f2VcJMGg5CriZ0Zu4
 7RsBXJ2PGn6gU3mDdVQ==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e81d83 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qBQ8OOdg5lpXHOzljU0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ZJ6yIJukKdSZ-8p_TTv6IURCCFkfNb1F
X-Proofpoint-ORIG-GUID: ZJ6yIJukKdSZ-8p_TTv6IURCCFkfNb1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35319-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,alex-min.fr:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EF77440FC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:10AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MSM IOMMU stores context descriptors on each IOMMU instance. Looking up
> the descriptor through dev_iommu_priv_get() is not sufficient because a
> device can reference multiple IOMMU provider nodes.
> 
> Look up the master from the target IOMMU ctx_list instead, and use the
> same helper when probing and attaching devices. This avoids dereferencing
> a NULL master when an IOMMU already has context entries for another
> device, and keeps separate context descriptors for separate IOMMU
> instances.
> 
> This is required to boot APQ8064 boards using multiple IOMMU contexts.

Which cores / devices? Could you please add a (trimmed) backtrace? Also
a Fixes tag would be nice.

> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/iommu/msm_iommu.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 0ad5ff431d5b..9c03878d0d2c 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -357,17 +357,25 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
>  	return 0;
>  }
>  
> +static struct msm_iommu_ctx_dev *find_iommu_master(struct msm_iommu_dev *iommu,
> +						   struct device *dev)
> +{
> +	struct msm_iommu_ctx_dev *master;
> +
> +	list_for_each_entry(master, &iommu->ctx_list, list)
> +		if (master->of_node == dev->of_node)
> +			return master;
> +
> +	return NULL;
> +}
> +
>  /* Must be called under msm_iommu_lock */
>  static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>  {
>  	struct msm_iommu_dev *iommu, *ret = NULL;
> -	struct msm_iommu_ctx_dev *master;
>  
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -		master = list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node == dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret = iommu;
>  			break;
>  		}
> @@ -405,10 +413,7 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
>  
>  	spin_lock_irqsave(&msm_iommu_lock, flags);
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -		master = list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node == dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret = __enable_clocks(iommu);
>  			if (ret)
>  				goto fail;
> @@ -601,10 +606,10 @@ static int insert_iommu_master(struct device *dev,
>  				struct msm_iommu_dev **iommu,
>  				const struct of_phandle_args *spec)
>  {
> -	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
> +	struct msm_iommu_ctx_dev *master = find_iommu_master(*iommu, dev);
>  	int sid;
>  
> -	if (list_empty(&(*iommu)->ctx_list)) {
> +	if (!master) {
>  		master = kzalloc_obj(*master, GFP_ATOMIC);
>  		if (!master) {
>  			dev_err(dev, "Failed to allocate iommu_master\n");
> @@ -612,7 +617,6 @@ static int insert_iommu_master(struct device *dev,
>  		}
>  		master->of_node = dev->of_node;
>  		list_add(&master->list, &(*iommu)->ctx_list);
> -		dev_iommu_priv_set(dev, master);
>  	}
>  
>  	for (sid = 0; sid < master->num_mids; sid++)
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

