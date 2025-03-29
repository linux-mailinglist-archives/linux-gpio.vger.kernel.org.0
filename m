Return-Path: <linux-gpio+bounces-18101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF4A755A7
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 11:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 948A27A694F
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 10:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796AC1ADC7F;
	Sat, 29 Mar 2025 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="rwwxVMWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66170807
	for <linux-gpio@vger.kernel.org>; Sat, 29 Mar 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743242557; cv=none; b=cYKbBvDLjKWXWed0z4GYTqMe+CWlz/Lo5hRWz1KxHNsfA8nPxXObGoAYvyhibsn5QExoRRLEeW2oKqqFnZOt8+7osI91KkNAIXsbSccepMoof8EQxhEr1s+Sb/8x1yWQchKgxew/CIMb/uNycDC2TjDGtkYhhZEgG5r4PmtlOWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743242557; c=relaxed/simple;
	bh=dH9+6RQdoDLhFzbAWFEt6un7a5fTJ8/Aw42J7tuTQSc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMc6ED1x8SWKvPx8VdABxjFuc/DcJb/gX3XfTqzpo/cqey44zGtpHESjASQ3sqJ/ilnVfyPcGdzYZ684FgU++Y8UIhhgMaZYcGDULwwT/evBcb9ZSG94F6YMRTD+eT1A8K+Wl19KpNOfzcRLa+Hh16IhpA5QDpPFRInb22WR8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=rwwxVMWs; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [192.168.90.187] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id B3CA15DACBF;
	Sat, 29 Mar 2025 10:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1743242026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH9+6RQdoDLhFzbAWFEt6un7a5fTJ8/Aw42J7tuTQSc=;
	b=rwwxVMWs4hmFUXR5Td3TjP/acvp3cAlIDH0WpWA3tkqqv42r4ZU2uzI+Dr6NRRnaj1VyWq
	YwQR+xbW0wQSsvZosFiVGmjRy2nhd6qBObzIqS67Wxefh8OC8WU8ptWfvzKnxOtoFlevj2
	ka1d+rX8A8qDhkJOAty9gQUkKorj6txt8Ueq/WryT0xIHhPEunesc1MvNdSWtgHzpXo7e4
	dnewaHqKAPgTeDxcfjAXVudN8K87bSuCfGxKE3nxk5zQtfDJHOfXRruuKO3IDSpaC6gtj6
	OA9GO7oUv7v5Q84NRb5lYQJHYmneUNWPdixJ09rcyHD2BZMfa7NhU3C/hYsIdw==
Message-ID: <27075369f1d53f840965a09601e10b130f622d16.camel@svanheule.net>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS
 example
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij	
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Shawn Guo	 <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Walmsley	
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>, Srinivas Neeli	 <srinivas.neeli@amd.com>,
 Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Manikandan
 Muralidharan	 <manikandan.m@microchip.com>, Maxime Ripard
 <mripard@kernel.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Bert Vermeulen
 <bert@biot.com>, 	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Date: Sat, 29 Mar 2025 10:53:45 +0100
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krysztof,

On Mon, 2025-03-24 at 13:53 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.=C2=A0 While re-indenting, drop
> unused labels.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../bindings/gpio/atmel,at91rm9200-gpio.yaml=C2=A0 | 16 ++---
> =C2=A0.../bindings/gpio/fairchild,74hc595.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 +++---
> =C2=A0.../devicetree/bindings/gpio/gpio-mxs.yaml=C2=A0=C2=A0=C2=A0 | 70 +=
++++++++----------
> =C2=A0.../devicetree/bindings/gpio/nxp,pcf8575.yaml | 24 +++----
> =C2=A0.../bindings/gpio/realtek,otto-gpio.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 8 +--
> =C2=A0.../bindings/gpio/renesas,em-gio.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 20 +++---
> =C2=A0.../bindings/gpio/renesas,rcar-gpio.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++----
> =C2=A0.../devicetree/bindings/gpio/sifive,gpio.yaml |=C2=A0 6 +-
> =C2=A0.../bindings/gpio/toshiba,gpio-visconti.yaml=C2=A0 | 24 +++----
> =C2=A0.../bindings/gpio/xlnx,gpio-xilinx.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 48 ++++++-------
> =C2=A010 files changed, 130 insertions(+), 130 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l
> b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> index 39fd959c45d2..728099c65824 100644
> --- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> @@ -81,7 +81,7 @@ dependencies:
> =C2=A0
> =C2=A0examples:
> =C2=A0=C2=A0 - |
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio@3500 {
> +=C2=A0=C2=A0=C2=A0 gpio@3500 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "realtek,=
rtl8380-gpio", "realtek,otto-gpio";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x3500 0x1c>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-controller;
> @@ -91,9 +91,9 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <2>=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&r=
tlintc>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <23>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };
> =C2=A0=C2=A0 - |
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio@3300 {
> +=C2=A0=C2=A0=C2=A0 gpio@3300 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "realtek,=
rtl9300-gpio", "realtek,otto-gpio";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x3300 0x1c>, <=
0x3338 0x8>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-controller;
> @@ -103,6 +103,6 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <2>=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&r=
tlintc>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <13>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };
> =C2=A0
> =C2=A0...

FWIW

Reviewed-by: Sander Vanheule <sander@svanheule.net>

Thanks!

Best,
Sander


