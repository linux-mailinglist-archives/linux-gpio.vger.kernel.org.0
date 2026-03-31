Return-Path: <linux-gpio+bounces-34450-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPCfHdtxy2k3HwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34450-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:03:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8617364BB7
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7805130679BF
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 07:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FA03BADBC;
	Tue, 31 Mar 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYmtxUd7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F436D4E4;
	Tue, 31 Mar 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940491; cv=none; b=roWgjD1VX1MPy84qUQB/Ey89QHtrDd0BMdKoyR0OgvNE+SihJbU6KhG72JyaA65ROht8WGt0xr2/sP9zGarsd01YQrHZyo1Q9ruZsHYOFF+obFriNv03dnHIdJPlHHmCZwf0A6+/RWUV9DKktJ+j+wSe5sS5yYHrhdYG+RsN3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940491; c=relaxed/simple;
	bh=GzzLKAM7HohgpbhX7Jt24n8lQNb/+gcmxOQdZGYzy2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eifb3WoGjoQr5h0YOD2zOaAGbPdkhgFvyMw98qK+nVITj/UEbj1gqP9+LYCYAqk56+ZK1NPhyX/oo/INJJr0MxBn+5GRrfeNE2dhXxp1gjTyZiLwtF9Oxfh+U37wClPNeXthof/wm+BotN/mWUtx5jN0YHFi+OD1ZqQYkg6N7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYmtxUd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835A1C2BCB0;
	Tue, 31 Mar 2026 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940491;
	bh=GzzLKAM7HohgpbhX7Jt24n8lQNb/+gcmxOQdZGYzy2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYmtxUd7yP70LJIdwmBli+tq6dX5Y/2Ui7J8KZWxYW9ikaun9TIbA1m/EA8J+SYW9
	 vwVnbO7y4rfYzwYxb+LbfW8xjiauMSGmzVBZxEEQVokRa7chI1K9zj6mFIUPzHmf+A
	 TGBL+pcRCNUMQNHtrUZxU/ZWde7UQrqqv40ISXPLuQmJQjoqFrQo1wiXjOjRz3+uxk
	 vsVG18fyH9euB3nFroZB1rOteT63tE2UocB+NuSgJAfgUWdb1x2g9D/ANwV6ZFvtKj
	 ulAYXzoAIeEBXg7aTm81E3+SNZ8M6ZLm+2t9L+1ZbICGB7O9wNXW2PGbxoYOZBqh58
	 jB3U6aNVa/neQ==
Date: Tue, 31 Mar 2026 09:01:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
 <20260330083429.359819-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-2-l.scorcia@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34450-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8617364BB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:29:35AM +0100, Luca Leonardo Scorcia wrote:
>            - items:
>                - enum:
>                    - mediatek,mt6366-rtc
> @@ -99,9 +107,6 @@ properties:
>                    - mediatek,mt6366-regulator
>                - const: mediatek,mt6358-regulator
>  
> -    required:
> -      - compatible

Not really, this affects existing ABI and might make the child schema
being applied. Basically regulators node can be anything now.

This is definitely not a binding we want. The syntax for parent schema
when listing only compatibles is requiring this compatible. You cannot
have here whatever empty node.

Best regards,
Krzysztof


