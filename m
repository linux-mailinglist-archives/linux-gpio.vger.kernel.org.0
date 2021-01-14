Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F5A2F60A5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 12:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbhANL6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 06:58:36 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58693 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728761AbhANL6f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Jan 2021 06:58:35 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 082675805E8;
        Thu, 14 Jan 2021 06:57:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 14 Jan 2021 06:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=pIhvASRgvoG2sgYrbHtOgU5UtLU
        uQKvIS/YboGlCm8E=; b=WpG29/sMUYehR6h3Q8PCye+zfhICMLVSDCU+0B6Aw7P
        wctjuuCpH7kwHQJ5psIdNpJoj0211klif24tIAHYgag2Ou20xD7qW71JCldRSDsQ
        kFrBzzRQnREpoBVatypDKydicwRqO+/KMjQoYLvbOE1c9i51zDHfFnLwANadGw9U
        yaoijP99PeC31tBDwjNzeyBla9eaYQEk6RdNAmBPq9e9384DQTtPu+dUoVpfspt+
        k6U4nKFNv3AgBHs0N+FCijgQKpFvnUx+Kv2kLyQkl5LmVtDTb2NO+bcCWjhe2J6j
        GCAF6XSshT4D8ebL2OG5KYWi50XbI9g4vX+/jE9lCSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pIhvAS
        RgvoG2sgYrbHtOgU5UtLUuQKvIS/YboGlCm8E=; b=ZY7bDwADVqWQf5WhAlb1yb
        +Ocm2EtWzWfp7X291fCRbVaqtt5o+9qNQpzTy9y1C0d4HrbgAWpTptpu+aOAUjnc
        RthgCUjb49pMfSGdx8A1rdo0dI697edZ8VSjNn8ssG5W4uxPsoptK67K0/k91ap3
        jK14dzObuMe9Qg3AWzwCy80f0dL9WocfMc+AQAkxxatDGU2u8oTKZkQAUOowG4t5
        rh50dZmDkZoIQ4QNBxrDVWh/GiOBA3CBFDr/J10tNjBFl8CBmxMkPVhpvbV8bfDz
        Laz9hTqeFG7XLpdDwIHjqA06jgbM6aTJn0qMALeNd60zj9o50cc0s39240Ky3PWQ
        ==
X-ME-Sender: <xms:uzEAYIFRSCo-WfycmpCmqVlP6gJFCIjEz0DlquEr8-cLLyX7yup07Q>
    <xme:uzEAYBW25kIDcsMjWFGgi_hkmSOHYr08n_Tql1PBybYKeo8nY-2DQv1Mw8Oe3ZALg
    qo7BlmZu0PVtne8oyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeevgeduteektefhtefggfdtkeekgfehhffffeegudelheegheeiueevfeegvdei
    geenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdeikedrje
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uzEAYCK9jsyc4gd4k1Nd5WaLLBeeo0ulDFP_NvPe-u_r9IxTGjcOKA>
    <xmx:uzEAYKF_7nKrUdhgBiaRfi1GpCsYxdNOprruIkpAat442yNfUjeFZQ>
    <xmx:uzEAYOXB5rhbQA6cXMZQHUch3HnK-xewKb7G9HU1yKaMS0m6NFxwsg>
    <xmx:vDEAYFPWNExPiGzUd5DTTLga4gJJ702PTMJsg3Rx3ynNRVjbvA0u5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE48B108005B;
        Thu, 14 Jan 2021 06:57:46 -0500 (EST)
Date:   Thu, 14 Jan 2021 12:57:45 +0100
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
Message-ID: <20210114115745.x5cuxmxqllu7b6zl@gilmour>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-3-andre.przywara@arm.com>
 <20201214093728.ehd2362jzclbxwp5@gilmour>
 <20210114004512.6cc7bd10@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mbsziskqq433z3de"
Content-Disposition: inline
In-Reply-To: <20210114004512.6cc7bd10@slackpad.fritz.box>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--mbsziskqq433z3de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:45:12AM +0000, Andre Przywara wrote:
> On Mon, 14 Dec 2020 10:37:28 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > On Fri, Dec 11, 2020 at 01:19:15AM +0000, Andre Przywara wrote:
> > > A new SoC, a new compatible string.
> > > Also we were too miserly with just allowing seven interrupt banks.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml   | 18
> > > ++++++++++++++++-- 1 file changed, 16 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > index 5240487dfe50..292b05d9ed08 100644 ---
> > > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > +++
> > > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > @@ -53,6 +53,8 @@ properties:
> > >        - allwinner,sun50i-h5-pinctrl
> > >        - allwinner,sun50i-h6-pinctrl
> > >        - allwinner,sun50i-h6-r-pinctrl
> > > +      - allwinner,sun50i-h616-pinctrl
> > > +      - allwinner,sun50i-h616-r-pinctrl
> > >        - allwinner,suniv-f1c100s-pinctrl
> > >        - nextthing,gr8-pinctrl
> > > =20
> > > @@ -61,7 +63,7 @@ properties:
> > > =20
> > >    interrupts:
> > >      minItems: 1
> > > -    maxItems: 7
> > > +    maxItems: 8
> > >      description:
> > >        One interrupt per external interrupt bank supported on the
> > >        controller, sorted by bank number ascending order.
> > > @@ -91,7 +93,7 @@ properties:
> > >        bank found in the controller
> > >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > >      minItems: 1
> > > -    maxItems: 5
> > > +    maxItems: 8
> > > =20
> > >  patternProperties:
> > >    # It's pretty scary, but the basic idea is that:
> > > @@ -145,6 +147,18 @@ allOf:
> > >    # boards are defining it at the moment so it would generate a
> > > lot of # warnings.
> > > =20
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - allwinner,sun50i-h616-pinctrl
> > > +
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 8
> > > +          maxItems: 8
> > > + =20
> >=20
> > You don't need to have both if they are equals, and in this particular
>=20
> Mmh, but all the other compatibles have both equal, so what would be
> the recommended way to describe this? Just minItems? I don't find a
> good explanation at the moment how to handle an explicit number, other
> than by enumerating the items explicitly.

This is where the magic happens:
https://github.com/devicetree-org/dt-schema/blob/master/dtschema/lib.py#L258

So, if there's an items property, it will expand minItems and maxItems
according to the length of the list. Else, it will see if there's either
minItems and maxItems and set the other one if it's missing.

In this case, minItems and maxItems are equals, so you could just fill
one of them

> > case we already check that the maximum is 8 so there's no need to
> > repeat that check here.
>=20
> Are you referring to the overall "maxItems: 8" above, in the 2nd hunk?
> While this will become redundant, this is apparently prone to changes
> (as only "7" would be redundant at the moment), so I would rather not
> rely on a global limit.

Yeah, my point was that since the upper schema checks for the interrupts
array length to be between 1 and 8, there's no need to specify a max of
8, the upper schema has it covered.

You're right that the max is increased regularly, however we can still
rely on the above logic to fill maxItems to 8 anyway

Maxime

--mbsziskqq433z3de
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAAxuQAKCRDj7w1vZxhR
xYH3AP4t/ykPC9xzwyQNNiNXKT3Ylna5bt6AAlTx88OYiEV8VAD9Hx/d1DVaUJpt
G7j6/tDOrfuHVA0D/O5NN23sozmD9gY=
=OD7z
-----END PGP SIGNATURE-----

--mbsziskqq433z3de--
