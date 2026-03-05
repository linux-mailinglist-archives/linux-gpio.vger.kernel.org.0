Return-Path: <linux-gpio+bounces-32615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAUuDoD6qWk7JAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 22:49:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39589218A4B
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 22:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE377300BEA5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 21:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F8C35F5E8;
	Thu,  5 Mar 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="SUToCcG5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C40C33A031
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 21:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747386; cv=none; b=IJm3Kxb/Q1mYQfoeabH3Roa+t39HG/q7nrJ21jq7uSezvGZjhvyS92cf+rwTUleymeAqC8ufrD6eBBh7WCokG04xjlM6v6AH08w6WdaRoly5d+fJ8anCHbC3B3s42D39KA97TP2RL6yl715DdthfnYYsf/xJ4g6wFBD0KwGlws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747386; c=relaxed/simple;
	bh=vH01rYnl/NRZ0Zi/fq7qciHoqCcVv0HrRWQjxLhG6IY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y9zFzFpO0vb4P6z1jIv83zDBn29jw9jxtUnogWf95YHZCm2ylt5Z6szemrZbivFwzBvCPIKU26tu/vVVhqyAF95A2aS1fJnWqMMxNelXAV/my8r/tzTDXNZu2SvAczgAiZgMG2gdiclA2fcQHiW5eiBiF27wXrCx/8GYIyQOUVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=SUToCcG5; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d] (2a02-1812-162c-8f00-19d9-5e35-1cd7-5d5d.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 93CA06F3045;
	Thu,  5 Mar 2026 22:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1772747381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTOLZe0At/Nfe+c5U6L75GPk0yzPzMk6sA5p+V8EDw4=;
	b=SUToCcG5wmCp2x7KI1RhwTzaLP7teewuytdCFe0IAGE4EvvIqPYQV7slI5ANqHNemi81ke
	vopXv4RJOkxtjl7o/u2Yml54B+gqiPVu2oFdIbr9HXxvrBtZ8Iara95BgfwdqnVcYFD+v9
	gy6PWzCf2+fhOkjoWFBYUe7kgVxxXPmCCSOnjxe4BhUBWkJYVEAKjQ1YiQbtEbcmbWRCjF
	dYZgv4gBY3+pZeMYNUeCUXpSqa9Qs9XX9zSsDuMM4XNy1QsANSO18XZRmuO0+trUUtNbSS
	3dNud4eGofpHycieqpi1X6SOmBZEhW3rObc9CUx+TkV8yEXfgmtanpGE5AXfTA==
Message-ID: <8d382a35b5e2304b4c869ced560c0c3880af5b84.camel@svanheule.net>
Subject: Re: [PATCH 2/2] gpio: realtek-otto: add rtl9607 support
From: Sander Vanheule <sander@svanheule.net>
To: adilov <adilov@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Bert Vermeulen	
 <bert@biot.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Mar 2026 22:49:41 +0100
In-Reply-To: <6a8538a1990dc02a6a0bdbf60ebd747f@disroot.org>
References: <20260305161106.15999-1-adilov@disroot.org>
	 <20260305161106.15999-3-adilov@disroot.org>
	 <f92a2a8558ebff7a145ece97c2bc44f1f7aafd26.camel@svanheule.net>
	 <6a8538a1990dc02a6a0bdbf60ebd747f@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 39589218A4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32615-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[svanheule.net:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openwrt.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

On Thu, 2026-03-05 at 19:54 +0000, adilov wrote:
> On 2026-03-05 19:04, Sander Vanheule wrote:
> > On Thu, 2026-03-05 at 21:11 +0500, Rustam Adilov wrote:,
> > > +	{
> > > +		.compatible =3D "realtek,rtl9607-gpio",
> > > +		.data =3D (void *)GPIO_PORTS_REVERSED,
> > > +	},
> > If I'm not mistaken, this SoC has a MIPS InterAptiv CPU like the=20
> > RTL931x SoC
> > series. Were you able to validate that the interrupts are functioning=
=20
> > as
> > expected?
> >=20
> > Best,
> > Sander
>=20
> Hi Sander,
>=20
> Yes, this is correct. I played around with gpio-keys in OpenWrt (though=
=20
> it
> has its own gpio-button-hotplug but it should not change things) and can
> verify that button presses and releases are working. I think this should
> confirm that interrupts are functional.

Thanks for the info. I was mainly wondering because there seemed to be some
initial confusion [1] about the port order. If you get the order wrong, you
would be getting spurious interrupts.

[1] https://forum.openwrt.org/t/240741/25

If the order is correct, you should see the key GPIO interrupt increase in
/proc/interrupts. So, assuming that's the case:

Reviewed-by: Sander Vanheule <sander@svanheule.net>

Best,
Sander

