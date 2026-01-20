Return-Path: <linux-gpio+bounces-30798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK73IH12cWngHgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 01:59:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DC6023D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 01:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04178849C92
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85416427A1E;
	Tue, 20 Jan 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGy40jut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E7426ED2
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911392; cv=none; b=lx4fyzVmVJ3mJyGyZQnuQ/sul91o0UVCWoJk06QdnBRUC7vX/81cEiL/ObFKcfnVhVvwA3f8vqyy1aMs50xIzcGMCdmM21ES17fAP9DcES/ciG/cbhZtRqiuq5dUURNMZ1O51wqOhYLo6Om07Ofa4FR2qnJFzVxhAgftSzhf9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911392; c=relaxed/simple;
	bh=f4SQu8TLteMQk418u5SbKNfQe6oAUTEfS0S5lAZ0Tcs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2x1pSllV7XIzjW1Eyca7qJ2o4YarBKdwLBSj2/O7Hw9DzhHcuZ8J071FQMeyUXHsyyBvRnPLoDBsf7pOl1dw+QDd+C8vIMz+UtXiBHQAScrswjEDW+VSX6MyzKEjL36xwle23L0YjOFe3F1FcG5iIv3V/mloA824aU3sxNfmwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGy40jut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC0EC2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911391;
	bh=f4SQu8TLteMQk418u5SbKNfQe6oAUTEfS0S5lAZ0Tcs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=dGy40jutA+5sYQr5rlYKmQj9WnJPyLnL4ZJG3v9OpoH+oRvnp79n9+vmrgRC6TtpK
	 A+RlMg9yZKt7NzJh7s8hiHUm8ST7a1iWUhmFl1T6ZEeKE6/XHiTVzcbjABkUnpDK02
	 zBpfdAx3JDw1muB6/iFa5mt2Rc8VIWQ5gPqCPj/1vG05pPx59hTJv76VeofYQTUD2t
	 aYv53poCdGjDy0YPOydTDyyWx6+x3Vn/VPX/kMj2Pz5ZG759+DsaVUz2TE0rG9FcUY
	 4a+ai3RFv8MR0fVpWwL+4zt7cfqZ8aKyHD6FoAsqOsM4yGJbqFbYor19FSbfPb996b
	 gIDkULjjY+QYA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b9fee282dso5338921e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 04:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8R3jaCkD57imIYfKNNl5omiJF6d6LNVxt9VCWYNtmrlA38CL5V1A61N3sGnDcv3MyaBXGRYaSqCQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjjGEGrHFCsheaVGu7ktpv7/GjJaZnLfaR7TfAPPWCONxuW/N
	dtNLCK3LkYhAz1U4+pxF0G/9cgp/y7T9jlWWKctJi3RpJ84JV7VamH9Bnawb3LKWdTWLhsNqffi
	eig/Zv8ot03A9nYde1ru/hyt1XpX2KBTnUze0sQfycw==
X-Received: by 2002:a05:6512:2398:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-59baef01bf5mr5299465e87.46.1768911390457; Tue, 20 Jan 2026
 04:16:30 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:16:28 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:16:28 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 12:16:28 +0000
X-Gmail-Original-Message-ID: <CAMRc=Md7+SWMpF20y-+-+Hn7ymkzuMeTxT2EsE3Cnb=B6YUG0w@mail.gmail.com>
X-Gm-Features: AZwV_QiewUw2Hjrv10M89S0t63JoJsu7jxaj9pA-T120txrnOoBROFqPAhkrEn8
Message-ID: <CAMRc=Md7+SWMpF20y-+-+Hn7ymkzuMeTxT2EsE3Cnb=B6YUG0w@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] pinctrl: s32cc: skip syscon child nodes when
 parsing funcs and groups
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[36];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30798-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E85DC6023D
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 12:59:19 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> The SIUL2 node contains child nodes for syscon
> instances (SIUL2_0 and SIUL2_1) to expose register
> ranges for SoC information. These nodes are not
> part of the pinctrl configuration and should not
> be treated as pinctrl functions or groups.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index cdd3a1cd4fe5..50d5a01107eb 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024-2025 NXP
> + * Copyright 2017-2022,2024-2025-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -832,6 +832,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>
>  	dev_dbg(info->dev, "parse function(%u): %pOFn\n", index, np);
>
> +	if (of_device_is_compatible(np, "syscon"))
> +		return 0;
> +
>  	func = &info->functions[index];
>
>  	/* Initialise function */
> @@ -941,7 +944,8 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  		return -ENODEV;
>
>  	for_each_child_of_node_scoped(np, child)
> -		++nfuncs;
> +		if (!of_device_is_compatible(child, "syscon"))
> +			++nfuncs;
>  	if (nfuncs <= 0)
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  				     "No functions defined\n");
> @@ -962,6 +966,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  		return -ENOMEM;
>
>  	for_each_child_of_node_scoped(np, child) {
> +		if (of_device_is_compatible(child, "syscon"))
> +			continue;
> +
>  		ret = s32_pinctrl_parse_functions(child, info, i++);
>  		if (ret)
>  			return ret;
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

