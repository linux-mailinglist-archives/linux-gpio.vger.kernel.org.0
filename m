Return-Path: <linux-gpio+bounces-30961-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOPuAdsWc2mwsAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30961-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:36:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE2710B4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AACD63025D06
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 06:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4000337692;
	Fri, 23 Jan 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="W5vjeQei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD889330648;
	Fri, 23 Jan 2026 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769150034; cv=none; b=D11SpYaBlQDqEVWQPD9LFh5ojNetYRUGS2tsZU6PcKWe889DVcyEmWHQJIzDXXR8NCQ4IGVmLxJ6HkqS0v02WFTNC4pwteFBaov/tHYhk8W7D1uj9bVeNNxCjOyG8rRA/rikKGrccrD9jY0hQwCYNn2muuIOOPvqcAdU5f4Km5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769150034; c=relaxed/simple;
	bh=QFFRrTELDhUD03AliDXYn7XZCYs5D/6SyfCAbC7OphI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mGvezfl2Gr13x6/bwvFrG65RcF+83HjAgCTLtNM588ymrBtFnm0NkwR3FTzJBaBOwNtjcLFi2BhqLY6d/m7IYJjQ5H2MyWLE1RmYoYpTnHOHaHx9apUi3mbAiGpgskwvCoUy0wm0Fcn0bMKmhoOVx3aEIRp7TEDn81uK13udNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=W5vjeQei; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1769150028;
	bh=hnUiivgV1GJFcmOh4pDO9k/tTrjNiMK55wQcL+7/7RA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W5vjeQeiU0ULdPQtUv9eAf70pYeEokLhFo21iZX0KDC3rHz4fGY+DMK2en6l6RbxT
	 ubNmsduQCSihVOdVHiTEzDdHb9QYkr88QX2j8Y0dsp5YmXJvKLQrl7WwnQw6bNn8fH
	 PrRjnuRiUpgy2WQhq7RlsVHnjb5Gj6ve3pEsB2sL0WEcSghQ9ardd/1JuYPoy0Uy6S
	 81exLyxBAYf1P9Cn3jDbAvZdUypm1nCqymrQniDwLrO25Aq1RzDdM/uDWuLsFnFk0G
	 P5eHOOXOhs8PCx8JHKccE5MSTsY4jKxFAN9y+R3P8g30Ll0zT6R2KNaIH1tCe8NzlQ
	 tGFau5QEV+LXg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 66DCE7C8E7;
	Fri, 23 Jan 2026 14:33:44 +0800 (AWST)
Message-ID: <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to
 the SCU binding.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Linus Walleij
	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
Date: Fri, 23 Jan 2026 17:03:43 +1030
In-Reply-To: <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
	 <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
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
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30961-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:email]
X-Rspamd-Queue-Id: 81CE2710B4
X-Rspamd-Action: no action

On Tue, 2026-01-20 at 19:43 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances. Each SoC has
> its own pinctrl register block, which needs to be described
> independently in the device tree.
>=20
> Introduce "aspeed,ast2700-soc0-pinctrl" for the SoC0 pinctrl, which
> follows the same usage model as the existing AST2600 pinctrl.
>=20
> The SoC1 pinctrl registers follow a regular and predictable layout,
> which allows describing them using an existing generic pinctrl
> binding without introducing a new SoC-specific compatible string.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> =C2=A0Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yam=
l b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index da1887d7a8fe..ff6cf8f63cbc 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -87,6 +87,7 @@ patternProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2400-pinctrl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2500-pinctrl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2600-pinctrl
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - asp=
eed,ast2700-soc0-pinctrl
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 required:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - compatible

So, in addition to Krzysztof's concern about the patch subject, I think
it's worth mulling over some further concerns that we might address
with a clean break for the AST2700. Specifically, whether we can tidy
up historical baggage by exploiting auxiliary bus[0] instead continuing
to pretend the SCU is an simple-mfd.

[0]: https://docs.kernel.org/driver-api/auxiliary_bus.html

The original AST2400 SCU bindings were cooked up in darker times and
have been a regular source of regret (same for the LPC bindings - we
can consider them later). The use of simple-mfd unnecessarily invokes a
bunch of machinery in the driver core to avoid explicit iteration of
subnodes in the driver(s), and causes tension between the need to
specify regs and the typically haphazard register layout of the SCUs.

Related, this entry from "DOs and DON=E2=80=99Ts for designing and writing
Devicetree bindings"[1] stands out:

 * DON=E2=80=99T create nodes just for the sake of instantiating drivers.
   Multi-function devices only need child nodes when the child nodes
   have their own DT resources. A single node can be multiple providers
   (e.g. clocks and resets).

[1]: https://docs.kernel.org/devicetree/bindings/writing-bindings.html#over=
all-design

We have a collection of all sorts of odd-ball bits of functionality,
and all of it can largely be implied by the SCU compatible. Avoiding
specifying things that are implied is also touched on by[2]:

 * DON=E2=80=99T add properties to avoid a specific compatible. DON=E2=80=
=99T add
   properties if they are implied by (deducible from) the compatible.

[2]: https://docs.kernel.org/devicetree/bindings/writing-bindings.html#prop=
erties

So, can we use auxiliary bus instead, and avoid extending the regret in
the devicetree?

Well, the interesting news is that auxiliary bus is already on the way
by way of the AST2700 clock and reset drivers[3].

[3]: https://lore.kernel.org/all/20250917020539.3690324-1-ryan_chen@aspeedt=
ech.com/

A noteworthy observation is the auxiliary bus approach for pinctrl was
already used by (at least) the mobileye eyeq5 platform:

- Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
- arch/mips/boot/dts/mobileye/eyeq5.dtsi
- arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi
- drivers/clk/clk-eyeq.c
- drivers/pinctrl/pinctrl-eyeq5.c

So, we're not inventing anything new here.

Going down this path for pinctrl to fix the SCU situation will require
some rework of what's already merged for the AST2700. However, we've
not yet merged either a DTS or DTSI using the compatibles (and by
extension, aren't using the AST2700 support from the drivers), so I
hope that allows us to do a course-correction without too much
collateral damage.

A possible path forward is to:

 * Move AST2700 definitions out of mfd/aspeed,ast2x00-scu.yaml into one
   of:
    - soc/aspeed/aspeed,ast2700-scu.yaml: Follow the example of
      mobileye,eyeq5-olb?
    - arm/aspeed/aspeed,ast2700-scu.yaml: We already have e.g. the secure
      boot controller documented under arm/aspeed
 * Retain compatible strings but require simple-mfd is not specified
 * Rework AST2700 support introduced in:
    - drivers/irqchip/irq-aspeed-scu-ic.c
    - drivers/soc/aspeed/aspeed-socinfo.c

This is my preference, at least for the moment. The change to make the
SoC0 pinctrl driver compatible with auxiliary bus shouldn't take much
overall. Unwinding the binding situation is a little more involved, but
not too much. I think it just needs consensus on the direction from the
devicetree maintainers.

Andrew

