Return-Path: <linux-gpio+bounces-36752-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAFzHAN1BGqdJwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36752-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:56:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B43C5336C8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF8123012D6F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 12:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCA644BCAF;
	Wed, 13 May 2026 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1Hkqw/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/cmLcsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320EE44A724
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676763; cv=none; b=hsP4JnehdaDWMzUZ5l9BpYvESOGjLtHnGe4cjlpBdsilCt9cj24ViuJ1hBLrXmEVmicWcJIIO5cHz9O1O34ZNRtfHIh/JzZn44cmscBhlbw+S2EMVaTis0TF7KAX0PZGNgem3eAuu0Fdk95ii201wuui07E7eWXPVT1PQyYMiEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676763; c=relaxed/simple;
	bh=gTWoMY2meEbg8/YZlWNxLM/90BqNWJc6npiMbglFr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P06vpplOZ5nX/BqZB70vUHlwcax9NBYOSSPk8Qeb/UCt2pxMEyryIUgYg8y/Kkz2QRD91faOD3JHwUSJg/dBDB51dTfWqmJCYkTtA4t4RtPMNNiXE2GmZi6zrDa7FfiCbNwxgHikkrlPvrCT3KVjqL/7x3sF2j9YlK2FLzFgyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1Hkqw/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/cmLcsL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mK093474926
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V2Glk+J1smJyB218askkSHc3
	dZ7oIdnyYG2LwbcHoos=; b=E1Hkqw/KhqnCGRqcH1340GhoqSGbTVOjn/w4InR6
	SYfqNaH1CBxXYMrmx0GL5B9gB5VsRNen0u81513Y6D6QV5+f9+DVODYVmLJOQq5F
	TOzE6xVPgVobo0QQ0vB/ElBisLrCa5etkxrY53QgM00NP2xtx8FdZo6gNQQQa6MN
	BX3Wv1MXMa8lwX5pBCetff4kkgeVq3gzzLOCKY024EaoCqZtBdLokmlM2pVmxJaG
	TzNWU2jsx9J7qCoKhtBSkZMmS5dohLSdTMsLdpojmvhRbYUPeiXLwN+4nl2OFwdy
	rYvX6tgDKLbfmBjDAvvLGovNKfa6BZ50uHKLXoeoIPgDvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418v8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:52:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso52469831cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676760; x=1779281560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2Glk+J1smJyB218askkSHc3dZ7oIdnyYG2LwbcHoos=;
        b=J/cmLcsLn3DMNeTQO5O7YTk+uxbjnjwdAf9RuS5nSth1P5hx9ooJQ5wnzN9xZI+XSu
         LWtapVgrMoEokvAb2WFQVTVE3q4STBiBBuLtQOLt1+a4tZRdUsNgTwAcmBbWoCFtpqK1
         AoDVYVHuEX2VULhWcaWfYcOz/JgSXLmDxm/noYNvsqEfPo/MhngshC52RKYGjAFn2by5
         yVMZr5kEPsEOzjgVQjF/WIyvVZZyadC98ui3d+0ZxPmF5OoP9EZo7BssLsChSwvg2brs
         /qx9JK/40PqFntq9/45Jsgl2YU7qbHzDCnZuY+zX5iZt9DA9j8KM3Li0CJyDw2DdhK5d
         6rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676760; x=1779281560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Glk+J1smJyB218askkSHc3dZ7oIdnyYG2LwbcHoos=;
        b=g3H9Vb9mR++h7AisON0Lze1+XUAq60th3DDRF9UQSMbyshWiPLa3eCPHgYWYxcZOaM
         DxOuBtuG2I9NcrsL873Ksl5Y7QUKfA+0Mxt/jcAgx0FkZqz1H/M9tBjcuLiKNHR7JzoJ
         xYWfLDcK6FLLVtoPtP2ERidUf06KYz610My7W9LtlJq3UFOUB7XE9upGtGEeVZOnA+Cq
         9J+x7gO+6+iVLN0BR2hPiQhBWlXiDYFxtdhWo/icYfSdp14r2yR+IpBJXHYg7lhPB9r1
         7PSpoiZ2u67Ge3j3EmiBtETMqsGArjWBXAN0Y+X7ojaZFW01B9TEMVVUG+RE29KGZSQ5
         JPOw==
X-Forwarded-Encrypted: i=1; AFNElJ+6g+xRHazUqkQLJHk2X/0ggDFo3nbZQWzVqRrjuaqOoCZVsL1b2RpYV3J9QvPM74x1aMuCdyBeQbAS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhuzr7PkaPT2fg2qTIPuBtZ8PQOOe/xtPydcKZH+ErijVRfUBL
	XkHBs+bcADoKKCJi5dNvIRRqWAazUIdeKmaQ4BMkHVb7Re7lQcxwEW131DRv57kKD3kSeVDqqhL
	S1nTEKpKqmCa+CytBe38GK2JzJ/xWqHTHMtZy2fVELeIOWPXDBtd4X+RsMLIEo10o
