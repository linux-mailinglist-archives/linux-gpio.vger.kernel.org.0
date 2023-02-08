Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4DE68EDF2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 12:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBHLaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 06:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjBHLaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 06:30:00 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C8043920;
        Wed,  8 Feb 2023 03:29:58 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id fi26so19979153edb.7;
        Wed, 08 Feb 2023 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37pUaSbLB8adpWxctGbYIwPN6O0+m+Kzz3qwADLaN50=;
        b=OjfBm86G0WQFwRkavMMCbinqzWO8yw71zqJzRJ20hTbfZ/wP9IU4XG+EKkaRDqCVEM
         TWCcCNhPgGWn+iWHkocELij02oWODLLgXSOMqTPZS8gGx01udE7LTtP1vOA+dISSYiWK
         fb9vsbFiJoBdTjL7n2IR3dPKzr4MWmIhHWx8ldexUrUaEKTr2ABLOmV0i67Ow+nAw/8n
         joqmV9KfCWG79OFJfM46LJJ2MW85DINb91eg7KMwcehhqMLPXqFzDuGhpfXqmGmFJn16
         5b/Ze2NwTvid7T4I/LjAFXxWOY1aekWXntnORJNmNq4AClsbfEBXjAkFboW2wIrEyasr
         /JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37pUaSbLB8adpWxctGbYIwPN6O0+m+Kzz3qwADLaN50=;
        b=Xi09gndutlDpo3NOIlbjMGbhD/+IM+xovc0fXuEkmHvk8bjkMShUw3jLq3MOwHz8dS
         kOXvnZg2gnjM2PPKQDqsuPpAczjo/aZcsjtPkw8kRBSWkkWcEE/7Kt7CLFkFcJp9EKa0
         Hmf7zdoDu1TAHtX46KaWJEXd0c50zAMRc4LPQCaktNqfuWdOBpOiWSwzu+4yAVVogxY4
         Cd+vkQHAIiDDGeB2lNVF9kS70ABSlyNcArTPJTAEMAlxFzmDlqVPN/2mZFk3bxdyGlsj
         /9XSgWZUFW87W6qtEIsWoDN1HvIIdYqcs6TmYkDrYik6KXfjmV0Uaxxk45Z1WXjqZb4D
         HVxw==
X-Gm-Message-State: AO0yUKVdiSClIqkgT2eGaRsiMC1VlTgtXveJZb9I9hUPkKCSHXELWiwY
        ZIq4SLLxk0e420+W2CNQaIg=
X-Google-Smtp-Source: AK7set8M9xOiq4xDz5RmYHerwB4kUGas4A/21Tk+v7eJQ0RiM9bWXpu4f9JZmlyf8vPsQAkOWWRpTg==
X-Received: by 2002:a50:870e:0:b0:4ab:554:37ea with SMTP id i14-20020a50870e000000b004ab055437eamr1988481edb.4.1675855796518;
        Wed, 08 Feb 2023 03:29:56 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u2-20020a509502000000b0049e08f781e3sm7844524eda.3.2023.02.08.03.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:29:56 -0800 (PST)
Date:   Wed, 8 Feb 2023 12:29:54 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        smangipudi@nvidia.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Message-ID: <Y+OHss1GJysBxYZl@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <167577954273.3457850.16805281654046177833.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UWgY83JasrdERZpt"
Content-Disposition: inline
In-Reply-To: <167577954273.3457850.16805281654046177833.robh@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UWgY83JasrdERZpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 08:37:51AM -0600, Rob Herring wrote:
>=20
> On Tue, 07 Feb 2023 17:26:15 +0530, Prathamesh Shete wrote:
> > Add DT binding doc for Tegra234 pinmux driver.
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
> >  1 file changed, 232 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra234-pinmux.yaml
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
inctrl/nvidia,tegra234-pinmux.example.dtb: pinmux@2430000: pinmux-pex-rst-c=
5-out:pex_rst:nvidia,pins:0: 'pex_l5_rst_n_pgg1' is not one of
[...]

Prathamesh,

Looks like maybe you copied the example from Tegra194. On Tegra234 I
think the corresponding GPIO is AF1, so the full pin name for this is
pex_l5_rst_n_paf1.

Please fix and make sure to run the DT binding check before sending out
v2.

Thierry

--UWgY83JasrdERZpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjh7IACgkQ3SOs138+
s6FFTRAAuRKU7cb42m6T7eulrCGw4N5pyi3PZW4TyTnb4NfdXMvu8ecRe8wumyW0
3dl1CPakjIlhVzoIaeJ5W883q9EFdPoY15x7hEUi8Lh7QkuICDyedIcaA3BR0jAd
Dv2dxV4oyeMuomjuMVBE37i09xv+35geVu6yXRJue3MoQY+CNUOvPD2aM0hYyh/Q
CsqxjQ8i3z2UruxbjvEyUjPndGNySgWrmTSAwbOA0VSkNPqBaGHJ9ET256gU+91I
vOBKYAvriZvl0BWnhkhm0xcLToC0qYL1yCzcQmER7Ak8ZvUlN1bhizqE3nqOHmcQ
BhYGWQ2dD+Vp8xtqYN6J+N+2ppwFX52XFGJ8eOAWBrc38yPVVgVJjozhaetz0DPt
APUllWHe0wY/vVjJ0mE0MPz3B/mVbmMsfy4UJPLO7tKXp58NpVl8OHUvmuasbOs5
D5TX0MebI4BeIWnz+X0Pf29x9sfipumXOeCXbrGrlzdUQiv3JO04CfZOTo11bn8f
+gQnYGAypGHa5i/c0asXEDSVuWrTiWw39DwTJvSwbXki7hAOeVIowZ9u9r2eow/W
h0lG9hIwrUrjaaDj9ljbWe+eJMOwUvnjVJ6f8PbS8mOYrZVscBkWajMaHBMqFtft
cI1fjOERoL9aIuzUvs0hj2yXkJwCpftNZAPTOwBU6mKTSEkdwrw=
=HxP/
-----END PGP SIGNATURE-----

--UWgY83JasrdERZpt--
