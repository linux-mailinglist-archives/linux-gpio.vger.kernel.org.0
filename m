Return-Path: <linux-gpio+bounces-6960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 228058D4D4C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3827282E63
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E842186E31;
	Thu, 30 May 2024 13:55:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54229171B6;
	Thu, 30 May 2024 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077350; cv=none; b=MZZ5Ml58Z8LxNJfkmJflLBvn9S806m9t2dxTgSsm+5KcVpizXJL7QLsZoAOvGlRaE0ZEvy/rx5DmY7YQsI92/l789Bz2w2tSH5z4ogaecGgV/dNlrxxlCkt50EACwFuRPpFjpl4nygWI5aZKnsrRhiLnP4Mtu0ocPNJwrq87dZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077350; c=relaxed/simple;
	bh=R2T6febTmbLJBN50SoMzp5xW9MDsIkxEZ0Ij0wYsPTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQGPErvssDYZep9PiCbIHu4aK12o3paSdRop9TzSuwdJ+iRLnKlSpGAuQVn4lcgJM/FqZaWtcZO3gftVcJocMWL5TlwyljaWS3EiuwI4Pbruu2pRivqw8dMHDRO06AEUo9WLFDOA/eOoKr/4EyJI27bASTLLgatn/E5IP/cD+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,201,1712588400"; 
   d="asc'?scan'208";a="206182912"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 May 2024 22:55:45 +0900
Received: from [10.226.92.220] (unknown [10.226.92.220])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 098AB44211B1;
	Thu, 30 May 2024 22:55:41 +0900 (JST)
Message-ID: <77a16dba-5d62-4086-adf0-fcc2eb276795@bp.renesas.com>
Date: Thu, 30 May 2024 14:55:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] pinctrl: renesas: rzg2l: Refactor pin to OEN bit
 translation
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
 <20240524094603.988-3-paul.barker.ct@bp.renesas.com>
 <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oqLi0t6XyYUW8ytuM6iJgUPP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oqLi0t6XyYUW8ytuM6iJgUPP
Content-Type: multipart/mixed; boundary="------------80sRyUscXVq85KVUgtJxjQK7";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <77a16dba-5d62-4086-adf0-fcc2eb276795@bp.renesas.com>
Subject: Re: [PATCH 2/9] pinctrl: renesas: rzg2l: Refactor pin to OEN bit
 translation
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
 <20240524094603.988-3-paul.barker.ct@bp.renesas.com>
 <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>
In-Reply-To: <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>

--------------80sRyUscXVq85KVUgtJxjQK7
Content-Type: multipart/mixed; boundary="------------eHgISoLx04v0zomq5F9VvJi0"

--------------eHgISoLx04v0zomq5F9VvJi0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2024 13:51, Geert Uytterhoeven wrote:
> Hi Paul,
>=20
> On Fri, May 24, 2024 at 11:46=E2=80=AFAM Paul Barker
> <paul.barker.ct@bp.renesas.com> wrote:
>> We currently support setting OEN (Output ENable) bits only for the
>> RZ/G3S SoC and so the functions rzg2l_oen_is_supported() and
>> rzg2l_pin_to_oen_bit() are hardcoded for the RZ/G3S. To prepare for
>> supporting OEN on SoCs in the RZ/G2L family, we need to make this code=

>> more flexible.
>>
>> So, the rzg2l_oen_is_supported() and rzg2l_pin_to_oen_bit() functions
>> are replaced with a single translation function which is called via a
>> pin_to_oen_bit function pointer and returns an error code if OEN is no=
t
>> supported for the given pin.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -256,6 +256,8 @@ struct rzg2l_pinctrl_data {
>>         const struct rzg2l_hwcfg *hwcfg;
>>         const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
>>         unsigned int n_variable_pin_cfg;
>> +       int (*pin_to_oen_bit)(const struct rzg2l_hwcfg *hwcfg,
>> +                             u32 caps, u32 offset, u8 pin);
>>  };
>=20
> This definitely needs synchronization with Prabhakar, as he introduces
> a different set of function pointers to distinguish RZ/G2L (G3S) and
> RZ/V2H.  We really like to end up with something that is consistent,
> and works for all.

Apologies that we missed this conflict!

We will have to use Prabhakar's approach. The methods for RZ/G2L &
RZ/G3S are similar enough to share read/write functions and just have
separate functions for determining which bit to set, but for RZ/V2H
we're writing to a completely different register.

So, please proceed with Prabhakar's patches. I'll rebase this series on
top of his and re-work the relevant bits.

Thanks,

--=20
Paul Barker
--------------eHgISoLx04v0zomq5F9VvJi0
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------eHgISoLx04v0zomq5F9VvJi0--

--------------80sRyUscXVq85KVUgtJxjQK7--

--------------oqLi0t6XyYUW8ytuM6iJgUPP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZliFXAUDAAAAAAAKCRDbaV4Vf/JGvUqD
AQD+BiWIpoKdWhUVJuVTpF1xxSJlJH8hT7zBGd/uUWIfawD/TsajZsJu+ExiHlafRJAEDaLS5Eu9
QAzHeZrzIF7yLgk=
=LIBw
-----END PGP SIGNATURE-----

--------------oqLi0t6XyYUW8ytuM6iJgUPP--

