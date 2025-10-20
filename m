Return-Path: <linux-gpio+bounces-27308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75BBF1870
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 15:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC98D3B6390
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B5E3128D6;
	Mon, 20 Oct 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="eDj4jx0l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D696241665
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760966758; cv=none; b=R+o1vxr+U8U3JUdNTRJVXHsTz0FnuYjX3wCXZ1daDSpn7NavmzsqY/0N7+xJHaa1BoDnVNEr+b8Dw8C9VYHtA3merlhsW39TFThLJdQ0nPkURTV6iEMp+t94NFBdAX4hTG0QVA+CTTkLi6SMimWIAVb6E8w04JNHaiaXXkAluc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760966758; c=relaxed/simple;
	bh=afxofr23i2UunU9Mu8zAdRO6/oYE0i1SJgKY92RYS3k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M0WyxP4LPQYuVgj8qswSI71tKnqhM/gAt5FLdo7OzVtUb/Z6QmgE2/droYIkj3NWk29FZ2NcwcfFO/WVdNtsMydg/8tcWKac4jBEKDCLDfM6NeGZl+BEtV9WnR2NjhVcxWZewTh3DjrZJbcLK5GR/fvopip4O2Q7Q7gmXFc3PXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=eDj4jx0l; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id BE7B5689384;
	Mon, 20 Oct 2025 15:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760966754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7j+ezeSL9kyg5i4/UFTinMbqW8dftUcX92kqRCzKLE=;
	b=eDj4jx0l7zX8+gtIUz/rlf/FJd24ll/fIYwnqV9P3x+roA0EcZx88TOUT5rsqV2HrT0T+t
	XxAxL957pH9dkqc5LV4eP0lW0YwniOiXgAotpCL1rJXNrEuJXT9aLCdtMYcfWlJSyWbCnJ
	jo9EKdjbTglFQbwqV4K+BuZQFDPxxXm/DaFqw2XH1rTxpM46p71YU8vVvbf6mjm3zwS8zD
	L2/sNPCI4CXWWWCypeJ/ZlRn9iM8QI4qWNGH1bTBtuAzQidjr2gNkbsvVRmRxUr/6gB5uZ
	BR2IXKDngI4ZGxPT5GPy7uTX4Ek8JDF1mvnRvagalj+lEzzwFTf1SRdIYgeCrQ==
Message-ID: <6bf0198d6e67a67e9f72fd27de86d65dc926d041.camel@svanheule.net>
Subject: Re: [RFC PATCH 1/2] gpio: regmap: Force writes for aliased data regs
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Mon, 20 Oct 2025 15:25:53 +0200
In-Reply-To: <DDN63XH3EQ2Q.1BKBHJTQQASHO@kernel.org>
References: <20251020115636.55417-1-sander@svanheule.net>
	 <20251020115636.55417-2-sander@svanheule.net>
	 <DDN63XH3EQ2Q.1BKBHJTQQASHO@kernel.org>
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

On Mon, 2025-10-20 at 15:02 +0200, Michael Walle wrote:
> Hi Sander,
>=20
> On Mon Oct 20, 2025 at 1:56 PM CEST, Sander Vanheule wrote:
> > GPIO chips often have data input and output fields aliased to the same
> > offset. Since gpio-regmap performs a value update before the direction
> > update (to prevent glitches), a pin currently configured as input may
> > cause regmap_update_bits() to not perform a write.
> >=20
> > This may cause unexpected line states when the current input state
> > equals the requested output state:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OUT=C2=A0=C2=A0 IN=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 OUT
> > =C2=A0=C2=A0=C2=A0 DIR ''''''\...|.../''''''
> >=20
> > =C2=A0=C2=A0=C2=A0 pin ....../'''|'''\......
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1) (2) (3)
> >=20
> > =C2=A0=C2=A0=C2=A0 1. Line was configurad as out-low, but is reconfigur=
ed to input.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 External logic results in high val=
ue.
> > =C2=A0=C2=A0=C2=A0 2. Set output value high. regmap_update_bits() sees =
the value is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 already high and discards the regi=
ster write.
> > =C2=A0=C2=A0=C2=A0 3. Line is switched to output, maintaining the stale=
 output config
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (low) instead of the requested con=
fig (high).
> >=20
> > By switching to regmap_write_bits(), a write of the requested output
> > value can be forced, irrespective of the read state. Do this only for
> > aliased registers, so the more efficient regmap_update_bits() can still
> > be used for distinct registers.
>=20
> Have you looked at the .volatile_reg callback of the regmap api?
> You might use the same heuristics, i.e. .reg_dat_base =3D=3D .reg_set_bas=
e
> to implement that callback. That way you'd just have to
> (unconditionally) set that callback in gpio_regmap_register() and
> regmap should take care of the rest.

Maybe I'm missing something here, but I'm not sure what difference that wou=
ld
make. .volatile_reg is part of the regmap config, so when gpio_regmap_regis=
ter()
is called, the regmap has already been created. We can't change the
.volatile_reg callback (and we shouldn't, it's up to the user to define it)=
.

FWIW, I did test this with a regmap config that marks the aliased data regi=
sters
as volatile. The issue isn't that an invalid cache is being read. The probl=
em is
that writes are being optimized away when they shouldn't:

   1. Read register from hardware (volatile) or cache (non-volatile).
   2. Update bits in mask to requested value
   3. Write updated value to hardware if:
         A. This is a forced write (i.e. regmap_write_bits), or
         B. The updated value differs from the original.

Marking the register as volatile doesn't change the behavior, only the sour=
ce of
the initial value _regmap_update_bits() uses. Step 3B is the problematic on=
e
when using regmap_update_bits(). Per the diagram above, the comparison may
happen against an input value differing from the (invisible) output state, =
which
would hide the state change.

Best,
Sander

