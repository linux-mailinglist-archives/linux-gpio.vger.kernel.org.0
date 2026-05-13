Return-Path: <linux-gpio+bounces-36749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCFUHph0BGprIQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:54:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8892533659
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5531531673F8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA1C40DFDC;
	Wed, 13 May 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4IB536+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0mQ8Z6b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65F3ADB8D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676493; cv=none; b=A7Nqto1qKj56GR67WdMAoj0eQlQumn8BciuLahcK1My+RkJGuQIzSX8RtBXwE0ccbbq4G1NtC05fQJ3cX0mEgaWkaaxcNCriCE+q2B7Fbla129vuA0b8PYq+n8DMdDFlimvVsoKLUVICMyhfHWGG+M9bGfT4FzOi5GkW8rOkpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676493; c=relaxed/simple;
	bh=lBAMXVaLRf7e+I3Mw5pkkrDPuoUt/kl0hayd1u6CLFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4mcCeBqLZpb/pC0jhdChXSBNyG+6AkeXhbaifCVykRUky20nK5qbLlaTNKlZzzPoNnIpNJ4rB0CQ1N6hBZ6aUhFtyruPbwlUuSkywVGYAzgb/v1hpW0WUbK/BBtTU/A5w8Mzv9yhjfrT05SB/7GySqY4RnfvJdK+Vm1HdAGyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4IB536+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0mQ8Z6b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAPBht2321422
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t4ZT18AR1d3xU/HYEeVlSAcB
	cL6PN3VDRrten0+gzJ4=; b=J4IB536+2VcMaAM2wLLXXuDbTj3i/XkJj9b9ESKq
	MPOF6AG5u+MrARznnUJ3pJdKOHGzDsqCNciB30BiVz9wWSXPcbOJ2N4rwYlxp8yD
	cyCcN57oLx0NUlPS/8Mxs12l17ZefDrcpCnT4fjkTuHP0F8QXzUDPbp+TYTW2Gmu
	HaPwhpomacYYpzDU9iLGhI/t+WcH/pQ9AUrk+4BQ1MR6BVbpRZGiqSrN/2GmNDk9
	sANgSm2jfio47SZL5L3y0dosyItO5463TKC94JHVxkLeRhABD/Ep8g62JpAQPucj
	1jmENIHF9jX2J0dzsR78Ig+C1qB0474eocb2J4KLiPjvTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9xwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:48:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8c3bdb60dadso57701326d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676490; x=1779281290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4ZT18AR1d3xU/HYEeVlSAcBcL6PN3VDRrten0+gzJ4=;
        b=e0mQ8Z6bq7j0Nk2f+PPY8khW216wp9imvognG1yCMnl+SxXcjppakhKu/HeXcWOYat
         rBQQk6v0wMIM4aF7h06JNLwGKI9aIe5MLO8HzTm9VtuQPZqekKL2rKZpo4EhHGntReyX
         taAbE4SnA0x8xgHeyyZLviImXvnjANC6MmdBUeA4ZS6P1hpyB07AaG/VGrsHOMPrmFra
         2ENuE2GtBxsx8MIAspO0njiuT+KruRMRTF1uFaScV6hgkpiFx0dCKJ+hIOpN0Eh655Bz
         9fhCKFmXxZgbYWSPesCVk6nyZmXejNDKogqVydTKxWb3Inqi1ImMstqDKom4OrqX2PI3
         NdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676490; x=1779281290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4ZT18AR1d3xU/HYEeVlSAcBcL6PN3VDRrten0+gzJ4=;
        b=szn/dktHv0omDTtlcs9KMDmGSp2OIqpaJnK2hEjfTb03o7RAgXeWw2g2BC0tkym/FW
         zdWuurC4zPZvy0yqQNYcUB7krN7iU/0LfO3GAHvCl5xDjUSQbqBJn3kvc5tTEKdeAesK
         pr1nDht8jmpIhS8BShA1B9bPkDH3N4vPLOuh8MHZuW7LHpxD558xhfJOUXuSeF0R37fy
         sI6w4YkUNPeXJrwSZXe7Gx2DdqAcwRPJpU6Tre8/I+f9sx5H7MPSZFDIxZ5coac+a0aO
         e/q6oiO1dSn/bWU41nBu4un0lKZimIiorLL9N+/GuoWpxE+U/2rUVgvdmyuDUvr2skbD
         5yaw==
