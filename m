Return-Path: <linux-gpio+bounces-33365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HRXJ0QXtGlkgwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:55:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0AB2844F7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 683B53090387
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D872EC0AE;
	Fri, 13 Mar 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQwEu7UY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B519539F;
	Fri, 13 Mar 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409252; cv=none; b=OhKay9xZyM48lsIYuWqsl/XBc5rLi7xSwGnuEqjXo9dslOFy7LpR3HOOD8SserpXIPZ+En/VwrPHFzyLcuvY80tKMjsUysBKIcUjySB26wlL0ZxfW0sYHe72dMbRGXvS/X5FowRdjv0HSWBb9nyBFBEkqIx+JuWMtzeA9AJk1IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409252; c=relaxed/simple;
	bh=3DaMdNDeS8ryATgNdncqNIGuyCoC8k0EIqnGFmQCfds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAgF7m4pNSyTbA2WQpeqakMIu/1Ha3NjkddIDTgGV005pY5BBlx/VON/F2rACwV9va8Xw+WWAzRKUz8pDsSeSgHnJUxqrFEK6iN4UlGaWj4EnqzUhVYOEEWG+tPT1SwL7YPjMdeMzMge1e2sD0sxuqkjvrnJUk5IeQXHxJVXDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQwEu7UY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA4C19421;
	Fri, 13 Mar 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409251;
	bh=3DaMdNDeS8ryATgNdncqNIGuyCoC8k0EIqnGFmQCfds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQwEu7UYURBju4ZAMInC1NM7Ulf/cU/l6txRROzbgE+Zbkj1vsPxYkLaxERfIccBO
	 v0JcgPH50vZCMpjoEs+Rzw70i43QQeWRkOjFlTX2uuJ+FD3iSMHmYLTAgEY+9HW4q7
	 paNc4WMJHiD929D4gXT5xP4/9xwS+bu+EN0nz19ZibpN0Wb7zyx1e2B/hh1NaGx7qX
	 +0vt8KF9UXohnhlhm9tLcH/jzhSU9B4IFbElKTej8aWNrEpJQ7ofBBi6hg9izcSKkt
	 1ScFE3T1VQq9EwaSLNveADCnriZ0eeE1+utDqcAeYmL0dbq6amuWa8Ah9wOzxyDesw
	 u/gxwmxu+ePvA==
Date: Fri, 13 Mar 2026 14:40:49 +0100
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
Subject: Re: [PATCH 5/6] pinctrl: mediatek: mt8188: Fix include guard comment
 in the header
Message-ID: <20260313-classic-chihuahua-of-discussion-043da3@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-6-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-6-akkun11.open@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33365-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C0AB2844F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:15:32PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2 +-

IMO, this change is just churn. Doing this one line per patch is way too
much. Do not send such oneliners for one subsystem as separate patches.


Best regards,
Krzysztof


