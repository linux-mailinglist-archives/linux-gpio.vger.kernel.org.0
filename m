Return-Path: <linux-gpio+bounces-7506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC33E90B375
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 17:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3483B1F24169
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 15:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A92152164;
	Mon, 17 Jun 2024 14:22:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13556150999;
	Mon, 17 Jun 2024 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634152; cv=none; b=jF188jNLUx84vZ2nEJ4FKLbyx9rC+ms8VfOUZ2I3IHlGOs2l89wJuFHx0/Jj090g3ymFwcNFWrlMt088uu3q0PoD/uVpCUCV4m/F44eooJC/Tg3asPm1YLdmbWwJozccwHM7dC4gFJfh7Jxk243bDNS4s9mXf0zcl3qnYnbmo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634152; c=relaxed/simple;
	bh=6OxWMUg3yA5WcTolc8+8/GvGqWIxjQzsKph93I8gX/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLjtuuvaTqCqc895D5yzTPIeFe3hjah4NvwPlcyAgr2RXl3N58GdtWb1Xz7h8RVQD4bY9CmNS1tgfxQKgM+EpzS5/juqzqnbA5gNDFY02AINV/ntWVefPNnvvKZHu1WTWEii9amPjQaXEi3shjLui6tbhHXbvbOAl8b2lA88vxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="asc'?scan'208";a="208262901"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jun 2024 23:22:28 +0900
Received: from [10.226.92.92] (unknown [10.226.92.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 405BB439D056;
	Mon, 17 Jun 2024 23:22:24 +0900 (JST)
Message-ID: <fa470a75-84e8-4924-9e1c-365cb397a391@bp.renesas.com>
Date: Mon, 17 Jun 2024 15:22:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] pinctrl: renesas: rzg2l: Clarify OEN read/write
 support
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
 <20240611113204.3004-2-paul.barker.ct@bp.renesas.com>
 <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C6QDSlgQSws9A1j2aMg0KGw0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C6QDSlgQSws9A1j2aMg0KGw0
Content-Type: multipart/mixed; boundary="------------RbiozDZ0z6VG00rUxljqUKph";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <fa470a75-84e8-4924-9e1c-365cb397a391@bp.renesas.com>
Subject: Re: [PATCH v2 1/9] pinctrl: renesas: rzg2l: Clarify OEN read/write
 support
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
 <20240611113204.3004-2-paul.barker.ct@bp.renesas.com>
 <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>
In-Reply-To: <CAMuHMdW-BrHBt9eDw_GaW7JwJ+TP6Q+68EN1Tpp2Z5H00Dq+3g@mail.gmail.com>

--------------RbiozDZ0z6VG00rUxljqUKph
Content-Type: multipart/mixed; boundary="------------fv908Zin3VFkRAE20i5xZIp2"

--------------fv908Zin3VFkRAE20i5xZIp2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17/06/2024 12:52, Geert Uytterhoeven wrote:
> Hi Paul,
>=20
> On Tue, Jun 11, 2024 at 1:32=E2=80=AFPM Paul Barker
> <paul.barker.ct@bp.renesas.com> wrote:
>> We currently support OEN read/write for the RZ/G3S SoC but not the
>> RZ/G2L SoC family (consisting of RZ/G2L, RZ/G2LC, RZ/G2UL, RZ/V2L &
>> RZ/Five). The appropriate functions are renamed to clarify this.
>>
>> We should also only set the oen_read and oen_write function pointers f=
or
>> the devices which support these operations. This requires us to check
>> that these function pointers are valid before calling them.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>> ---
>> Changes v1->v2:
>>   * New patch to clarify function names.
>=20
> Thanks for your patch!
>=20
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>=20
>> @@ -1016,31 +1016,31 @@ static u8 rzg2l_pin_to_oen_bit(u32 offset, u8 =
pin, u8 max_port)
>>         return pin;
>>  }
>>
>> -static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 =
offset, u8 pin)
>> +static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 =
offset, u8 pin)
>=20
>> -static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32=
 offset, u8 pin, u8 oen)
>> +static int rzg3s_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32=
 offset, u8 pin, u8 oen)
>=20
> As commit 7d566a4d270c52ff ("pinctrl: renesas: rzg2l: Add function
> pointers for OEN register access") did not rename
> rzg2l_{read,write}_oen() to rzg2l_oen_{read,write}(), to match the
> .oen_{read,write}() callback names, this is a good opportunity to fix
> that oversight.

Ack.

>=20
> The v2h variants already match the callback names.
>=20
>> @@ -1215,6 +1215,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinc=
trl_dev *pctldev,
>>                 break;
>>
>>         case PIN_CONFIG_OUTPUT_ENABLE:
>> +               if (!pctrl->data->oen_read)
>> +                       return -EOPNOTSUPP;
>=20
> Perhaps the check for PIN_CFG_OEN in each of the .oen_read()
> callbacks should be moved here?

Ack.

>=20
>>                 arg =3D pctrl->data->oen_read(pctrl, cfg, _pin, bit);
>>                 if (!arg)
>>                         return -EINVAL;
>> @@ -1354,6 +1356,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinc=
trl_dev *pctldev,
>>
>>                 case PIN_CONFIG_OUTPUT_ENABLE:
>>                         arg =3D pinconf_to_config_argument(_configs[i]=
);
>> +                       if (!pctrl->data->oen_write)
>> +                               return -EOPNOTSUPP;
>=20
> Likewise.

Ack.

I'll fix these in v3.

Thanks,

--=20
Paul Barker

--------------fv908Zin3VFkRAE20i5xZIp2
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------fv908Zin3VFkRAE20i5xZIp2--

--------------RbiozDZ0z6VG00rUxljqUKph--

--------------C6QDSlgQSws9A1j2aMg0KGw0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZnBGoAUDAAAAAAAKCRDbaV4Vf/JGvWna
AP9p5/HCOBqF1h5FzmOYXHErfMIof0KDoob4zUjs8p/KCAD9Hf5RswcQh+KbvcqZyOQOn3S/gh/S
sTeHdqwyzdUaHgk=
=wkPW
-----END PGP SIGNATURE-----

--------------C6QDSlgQSws9A1j2aMg0KGw0--

