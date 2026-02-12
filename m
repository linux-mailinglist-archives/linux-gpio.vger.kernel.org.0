Return-Path: <linux-gpio+bounces-31632-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHwqA269jWnL6QAAu9opvQ
	(envelope-from <linux-gpio+bounces-31632-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 12:45:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFE12D1F1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 12:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67BA930D9A77
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 11:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B9F34A3AC;
	Thu, 12 Feb 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMojFqL1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86DB349B0F;
	Thu, 12 Feb 2026 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896703; cv=none; b=UXC65wVibQOlGDgDyntIe52yTRNQAIqmtwA5adGxgdy1mHzbUKnuUDe3tj44loHW9L0feerRE5xEIIQOHOiU1EUAy40MKz11ok7ggaI83vuj1h9sirB/i1nZqfRVmhwUvWQ6jS/xniqmusGFHK4uKT1ogY4XLPlg7bEK6m6r9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896703; c=relaxed/simple;
	bh=GZslXHKhVABa//r0nZYc2MzLtfrMPSsOERvcnBRcLgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6NmmI8qxzrtj0na0Imo3DIuLxj3gr3EtOpmOjSqUuQs0XkyRx1YceMaqGkGBNXPubC9gKyRSvTXISIYHXRbYFNORleCCWLd/2zwToM5O6uNBx1Li1VQi2J2JEzyaY3RNKJnkNxkNHTCszrocacvtYUOUWPQERnaC8pT83l84ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMojFqL1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96AEC4CEF7;
	Thu, 12 Feb 2026 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896703;
	bh=GZslXHKhVABa//r0nZYc2MzLtfrMPSsOERvcnBRcLgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMojFqL1M+MB8QERPV2uDjw4rnyyTSDyJ+3F246glTKqgw150Uy9lwYpZn0I+zvHL
	 6bjIk9bOonRGN08bRtBs5DkdvAE+EcdfsE9LQte5GTwDUtDMpiXyieMByUUlMv52sf
	 DPAZcqQ+m/QqgwDlNup96V4DmaU1yLPMx9qd1SjiDvd3BOwdAqOnEtOyR+UonxDYAv
	 wIVxgb0RhBi0bB0Tm2pKfCy7Efpj+sRNA2gU44eU5pm0/Nr3M2yT5vxkFKy4I3P0A7
	 GHqiGDPBhUSARiQZudTREwd2H17tmZO5RnYJEeak/6yA5sJMpp2URt5qyuutxuRA1g
	 PpeqkLMYX5N3A==
Date: Thu, 12 Feb 2026 12:45:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: imx35: add compatible string
 fsl,imx25-iomuxc
Message-ID: <20260212-cuscus-of-perpetual-brotherhood-516caf@quoll>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
 <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-imx2_iomux_warning-v1-2-1c5233771b32@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31632-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 66AFE12D1F1
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:00:01PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-iomuxc.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


