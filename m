Return-Path: <linux-gpio+bounces-37691-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCUJNsOdGWq7xwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37691-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:08:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6E60347A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE78302DB64
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 14:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BFC3469F6;
	Fri, 29 May 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n49KsI/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYskOXA6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AD346FC4
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063334; cv=none; b=gPF6M4nYI06g/xek+dQ4mSbGB917dV30Cb62IDnz8XwwUjZyosBlQg6Cv247rtfjj1vrrXzdBhYwozurK0aqt0Np4MDRnM/fIlF6LPZiHccAa6xCLB48qvUFEbpUCLvPIeoE7GnzPpobISphu7OTYWqpAvA4BfHTqupoOqba5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063334; c=relaxed/simple;
	bh=rVRK5jWbTZVvXEMLSmFo8QQ9aUW0G8dSJpscL5lI4IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trRwSHbzZqEDFwRM2vgvtpTQiB/RwXKFQDyKaiIxTLlDQwtfIgfVK434f25Rbh6ATlJzQJy05LV5obwe+RZG9CrZMv2gpJqTd3rCDAloWAcZW/sxiBPjNVRmXWzL0H2Jrrg0zF1mk4sUS43GpN8N8i0dBU8VdtGfdm3pq9OS2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n49KsI/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYskOXA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKW4r4119180
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8rNbSa5cBAMgvrmaj0Kg14xG
	39pdVOPXbgUHJBktyWY=; b=n49KsI/qt8BZpkNvZ2ZD/2v/qW4ORlNT/urYVIvG
	FXwDaL4ZjfBk+eMKCYY0/rqK0AicsTqdEEEsrSEVrg3eMb1/oXphUWG3541g2UEU
	x52u5xeVg5PJAAoZfoKV88RDdk7S8vOZ9a10WSWW6ZTtyQTuRRd39MPTFfVZwmSH
	dUQWm+09e/V/Cq2bTjKmDuDPPCH+spx5L8EYqDQJL2gqNNhJ5lMtt6G99CEq4SiO
	hQddsF4duRNt+7SOEvgAVbTV8p+Q66tz0Ve6ouaVj2aNPY0SrhO6PK6Lwu+Jt5Gh
	in233agCR8XUWAavcVNJnjbus5qIvL+LTPO6OsJMXBQbwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcgur4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:02:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5794db0eeso4920137.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063330; x=1780668130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rNbSa5cBAMgvrmaj0Kg14xG39pdVOPXbgUHJBktyWY=;
        b=iYskOXA6ZKhDgMbyR6Zw0F1PlIGhFD9jMdicaIr//VARMycnW1HqifMbJiEVr/7X7e
         wp+aljWtSxXinsHbdqSUiyMy34i/uzwVWUDzw0+swjKIM0ksK0le8rr8IbT4hg9pH8jb
         nG1YmZ4oN7zNf3HDTlEHiQRrMbRfMo6eUflY/m/f32TjQoZ23aNhIal7F/J92OXUm8c6
         7AoJ+dbjE71kR9KeurgSQFN0eJCy/dDD4+1RfHw/jJ8XYYrh/kbuTl/ucMkurEH9niyl
         rmcqCKzDOtuGbQkrCJE169PtqgujvBG0/jdTtVylbbVyc2QiO/JycQ4LonD2fiHtfhJi
         +1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063330; x=1780668130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rNbSa5cBAMgvrmaj0Kg14xG39pdVOPXbgUHJBktyWY=;
        b=Y5JHkZYASzzFOlK6ihYIXeuXLglwDqhA270fmpsscETfsgNOPVhLPJj0hlBEIR+MO9
         Ei2JKEPO0ZH+WY5vX3603eLzyVLP3bTbt9lCGQkZz6fn3Z8rixOlAk43w9Snw85wpSoO
         e8P07l8s4JhKr5skBARcK+azmXR+NALb2wdWKni254QHnjTBRYmqwSmLNpYdSeKhBRZC
         YJ3L2vyWyW25fdN3xb5vY0k6iQzzdXI5c2WhaPJZc3cpvoJVKMD4+9suld+ZzjJ7spFt
         ML6SvtL6blJFixXXcBKc9t42lMNeQYHIULmgH1Liub994zpnvlhWKbQ+VbwYXoC3mLgp
         1VRg==
X-Forwarded-Encrypted: i=1; AFNElJ8J0Wn5Z82yVP2Z/mt3uwGDeq2vLh2IgRjt708lbzqKq2fMUrkjfUrZtHL/SUUkg9HbUOAjdRSY7qsk@vger.kernel.org
X-Gm-Message-State: AOJu0YyX28saidcrxOs/mw8/Py9LcfCafTG9nC3JudQWVKSSVXytuByH
	nQWQtnT2z0qo2T9AwCKyp7I8q1HXa54pm2kTYn9ZUN6oPkElRkvjFDRTFmtFwgoN1/kG8OmjiLP
	tpcBiuJzwL6fWbc6r2k16XUXdRYcwltg4ZorWudSyOxYYUTDfSyq8wAwLnEw4enM2
