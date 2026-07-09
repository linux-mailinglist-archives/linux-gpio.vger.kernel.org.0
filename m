Return-Path: <linux-gpio+bounces-39740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uYU/JaWjT2oRlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:35:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BA731A0A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:35:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=oxzQRURG;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39740-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39740-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D34C30DE36E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC1F2BE65B;
	Thu,  9 Jul 2026 13:28:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165827EFF7;
	Thu,  9 Jul 2026 13:28:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603732; cv=none; b=HUYg6juiy/ktL9xMHYglFaQ90EIGBC7SII+eMP3HgXzKM+7bTiCXTXvwF2irgw7e+170xYmH3ucYQnURpUB4Yt/L5SiksU78Jpn4m9kVq5qfyswX1H6RnJNe/wNavn4ZM1apIN3JXoLOPKx3LZhcey977GR+ppkm7HHOQEnAjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603732; c=relaxed/simple;
	bh=yWwu9Dw0bgklg8rEYYCg7rN641JKgjBzviJJuvZGWOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfmhEZhlsIMy4OsxE9dLx+YfH4FRjv+rvCn/gC102e8/S7CvytWHVtQeeAVnNH9vpzB3pvYlpEUHay5zruhM0xtf4AYT15UAGfCrWZk+PHJCzg4Hi+iw+CFDjeuRZrfdJSbKF/0cMgzA7fclYReHt7YiGiVgPNJ4TfEuGyTiqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oxzQRURG; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X4P7u3dFDEDxMv/k3ihz5ZANOLlFAGouyLWQu7Kao38=; b=oxzQRURGkAfeNtSpZjPAwD1tO2
	h5SvlL7tHojTOo7sZVQTjSbSngWRPuZh4IGhDLfV8q0L5TAPsgVsX2mHQBvTega0TBAa7uSqyrRlM
	p6DNlVqxtfXgbcZTNXiG5aHjSDHO9t0XLe0HX4vupD5tZ2JDp68xEOkOpg2MFfqjhCA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whoo2-00BUzy-Dm; Thu, 09 Jul 2026 15:28:46 +0200
Date: Thu, 9 Jul 2026 15:28:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
Message-ID: <1a7344ed-0ed7-4151-99dc-76f35860bd35@lunn.ch>
References: <20260707230651.1138887-1-rosenp@gmail.com>
 <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
 <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
 <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-39740-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:ralph.sennhauser@gmail.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:ralphsennhauser@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D30BA731A0A

> So is the clock optional or is it not? The answer determines the correct
> clk API to use.

The Orion5x family does not have the clock. As far as i remember, all
the other families using this driver do have the clock. And for this
line of Marvell devices, if the clock exists, you need it ticking,
otherwise the hardware just wedges if you access registers with the
clock disabled.

Also, as far as i remember, the Orion5x family does not have the PWM
extension to the GPIO controller. I don't remember the code well
enough, but it is possible the missing clock check is dual purpose, it
also detects an invalid DT when Orion5x has PWM properties when it
should not?

       Andrew

