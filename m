Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3B9625E33
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 16:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbiKKPUP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 10:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbiKKPTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 10:19:46 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785217F564;
        Fri, 11 Nov 2022 07:19:34 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id q9so13402757ejd.0;
        Fri, 11 Nov 2022 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Avc73Wd5uy7Skwld22VvbpjyFk8ZE6ZJMl2WUws4Lc=;
        b=VcgNLkQQBUoBcvJQba3AuaBnr9vBwzCaLsiJDg3vfO1i8jz04RZ8M9boGBXr+aqJ13
         F4AwNu0vWhu2dwG6IQVLIiX+hcnUYylAqdCtNNGzdKo60Xy8FoC4znTaestAX1avwze7
         uu0UJAHVi+bWnIZ++aj0uIe38aNuOejmSORQUHK6kuWBrspzO/+wxOUE1RITCn8u2+U5
         sPvvqxnF4g6B1WCGvZ/PggiGtnEGrbSNJDnWg8QNfHQ94lFqfU7IN+Bedt1mGF9GDCn/
         7EnSfj85WSPoHT+nGsxN35AdLPVa4aBsITm6h1vqkqEZqelUFBwzpUB/yCNHmbvPxF0O
         VJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Avc73Wd5uy7Skwld22VvbpjyFk8ZE6ZJMl2WUws4Lc=;
        b=dshVNXp8FayAYmyBkVqSJbQ/mGPoKPazX7nlhuZ+R3Vlu4TSFMzE1ZbpIxulhamPgF
         zVz6pG9x8GIzVn1BhTgGBuW8Q0ShRANLtOxhT6/LuboyXHuRPKtTQY8u6SwDsp966nEm
         FeWCdhQLrzZ5DQ40KjqX02xcXIBmBDthSXH2o3jjCPVX6M/bfyLkBgpTw5HdyHOa94DK
         SJ/Adzlc5fwBtbrAKgpGg36Yj32fPv4FrqcqwsPbC1W2N+GLTCr9jdmHp7a2vKPxnRuL
         zQ0qw6gfAPoeHlNliQDMZ/pXxGHFl0DLr4iycp3fkoGJGJjVCEJnjtMfupYobyI0mCXq
         8qkA==
X-Gm-Message-State: ANoB5pmJoYwj1kCXi43SHdI4U5FHo0wSiLd+oxhas4lFjoRfN202CGRD
        +h7n3fgTWOIb6MO4c4rEfWM=
X-Google-Smtp-Source: AA0mqf7jcjvvCajWEZf/4tzH9aqqjB2lGEVAh0GleCi1WbBbEayX+c7poMtqgc5jYCdKUUnpl2KrMg==
X-Received: by 2002:a17:906:4dc2:b0:7ae:50c6:fd0a with SMTP id f2-20020a1709064dc200b007ae50c6fd0amr2184833ejw.184.1668179973013;
        Fri, 11 Nov 2022 07:19:33 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b19-20020a056402139300b004637489cf08sm1168773edv.88.2022.11.11.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 07:19:32 -0800 (PST)
Date:   Fri, 11 Nov 2022 16:19:30 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
Message-ID: <Y25oAmZMcfBOCat3@orome>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
 <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HZeBpEYEJWldW/UB"
Content-Disposition: inline
In-Reply-To: <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com>
User-Agent: Mutt/2.2.8 (2022-11-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--HZeBpEYEJWldW/UB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 03:10:01PM +0100, Linus Walleij wrote:
> On Fri, Nov 4, 2022 at 3:23 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > This patch series changes the pin controller DT description on Tegra194
> > in order to properly describe how the hardware works. Currently a
> > simplified description is used that merges two pin controller instances
> > (called AON and main) into a single DT node. This has some disadvantages
> > such as creating a complicated mapping between the pins in those pin
> > controllers and the corresponding GPIO controllers (which are already
> > separated).
> >
> > As a prerequisite, the first patch in this series converts the device
> > tree bindings to json-schema. A second patch then adds an additional
> > compatible string for the AON instance (along with more details about
> > each controller's pins) and finally patch 3 converts the driver to
> > cope with these changes. A fourth patch makes the corresponding
> > changes in the Tegra194 DTS file.
> >
> > Note that while this changes the DT node in an incompatible way, this
> > doesn't have any practical implications for backwards-compatibility. The
> > reason for this is that device trees have only reconfigured a very
> > narrow subset of pins of the main controller, so the new driver will
> > remain backwards-compatible with old device trees.
> >
> > Changes in v3:
> > - address more review comments by Rob Herring and make validation work
>=20
> This looks good to me!
>=20
> I tried to apply them to the pinctrl devel branch but this happens:
>=20
> $ git am --signoff
> ./v3_20221104_thierry_reding_pinctrl_tegra_separate_tegra194_instances.mbx
> Applying: dt-bindings: pinctrl: tegra: Convert to json-schema
> error: Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml:
> does not exist in index
> Patch failed at 0001 dt-bindings: pinctrl: tegra: Convert to json-schema
>=20
> I guess there are some prerequisites?

Yeah, I noticed the same thing as I was just testing to cherry-pick just
the first three patches to a vanilla upstream branch. So yes, that pre-
requisite is another json-schema conversion that I have in my tree but
which hasn't been merged yet.

The good news is that my testing confirms what I recollect about the DT
backwards-compatibility not being an issue. In practice the only pins
=66rom this that are being used are in the first controller, so if we
change the driver to only take control of one of them, the second will
be ignored and that's really a no-op.

What that also implies is that the pinctrl driver patch is completely
standalone, so you can apply that whenever you want and I can apply the
DT patch to the Tegra tree. I can then also pick up the DT bindings
patches and resolve the conflict there. That is, if you don't mind.

Thierry

--HZeBpEYEJWldW/UB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNuaAIACgkQ3SOs138+
s6G7PQ/+KgZZbOu4GM2OFplp4E42IdyUdN9zgYBdFRY+OLIjG6gMmY8sfY9Rj47w
w6Ugi/LiEJKpBbfos6tXqnrgE/A3fK+G8RTWLYHiD0zr8XhytBRZ1+9bTE3OjDwO
2p8K+YSWpQCVOP0DIZ8nf/w3EXTyQ2Wday+0EJPg6ro8XL4o3mCYzryDYRwMJRvn
8eIKl9gZPJUXCCYJ2yphwzJ2SH6VL5aR396mK/waEBwYR4XkJQiZJJEVddrDEq4k
q+DwOv8SuMIDc45Vwc1J+aDOYSM+ICsh/qb5K8St7fHzFnFBKep0B1s60tfEs2ke
+fdBxl0MDa0febtuKxQqJNSeSoOhb8Q2HQCpSOBvnGsRPnqGXNBCfFU//0bZ1Z1P
r46j1j5HUMhKip9elA5BPI+B0MowevGRSeT/sw1xnX+csbwqfvGH7tf/T3q+Te+A
oT8Zss5kirkvRdb16igoux0zEfzbNwQnOO7CFsLIfyKBaChFv4zDdUJ6ydx9dUCe
CPSXEO2ZeaM47vR3hyyYl3uq6BWD9vNNLIZ8WUQUD2zHOgGA8fDWqKXNAIZ53Y7b
Zi7HISh2csDV6ETiEHI1fx60MfowlTJnjl7cWyX0g47Ts8+KR7PvBMjtLEhOEi8M
vuLP5mdFIIUg2peOSEyzqe6VwMmQm1Uerd/6jT70FwwvbgKUCU0=
=70p8
-----END PGP SIGNATURE-----

--HZeBpEYEJWldW/UB--
