Return-Path: <linux-gpio+bounces-11072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BD99546A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 18:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3586E1F26A5D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1621E0DC0;
	Tue,  8 Oct 2024 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npHcg7G8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F96F2F3;
	Tue,  8 Oct 2024 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404863; cv=none; b=NFnfit+x3rIdVo08HIPaA32PE14MgGn0Sx0L1ygdoUvMbj23aZ+1C6N3ogS3gEiX9xv2fgtK4+4yLIlYRdasoz8qpk5gmWfUEjvRHPVoXYFfBNqhm8tTj+9CbFiz+XiK9gJfJepAwb8aeEgJITCWoQVjWNxC3r62K7cvZJZaxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404863; c=relaxed/simple;
	bh=zWC1pggc7OwVOj3ZzpCupZ+Awrq6EYrzUUSPwO2P6s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYjyI6KfWzBR3d4TDCHg5wh53pscAy/+Bm3xF86qVDhg4VBKzkd679yfczN6hPDdSbRi3fL1zgwCUA8XCUljXnPjVFiAxwKcnnMRpLhGwwS5QgQcA04XQjORhcGGHzaUdikYpttFWgxIgjqSCdD1kModXNAOW0MI5r7PkiZnWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npHcg7G8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C959BC4CEC7;
	Tue,  8 Oct 2024 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728404863;
	bh=zWC1pggc7OwVOj3ZzpCupZ+Awrq6EYrzUUSPwO2P6s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npHcg7G8v9mNQd/hWqnog6AFImMftyLySMr1I5ZN089a/f4FxKnHTH5lg0vHYX8e9
	 3T3rg5gc/MtSAVeU4w+d2q0E+jPlyKa2Xw3AXkC0Q8kk3HHRnRemykH+XNo/xtgOZD
	 iJqTByGKAXoT2N3o4rhss2c+KPcwS9TMl31jw+Ht6PgNjgt/cs/sqcVbMfXf/k1ujl
	 5gQsCU9xlUt37BjDpiBOrOQxJW+DeivRvXIU93ZIX02g0PllJ9RPlYrW2h9QvhvWpc
	 6NJnvHQM4sxSec8Om4c+2X7N5F109YCfdydpZxkrdh2Jz84iDpyeHHoig0W2iQyUFU
	 waIaX4RXw3k2w==
Date: Tue, 8 Oct 2024 17:27:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
Message-ID: <20241008-backboned-helium-167d99aac110@spud>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
 <20241001-stratus-overplay-96266c33ca89@spud>
 <6a1a3e38-0c6b-4d79-a101-b3292a2ab3be@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="spWZWIgtfKtTVugF"
Content-Disposition: inline
In-Reply-To: <6a1a3e38-0c6b-4d79-a101-b3292a2ab3be@163.com>


--spWZWIgtfKtTVugF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 04:31:35PM +0800, Ze Huang wrote:
> On 10/1/24 8:32 PM, Conor Dooley wrote:
> > On Tue, Oct 01, 2024 at 02:27:25PM +0200, Linus Walleij wrote:
> > > On Thu, Sep 26, 2024 at 5:58=E2=80=AFPM Ze Huang <18771902331@163.com=
> wrote:
> > >=20
> > > > This patch series introduces support for the pinctrl driver of the =
Canaan
> > > > K230 SoC. The K230 SoC features 64 IO pins, each of which can be co=
nfigured
> > > > for up to five different functions.
> > > >=20
> > > > The controller manages the entire pin configuration and multiplexing
> > > > through a single register, which control features such as schmitt t=
rigger,
> > > > drive strength, bias pull-up/down, input/output enable, power sourc=
e, and
> > > > mux mode.
> > > >=20
> > > > The changes have been tested on CanMV-K230-V1.1 board.
> > > >=20
> > > > The pin function definition can be found here [1], and most of the =
DTS data
> > > > was converted from the vendor's code [2].
> > > Bindings ACKed and patches look good to I applied patch
> > > 1 & 2 to the pin control tree.
> > >=20
> > > Please funnel patch 3 through the SoC tree.
> > >=20
> > > > prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF=
809@qq.com>
> > > > prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
> > > > prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
> > > > prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
> > > > prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
> > > > prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
> > > > prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
> > > I don't know about all this stuff but neither bindings or code seems
> > > to contain anything that won't compile so I just assume that any of t=
hese
> > > dependencies are purely for patch 3/3 and I nothing blocks me
> > > merging patches 1 & 2 so I just went ahead with that.
> > Yah, this should all be cos I haven't yet applied
> > https://lore.kernel.org/all/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF80=
9@qq.com/
> > as I am waiting for a clock driver to be sorted out.
>=20
> Thank you very much for your time in reviewing and helping fix the bug!
> Indeed, only patch 3 really depends on the previous patches. We are now
> working on clock driver. Should we deal with patch 3 after that?

Yeah, send patch 3 to me when you're done with the clock driver.

--spWZWIgtfKtTVugF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwVdegAKCRB4tDGHoIJi
0vM+AQDUK2jfSUbjSUKTs2s9LIlWGezF+H00zfOJ/3xz2cu8JgEA19Je82HcT04j
Q32XZouXgVHrbuSNLIV/YZmruchA6g8=
=VNFz
-----END PGP SIGNATURE-----

--spWZWIgtfKtTVugF--

