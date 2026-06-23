Return-Path: <linux-gpio+bounces-38848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7v9CFcmrOmoVDQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:52:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC46B8759
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 17:52:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SLSN4one;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="D/VROfq6";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38848-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38848-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4830B3018610
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 15:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DDF305689;
	Tue, 23 Jun 2026 15:52:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3A2D7393
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:52:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229955; cv=none; b=cQRtrvH6NGPGD1DAuYFaYCS1zJhwAPq64eJGr03ZXKQakJ+uoF8KVRkCsgGdBjMUTlxUTzQA/nooOQHP6QDHS+BpMf1glP9UXKT8G7F5A+ckxZ75oT/jaKNOJEtAdFHlSrGc+g1hLW46VH+paCirF0PlWtkq6pY/GbqPwRfGGXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229955; c=relaxed/simple;
	bh=UiX8iIXfwTkI1R2HiX1zn5Surnk57floHA1qcRRtyr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzJoOYrX4tooM9EVpNmsca+4eOpGCJ1ycTwH2yVul6nBGcnA2OZOHYwtnYkqurNQvGbs60rcIv2W6J3RPJcYC9CZoPvzWLtQ+je6KbCd9LngzN+NhsMfCMmV5QlQcv3mhEEdRJ9RcqWVxsjwfrcHvwfNE+0jWYHAoP3KWN7yFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLSN4one; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/VROfq6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXaDj3744739
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gFSaw/u+/0FxiD2pcJvn1Wi1
	v6T8JxW8g+4qgMYIPUM=; b=SLSN4onevKNYpSys4K/MnuvYqfKou6QPAOPDUPv/
	P/Y237ze8WJzWcuYjItXYLJ3KiLHdTeHk+4AFB5lWIYi19qq760n8cuMCM55llp/
	8MnW0NjZSCRKiEPmkpahubVJQ3MQ8ZLYUsSBg0rKtpQimXZOjWDLQxiQl8EDg20B
	919iVIo9caBBqYebD0ixmJGSkcff9On/5bPMTRsTAStGbiPRJ6IEgeAoAz6jaNPL
	PY5jYdNgVFffL601t55JgzuiRBxTXR2fMiAuUrZ1oCgBX3P/5w40ZfO56hTn2afs
	mV+EjS7mJt4GQThVY6xugrBIq/yXPg0FTr8gdq77Gv2o6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx39t68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 15:52:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso68114a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229953; x=1782834753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFSaw/u+/0FxiD2pcJvn1Wi1v6T8JxW8g+4qgMYIPUM=;
        b=D/VROfq6sT9aIombwwUnaH8atlbj4dNVk1Y8NGTca/mANeW/bPtRwtTCQmfCJKb3PE
         w3m2mj8VGnQDe+cJqFCtM3c+6yN/tkeh1GYJYmLvgdMQ+CNMAoY+oVquqMYZLBG/tCxu
         7syFxB4jTMTKP+4p7ywEgYt1ROe1qCCCXeneLmRxG8Gf0hlEPMzm8N0T2MwTfcvly6t7
         rfbF4SRPPWsFOUNRffkmTLZhsWQR4nyjBXKHBzzK7oUwjpcZAYQPu17fTlShA8a45jmn
         K57x729g7Jm3x7dwvnfO5mDJtI+T7nQTzdXpjnDvhhwnPQPNNTw0HKAp95nmq2JYSAZH
         XMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229953; x=1782834753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFSaw/u+/0FxiD2pcJvn1Wi1v6T8JxW8g+4qgMYIPUM=;
        b=Cb7wAhSAhyI2UZlcFW99Y5ci4r59v33Jcep4g8c756kJuNIwRmG166aoP8LD1XPpkK
         3vRQM6sxO+lF8RON61DaGJcNd3OuLe2+KJHK+Fg6kufZItvJOlAyGe5aXOrgrpXbbE4v
         5jLWo5c+MHzCm2Vn9jrvL3X+En43kGtVkS+joREstzZtOLN7rVv0Hwm5cgzuagvrY6Cj
         e/p2gY02nz1m4IUSIsKjajfOQ4Jl5mpT32TfS3eLAI9Y3U/ADM55+0xJ2xuZYQYMJBcx
         4hTfbRblZ0eU9Xue7H5vlFkTR4OByngM6bfW1+JjIGWDPpGA72SN3DTFQU0tKUR+5eUE
         JZSg==
