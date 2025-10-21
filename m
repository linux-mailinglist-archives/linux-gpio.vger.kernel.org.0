Return-Path: <linux-gpio+bounces-27348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2CBF561F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3369318A595D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A66132AAA6;
	Tue, 21 Oct 2025 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="QS6xDKom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C6329C76
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037217; cv=none; b=JYMLLNxkkynDKsnZbedUX7GXm8NkMg/enuXay6U36OFp6bqk0OTi6TtVXjtANQnOZ1MSa341D2uuf7/Yh5XzeA5ARLPV+2zwDArrfS6sItGFpZVLLIkMydCOec7NetJDcZooCMOyY2+S7kwtgPZOuPPuip4uXf4f9iy5tZ6951M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037217; c=relaxed/simple;
	bh=FY66GgTDOIoB9mS2HFOFn+lKyUzk7ReEJSz06q2JKqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VO/MXGwzkbV/a3xLGucmPhMlUvQtBaOQtBPOHiN8s1IpCpweKB4QShj1EQfdEd2nIt1gC/rCbDcg7guWC8lcelpwEyQlaJXgOeUIuG321980ZZb13T+d05vSeyQgAFIf0PgCk4r7BLJW1bLQwgt/tUtwoDpCowzHUoez/w5dLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=QS6xDKom; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id A16C4689CBF;
	Tue, 21 Oct 2025 11:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761037211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y986KfT3B0zrxnVKXVm/ZB2eNF2myKB1y4plYJDTzQg=;
	b=QS6xDKom75MGyfUmlX6mzLCM3Cs1qnQp+Azwij7nq6dDoHz7pifTaSQ1qgzDJFLjD0zQQ5
	980IHMra3TFwbrXRQ17Qc6OTTn8wHLpaNsJavqoxLwDdmKHi7tzUNfjF2asI6q+BpxGect
	x2XF0Ck/GQCped4sPOWWyEEzS71IDfKBwcAzGMo9ODW6PtRVnjfWDT6+T7HBGr/r41Fvup
	Ur7FqEhSsCP1fn9dR1QohdqR1Z2CkvFF8BfaT2edkWSZ45hibf8iBkwRBGtFdUy8S+CYiD
	8waEN8oIvPqRE3rpnaPjr8R6bBdQCOP7ElF0YWOqQ0qwiICNbCVq2mn0rK39Gg==
Message-ID: <bfab980197bfd845cce360d2dbd12ef716f8b727.camel@svanheule.net>
Subject: Re: [RFC PATCH 1/2] gpio: regmap: Force writes for aliased data regs
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Tue, 21 Oct 2025 11:00:10 +0200
In-Reply-To: <DDNTQLB5YRM3.39C226E0QO6X9@kernel.org>
References: <20251020115636.55417-1-sander@svanheule.net>
	 <20251020115636.55417-2-sander@svanheule.net>
	 <DDNTQLB5YRM3.39C226E0QO6X9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Michael,

On Tue, 2025-10-21 at 09:33 +0200, Michael Walle wrote:
> > +	/* ignore input values which shadow the old output value */
> > +	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
> > +		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> > +	else
> > +		ret =3D regmap_update_bits(gpio->regmap, reg, mask,
> > mask_val);
>=20
> I wonder if we should just switch to regmap_write_bits() entirely.

It would certainly make the code simpler, but it may impact performance a b=
it.
E.g. a bit-banged I2C bus doesn't need to update the output value (only the
direction), so using regmap_update_bits() saves half the writes when the ou=
tput
data register can be properly cached.

Similar to gpio-mmio.c, gpio-regmap.c could also provide multiple setters, =
so
the branch(es) in this call would only occur once at init, to sacrifice cod=
e
size for a bit of performance. Feel free to let me know what your preferenc=
e is,
otherwise I'll keep the patch as-is.

>=20
> In patch 2, you've wrote:
>=20
> > The generic gpiochip implementation stores a shadow value of the
> > pin output data, which is updated and written to hardware on output
> > data changes. Pin input values are always obtained by reading the
> > aliased data register from hardware.
>=20
> I couldn't find that in the code though. But if the gpiolib only
> updates the output register on changes, the write part in
> regmap_update_bits() would always occur.

I was referring to bgpio_set(). AFAICT gpiod_direction_input() and
gpiod_direction_output() call the driver unconditionally, without checking =
if
the gpiolib state would change for this pin.

>=20
> In any case, feel free to add.
>=20
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks!

Best,
Sander

