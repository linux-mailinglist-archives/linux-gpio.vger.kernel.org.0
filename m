Return-Path: <linux-gpio+bounces-33240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEi0Jf6hsmkOOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:22:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C0270D0E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761693081BE1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68513B388B;
	Thu, 12 Mar 2026 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiQdmWnW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867139D6EC;
	Thu, 12 Mar 2026 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314512; cv=none; b=s/t98abGcRdSIDjF/cj2yEK+jYwlpntQzd+QukMR7GbpUIoXd1S1XGqnZqVSNec9jR2iUMXwfpbqadNrVhX5sKwB7Ekdas/XtyMgGNy370z1ULC5Nu9VuJLXNeUVM3oDHNqnNfmL1qh41zFcYP5GiFXJIblHJsKOi7ZoUhgBnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314512; c=relaxed/simple;
	bh=ka1+40NCf1V8bKWsuV29BMn3rQttD0Wiz0TTE+RnufY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skXj6jDlh1RbdDwmM3zT9V0to3J53XCgAWJ7piKqfzanl4mgkfvM1hfxjr108F0VBoRiN9QR2PMBd8YYaNJXN7nSYHZ9DFM1sd6mKMJHBNBS8RJ14BUfQpsNd8u7TThZ00TYZKZeqHftxdtcnoztjjtw2wGSDzuQBfGLw0gHQpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiQdmWnW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C24C4CEF7;
	Thu, 12 Mar 2026 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314512;
	bh=ka1+40NCf1V8bKWsuV29BMn3rQttD0Wiz0TTE+RnufY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiQdmWnWhE5sHW3j9Rurh0Srzd7t3zPDVmlikV8bdHLF76o/B6SHwD5wMnpnIrbKm
	 XbrgqSscDiCC22hLhXR1EHpF0JBC1MTpa+Ql2kNOxO7FGCCAYM0IgPCOaTEMaaATFA
	 eJb1cyO8ny6vmvYe+nEcnQalde1FvD2Hp6Ijz+jOR1rk/lDXG5ac7jv3DMq1z26eW0
	 JO1oSccXjF1Ssr5ulQVc+Q0Mz1ngfOgbOqv1yE/c7vw/5zJlenNWI4IYq04rN77Zml
	 aedgEwlDi4+jHqEQXo02g4am9nr3Bijy/ZHxEQJ/QqDJqGp2Jmw4gE6jorH+kwqI/w
	 qOHzvuJ4no4Ww==
Date: Thu, 12 Mar 2026 19:21:49 +0800
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
Message-ID: <20260312112149-GKG302167@kernel.org>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33240-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED2C0270D0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Junhui, 

On 16:42 Thu 12 Mar     , Junhui Liu wrote:
> This add GPIO pin configuration support for the Spacemit K1 SoC. Some
> use cases require configuring pin attributes like pull-up/down when using
> GPIO lines.
> 
> A practical example is the SD card detection pin on the Banana Pi BPI-F3
> board. Since it lacks an external pull-up circuit, the pin must be
> configured with an internal pull-up to function correctly. Such
> configurations can be specified directly in the devicetree:
> 
>     cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> 
> To address this, add the set_config() callback to the gpio-spacemit-k1
> driver to enable pin configuration through pinctrl, and modify the
> pinctrl driver to return -ENOTSUPP instead of -EINVAL for unsupported
> parameters, allowing the GPIO subsystem to gracefully handle them.
> 
Thanks for working on this, for the series

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Junhui Liu (2):
>       pinctrl: spacemit: return -ENOTSUPP for unsupported pin configurations
>       gpio: spacemit-k1: Add set_config callback support
> 
>  drivers/gpio/gpio-spacemit-k1.c       |  1 +
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> ---
> base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
> change-id: 20260312-k1-gpio-set-config-f0873e92ebac
> 
> Best regards,
> -- 
> Junhui Liu <junhui.liu@pigmoral.tech>
> 

-- 
Yixun Lan (dlan)

