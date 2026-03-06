Return-Path: <linux-gpio+bounces-32691-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELhOKqfkqmkTYAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32691-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:28:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55014222AE8
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D90F301F33D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 14:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB45138E5CD;
	Fri,  6 Mar 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="V98CLCO4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD933689C;
	Fri,  6 Mar 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807080; cv=none; b=YF+8Vpti1CibUkhuOzC5C0j1ik2+Z1z37Q7ocIlE4fI+/V12MBkfDg81wm7vpSvMnoibnqHJdowUnVIlOfaimZtJ2NdoEe4JShKhKfPkZLcr165ShYbwhhQCShtQSVswVa9rd7+8Qj5uWJeMjIwY/MR3nUIKVrX3YmGwyJWh+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807080; c=relaxed/simple;
	bh=6OkOqGrqWkYWaIXzcQ5bM3nvX8EDOg+UKgImTbdpC3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lICIwWjXRBF3gFLmieYeino+Ly1oOo4T+96oTZ4HlbtK83kNx+vjdgacgJaHmCD9bMNr5F1z9M7DqDOxoyBSoLS2wHTs2SdEeBMUKqJy19BPgNV450XlWdiOyVgxgM03N/ZS0GtKEd5DlfmUbGBFqAaKI2hUnj/BUaBZ3tz/T/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=V98CLCO4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iP/+KyLFxcqxA5l9rU9MI9S/9G1X3GO+0l1FGXNsyfQ=; b=V98CLCO4f2BlxzFF7j27+NDGzP
	MUHc4RU4Jp2NxDPKV4Jt9hhoyRvN/Rbb2yOJ4xgG/pJes5IaA1WhQA2j4YiL6pIxjBvB0S/JHeS6N
	UX+2NYTNArBvFyhwuaiFUfSZrboOr+yJolcZD6CfsVnqJsNO0kqGRSXAvhaY+h/GRuRY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyW6O-00AUTM-NT; Fri, 06 Mar 2026 15:24:28 +0100
Date: Fri, 6 Mar 2026 15:24:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
X-Rspamd-Queue-Id: 55014222AE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32691-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

> +static struct rpmsg_gpio_fixed_up imx_fixed_up_data = {
> +	.recv_fixed_up = rpmsg_gpio_imx_recv_fixed_up,
> +	.send_fixed_up = rpmsg_gpio_imx_send_fixed_up,
> +};
> +
>  static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
>  				   struct rpmsg_gpio_packet *msg,
>  				   bool sync)
> @@ -572,6 +711,10 @@ static const struct of_device_id rpmsg_gpio_dt_ids[] = {
>  
>  static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>  	{ .name = "rpmsg-io" },
> +	{
> +		.name   = "rpmsg-io-channel",
> +		.driver_data = (kernel_ulong_t)(uintptr_t)&imx_fixed_up_data
> +	},

Its not clear to me how this gets applied. Don't you need a different
compatible? fsl,rpmsg-gpio-legacy or something?

I would also put it behind a CONFIG_ option, and in a different
module. Nobody needs this code other than your legacy products. You
don't need the bloat for your new devices and other vendors don't need
it.

    Andrew

