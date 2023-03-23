Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0796C6A81
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 15:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCWOMG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 10:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCWOMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 10:12:05 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D227305F1;
        Thu, 23 Mar 2023 07:11:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id cy23so87060034edb.12;
        Thu, 23 Mar 2023 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679580718;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7fWE1i/dRfyPFGjkswL64OGjACQhbXNRs2vbqxv+78=;
        b=IYpy1Jt7/9oQxGbqjerPbIKIjhyjoIbqhzhrTSha51fbx6n5i1QcBUdHPFYIHaicxw
         mJ3f9QfzExjp5e3mCS1E/CTd4c3qrGEzNyu22F1ov/xaCmsp8KdiODNQd2ez7JOfxCcZ
         hE96NfY0+rgMv6VCq+6Juic1sHuYSKpiW6slgwRtlmeqWhB9MA/6DQyv17h+/ku8YMd7
         2GLu04n3QeJatCeiM0/KuixPpwKqE1jcoUCQUl5AsqwoUwsvmYCpDSv3JOaixWJdElil
         XA5N594BuleON6zXW67mtyflMqx4TJGRk2RZI4mCFHoP6Ov452wglaKszeUbP5LIUUpL
         pzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580718;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7fWE1i/dRfyPFGjkswL64OGjACQhbXNRs2vbqxv+78=;
        b=tt00b55HkRYtbp1TxJ/29GLIS/rKpE+h3DuH3CDJWiot1nWA3H3HVv+aS5ebgab7ak
         Itl+AfP6vnE7yLgVJJSjq4ttRyJyxtSzy3f+ddFfSAqbfncx0Ua9bi1quc8AGzmRn+9D
         6zGvekhm1b8fWUnqQYogyetZnjWGgtmMF09IzDn3/U8MLeqqUuU0dS9zkr1j70hBet1Q
         syprh0udTX30QMHRHgUfBmGvtDxpArzWyv3YV3OZLSZz1KE6kmfNo2CRjocVyYy2FN0C
         D39ZpogqmT1aBXZM2UrVQ6Fm+elhMLg4gvVLXsCNsEQgZ0gZ6vt08OBKkvR1xZz1jCTJ
         zzag==
X-Gm-Message-State: AO0yUKU+eVUm3oxx1l9dHszl7SaGnNz9GFU91s5MaHlGBh+WFFrtECoz
        SXD53QvSqcq5+Ow6Vd6Zi7o=
X-Google-Smtp-Source: AK7set+qwWDitTFV0CoJv6kN1GfQJGiQG+c2QMmD5M5pRSS7qEUAcG4sOxwZy7anlJLjwy69hV5QPw==
X-Received: by 2002:aa7:d8d1:0:b0:4fa:4b1c:6979 with SMTP id k17-20020aa7d8d1000000b004fa4b1c6979mr10454931eds.28.1679580717942;
        Thu, 23 Mar 2023 07:11:57 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b004bef1187754sm9206874edj.95.2023.03.23.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:11:57 -0700 (PDT)
Date:   Thu, 23 Mar 2023 15:11:56 +0100
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
Message-ID: <ZBxeLIXJDbM2ebyt@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
 <Y+OGdMFQkL9Dtaq/@orome>
 <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
 <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
 <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PKHh1Q9FWbf80SlK"
Content-Disposition: inline
In-Reply-To: <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org>
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


