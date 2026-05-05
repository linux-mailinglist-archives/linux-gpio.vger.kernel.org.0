Return-Path: <linux-gpio+bounces-36241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM8KLANI+mmJMAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 21:41:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6434D3315
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 21:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C056301650C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 19:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0482D4963D2;
	Tue,  5 May 2026 19:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUROvmTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815A3D1CDF;
	Tue,  5 May 2026 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010107; cv=none; b=Stzj4PluQjKc1GyE4WlLmjbAI17zGbka1+TsbT6prfHYeEPZBotYgi8aF23C1shHC6VUMzzfyc6CwMDoB60v1P/Mqo3Np+mYoznoqSRSIbVmFdFJIalYtEWR7pkMiz4oYDXu8JO7+2vFqScprEJNigQokNnHy3yXXJnlpTnVFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010107; c=relaxed/simple;
	bh=f+zthwuppfpFTa8b8uyHJmInP9s5La5GZHSH/CQEOa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDHaHJ/+lVLWIw5cG/WGKukxkRHibu/Lpv7GaXAs/fOElvMxheOROLQRAeW1vupNSPerbOysEYlnRIUlDj4GHWs4UiEWhzAhKManIcvcliWDGa54Jivpk/os1JuRN/fqOyDgPAhn/Rk8IJ/1O7N39quJxSBoKajWTVdlclCgjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUROvmTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4BCC2BCB4;
	Tue,  5 May 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010107;
	bh=f+zthwuppfpFTa8b8uyHJmInP9s5La5GZHSH/CQEOa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUROvmTjlsPg6l30xYj3CqxY+c99n1i7qfItZZvbymBEeQr2WwOY4HVw6KGNUhXmm
	 8pDlHR+A6EOAZcTEsVmjf+1MKasze01GDQSdeieKoxSyiGO+f1b7vN9LdhJEghaxYv
	 Fw5pbBkw6/tnsG7Z0HzR/Kg0RhjQJHHniCNFY81vIXm+E/dkLtEMY8OeVTHByaBWSo
	 PclJN70pGhz8Jqqgu2KF1DUJKy47haFlJKfRxXkmF2D3NUrPBVn4Edw7sQaM6u1sNm
	 /xcljRt7QpHTRVa0meiOobjQZEIC0i5ma2Q9jUMFn3N+swNB3Eedvyj6Rc483sPx1o
	 ownyMgcLaNoTw==
Date: Tue, 5 May 2026 14:41:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>, linux-pm@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392
 pinctrl
Message-ID: <177801010490.3801319.4232280510868698517.robh@kernel.org>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
 <20260420213529.1645560-5-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420213529.1645560-5-l.scorcia@gmail.com>
X-Rspamd-Queue-Id: 0F6434D3315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mediatek.com,gmail.com,kernel.org,collabora.com,lists.infradead.org,vger.kernel.org,packett.cool];
	TAGGED_FROM(0.00)[bounces-36241-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]


On Mon, 20 Apr 2026 22:30:03 +0100, Luca Leonardo Scorcia wrote:
> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
> the already supported MT6397.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
>  .../pinctrl/mediatek,mt6392-pinfunc.h         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


