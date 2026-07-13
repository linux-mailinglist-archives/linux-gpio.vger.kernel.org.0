Return-Path: <linux-gpio+bounces-39945-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vZ/KNpGWVGrJnwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39945-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:41:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E99748489
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 09:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CSZqzrV7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39945-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39945-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A92F30584B8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 07:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC9B390239;
	Mon, 13 Jul 2026 07:35:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE437BE71;
	Mon, 13 Jul 2026 07:35:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928117; cv=none; b=amTk1+IIx5b3L6hLl3CTGzcaC9vTcrcVx/6qLJxOxjbE5sm8MPd/sBPyb5dc17GJUP7zau3hy76IgAbOxSIqN1uuq8QMqLjh1RvW5LE7P++zHKkfshz40yqcNbUq8FacMkCOpLdEROpvIaIKfoXeAg17mNpUZHOtyVrMe9iLGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928117; c=relaxed/simple;
	bh=yMw0NCgwjTkpMczVj1/nRmFXG7mAF/3to9PqyCZ2BVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ManjoePH6hqVZ1jrIOrtO8NmoOYeU5xpYeWqUSw5ywsMgr+Upqv+hur4/lpf5Hri8O3m/2reqKTHkxecCEjv3hLzP8EqDlWb68SKx8f3B0szwex9xp8P/F/MJPp30QGvYWXlF/KOacG+IdjZKujHYIDcDYilElZe5Ex4vmXE2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSZqzrV7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F6F1F00A3D;
	Mon, 13 Jul 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928115;
	bh=EIw2BCcTyrAqvybZP6qCfsnARhDfIWS5/tpUpJJR3CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSZqzrV7G2b5txZPBXw/5gEKu5V8zJeTh/qAVraJT7A8/OagkLNYIGIQRNhKZI4PA
	 j0zKeQ2Jylb4EVdjfow1luPl/VsFGKWaUvlcBEuMmYVYKpCvbWUlg/q1XoP0xkSbBX
	 421dggl0kNTWQV8CkMwCryXAuV7To21EwND7YKIDINYVv96CrzmXVEGsCfgTUgTlnh
	 jr/GXPxAoFOPuMXr6TEFh7uKQkpBwg2DQhiR8fL0aoWV3L83FSTMTTShH8uCmAvbzD
	 ssZASH2hr4jcY1MQeqPoWT/rSxZnC15EVZWi4xzz1+xEK7299xS/EHvvOrYWh/nDsG
	 KRQ9JBX8aEUZg==
Date: Mon, 13 Jul 2026 09:35:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikolai Burov <nikolai.burov@jolla.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
Message-ID: <20260713-gifted-loyal-labradoodle-a54aef@quoll>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nikolai.burov@jolla.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov+review@abscue.de,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39945-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,abscue.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35E99748489

On Fri, Jul 10, 2026 at 06:00:23PM +0300, Nikolai Burov wrote:
> Add new DT bindings for the pin controller found in the MT6858
> (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
>  1 file changed, 190 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


