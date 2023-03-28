Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0EAD6CBF58
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 14:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjC1MkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 08:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbjC1MkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 08:40:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DE79EFA;
        Tue, 28 Mar 2023 05:39:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t10so48990223edd.12;
        Tue, 28 Mar 2023 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680007189;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkahNZrJeIv1+bxwFASjNCDYeTxk+0/JVaqPrT+yHUg=;
        b=SYUCiCwlqlyBtVCcx0V848MOAZ0Y/fSiZYfkrpBaMJpBy9gkKoyKU8qvNk6hJZEPn5
         /f89JMCzUa/FjVxBXXL9kUp+lTvg3abrPEIiZvp7eBkBhUj5U6wxVD09KqbyDxw9l14e
         mvtgMaJL/0b+xMZvSsw/7I/V5sxCbEtAA2ce8WegQUR6g/tjMnUkaeHmPgEfHRqVUMXw
         s7uC6U8EWJzB2McgafDiK0vgo/6WyKG5LRlZ/y7dZC2+rWmv6dtgtvQJJpsJOfMVN371
         HQ6HnnZc70IGJ7HUsWKxLy9P1Iw0hB0WG78K/IsHsSNvQn4kryWidPBxyiI/ZmGC2wYW
         51Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680007189;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkahNZrJeIv1+bxwFASjNCDYeTxk+0/JVaqPrT+yHUg=;
        b=FGhEAPO6eZMVHSs1IrZEB4R6WDdgZKbUfdVutKscQ2icEppHO9YKcYXxQ/r3Z3ERkn
         HRW7pib33e1Idgt4eeROfcjmpOSKdmW5A/OSBbQV1N4Pm2xqkDN1IAUPT60MN4Buo4uk
         TrjOQnMG157lIM3qKqn8WnzoiQJ39aD5lTTognfXlfRxlgPE1uTMj3PogCKQq7i2D0nt
         mgWV7vPYgGB9buZkuwHP62bk+w68FpSOi57A1y/51h4HsDHeoLzM4gAIIOkna4qPpEX9
         QS3qGGS49Nr10FeiM+GbeYCAxTmGIc5huZvX0dPgnGbnSw31+NHIl4+t3MPeskiJMzmP
         MvCQ==
X-Gm-Message-State: AAQBX9cmGubdP6ZKzx0e8XhUyu/eh78Nj2J65tpYAG7VSXr2mAoXwcvN
        Ptot9WrFzqY18hIzfYOSLiM=
X-Google-Smtp-Source: AKy350ZSTnZi0wlK7RVHH79oyTR0QFck1OHqW88Wf+z3AAU1VKWwtN5dvy+O21IsUi2k7O8m4Jm+yA==
X-Received: by 2002:a17:906:7109:b0:931:6921:bdb7 with SMTP id x9-20020a170906710900b009316921bdb7mr15179096ejj.60.1680007188624;
        Tue, 28 Mar 2023 05:39:48 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c16-20020a170906925000b009327f9a397csm14678274ejx.145.2023.03.28.05.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 05:39:48 -0700 (PDT)
Date:   Tue, 28 Mar 2023 14:39:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Message-ID: <ZCLgEhrQiYHGGZ6S@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
 <Y+OGdMFQkL9Dtaq/@orome>
 <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
 <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
 <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org>
 <ZBxeLIXJDbM2ebyt@orome>
 <e06977ab-8112-1e45-4392-df36e358e772@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XSu3Gsb1PNODp4mo"
Content-Disposition: inline
In-Reply-To: <e06977ab-8112-1e45-4392-df36e358e772@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--XSu3Gsb1PNODp4mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2023 at 02:19:45PM +0200, Krzysztof Kozlowski wrote:
> On 23/03/2023 15:11, Thierry Reding wrote:
> > On Wed, Mar 08, 2023 at 01:24:04PM +0100, Krzysztof Kozlowski wrote:
> >> On 08/03/2023 12:45, Prathamesh Shete wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Sent: Wednesday, February 8, 2023 5:28 PM
> >>>> To: Thierry Reding <thierry.reding@gmail.com>
> >>>> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
> >>>> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel.org;
> >>>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
> >>>> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangipudi
> >>>> <smangipudi@nvidia.com>
> >>>> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT bind=
ing doc
> >>>>
> >>>> External email: Use caution opening links or attachments
> >>>>
> >>>>
> >>>> On 08/02/2023 12:24, Thierry Reding wrote:
> >>>>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
> >>>>
> >>>>
> >>>>>>> +          type: object
> >>>>>>> +          additionalProperties:
> >>>>>>> +            properties:
> >>>>>>> +              nvidia,pins:
> >>>>>>> +                description: An array of strings. Each string co=
ntains the name
> >>>>>>> +                  of a pin or group. Valid values for these name=
s are listed
> >>>>>>> +                  below.
> >>>>>>
> >>>>>> Define properties in top level, which points to the complexity of
> >>>>>> your if-else, thus probably this should be split into two bindings.
> >>>>>> Dunno, your other bindings repeat this pattern :(
> >>>>>
> >>>>> The property itself is already defined in the common schema found in
> >>>>> nvidia,tegra-pinmux-common.yaml and we're overriding this here for
> >>>>> each instance since each has its own set of pins.
> >>>>>
> >>>>> This was a compromise to avoid too many bindings. Originally I
> >>>>> attempted to roll all Tegra pinctrl bindings into a single dt-schem=
a,
> >>>>> but that turned out truly horrible =3D) Splitting this into per-SoC
> >>>>> bindings is already causing a lot of duplication in these files,
> >>>>
> >>>> What would be duplicated? Almost eveerything should be coming from
> >>>> shared binding, so you will have only compatible,
> >>>> patternProperties(pinmux) and nvidia,pins. And an example. Maybe I m=
iss
> >>>> something but I would say this would create many but very easy to re=
ad
> >>>> bindings, referencing common pieces.
> >>>>
> >>>>> though splitting
> >>>>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit
> >>>>> with that already. Splitting this into per-instance bindings would
> >>>>> effectively duplicate everything but the pin array here, so we kind=
 of
