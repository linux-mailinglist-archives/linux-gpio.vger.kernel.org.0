Return-Path: <linux-gpio+bounces-6137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F08BCD77
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 14:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79D72829C5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D25143889;
	Mon,  6 May 2024 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9+6v+Kt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8523D2;
	Mon,  6 May 2024 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997348; cv=none; b=jRMynaCaONWMQvR4KE48WxFoTUOjyTfPb8/SFGgJc3jwDuiSiGg3qj0ZTI8xTLGxMsrHgbFH3btMdXVwhhPVWnCxEVSBFvtoKS8+GYNJ9u8wl+PoZWzfwPXwuI1v8XbXQK29av/xTDIM8mpkmQWc1JUsa8JoE5KMWi8DQBcepck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997348; c=relaxed/simple;
	bh=0Fnm+sI6wbj1mgKUxkxRr4HUT2qUNad/sLEyTt+hwpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZS/oG1Gxf9GO0ENTGJDcXwKnUW/cKQp79Z9kjJlBsfAyC0Vc81xNZnPXXaeta58LMEDMWfpbwmLD5ios0dgkwhYjRRdKP8coB4Zk/ypy984bFUUFAsuFVXKxCeDcISb5rgirv8mnOEW/YRIUgqBMod8arI5G4VzIkN3YZepplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9+6v+Kt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A02EC116B1;
	Mon,  6 May 2024 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714997347;
	bh=0Fnm+sI6wbj1mgKUxkxRr4HUT2qUNad/sLEyTt+hwpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9+6v+Kti8MbD+yblxVWhraoQ6x5kHRP8p86QwLv1lLt86iYx1stJvwygiZKJSBRZ
	 XZdCbVfvReLKs9UbAyFPS4EXPB64sNmcrOZ7ZzRdvVSZu0LEcenVRHUARoIpjoLRjz
	 JdimM5YCje+w6lADPp5ePTCHt55ueJZ7iuaI915I5aMPTBWsf4mGO7QUMAPR2GfWwL
	 b7NP4Yo6GDXn3BAG1rIgnDWF8O0Dq0jaakVIaI3ub7NXj7BRZZMxFRcHl9s1OsGBQ3
	 tQgQ0xjOxCTZ4SNszihFdCm1RU58mcGYRyuHMM0k809VbLO4HIN5M8jsrJwcYDYeCQ
	 x1hOM/zckr6cg==
Date: Mon, 6 May 2024 13:09:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yuklin Soo <yuklin.soo@starfivetech.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
Message-ID: <20240506-buddhism-outtakes-5a2bbcc73f1a@spud>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
 <ZQZPR01MB0979DEF368CB86BB16B538E78A1CA@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fhe1DvgnzcGojSpS"
Content-Disposition: inline
In-Reply-To: <ZQZPR01MB0979DEF368CB86BB16B538E78A1CA@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>


--fhe1DvgnzcGojSpS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 07:31:19AM +0000, Leyfoon Tan wrote:
>=20
>=20
> > -----Original Message-----
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: Monday, May 6, 2024 2:35 PM
> > To: Yuklin Soo <yuklin.soo@starfivetech.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Hal Feng
> > <hal.feng@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> > Jianlong Huang <jianlong.huang@starfivetech.com>; Emil Renner Berthing
> > <kernel@esmil.dk>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> > Drew Fustini <drew@beagleboard.org>; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > riscv@lists.infradead.org; Paul Walmsley <paul.walmsley@sifive.com>; Pa=
lmer
> > Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> > Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 =
SoC
> >=20
> > On Fri, May 3, 2024 at 1:14=E2=80=AFPM Alex Soo <yuklin.soo@starfivetec=
h.com>
> > wrote:
> >=20
> > > Starfive JH8100 SoC consists of 4 pinctrl domains - sys_east,
> > > sys_west, sys_gmac, and aon. This patch series adds pinctrl drivers
> > > for these 4 pinctrl domains and this patch series is depending on the
> > > JH8100 base patch series in [1] and [2].
> > > The relevant dt-binding documentation for each pinctrl domain has been
> > > updated accordingly.
> > >
> > > [1]
> > > https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfi
> > > vetech.com/ [2]
> > > https://lore.kernel.org/lkml/20231206115000.295825-1-
> > jeeheng.sia@starf
> > > ivetech.com/
> >=20
> > v3 is starting to look very nice, why is this patch set still in "RFC"?
> >=20
> > I would like some proper review from the StarFive maintainers at this p=
oint so
> > we can get it finished.
> >=20
> > Yours,
> > Linus Walleij
>=20
> Hi Linus
>=20
> Thanks for reviewing the patches.
>=20
> There is a discussion in another thread about the JH8100 SoC being valida=
ted on FPGA/Emulation only now.  The suggestion is to send the patches as "=
RFC" before the real silicon availability.
>=20
> https://patchew.org/linux/20231201121410.95298-1-jeeheng.sia@starfivetech=
=2Ecom/20231201121410.95298-3-jeeheng.sia@starfivetech.com/

I know I said "drivers" in that mail you link to, but I was mostly
concerned about binding headers etc, of which I think there are actually
none here, so see my reply to this thread a few days ago:
https://lore.kernel.org/all/20240503-undress-mantra-e5e46b2f6360@spud/

--fhe1DvgnzcGojSpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjjIXgAKCRB4tDGHoIJi
0siTAPwPnSCk10VkOwstQsjPqJmO7jS0QCzQE8MSxiuXnngLHwD/btPWiaBObZuw
ous37JV45r0PEtTo5WYRu5cNHmTICAI=
=uM22
-----END PGP SIGNATURE-----

--fhe1DvgnzcGojSpS--

