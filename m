Return-Path: <linux-gpio+bounces-35418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFDrLIQk6mnRvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 15:54:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA8453523
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 15:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6477F3012203
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392E62EC0A2;
	Thu, 23 Apr 2026 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Idqd7BHn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37C23EA94;
	Thu, 23 Apr 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952423; cv=none; b=jJiRFdwfnZeKp9Bt9FXOb2VOSnn8o9B1Zm4MbfJPFlSEWeSjg/Yg+77zBKaktGk3JTf7h8F9q5ycQ/HewJNnaWct/vlfrcaI0vSieDb5IBcQ2zQthcrzPl6vDexGAfihnYKx/r0rVmWJSsmikgrEHx5iWPhJWTi4JsXBxnXA8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952423; c=relaxed/simple;
	bh=ymn0hziyzCDHZ/xtQ+g72NZCw696mbMVcg4VrvTA860=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSbwo21iIvEmf3jpb6p5qYAXXv3dysBXEheMzeSEVYLxl2qsRHqEaF0GgPoEDndZ/u/5H/M4OwlvGyIF2lkkwvZm6D2eIRzxCdKUz4ZmNDAzNieqstTUM92dvI7Mp+X40YTVgxBg63VhTdAwjD7j9LGVPOcdOEcGU2yOb3oNoJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Idqd7BHn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NJ45MRd50YmhTuS87ih6apveq2PuxqmT1boxyJYCNPo=; b=Idqd7BHnu2Vb4Ca8b6K1WFzn4p
	I/HKK+Y6KDoSFcUFKSfzIYdeWWTfIB9QcuVugQ/GkQMCMqd8+1ueMe8ipPGg7khwJjj26jz38/82/
	RUUEYHFn7spP9fIHQUSVVIkU54Ejhw6/pB/G01fSHd5PwBkqMzz1FeVZ/wgifXjOzEgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFuUm-00HFdP-Cn; Thu, 23 Apr 2026 15:53:32 +0200
Date: Thu, 23 Apr 2026 15:53:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <cb6b8ec9-296e-40fe-848d-ae87463ff1db@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35418-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,i.mx:url]
X-Rspamd-Queue-Id: 67EA8453523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 06:53:12AM -0600, Mathieu Poirier wrote:
> Once again Andrew Lunn was left out.
> 
> On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.

That looks like a step forward. Now we don't care about legacy NXP
firmware, it makes it easier to make bigger changes, like use the
messages format from gpio-virtio.

	 Andrew

