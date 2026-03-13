Return-Path: <linux-gpio+bounces-33364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JM0HeIatGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:10:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EF2849BB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2D2B33F4687
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9F0398900;
	Fri, 13 Mar 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hG7h7Fxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA53947AC;
	Fri, 13 Mar 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409194; cv=none; b=abcUCp99ar++oD9vMz4Xas0sOw8hFZ1BHIs1RpIs1MVr6vKVsqGNcsS57b8gK0h7RClCKAgZ1qK81/YmTBpXFXog7ZbsCknOwchfdFWHmfdSleuBuROlyuLc3jLHO0DjfpwL1eR5KrvaozWPFzxm6ANGP+2i9vkZPk1f9EutDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409194; c=relaxed/simple;
	bh=1A73YCZCdwCqBIs1PA/b3ftEk+iWhmVH8hXw4g5DgOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvrGtDzllu5epelSnzu/P+s6Zom813dlaE1GUwh/eIPlZys1lpWwcmJbZ+uJBYSni3F6IiJKfttSanbJElDtLpX0N3fP2SvF8MrGMYgxB8tC9ut37L+GGM0Y5/PQju9wVDC1ZoNI1f1DnUYDqZuICcYbNcHMwzhl09tHl6DZnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hG7h7Fxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B526C19421;
	Fri, 13 Mar 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409194;
	bh=1A73YCZCdwCqBIs1PA/b3ftEk+iWhmVH8hXw4g5DgOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hG7h7FxfRhjYL9T20ThO2UvC23U/Euqe4Dz8ExEV7pSyEZDoO5iEmzeqyH5cPnBcR
	 4/GSy1q1pGAR91W/s9ZJzRqfm3viVgEB39y7TDEEOIMwXarnTsfMP9L304lliI6pyw
	 h768C6nhDoEsqQzhJYs7L7mB2YISBtlgjRrsFuejTnmlCjycEEBcpWu0+KMi0qtnVO
	 TmU8Hvpg1X4noarsQiUN1EnZWc9i6sSU+LPBcQ1Xc4mOr3zVIr6bxSk1VtoTPHyBo/
	 GoSVTvN/fs151a1+3q3CVgus7WOIkuN+rYQHzTA6ayxBnurTUzK02IUJTDaZnTOhNt
	 p1qxEabsmvFPw==
Date: Fri, 13 Mar 2026 14:39:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@kernel.org, 
	linusw@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, erin.lo@mediatek.com, 
	zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, 
	seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Subject: Re: [PATCH 4/6] pinctrl: mediatek: mt6779: Fix include guard comment
 in the header
Message-ID: <20260313-proficient-sambar-of-discussion-d31aac@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-5-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-5-akkun11.open@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33364-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,mediatek.com,linaro.org,milecki.pl,baylibre.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F4EF2849BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:15:31PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 920e469e15c8 ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")

Nothing to be fixed here.

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---

Best regards,
Krzysztof