X-Gm-Gg: Acq92OEVoGNog9hP10W/Xg0CU37iTAJ6TKszemGmKJhVfGRFHmHajo7K64So0m6sH8q
	JBDOQEoyniFNi+1QSvZcBSPrEHxhRfMWGDGNb8czrpwuSk5ccg/0PvvMw22p+nGL9hyGySMO1UW
	bOTJ5NXEIPrBVSoSlVCeheTJZDB8sYmC6TqBEQqFIuKiZldjx3yYie7kGZpHAzk/1KOdJI/yQaT
	ARn/hdajBwcJRKtnE4AcDEFI8i3Nh4FgoPsuhgmu+PAKrRflCyC87iZd3nyrPZSo22y+sv+CeLB
	aAxoOjBW8U38Ms1cvpTmpWmXnv/I7jeJlU6Y5UY5Jdg9UMFAlHClM6YsHGCmDHrLj40EdrJrB5n
	pSvaJ8xGm3+7FpjEvmKPidI7Ld+oo79dLSACbVfYmpxjvSyyDUTORrsr9fa9E1gNbffNDpVgKuy
	2S1twr2oemlUD6VhDKmrgdtMTEwcGDmL2SHxKTNjsiQDFfRQ==
X-Received: by 2002:a05:6102:688f:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6bf39268d3fmr1217351137.20.1780063329067;
        Fri, 29 May 2026 07:02:09 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6bf39268d3fmr1217198137.20.1780063327649;
        Fri, 29 May 2026 07:02:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c90b95sm2289911fa.11.2026.05.29.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:02:06 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Message-ID: <h5q6nlkxw2hpfpo2p5mt6umgju3kvhygeiyhngm37tabysifuo@srkdeexp2pj4>
References: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
X-Proofpoint-GUID: U86oDedT_QmF28U886zdcGOmM5VjLeWL
X-Proofpoint-ORIG-GUID: U86oDedT_QmF28U886zdcGOmM5VjLeWL
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a199c62 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jYLZWZKYfa6piK-RdpwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MCBTYWx0ZWRfX/MeCQvfHTdRB
 7kX1rw6JZqHV1WQO0rS9TOQIZtCHPGdLLNW+DpQuyrBki5CfxYRqVLcXlDfk+0D8UiXM3G335L9
 4zGuUsq/JHlibHigy5Jso+mRkvTpeRr2UB0TE0Ogue2xjR/r9gGBKju1BI2zXpiBdVS7Gk/SJ6c
 6VnXKiHKw81tgKc6w/t/67n+HVmqr78D9ewHkoXH7N1HUBskiB4aU3rTM3J8ExLPqeAUlVIO7vs
 MOe6SoQ37uJ1K+ZwlRZO8y1s67f566YW+lhdFsDPJBoDl1IcHd4tNVrmdKjMIfJOctLjTrum8Wc
 XxKzpK6KWtUHbbxRyYlGnFqthZbB2KCHMn8v5NV0v65KhC4z1zM3ibDVbHWI6DxEzqJLnYUOlsp
 yLW8A+XhJd39KEnD5dHJDRMLsz9iJMx86igbJXs9r97RZXl4pxTrBx6ZIYLcsSQfbcK6prjrT5+
 mm+db5B3QZ07Dpmwz7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290140
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
	TAGGED_FROM(0.00)[bounces-37691-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: E7C6E60347A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:39:11PM +0530, Maulik Shah wrote:
> Before commit 14dbe186b9d4 ("pinctrl: msmgpio: Make the irqchip immutable")
> msm gpio irqchip conditionally initialized pctrl->irq_chip.irq_eoi to
> irq_chip_eoi_parent() only for the GPIO irqs having a wakeup capable irq.
> 
> In order to make gpio irqchip immutable pctrl->irq_chip.irq_eoi is
> initialized to msm_gpio_irq_eoi() which now gets invoked for both wake up
> and non-wakeup capable GPIO IRQs.
> 
> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
> 
> Since the irq_chip_*_parent() APIs internally do not check the valid parent
> data is present to ensure irq_chip_eoi_parent() is only invoked for wakeup
> capable GPIOs validate d->parent_data within msm_gpio_irq_eoi().
> 
> For non wakeup capable GPIOs d->parent_data will be NULL since parent
> irqchip diconnects hierarchy using irq_domain_disconnect_hierarchy() and
> later irq framework trims hierarchy using irq_domain_trim_hierarchy() which
> makes d->parent_data as NULL.
> 
> No functional impact.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit log with the reasoning
> - With the reasoning added keep reviewed by tag from Bjorn
> - Link to v1: https://patch.msgid.link/20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

