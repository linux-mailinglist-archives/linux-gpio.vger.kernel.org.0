Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24AE47C132
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Dec 2021 15:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbhLUOLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 09:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhLUOLC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 09:11:02 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1DFC061574;
        Tue, 21 Dec 2021 06:11:01 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c66so5436034wma.5;
        Tue, 21 Dec 2021 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SKlYu4rhd+UeC4gSMPgYkjH1fJ06JxDx8cl5WcaRXUU=;
        b=VtsZYrwRPA5ySb+YQl1TRIozf1/HeC0/ihl2pmJBUkDKSOyC++IuN4Ypv/UQDXovvV
         jiRWfMJiEmYZ+ViYnC7b7YNbphot5qSf/Q6ToUp3Ck0FQ7yrKBaFdAqnXQwLJZUCTshC
         TGlzoH0xtjF6MSb/kRoOBgqeac9CZ2eN7/tnJ2NMwMsT76LgYWvBDe7SS8PtcWaQYrr4
         f2ZZTaa7opHTz3yx+b8csbqEiymAS0WM6Eh8xxeLzXrhHdpCzdVxhbeT+qL58bPY793l
         iO2uNqG9/BbVXrmjuoJU2e0Jv8U0fJGFZOy3qL/qiq77Tv5cAjfbK1ka4M+AXi/d0jYi
         gWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SKlYu4rhd+UeC4gSMPgYkjH1fJ06JxDx8cl5WcaRXUU=;
        b=lKfsl7gYbx06uBb/dTwcvv/NAG4tav4B3EWimFMs1bMUf9LnWmmSLgCNL6+ELoK8gz
         TYWobzwYJJ5z8+LBTpMCdUuN5OjLX5gyeDyV41LhUNAEsnlaNLLzBuIl322etkeIxT0A
         WzNbulbH07ZMA3XwGXiz5bUzWN2XxlkxWXoIgPKXV0j3Dd6+DbTWkaNG8pUk2eH29B4r
         Yp5PurUCTWAADWZCWF5admQ55dXvh2oCzFH9j2ycSbeYnMjjdd0AMnZM8Ml0HidTn0/B
         9tag8N90SJH76NjhTf5sdMaeGHyLAyGB/hoL0uKxQclMiJ2STkHPBT+vdgN8tt2wXFB2
         55IQ==
X-Gm-Message-State: AOAM533Wrf1C00CmBXor6Ro3k6VVweDwikAwDa3m64cH1ouVg2qd2lEd
        Izc33nZS/pZeXvfnRBpepKc=
X-Google-Smtp-Source: ABdhPJzOySEmnpNlXj+3FBfRdCyECmgrbbLMNWdcku3SnU+GVp53y/Ah5bbeYjRZUQ76JjE5S0UQ1w==
X-Received: by 2002:a05:600c:3d90:: with SMTP id bi16mr2922378wmb.42.1640095860441;
        Tue, 21 Dec 2021 06:11:00 -0800 (PST)
Received: from orome (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id r62sm2426412wmr.35.2021.12.21.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 06:10:59 -0800 (PST)
Date:   Tue, 21 Dec 2021 15:10:57 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: tegra: Convert to json-schema
Message-ID: <YcHgcbUNZfmGFZ3j@orome>
References: <20211217165342.2572021-1-thierry.reding@gmail.com>
 <YcHbzrUNDaqjTNtN@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XHXWSF7fSkzX4LJQ"
Content-Disposition: inline
In-Reply-To: <YcHbzrUNDaqjTNtN@robh.at.kernel.org>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--XHXWSF7fSkzX4LJQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 09:51:10AM -0400, Rob Herring wrote:
> On Fri, Dec 17, 2021 at 05:53:42PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> > text format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
> >  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 264 ++++++++++++++++
> >  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
> >  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 287 ++++++++++++++++++
> >  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
> >  .../pinctrl/nvidia,tegra194-pinmux.yaml       | 175 +++++++++++
> >  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
> >  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 203 +++++++++++++
> >  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
> >  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 232 ++++++++++++++
> >  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
> >  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 268 ++++++++++++++++
> >  12 files changed, 1429 insertions(+), 844 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra114-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra114-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra124-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra124-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra194-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra194-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra20-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra20-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra210-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra210-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra30-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra30-pinmux.yaml
>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-=
pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pin=
mux.yaml
> > new file mode 100644
> > index 000000000000..fa95d0bd6fe4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.=
yaml
> > @@ -0,0 +1,264 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
>=20
> GPL-2.0-only please.
>=20
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra114 pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra114-pinmux
> > +
> > +  reg:
> > +    items:
> > +      - description: pad control registers
> > +      - description: mux registers
> > +
> > +additionalProperties:
> > +  type: object
>=20
>      additionalProperties: false
>=20
> That will cause the example to fail.

The idea here was for additionalProperties: to match anything that was
not elsewhere specified and as such to serve as a catch-all for the
pinmux subnodes. That way I wouldn't have to come up with a pattern to
match all existing uses.

Thierry

--XHXWSF7fSkzX4LJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHB4G4ACgkQ3SOs138+
s6Eh/g//SuOOaGHxsnLZZMBMB1qq/cLaHVETHwhkWEBPwe0WYHC4hD14qVum2I2w
znJnbCIz4xEba5Yk3kLlFDCisOCiLUS6OX29Ro2WS/WkNjR0SsNPswnGYhwvIP2r
VX3UNrBU9EQiUVdvKcmI8cAAnLF1P0nVggD181OZ/0D/Pxiiwzv5Pd6ksr2EGYjE
GO6uoGVlukwWUP0qqskG/3Z0iTJxkwL5kohErpfRGu9TCyWxcmG8LuEmF75HPRm6
rTKKTKci2UEVj3BH0N2Xl3RPImD7f45T9/fKIdXdBq8XDrJDYo9LA5IKX6CrC9tK
wmwnrqUtgmpibiuG0CNsn5jRY15akLzu3Ki6tSpG/1+NzbUaq5Op1oYpC6kesrAL
pIR94wM+MnkZ3T1h3wWqXTKYe/6Envs9L7qtU47S81mRBgTco+o0Vio7ayJjfhXj
+dvF1KxoGLNXKK/FGQio8dXquwjeTWoOfqkMz9tk8S9SLLYz/Oz+KO0lhz7OXU75
OaLXB9sRXcy7+CRP3guFXa8CzwcSdL5qVeP3iFKjSbF3NlQZw62FlIqWV1V/Vv+D
ifM6R+oh4L51o99eQAMjvXPo0LGPeP7RHtwJIojj742A+AbUDoQFHx9LBL3MxN9A
anqxp/a7WUz5K48w5zO56dGdxSByTf4bp6wxGw9zKso3MNtIKSE=
=8Vvb
-----END PGP SIGNATURE-----

--XHXWSF7fSkzX4LJQ--
