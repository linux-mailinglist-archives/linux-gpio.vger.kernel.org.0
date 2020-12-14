Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4372D9560
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393027AbgLNJiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:38:52 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45487 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728644AbgLNJip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 04:38:45 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 63B17580392;
        Mon, 14 Dec 2020 04:37:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 04:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=HWHAg7xpE7CitXLNsFfZMevT63D
        F9AXAXnEVExpoqhQ=; b=R+UJ4OEqqfYuz0cFPUVKj+CReQjIpmHFv4DcBgsAOUP
        KpthKRYwqiv6+PruBC8xlOYr0J9sryjeO/nHWjKuUcm67yCu+bkPQeKTgIArT52I
        lXVSECorzWInoAtEIAukQGnP1fiT1Wq/UhP750uyJ++pMxzOEb2cACEwltjq5322
        LbR2trlqWuZ33p4E6KRAYanFc3VKEwq/sf9GgASY+V2R8caldcniktciFX+Lpb1B
        a2i2HqyuG26lay5wPLZyDpf83m3cNlWEhFDUBmADy9oegMu827y9Lpf9qqMjtBkr
        fcFsrVZAhLqXKdkQrWFRao9Gja/LRUvaynXwWeEeNfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HWHAg7
        xpE7CitXLNsFfZMevT63DF9AXAXnEVExpoqhQ=; b=IGEyRPcmDONLzmRhmwptS1
        7sBVDSiuxDUzEG2s7jW8yFc5nd2U3qxWM+5tWYL5F7Hl3SxrxYvL7K9YZKMbByV2
        +/M3CY5mUxzCu8mi+d81udonMXxrQRxIK+CygYRn/k0Ke+SQUWKbtKWSQaNvLJgb
        dgJnerJYDWP/3grTln95J4RrOCCKHK9P/WjRCYqPmVbzk6EJf0ECoEmob3dN7ms0
        PReBCXW2V4lvrWn94f8bs0+z5w7ZNVK7n20sbgRfSSb9XVlbXKp9Ci/bqB+ipUMv
        vI0xatn6HUxHjpCPHv7Em2kq2KihsreYGbrl73pkTW5rfO5cbuQpH0uEFrGFffEQ
        ==
X-ME-Sender: <xms:WjLXXyupwYT0K6SqrRKhshL7K5qqU-Zpb_usAZHw-L3rzoVkDzIx3g>
    <xme:WjLXX3fFCwrRxBnfy2yEGDGuqP-9qkS5CsA-v7-AIOFlvPimOlrSwdtEI0nIjlAk3
    HISbFiw8QcYBNzmRf0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WjLXX9xVgA1BTQL8ANNSPQRPV8-URZ_26_17mh76-T6xeWcNu4QGrw>
    <xmx:WjLXX9Oie0B4ft4zETPpbHCrIXh5zU-KLLOs7RqcbAZKwmFU0zyskA>
    <xmx:WjLXXy-qtdmQrV_r0qbZXbNtW66eVzXzFWzXw-9Bj8O3CYcTdb2zxQ>
    <xmx:WzLXX1UewJcoqevkxdCThp0_uvdOr8a6L0k66A4vCrefZM-Ax9tBXg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C7D6524005D;
        Mon, 14 Dec 2020 04:37:29 -0500 (EST)
Date:   Mon, 14 Dec 2020 10:37:28 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/21] dt-bindings: pinctrl: Add Allwinner H616
 compatible strings
Message-ID: <20201214093728.ehd2362jzclbxwp5@gilmour>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="teps3mzqehr2ukhi"
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-3-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--teps3mzqehr2ukhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 01:19:15AM +0000, Andre Przywara wrote:
> A new SoC, a new compatible string.
> Also we were too miserly with just allowing seven interrupt banks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml   | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a1=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml
> index 5240487dfe50..292b05d9ed08 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> @@ -53,6 +53,8 @@ properties:
>        - allwinner,sun50i-h5-pinctrl
>        - allwinner,sun50i-h6-pinctrl
>        - allwinner,sun50i-h6-r-pinctrl
> +      - allwinner,sun50i-h616-pinctrl
> +      - allwinner,sun50i-h616-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
> =20
> @@ -61,7 +63,7 @@ properties:
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 7
> +    maxItems: 8
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -91,7 +93,7 @@ properties:
>        bank found in the controller
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
> =20
>  patternProperties:
>    # It's pretty scary, but the basic idea is that:
> @@ -145,6 +147,18 @@ allOf:
>    # boards are defining it at the moment so it would generate a lot of
>    # warnings.
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun50i-h616-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +          maxItems: 8
> +

You don't need to have both if they are equals, and in this particular
case we already check that the maximum is 8 so there's no need to repeat
that check here.

Maxime

--teps3mzqehr2ukhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9cyWAAKCRDj7w1vZxhR
xYfnAQDBD2pe+FNR4IA9GRNzIHQdPJoicvUpXdOkIZ3Vg4PxnwEAwDkKO+5X8qIm
0YBiAOU4IfGNDdKT2j1xV9fMEDkLqwk=
=T4BT
-----END PGP SIGNATURE-----

--teps3mzqehr2ukhi--
