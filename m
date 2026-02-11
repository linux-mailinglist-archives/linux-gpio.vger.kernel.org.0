Return-Path: <linux-gpio+bounces-31584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO1TCLQqjGmFigAAu9opvQ
	(envelope-from <linux-gpio+bounces-31584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:07:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AE121CC3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D7F30439F4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 07:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAB133A00C;
	Wed, 11 Feb 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="P9M0s6tm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF67318EDB;
	Wed, 11 Feb 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770793625; cv=none; b=XOJa/4qU8I3bSRtngzyqXYmQp9vS5tXUcpzwGFXPF0e0vFO8jGTmgtLEiIFCwhLnEGhIQ2RQnCNKOIKiJNKMpFl5w7bFAN+kY3Rh1/MgOrGPLa1O7ptqCl0s3hZo2PyKD7xpaZj/E9HYLqyk3s4VnLVQvcvk6qbJP62Qgs8Bus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770793625; c=relaxed/simple;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UzIJxUlweAuaDu0jtl5xuFKDN9s7MoOxyKxjz2kDHoCejHp1iHna4IpNiO7W8DooQXkqOrG+b5oRwlo1sVZetO5IgeBw50gjoCZe/Z5767Mf+sDK5SgCfzHphtXEPXVb/v+8OYJQqwufRLyDWH2RwZWyK3GWwT984jqLcAicMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=P9M0s6tm; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770793620;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P9M0s6tmcbwCi6R7qtb9G7n9zjrlhTdWDjrCSNhFhzlYolQSCANRFcMHilkBkkoOH
	 8C5d/18JDioaWOfFnBe2EfO/xlBqrzgtBJAguPI3qj1EYxv7Dmr02z8pkSxyfXNGLT
	 csWtmJ1Dc9ePK7bk/9tlbaS/74ddev/TnjVEHKUALXGsFrOS4S7plZBx++8fxXhrVN
	 cyFEYZlQkcA+/xsPsE85UoTevoL6bMD6PQN9OJaBLQr65pYpJL5fJEtrpL5Hmov0wX
	 KqSDB4BjiWyVO2czOwvkUksWj133s+z8bmHW8NTQFEEyaY5vfYClOdMHmHyQbM0L35
	 /9wVgqf3VefZw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BEB226040B;
	Wed, 11 Feb 2026 15:06:58 +0800 (AWST)
Message-ID: <31a3283787df06b7b44796ef78cca3fd380ee18d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to
 the SCU binding.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,  Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
Date: Wed, 11 Feb 2026 17:36:57 +1030
In-Reply-To: <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
		 <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
	 <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31584-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: CD1AE121CC3
X-Rspamd-Action: no action

On Fri, 2026-01-23 at 17:03 +1030, Andrew Jeffery wrote:
>=20
> Going down this path for pinctrl to fix the SCU situation will require
> some rework of what's already merged for the AST2700. However, we've
> not yet merged either a DTS or DTSI using the compatibles (and by
> extension, aren't using the AST2700 support from the drivers), so I
> hope that allows us to do a course-correction without too much
> collateral damage.
>=20
> A possible path forward is to:
>=20
> =C2=A0* Move AST2700 definitions out of mfd/aspeed,ast2x00-scu.yaml into =
one
> =C2=A0=C2=A0 of:
> =C2=A0=C2=A0=C2=A0 - soc/aspeed/aspeed,ast2700-scu.yaml: Follow the examp=
le of
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mobileye,eyeq5-olb?
> =C2=A0=C2=A0=C2=A0 - arm/aspeed/aspeed,ast2700-scu.yaml: We already have =
e.g. the secure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot controller documented under arm/aspee=
d
> =C2=A0* Retain compatible strings but require simple-mfd is not specified
> =C2=A0* Rework AST2700 support introduced in:
> =C2=A0=C2=A0=C2=A0 - drivers/irqchip/irq-aspeed-scu-ic.c
> =C2=A0=C2=A0=C2=A0 - drivers/soc/aspeed/aspeed-socinfo.c
>=20

... but perhaps that is too much churn for this stage.

Krzysztof: If you think the rework is worthwhile, let me know and we
can look at that design, otherwise I think Billy can proceed by
incorporating your current feedback for a v4.

Andrew