X-Forwarded-Encrypted: i=1; AFNElJ9AO7tvUewybcA30b9ax+TgbzO0y/baP+8bcV7QnaSkQd3NESnloC6BrYX4u+VXofrz9G4wCeO1C9xR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dSY6/d+cFiAO+EYRpvKhujleUVQY3j5Um1Ea0ddZP0gO3Bcs
	4+GEP8mR0W7xB4aYvKxbGpQrYrvpmzrceBlyXhS9hkvskn7/otYUwV2bYmkIGt9oHwTrgkgL8qm
	5by2WL1Mt37fFdG/1oaJSiob+E/U9V7v0MsVOVj52kE958B5Hd8RWRvptg1SjwXER
X-Gm-Gg: AfdE7ckrZvJQOTrlUQbD6tpKy/Ztnerq9H1SEIUy13Kz9wDqhtpj4ED/UFwcZXhLbFr
	yHesD85thzrcNTH0oSWeq/rkS+zDF2RqW4bXUl5iCtDCJBIfsu2N5dalC+Jidb6I+2AkKWuXXEg
	LbVSw7APHfgeXX29eiC6rHKE0X7Z72MxSKA8TNM8+lXkw2EQ9Shagl/NcE1Y8ATe8WVglrpFS5v
	6h9ur7MkpHfne8RbAhNIoOxK5fldr3xwh/7LkN2CJq0byLlUJ6wHsirUcNIos1ipexvPazybauE
	yuLavc7sc/GepYPY67mWX8br4rjfC18dtEfTtR9wIEJPEg1WJP0aaWMi4jB86ME0lxZkSCQEcjk
	nTenx6fO4kgcx82S+Hkpksx1x9BjvShU53hsNqQ==
X-Received: by 2002:a05:6a20:c90a:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3bd18fb0760mr4106543637.3.1782229952593;
        Tue, 23 Jun 2026 08:52:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3bd18fb0760mr4106492637.3.1782229952040;
        Tue, 23 Jun 2026 08:52:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bbffc2329sm10757380a12.0.2026.06.23.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:52:31 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:22:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from
 msm_gpio_update_dual_edge_pos()
Message-ID: <20260623155226.n2knq2lwtiwc5boj@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
 <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3aabc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uwjjOWXvf9S-uVtQyYsA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dRIK0eduntx5n_bdgmod1SNJWF0uQHBq
X-Proofpoint-GUID: dRIK0eduntx5n_bdgmod1SNJWF0uQHBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX49TiJOz6a3mb
 6Opw2TWUkfG2DugsFPiEubvxBLee4tTC1Fkv4op0+eYsPbku4Sws186bxWWZ7QuKbZqLXtdJbCB
 pXng7M485n622eYDdKNeltCZnbPPgWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX9BTh7/WsZifH
 MG8Z5IQh5eCXBFDgfmtALOC+YW2nho59jwN05ZxaX58zP7/2RFiiUNm9i20qz8X3UNFPGu1whyF
 eHsmWWycCZKcrfapv0a43X40Vw6fDut1rxDN4CNSHgwkHiiEDRn7kelG5yOYJnks6guAcCfwcLx
 9gLM4pSlq4cYzEe/VTktnS+emzAeqz6f9l0kw5ryX9+0tysd+YvdvPXPsQ+0ZruB7yjYxUULwNn
 +I4IAuUl+KPBjjhRg9eXv1Mi5fzHJ2SwZUNb03M+tZGSTVD/9FNk20tXO/SmBTQtgo87qOqAyFA
 ERFJ7OPFq13Odd3mtXKaH5TqbmZAHooYEuRbt9QQheAZuZxW9qoQ59h8/esW9I2Rt9OGTcazI+O
 c2QXfjPtWGkHxZ3s+5Cp3uHjrC9fWqhZlF3dDioGNnZt55hcH57b440uvq9koOax4y7RWEb/svO
 DDif/sDo1FovUFEt5KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38848-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FAC46B8759

On Tue, Jun 23, 2026 at 02:27:32PM +0200, Hans de Goede wrote:
> The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
> unused, drop it.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 419342ab45e1..f780bab51d9c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -810,8 +810,7 @@ static const struct gpio_chip msm_gpio_template = {
>   * Algorithm comes from Google's msmgpio driver.
>   */
>  static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
> -					  const struct msm_pingroup *g,
> -					  struct irq_data *d)
> +					  const struct msm_pingroup *g)
>  {
>  	int loop_limit = 100;
>  	unsigned val, val2, intstat;
> @@ -1015,7 +1014,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  	msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> -		msm_gpio_update_dual_edge_pos(pctrl, g, d);
> +		msm_gpio_update_dual_edge_pos(pctrl, g);
>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
> @@ -1190,7 +1189,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> -		msm_gpio_update_dual_edge_pos(pctrl, g, d);
> +		msm_gpio_update_dual_edge_pos(pctrl, g);
>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  
> -- 
> 2.54.0
> 

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