X-Gm-Gg: Acq92OHKMHQIWuMxvhCYXck90H9ABalZghGEP9xGpi5hHsGvbuFPhWwHDTgGW3u5gBQ
	98dxWG4TMJla9Y5ASOu6SWkfprjd4Vu6r3Lf/3jVwA4eR7JPY2ZfpW4TfP97gbokuea3okG115q
	lXXfIzkc1t3uyD4cSOLo9AcqBACxDCvx0bUfVhD0Rv3y6lBg4fYdFhpL7g1QX8sQYBPj3VHIzrm
	tVt8XJ1PGpBPaWhoY5BCIx/pXSnNWmebIRg+TRePh7Uwb9gIX3MmNyisFjlO48RGxNaH2D/mx39
	1VdKAueg5/oGlrSeorP83YL9uAbMkiPsohrvyEKZZQchQAu1+B1F8iFtbgTom2dZocAfGpO707Q
	2P0TMQSsN/uBqBC07xpJWvzrUPcalemrDUgg3FlBxx7xjvmcAu/Yp7IP3O7Ps60snPMHFAqvoSR
	HvTkt5fr+O09U5pQgiXNgu09pAgbfEQaMugh0=
X-Received: by 2002:a05:622a:610a:b0:50d:65ec:a071 with SMTP id d75a77b69052e-5162fe3dac5mr34929661cf.5.1778676760511;
        Wed, 13 May 2026 05:52:40 -0700 (PDT)
X-Received: by 2002:a05:622a:610a:b0:50d:65ec:a071 with SMTP id d75a77b69052e-5162fe3dac5mr34929331cf.5.1778676759974;
        Wed, 13 May 2026 05:52:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4042009e87.23.2026.05.13.05.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:52:38 -0700 (PDT)
Date: Wed, 13 May 2026 15:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
Message-ID: <ucmpc5hkbjruix2ftxys2zfk5blntfsap3fbspqta6ihyigrgg@3nyghgnonxvh>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a047419 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RfFmp6mFNQ8jP_shwQAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMyBTYWx0ZWRfXwcUM8ieBZKO/
 GtUSvFbjSgG+TjdENSkxyABi1rLbLlUgUQR5Rsv2FOwjDDfOv+cgpZqogz7ryFuQLeDoU4775z/
 qh/syXUs3Ibz68n6dQWZYdjAmQ8/84991oOrvbadwt0FNIPDvTSOLKbh+BCqXRNMEAsBAue/2pC
 EL9RbdQyC/lIk/ZsYsWYDDAg+2msHZFsg+hlzBmabRLztPeUPH33/1BMAzGZgNp8UC7JqdQ/ax7
 qCCynZvLlddc0vuPvWdPKTNZDhoPITUVcE8vukPilfs5IE+IlXLJGyUiGd8PQXx2imLSPYr776f
 ZodEc34cRWBFYYBG1WnXt1JSm7bXRcCM3mrIHOkIzYBqwMl88z+riCf8s4vgb6tl9v+5eSxoiQc
 gHK43C/mV0kZ9PATPNgxUcMVvWFW6Qmized4N0Sh0NT4kM+rVrxP9qBHBe1bCodaFsS/TStcRuS
 mDPJb9DS3jPSGwR6Tdg==
X-Proofpoint-GUID: P9lVmAmWa-IJ-6SrD9Vg2TgxiSzgpBSV
X-Proofpoint-ORIG-GUID: P9lVmAmWa-IJ-6SrD9Vg2TgxiSzgpBSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130133
X-Rspamd-Queue-Id: 0B43C5336C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36752-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:55:26PM +0530, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Guard GPIO register read/write helpers and slew-rate register programming
> with synchronous runtime PM calls so the device is active during MMIO
> operations whenever autosuspend is enabled.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 118 ++++++++++++------
>  .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
>  2 files changed, 88 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 15ced5027579..d95e28926d38 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -15,6 +15,9 @@
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinmux.h>
> +#include <linux/cleanup.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "../pinctrl-utils.h"
>  
> @@ -22,7 +25,6 @@
>  
>  #define MAX_NR_GPIO		32
>  #define GPIO_FUNC		0
> -#define MAX_LPI_NUM_CLKS	2
>  
>  struct lpi_pinctrl {
>  	struct device *dev;
> @@ -31,7 +33,6 @@ struct lpi_pinctrl {
>  	struct pinctrl_desc desc;
>  	char __iomem *tlmm_base;
>  	char __iomem *slew_base;
> -	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
>  	/* Protects from concurrent register updates */
>  	struct mutex lock;
>  	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
> @@ -39,29 +40,47 @@ struct lpi_pinctrl {
>  };
>  
>  static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
> -			 unsigned int addr)
> +			 unsigned int addr, u32 *val)
>  {
>  	u32 pin_offset;
> +	int ret;
>  
>  	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
>  		pin_offset = state->data->groups[pin].pin_offset;
>  	else
>  		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>  
> -	return ioread32(state->tlmm_base + pin_offset + addr);
> +	ret = pm_runtime_resume_and_get(state->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ioread32(state->tlmm_base + pin_offset + addr);
> +	ret = pm_runtime_put_autosuspend(state->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Just `return pm_runtime_put_autosuspend(state->dev)`, no need for extra
ifs.

>  }
>  

-- 
With best wishes
Dmitry