--PKHh1Q9FWbf80SlK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 01:24:04PM +0100, Krzysztof Kozlowski wrote:
> On 08/03/2023 12:45, Prathamesh Shete wrote:
> >=20
> >=20
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: Wednesday, February 8, 2023 5:28 PM
> >> To: Thierry Reding <thierry.reding@gmail.com>
> >> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
> >> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel.org;
> >> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
> >> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangipudi
> >> <smangipudi@nvidia.com>
> >> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT bindin=
g doc
> >>
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> On 08/02/2023 12:24, Thierry Reding wrote:
> >>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
> >>
> >>
> >>>>> +          type: object
> >>>>> +          additionalProperties:
> >>>>> +            properties:
> >>>>> +              nvidia,pins:
> >>>>> +                description: An array of strings. Each string cont=
ains the name
> >>>>> +                  of a pin or group. Valid values for these names =
are listed
> >>>>> +                  below.
> >>>>
> >>>> Define properties in top level, which points to the complexity of
> >>>> your if-else, thus probably this should be split into two bindings.
> >>>> Dunno, your other bindings repeat this pattern :(
> >>>
> >>> The property itself is already defined in the common schema found in
> >>> nvidia,tegra-pinmux-common.yaml and we're overriding this here for
> >>> each instance since each has its own set of pins.
> >>>
> >>> This was a compromise to avoid too many bindings. Originally I
> >>> attempted to roll all Tegra pinctrl bindings into a single dt-schema,
> >>> but that turned out truly horrible =3D) Splitting this into per-SoC
> >>> bindings is already causing a lot of duplication in these files,
> >>
> >> What would be duplicated? Almost eveerything should be coming from
> >> shared binding, so you will have only compatible,
> >> patternProperties(pinmux) and nvidia,pins. And an example. Maybe I miss
> >> something but I would say this would create many but very easy to read
> >> bindings, referencing common pieces.
> >>
> >>> though splitting
> >>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit
> >>> with that already. Splitting this into per-instance bindings would
> >>> effectively duplicate everything but the pin array here, so we kind of
> >>> settled on this compromise for Tegra194.
> >>
> >> OK, but are you sure it is now readable? You have if:then: with
> >> patternProperties: with additionalProperties: with properties: with
> >> nvidia,pins.
> > This is inline with the existing bindings and I think this is the compr=
omise that was reached during review when the bindings were submitted,
>=20
> So the code might be totally unreadable, but it is inline with existing
> code, thus it should stay unreadable. Great.

I'd say this is very subjective. I personally don't find the current
version hard to read, but that's maybe because I wrote it... =3D)

> > offer to rework if a better alternative can be found, but that only mak=
es sense if all the other bindings get changed as well, so I think it'd be =
good if we can merge in the same format as the existing bindings for now an=
d change all of them later on.
>=20
> Cleanup should happen before adding new bindings.

I don't recall the exact problems that I ran into last time, but I do
remember that pulling out the common bindings to the very top-level was
the main issue.

If I understand correctly what you're saying, the main problem that
makes this hard to read is the if and else constructs for AON/MAIN
variants on Tegra194/Tegra234. These should be quite easy to pull out
into separate bindings. I'll do that first and then see if there's
anything that could be done to further improve things.

Thierry

--PKHh1Q9FWbf80SlK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQcXikACgkQ3SOs138+
s6FCjxAAol5gJhxzqk6OhoNz54nDtsbRLB07i2nyNL64g8rQtkyKOT2uN0+4w6qh
XcpwdiQp9JipieZS0FLiFa9PeU71g2ykvODOOfCsOuAqxPIIGdafFqZrchlg4YuH
bRGNDp+s1J1xdnFcr6RGXD7b5mIfgHaTgdesO7dbwewH0SDrJGebHk9k9y5kU2Id
xzHuO/C8oDjHwsXVCstjma+JiT2NqXJFDt2owsA5Pxnk4aoT/DqIivZS3QHoKCdo
ge8wuyCz37ZCF6ocsrONFyi5Agbq1sKHthIME+DChlOHYDqHiwBOCdcOvmtB4cSJ
kn0DWhoeVyzeG4FPMhdl6YcDDs8MUwUUo9ed9ghpg0S0IEDk3LCwBjyjVDt3ddtJ
DycQ8WNvhz+p1jgBSma2TpLbavdYq3GBB8Io3D6nAHAiqaKUOCtnmgiUdZgDLozp
Fxd5C7XGhAxuMHKrew1FHzA74o52AforIOi3tAR7vwNZzxyElpEDqx8yF8SItndP
xisMTnFCCWCNyJ9S9ab3mRhzhBg5B0L047Cx44I11oUEnW2eOzUE3FdTbyynJzjr
gP0LuEuJWnHNED5flu2aWRwJtShemEyYX1CuY9vBb1O/jUT1v5g5/kTz6+ZUupAi
aW9jtpH1oGaK4fiUryMOtPRpHNgskZ/9yjDVef8fvnb/Jg6i6zc=
=HL0b
-----END PGP SIGNATURE-----

--PKHh1Q9FWbf80SlK--
