Return-Path: <linux-gpio+bounces-40107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qVXoDU9xV2piOAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:38:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7A75D9D8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:38:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Jj/YkM/q";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40107-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40107-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96F02311184B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC1D448D11;
	Wed, 15 Jul 2026 11:36:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3835D448CF3;
	Wed, 15 Jul 2026 11:36:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115372; cv=none; b=nwxPag+j9L+GYIm/GVXcJ6cRA6GD7JqBJ8sEQfC5BesG6tt6XfO2g3zOeBwCzg2fzJtUG8IOVkTsimQdkxOigKMmLrbhRAABEN8NKYv7XJzPr3dooZy9jZSlurkrporUvY6zv4TqzXizeWmD5i0N+lBtt/FPYa12LQxcIb93HVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115372; c=relaxed/simple;
	bh=vR/hWLz7KlqMR3k0+e0hevTgG/iew7QOE9ntVM+LJXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBqDK9EuwY41wMvGqIp5ntiMP1pCxj9gEU/lDEQCOC50DL8hHA/6WFxzHFGCuskOxPeTxz61OI66gEmzI3cRdtF6ZXT24XsocennLCON6PXY6yicnCAn/GHxUpcNukKwPm8yx0nLOl4zw1Wikw7PkZNCtZw3C/x17EqszFn7Fh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jj/YkM/q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483BE1F000E9;
	Wed, 15 Jul 2026 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115369;
	bh=s+cCPUzfDWNBEmGXrtgzlca2oCCH/fQk5Q8BM6egFX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jj/YkM/qLp+Lk6Zvg3BomiGmm8LZA99hQo6UP+rLVSeQYgQPZEG7yK3TCWRjfgvEY
	 iNNRn4aGUhhur5rCfGmfyc4wDueGwR5MA9HHVJnYIADM+MNuytRFPKJXE6DZMyJO9j
	 o3gI6ydM1yfpzkC/zWZ1YbCpXhj8GNrcVyw0Xe5n9BLppdjKZ00b9qmZsoRTc9WXd5
	 frcHWRvnLE+7cpWKLLMxPiVVBd/SgfbHUZ19CdYTNfSvOnRAlwu11xq2td96hUfCyV
	 On33kR75UWc+A7XvQHTf4jkDMGWu9Wuhh6Tf6YdYYsomC0tzl3CanNLdeUWpw+e+C5
	 Rl7YuwIAmZETw==
Date: Wed, 15 Jul 2026 13:36:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Message-ID: <20260715-unbreakable-utopian-wallaby-fc1bec@quoll>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
 <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:lkp@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40107-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,quoll:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D7A75D9D8

On Mon, Jul 13, 2026 at 05:45:17PM +0530, Ravi Hothi wrote:
> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
> Eliza has the same pin mux functions as Milos but uses a different
> slew rate register layout where the slew rate field is in the same
> GPIO config register rather than a separate dedicated register. As a
> result, Eliza only has a single reg entry instead of two.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/
> ---
>  .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
> index 73e84f188591..c81cac1a9740 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
> @@ -15,9 +15,12 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,milos-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,milos-lpass-lpi-pinctrl
> +      - qcom,eliza-lpass-lpi-pinctrl

Please keep alphabetical order.

With this fixed and dropped incorrect tags (please read response from
LKP - it tells you when to add the tags):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


