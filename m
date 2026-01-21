Return-Path: <linux-gpio+bounces-30876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJLWBAcccWmodQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 19:33:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A93105B510
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 19:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD76580B735
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEC532B99B;
	Wed, 21 Jan 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY301fyr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423830BBA9;
	Wed, 21 Jan 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013962; cv=none; b=FnxpK5pmUGGEtuKGSJP1SIVUZLVJwE0miH0c9rggaAbCfPZbEV2jnd2BmusMW9RrG5aiY9A3Cz3twQ/du3P85UQOyzFBojXBI1v5WMTweyd7ZJuzz6ceykcAmcrBo4NSxOup1p20ji5ukBoQFjhTzDg3LNyD7GmQsUVm2eSeYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013962; c=relaxed/simple;
	bh=6FTv1CZdasXJxXvNY8q0BTonxazYYIAqlcCzJRiTQso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH6APMeNeF5A0vq5hOYLdt3KIMG8Nwljr+pMUo+reU0oF9vScZ/1d3BuhBtPVVcX2w0SCQK70dWub5w1k9QZrAnUiH0XJCcnUg2UzQq2+PWJdWQ8LKXIyrqK2NvhcMUC2lmZWhOh5QwbQYQezWH1tzQrzqfDiT6IaLMDNP/Xt4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY301fyr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81515C4CEF1;
	Wed, 21 Jan 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769013961;
	bh=6FTv1CZdasXJxXvNY8q0BTonxazYYIAqlcCzJRiTQso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BY301fyrwRQn+ZDj42LlRm4T1xqnbh3vlaf6Gildunhg3TPPpdxM7uCmvK8LQXwEp
	 rbIYw//yeFWwtlnC9CL5VedlPulbKWnE22M1y7951wBrFn9VKESPHES4EaM795N6Jc
	 5cTTiKHkYxT3ibZJlNb7OHEiJBl3mtK19sGWUpADW2yiqF7+57MX+VcDQxzBKmBGBg
	 8DYv1O8qAjGim3IrNwOGWfNike4Yhq/BCPLknGQa19TAlw3fJmALfpuTQhbnm2H96+
	 1cDi635210mbc4sOtCs/c2Vz8uvKz4kg7jXRX3mGbPJWvMVPAAcqRu9uSmPGUTGkt6
	 pK47Q+JtSVI+g==
Date: Wed, 21 Jan 2026 10:46:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Emil Schulz =?iso-8859-1?Q?=D8stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: ocelot: Add LAN9645x SoC
 support
Message-ID: <176901395988.3438237.9655033303007124364.robh@kernel.org>
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
 <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-1-1228155ed0ee@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-1-1228155ed0ee@microchip.com>
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30876-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A93105B510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 19 Jan 2026 16:06:09 +0100, Jens Emil Schulz Østergaard wrote:
> Add documentation for the compatibles designated for the following SKUs
> in the LAN9645x family:
> 
> lan96455f
> lan96457f
> lan96459f
> 
> with fallback a compatible for the smallest 5-ported SKUs lan96455f.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


