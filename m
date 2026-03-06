Return-Path: <linux-gpio+bounces-32619-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHTpBp4mqmkPMAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32619-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 01:58:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CF21A11A
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 01:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E16B304021A
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 00:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BCC2F28E3;
	Fri,  6 Mar 2026 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg9h/R5d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB02BD022;
	Fri,  6 Mar 2026 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758627; cv=none; b=AIN2Rvk8AxLBo9vjCT/rKdxMslFTUvS7DwGOTk5qozXYBEuRq2qV9Jo/kXl6Q5kMYbL+lrux/q4cQu7cO+wlLyye36lPOziCn2ejfk1NKsFStB3kl+rlBdsdwKBK84VA8Ri1Eosi1CaNgjKoZlFAtf8qpSXcvvwMTZCWOmQ4M9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758627; c=relaxed/simple;
	bh=9QPHXsJibYdiI9qqEiSAHrmKf9tnT4G0DXCtKS89QIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAf58FSqoUoepjXdZSEhu/Yb77CnAWKepHEAiKNTHCDuDWyj4y8DtepO4YtZLCBhbrNFrzI6LgOSEqTqMqXAYOyMUu2qfjNuckT2mgmgn6k1Ul9W1o0fGoA4JxgJLmIZDRwKWen3hVMGHKPqW92bsprPCAJO9wXSEIvjOz7Bv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg9h/R5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879C0C116C6;
	Fri,  6 Mar 2026 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758626;
	bh=9QPHXsJibYdiI9qqEiSAHrmKf9tnT4G0DXCtKS89QIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zg9h/R5dfAalOU6ZrHNSdH4Kmx50xx+BKM/S1ZhLdPBFgNDbq/eNtVcRFFQPdnGFu
	 6VBZ9uBGfVhIEBzJN9cGtMMXnrPgbNHEdFeXy4zfuwzKO7g5jnK2W04QFsLfwQQupC
	 V5jaR5689kUMI/OjxLunX48h77KQxGVmjk6Xcrs7Ti4w4dGlWrrnE2XrROArfaHLpY
	 icc3JmgjXwp/NLOGwgsYlbPhKvpaqhUXStZh9PqL6TEJEHSwsf+1IfMpDsYAa+DTRQ
	 kkzb+uR+JgPtlK+b8CY+oW4WJCytU/bwUh3HEyeWb9OXbnMwqeEPIazYx8GMr+1TSb
	 3+K++YazKbKng==
Date: Thu, 5 Mar 2026 18:57:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peter Rosin <peda@axentia.se>,
	Conor Dooley <conor+dt@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Message-ID: <177275862503.886378.14653051699126465622.robh@kernel.org>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
X-Rspamd-Queue-Id: 6F9CF21A11A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.infradead.org,pengutronix.de,gmail.com,axentia.se,nxp.com,vger.kernel.org,milecki.pl];
	TAGGED_FROM(0.00)[bounces-32619-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 25 Feb 2026 18:55:06 -0500, Frank Li wrote:
> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.
> 
> On some boards, especially development boards, external mux chips are used
> to switch SoC signals between different peripherals (e.g. MMC and UART).
> The mux select lines are often driven by a GPIO expander over I2C,
> as illustrated below:
> 
> 	┌──────┐      ┌─────┐
> 	│ SOC  │      │     │    ┌───────┐
> 	│      │      │     │───►│ MMC   │
> 	│      │      │ MUX │    └───────┘
> 	│      ├─────►│     │    ┌───────┐
> 	│      │      │     │───►│ UART  │
> 	│      │      └─────┘    └───────┘
> 	│      │         ▲
> 	│      │    ┌────┴──────────────┐
> 	│ I2C  ├───►│ GPIO Expander     │
> 	└──────┘    └───────────────────┘
> 
> Traditionally, gpio-hog is used to configure the onboard mux at boot.
> However, the GPIO expander may probe later than consumer devices such as
> MMC. As a result, the MUX might not be configured when the peripheral
> driver probes, leading to initialization failures or data transfer errors.
> 
> Introduce a generic pinctrl binding that models the board-level MUX as a
> pin control provider and builds proper device links between the MUX, its
> GPIO controller, and peripheral devices. This ensures correct probe
> ordering and reliable mux configuration.
> 
> The implementation leverages the standard multiplexer subsystem, which
> provides broad support for onboard mux controllers and avoids the need for
> per-driver custom MUX handling.
> 
> Allow pinctrl-* pattern as node name because this pinctrl device have not
> reg property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2:
>  - change descriptions for device, not for driver
>  - add missed additionalProperties: false
> ---
>  .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