X-Forwarded-Encrypted: i=1; AFNElJ/IyqnDqmQ4OwDuaP/dBnlD2FECYFE7e7m/tmfoJpBMnyl2u5VGMx6UMVszKCykHa0oMCT8/Rh2CzAp@vger.kernel.org
X-Gm-Message-State: AOJu0YxgP9DM2PVqzMaGKmn4DaGyOR/E9EG/abEIg3wC7q6iwQAtgo7s
	o+dVsUKiU3/PA0ffQFMvL0eubGhPerHhZSpU7QuNmu5imAWGw3hFBaCzGd90qUAqM8yQS6t0d2n
	mzCiWRAz3o6d7r8PeRH1CtU/kyP2w5HcV7mWmNIMWue2MIkjHYdk9Mjb+1d2wXBn71rWjqfBp
X-Gm-Gg: Acq92OH+ZEBDgFR/7xkVJh6HKcO4d1KHUSSCYkRlYZug3Tsmr7dZ0KC2wevwVcAUZhX
	31c1bAO+o+vdgPFjIPbCQ/s1lrMpQspa93DQCcGb9MFOcigKmth6u3CJVoshT5JnArzd1UBSRrS
	sUaJ7kmEWfBRR0Q4ESys8Yrg69saOReWNdy5ZHkZc6mxucBeUoPojo+tMSIEjq3YUp4FQkWrW5I
	h0088E0WNPj15F+oMoPz+rmJoGD489acVsvL9dAhsatFt86h5N89xSAItu6vb8YQVBJrkdISBmz
	YsxktyGRPr4KrblLMW/mGEtnkuc9JYWQUpU4+IoK8lNckFP56MEEqi498e5L9pAXAFjog4TtBui
	e1dhJG4RSJlX8Ybz9soB/H8O3Ymg82rXqsx5mOmFEWvY4GHEdkw2C0weA8f5NClMQGwvfKJwXjO
	7HHFse7sHgYhu+ibDhcjpzmfCbWCQ+0hwOi20=
X-Received: by 2002:a05:622a:511:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5162fe2d671mr37318591cf.19.1778676489820;
        Wed, 13 May 2026 05:48:09 -0700 (PDT)
X-Received: by 2002:a05:622a:511:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5162fe2d671mr37318151cf.19.1778676489305;
        Wed, 13 May 2026 05:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c873fd59sm2444092e87.57.2026.05.13.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:48:07 -0700 (PDT)
Date: Wed, 13 May 2026 15:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
Message-ID: <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04730b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ueq-J5Ao1-vnPzIKXa8A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: OriKj0uKxROV8dKeBOlL3mFkU7DXFK6O
X-Proofpoint-ORIG-GUID: OriKj0uKxROV8dKeBOlL3mFkU7DXFK6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX+PAfBo/KfaXk
 obJ3v2XcrZHsk5phZB5zIZiOyTmRX4E/q3JkM3XktelIW0UJ7xUL2UoTY6WldFgc3076uj6Ngcb
 enLV3Z8KvkcLwiSRAp9GST7D0T1KKy1tzt5D0D4gCGcBy5Zktxle4Z+zUTfMFbpp0CKnbZWKQu1
 FKC5UD6s+p0Wtd9TQRSPTGlINvoOeKh4mgX681CNU/1itUYIq0qmoKJWJjvBxaphjlPW2HVFLvw
 QsJO/jAQ41+HT6qKP9zM+SDgwYyAP8cXMkYxaNDIGGr8lrioc3LyRd6X9rwtHdNRZ3Kii6lF2ar
 QfUS3L0bGLCaGN3U00HKNnwhJN0CKkDmA/qzLPZM2qBvjAtaog3CI/PJUwdAsGp6VGoEv/fsy7k
 O2pHsNNpGBIhcNNhAmWRvCWX9NtKLk+4MWqSfjaDQCtyHEIepWY+eLJA6DxZ3yn40xJ3QY7TJoN
 adtOEbV4/GgCaPu1sIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: C8892533659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36749-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:06:35PM +0530, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the remaining LPASS LPI variant
> drivers so all SoCs using the common core get consistent pm_clk based
> clock handling:
>   - milos
>   - sdm660
>   - sdm670
>   - sc8280xp
>   - sm4250
>   - sm6115
>   - sm8250
>   - sm8450
>   - sm8550
>   - sm8650
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>  10 files changed, 80 insertions(+), 10 deletions(-)
> 
> @@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,

> @@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> index 439f6541622e..a79f99ec6df9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> index 73065919c8c2..9037ef0020da 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> index f9fcedf5a65d..513ddc99dd37 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
> @@ -6,6 +6,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pinctrl-lpass-lpi.h"
>  
> @@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>  
> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver lpi_pinctrl_driver = {
>  	.driver = {
> -		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
> -		   .of_match_table = lpi_pinctrl_of_match,
> +			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
> +			   .of_match_table = lpi_pinctrl_of_match,
> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),

Incorrect indentation

>  	},
>  	.probe = lpi_pinctrl_probe,
>  	.remove = lpi_pinctrl_remove,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

