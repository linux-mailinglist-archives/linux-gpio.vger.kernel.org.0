Return-Path: <linux-gpio+bounces-34677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP2iNBkS0mlVTAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 09:41:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371439DA93
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 09:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2872030094CC
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 07:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2259D36A02E;
	Sun,  5 Apr 2026 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sd+W5Kow"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A70DDCD;
	Sun,  5 Apr 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775374870; cv=none; b=KG5RAiCMhGnRX8v2HGq7JPtlYZ+u4lr5uTdyWa4opZo+xxdh1WcEF0M8126BF6pccuA+1NSQJpEEJSy4xeXgbfdHUug7cbCdYdxfN3XeU8ecvRWIPqtrA1z7MhTVbjrm8sO5kEwJ1RytET1hHnZ99CbdyQtQl9vIuGB/ExBclFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775374870; c=relaxed/simple;
	bh=xMHJMLD6auH57RAml3QH+hWo8iMWMFRq2cv+mHA962k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/uRymn8ChA+aYFHSJtLaIXv/W8AsoxrB7+OslXO9tAhbNh6GulE0KEPgJkSnTpfAQQwVOy5YTidcMQZXW80ksg6a4zIXWW6/sOFQTOdPV2fJ1cpFjiIU4dTCv49gL66aLF7edjrzmQLAw0YJr9b1T5tLB5Dv60TmoiAaK8J7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sd+W5Kow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EA6C116C6;
	Sun,  5 Apr 2026 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775374870;
	bh=xMHJMLD6auH57RAml3QH+hWo8iMWMFRq2cv+mHA962k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sd+W5Kow5B3pjr1QskzmW0g2GHN/S9A+GuLg/fp8irzSH9NtfQPMYu7L2tSY9GG3+
	 yeKcnDFV2YylnAE72mBKgTn7AQGqsHOUA3Uamcy38FRI3PIAoHW1ldykhWwkE4wzah
	 B7qmxGE1c9+OuG0JsrdW6Hbhv60+CTc9a1gOkaIZeClX6OL6lQ35pTfxkoHjyfbYB+
	 HHqcLNiMfyIxGQXM1AqDHDPyxCjm9d6zuO/tkCavecn3Ugs+CKuhfo0jzvBd6EJpBU
	 wdPZtszBXUtz+iuoY6R/NQDIO4nsJjjPCLwjKQklx5bB4DEC9NETVBNgZKz0IiECEl
	 wBtEA++7t5/Mw==
Date: Sun, 5 Apr 2026 09:41:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <20260405-intrepid-crouching-pony-9ace18@quoll>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34677-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5371439DA93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:56PM +0200, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 6df6159fa5f89f9f0470e700b4698dc8849ed515..6698e2a50b2f67b1aadb4a840339e769c92f95f8 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -261,6 +261,13 @@ config PINCTRL_SA8775P
>  	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
>  	  TLMM block found on the Qualcomm SA8775P platforms.
>  
> +config PINCTRL_NORD

N goes after M, so probably after PINCTRL_MSM8998

Don't take Milos as an example...

Best regards,
Krzysztof


