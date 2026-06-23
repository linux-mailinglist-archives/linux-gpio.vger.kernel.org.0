Return-Path: <linux-gpio+bounces-38851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id on4xKfbrOmpJLggAu9opvQ
	(envelope-from <linux-gpio+bounces-38851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 22:26:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C926B9FAC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 22:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OgC4EauX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38851-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38851-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F77301DB92
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 20:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA76E3A0B38;
	Tue, 23 Jun 2026 20:26:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F539E17E;
	Tue, 23 Jun 2026 20:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246373; cv=none; b=ggAgVcciisH150LZ4PAXatlaoEc0H0mhsAsfJWxTf60e7T72o6S2GvUCELjBwktZSkAoLe52UQVyWwiHPBZO8Hdepl5/OKXgmQi2CT+/Ze9EFhJWhseKk5L6lsKAsuq9RfIHQ7KrBo6aaExsY0ZywrAAdQ0ftcDoOtscDH9aFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246373; c=relaxed/simple;
	bh=xEnvNTLtjfcMezDcGfZfuW3EN3vQd8vYL6OVZNKf2H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAJe6JMfMG5G/8wpiTTQweTJKqfwqtsX1NvIreWnkQooqNYVIcO6hBzVcvMBsUg5Vwb0ahDu5gM11CZNcteitQ9S2sGBXDj18MSIa8neHfv36ece79x0CC+7UEoSwEowUml6yd5xiJiEq1NM9/U3DADokLaLQDNnHK1zT1Kce2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgC4EauX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E341F000E9;
	Tue, 23 Jun 2026 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246370;
	bh=34FF/afQY7rryAyieahHIYlb29AbDzpMLTYiaGi6CT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OgC4EauXpZBNWLUChjheUpa4V/Iiwcb7qYB6c9bFVNd68X/S6kySvetpAj9rl5BmR
	 S+lJIbLLAM8ffuvYh83VirCj/2inuWQ97ElFLQj2BH7Y7dW3WrSQXJI3W+aFRXsW5t
	 lIPEOCiBb0+eruG1A0M+q8i2bKsEjgSopF0ZH5dWpIAv6tZ5gbDMfcV1tsj/9NT32O
	 kHjUFcSWrUAIqvGNvpYU7Y1GXsgzBseFDBml4R5BXhJj2kn6GUQX/ZJ2TPRWWnuzGl
	 DL05H+zXFRx3Tzvb6AjrSvefPdCwf7XvtNNxHp46XgsrwBxpDgUBO280Vm7W+gSHj6
	 y5NfZlXkB1hLw==
Date: Tue, 23 Jun 2026 22:26:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Drop incorrect usage of
 double '::'
Message-ID: <ajrrrB3EzSuy-JDU@zenone.zhora.eu>
References: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-38851-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,qualcomm.com:email,vger.kernel.org:from_smtp,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08C926B9FAC

Hi Krzysztof,

On Tue, Jun 23, 2026 at 07:48:43AM +0200, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

