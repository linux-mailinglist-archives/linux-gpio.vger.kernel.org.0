Return-Path: <linux-gpio+bounces-38406-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /QteGf2JLWouhQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38406-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 18:49:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0E67F172
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 18:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KPBm6DbR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38406-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38406-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B619300E73D
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 16:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70483168E6;
	Sat, 13 Jun 2026 16:48:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B5263C8F;
	Sat, 13 Jun 2026 16:48:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781369333; cv=none; b=XO4TeijJ9LCJnqSaKKDsl/JfL4cagaF2hSYTyZpvPNawCS5iU//Y95oL22C7CoylimU2ZVJ6XN20017EWWoHvteZkST6xA/nriEgbIj/2TEtvLgLzlt/IwwuxSqw5qiHK+5fFlJ/yXLRfyW3a84uKTp3lfR0XIXb1TuFUNSJg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781369333; c=relaxed/simple;
	bh=u18l/tEe4VipANnKG2MxfkxQ+FFaXOgq5noVLMuBeTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de2qjcRBSbnRfffSS9edfnkkjh05TTXDiqwoXnEuKwCSZPbNFcjuGKfLGPJjPlla4lBZz1lrQqfo1GOd2NZrzVJONrWV7ePiHMPX4zXAJ4mlbpssJjYwiPHoCGUAwVr+DgNeAeS+dhUG/fx0c+bWpBUDiw9/xXehleRYhOBewpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPBm6DbR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4701F000E9;
	Sat, 13 Jun 2026 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781369332;
	bh=LVBnyWkL2409t5kbHwLTU6uhwAAVAlV9g1CqOb0LOcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPBm6DbRE1k0T7fGnKCHKz0da1JpXeBiGifUPNrTt6HWQ4OV2OpvCJjogPVNtWwBF
	 O+ra2mqYG6V8v7EkkWo3rnupvm1l1+FShOdChM9+ZG5vtWjlvgxtamWLGn6C8MGiDe
	 H6Y8H4Gav87X4AsxK6uquK/MUGdMhztce/HTsiUo4KEeo+kde+k6mTERTpsldoq8Pq
	 XrEBWkPyWYdGY1ZygqtqW1OZd8P5kQlDjDkDyg0hgVxKsbWhFY1bd1vRFoiorKma7e
	 U5ittcyxp5BgM1+d6VmC5rRJBP7a2G3q6Z1xjdeQ3LXEz9B/BIwQWQBVMnibur1XAz
	 FqInFbyPkG6hQ==
Date: Sat, 13 Jun 2026 12:48:47 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>, Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Message-ID: <20260613164847.GA3152104@ax162>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
 <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38406-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1B0E67F172

On Wed, Jun 10, 2026 at 01:29:56PM +0800, Jia Wang wrote:
> diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> new file mode 100644
> index 000000000000..8fb5b0ea5b93
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
...
> +static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
> +				unsigned int selector)
> +{
> +	const struct function_desc *function;
> +
> +	function = pinmux_generic_get_function(pctldev, selector);
> +	if (!function)
> +		return false;
> +
> +	for (u32 i = 0; i < function->func->ngroups; i++) {
> +		const char *func_name;
> +		int group_selector;
> +
> +		group_selector = pinctrl_get_group_selector(pctldev,
> +							    function->func->groups[i]);
> +		if (group_selector < 0)
> +			return false;
> +
> +		func_name = ur_get_group_function(pctldev, group_selector, 0);
> +		if (!func_name || strcmp(func_name, "gpio"))
> +			return false;
> +	}
> +
> +	return true;
> +}

The usage of pinctrl_get_group_selector() in this function breaks the
build when this driver is a module because pinctrl_get_group_selector()
is not exported for modules:

  ERROR: modpost: "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko] undefined!

Also reported by the robots:

  https://lore.kernel.org/202606130210.ytVPxHlm-lkp@intel.com/

-- 
Cheers,
Nathan

