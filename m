Return-Path: <linux-gpio+bounces-10627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B613598BC25
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0011F22F4E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C932B1C0DE8;
	Tue,  1 Oct 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHvQlB3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E819AD8C;
	Tue,  1 Oct 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785985; cv=none; b=EtmaUmDTqewPf1QDVd6uDLHlJeavb994TwFgMXX3M+weMI0CcgjnwqW9fnXe9qXrLQHFNEFs8MuFaIHWVMDdSMQtkF2eyUZqT25HajL7aiKPcTsYvLes/cpjmFnjnP927UMV0QDqhdJbHAeDNokreio6CvsYn4QK+fGkpSeWWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785985; c=relaxed/simple;
	bh=2mC2Q0SM0qv8F+TbsE6KIL+n1IyhIuMI2WWZSIIkF3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtvfCfrIRefLmbcjJhUM28/2PqPPeUV9dkMyGbHSj4ITzNzkeArLPUb3++nvmjDBzPFWodrMzaFifnhb2RweJzCafwIA8nrqtVYSDkqyLG+JSuJ6mLskJl3Fu9zmYgzeKO8QHXogYKma8Lkx/tYrSr0T4kxwuaJrw40c+Zb2ITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHvQlB3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5267C4CEC6;
	Tue,  1 Oct 2024 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727785985;
	bh=2mC2Q0SM0qv8F+TbsE6KIL+n1IyhIuMI2WWZSIIkF3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHvQlB3f4XuJ3Lxeqche4e0Z4YLu/RjBxkGvXOZq+qw3bZnobbUu4REsTnH0GMfV1
	 ZFxCUvAL9Q2WlSSjSuv15DTgEShQJ+O85Nk7e4j9rbOsdJTyWkHj/ANKRYPAuBSlSl
	 Dgw7NaF71t8wmtFgBKUFosvG2xqJwOlJK+hsvI5ltPDLj1h38c1yIn9swXl1P48yJi
	 DR0N75MdvRBwwKNDVN2YMpce4PL4wx9xAL4XD4mAw/FDr/1gXyW2Mkesd+7SacyRcX
	 47qEMAPT1Aa/QfzM5WR6BGBwri6EvIxZnOnod14g4+VHVcVu2OD/uksSBRcnN7tJ4F
	 oHBV5Ib02tckw==
Date: Tue, 1 Oct 2024 13:32:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ze Huang <18771902331@163.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
Message-ID: <20241001-stratus-overplay-96266c33ca89@spud>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MVunmLxiGHzDTp2O"
Content-Disposition: inline
In-Reply-To: <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>


--MVunmLxiGHzDTp2O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:27:25PM +0200, Linus Walleij wrote:
> On Thu, Sep 26, 2024 at 5:58=E2=80=AFPM Ze Huang <18771902331@163.com> wr=
ote:
>=20
> > This patch series introduces support for the pinctrl driver of the Cana=
an
> > K230 SoC. The K230 SoC features 64 IO pins, each of which can be config=
ured
> > for up to five different functions.
> >
> > The controller manages the entire pin configuration and multiplexing
> > through a single register, which control features such as schmitt trigg=
er,
> > drive strength, bias pull-up/down, input/output enable, power source, a=
nd
> > mux mode.
> >
> > The changes have been tested on CanMV-K230-V1.1 board.
> >
> > The pin function definition can be found here [1], and most of the DTS =
data
> > was converted from the vendor's code [2].
>=20
> Bindings ACKed and patches look good to I applied patch
> 1 & 2 to the pin control tree.
>=20
> Please funnel patch 3 through the SoC tree.
>=20
> > prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@=
qq.com>
> > prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
> > prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
> > prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
> > prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
> > prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
> > prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
>=20
> I don't know about all this stuff but neither bindings or code seems
> to contain anything that won't compile so I just assume that any of these
> dependencies are purely for patch 3/3 and I nothing blocks me
> merging patches 1 & 2 so I just went ahead with that.

Yah, this should all be cos I haven't yet applied
https://lore.kernel.org/all/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq=
=2Ecom/
as I am waiting for a clock driver to be sorted out.

--MVunmLxiGHzDTp2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvr+wAKCRB4tDGHoIJi
0hnQAP93nua+l5hRyOfPimtHNG8Wn/JusylG6RrR+aZbNJtWnQEAhLgo5tqTgYtt
euXnFikL3ifpzn/KlGUSlx8O8lRN/AI=
=a1pK
-----END PGP SIGNATURE-----

--MVunmLxiGHzDTp2O--

