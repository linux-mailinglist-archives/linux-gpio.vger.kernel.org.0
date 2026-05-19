Return-Path: <linux-gpio+bounces-37108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJhlCSjXC2qhPAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:21:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551A576CD7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3704230118DB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 03:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244852C11CB;
	Tue, 19 May 2026 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAt+A9Vg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB932750ED;
	Tue, 19 May 2026 03:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160858; cv=none; b=ddF/WpNjWxEAYJQb7sH9uRp2ZLIg6RSDBOnJ2Ku2W5LeaAzuRWqwQo8onL60vJaVeQZLkJR+UGC07EsejymYI1tT2HBSkAeYTsJFEq8ZXT9auHhieToDmZrKthS7mGffw46F/8vyT84v9820dtacVCaQVcNh8rH0XcvLVoAb4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160858; c=relaxed/simple;
	bh=/36KSusPRTP/UF8GENjGZe0621iZvB61CO7GNMkMhUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrNEFh2xFX9VZVP6mtds8SbbqY//GA3sGZbxuKdQplCTSb9yXlrXkeV3dJzGpgJl++8u7o8EvyFKQdpdddTlT6hJ7ZD/DsCXzuSI+RkEeKhoUyKVODzggwnhk537TtXNc/6jG+Hg0JIkDXqLktIrmKij6+wa90cFc3LgOhWsECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAt+A9Vg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE7EC2BCB3;
	Tue, 19 May 2026 03:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160858;
	bh=/36KSusPRTP/UF8GENjGZe0621iZvB61CO7GNMkMhUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAt+A9VglNl4qNUEXY9HZgnK3mFqQhM3+1XSFnWvkdlqEXMHCtecajVp2hMRRgMB2
	 gq0b4xbYBECOzGys+7dvH24CjgE0KRez8tdMvedLUDz5y2STmAF1YpO9F9Bu0Q1pSo
	 xk6pyICFl714rG29tRk0rileuIWg+MTvwzBlO0JgdUG+EWGPv+K7B0LI5UGZUdmxWN
	 8+XMEqzX5/DSE66VCoFkWiGPJB4f9bsiq9rmQLZjkJ0/geywSsAfsN5YBwYaEksI7b
	 +PoSH0IKcDbTIWkSjjI9K+WhQpFkfLql4BOcLgQ2guR0GDHRkXNd9vSDihUL3hKzxA
	 8azkzfEi4viAg==
Date: Mon, 18 May 2026 22:20:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Message-ID: <agvW8hetKSsPAXgv@baldur>
References: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37108-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 1551A576CD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 02:08:25PM +0530, Maulik Shah wrote:
> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
> 
> No functional impact.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 45b3a2763eb8..6771f5eb29e4 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  
>  static void msm_gpio_irq_eoi(struct irq_data *d)
>  {
> -	d = d->parent_data;
> -
> -	if (d)
> -		d->chip->irq_eoi(d);
> +	if (d->parent_data)
> +		irq_chip_eoi_parent(d);
>  }
>  
>  static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
> 
> Best regards,
> --  
> Maulik Shah <maulik.shah@oss.qualcomm.com>
> 