> >>>>> settled on this compromise for Tegra194.
> >>>>
> >>>> OK, but are you sure it is now readable? You have if:then: with
> >>>> patternProperties: with additionalProperties: with properties: with
> >>>> nvidia,pins.
> >>> This is inline with the existing bindings and I think this is the com=
promise that was reached during review when the bindings were submitted,
> >>
> >> So the code might be totally unreadable, but it is inline with existing
> >> code, thus it should stay unreadable. Great.
> >=20
> > I'd say this is very subjective. I personally don't find the current
> > version hard to read, but that's maybe because I wrote it... =3D)
> >=20
> >>> offer to rework if a better alternative can be found, but that only m=
akes sense if all the other bindings get changed as well, so I think it'd b=
e good if we can merge in the same format as the existing bindings for now =
and change all of them later on.
> >>
> >> Cleanup should happen before adding new bindings.
> >=20
> > I don't recall the exact problems that I ran into last time, but I do
> > remember that pulling out the common bindings to the very top-level was
> > the main issue.
> >=20
> > If I understand correctly what you're saying, the main problem that
> > makes this hard to read is the if and else constructs for AON/MAIN
> > variants on Tegra194/Tegra234. These should be quite easy to pull out
> > into separate bindings. I'll do that first and then see if there's
> > anything that could be done to further improve things.
>=20
> One problem is allowing characters here which are not allowed. Second
> problem is reluctance to change it with argument "existing bindings also
> have this problem". It's explanation like "there is already bug like
> this, so I am allowed to add similar one".

This is not a bug that we're trying to replicate. We're basing this
binding on a existing bindings that were already reviewed upstream a
long time ago. It uses a shared binding that's in use by these other
bindings, so making any changes to this new binding means either the
other ones need to be changed as well or we can't reuse the existing
shared binding.

> Now third is that defining properties in allOf is not the style we want
> to have, because it does not work with additionalProperties and is
> difficult to read. Again using argument "existing code also does like
> this" is a very poor argument.

As far as I can tell, it does work as expected in this case because
we're not actually adding any *new* properties in the allOf/if branches.
If we were, then yes, we would need to use unevaluatedProperties and
that can get complicated. But again, in this case we're merely
overriding existing properties with more specific values, which means
that both the standard binding applies and then things are narrowed down
by the values defined for each compatible.

Thierry

--XSu3Gsb1PNODp4mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQi4BAACgkQ3SOs138+
s6GRYBAAsUYHCigNtdc8rSsLD1NsjbYlndUAsaupRMDOT3KiJDGC5luJCphp687y
5YYtrWu9glbcfubIGNr7eBHcelnOQqqHt9u5fgLV1C20tvYNbAdu6MJqB0p4QuVF
WM1x09wv6BpK39TYEY+psHhFyUCnm4t+PCF+uOiRPjpZMgyp2kZ3gSwa9PArCUzm
1k+kCfPo7G8zjClLDNV3knOkqW36kS4VNd6UDkCrs+OK2T7zCCpwBTNDVjZaVuUK
ar14F2j2o38N9uqldtGkbdZk5GtAxleZXiggDa1KLHTVegibJmnBx7NDmEXkkI/P
WNmwhtd5hSu1y9+sP52gNz/rdd7DcG2Nr4jF2D+z6SlVFVT+2QzsI1uRlh7+yvW3
091yMAeH5rwHgpPNWvrWZ1QZbA4uTUKPPJMkqFww62rQDdORenWTdhZiYXJyD9qd
Pn9PZZSJVKxdbDew1k2EeFUk6B5cacRjQEjmSgE9dNsxeC0kZK7tT5I1w/CWQJSL
2zUrsy+SfUgQN/MKDiF8BB146+Vn3vDqNloUcMnDOYrrlnOnWVNa57pFkJmCchdv
kOJGq5DVN+TecCQXAKes5qO77pzPFepii6d2P3SZGyrsd6I97skCiPxg2HUJgr3l
C4tmCM9vOx3gf4oEdkNv9uUFzn4+xaQ/TAvePQKlrxr6u26J0DU=
=NdYS
-----END PGP SIGNATURE-----

--XSu3Gsb1PNODp4mo--
