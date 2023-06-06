Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E060D7243BD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 15:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbjFFNIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 09:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238028AbjFFNIQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 09:08:16 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB208198B;
        Tue,  6 Jun 2023 06:07:56 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so8949863a12.1;
        Tue, 06 Jun 2023 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686056871; x=1688648871;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2fbb8azWMwhLT2kLfdp06eGPdi0Pd4eejTK1A07kSw=;
        b=p52hJwxlKJj7jrVAIRuK7sBpYvtPzg8ez597LxrtYWalz6FM4fa0rXKvA3SrKlYzCs
         WRz2WOvcQlqw8GtB9MZqDUgcCn5lbJCr0p3jXqO8/MdxmqB17LVLumiU6K4qVAbVtfBR
         wCQb5ZTerz66aYcbDBlzSByOszemZXKo9ErVYqycH9OGD5awSM8IQnpq+wtYwuRQvHQK
         wMu31eFMEHYDDEwTM3tpmqZjeapbzhx3XX5foz8nbLu2f/t1EKOzvAWQNuIiEQRoVIpd
         iuYdXQgQv8dtPey2FAfLHiSF9kGT9jaODvw2P7z9aN3qrPG6+g937d+jAUEdu2X4Vp1e
         IT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056871; x=1688648871;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2fbb8azWMwhLT2kLfdp06eGPdi0Pd4eejTK1A07kSw=;
        b=ME0+iL8xoErvl9ip9MgSDLl63AEG8frWWjvoHClFJQzBcLLfVevjYnK6IGxE9xn+JB
         KIdbvHxnV4zduv1/ZGuImjhj98xO9VQrfRJyuGuApO2HgmzMv3erGzrmUQ7UHBLRnoiE
         b4VJQ4NQ/b/AQu9slTabMXxnIFioTR7Kpw9nHxwDA16QqEkTqmX1aw6wYsKxHBK0sEii
         ThkFl2cSuwkxHVwEJ6drTcapaw0fC4+hiJa3tDOMRNCcl0PquyBBN66ZifTjBhVuHYxJ
         tFpRV/8/H8Nazw031kZsorgjBcl7WjDj46XFcO2mLMITgvqWyiSqaKcAo78MdrMipSkN
         5dbg==
X-Gm-Message-State: AC+VfDw6VPNe1D3QL1H3gbe9OlQdrit1b2bFS3QaDOdQ0gDgzRRIjXeA
        NZKRtQZtNJtdwL8Fxpf2gi4FC/HmZiA=
X-Google-Smtp-Source: ACHHUZ7wTnp9Kwhh2GXBgRgIQ1o+XM7SMnM6xxZ2AxQjDogAYsb8Fn33Ra92zxSjTSNZJOOkB1ZDnA==
X-Received: by 2002:a17:907:60d4:b0:974:1c90:643f with SMTP id hv20-20020a17090760d400b009741c90643fmr2632768ejc.18.1686056870432;
        Tue, 06 Jun 2023 06:07:50 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ks9-20020a170906f84900b00965fdb90801sm5552014ejb.153.2023.06.06.06.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:07:50 -0700 (PDT)
Date:   Tue, 6 Jun 2023 15:07:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 0/3] pinctrl: tegra: Add Tegra234 pinmux driver
Message-ID: <ZH8vpP-J30qThiDp@orome>
References: <20230605154230.2910847-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oZqmczWLljUjEOrw"
Content-Disposition: inline
In-Reply-To: <20230605154230.2910847-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--oZqmczWLljUjEOrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 05:42:27PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> this is an updated version of v4 of the series, which can be found here:
>=20
> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D357888
>=20
> This adds the missing DT bindings example for the AON pinmux controller
> and addresses some review comments from Andy that I had previously
> missed.
>=20
> Changes in v5:
> - add missing DT bindings example for AON controller
> - use generic device_get_match_data() instead of OF-specific variant
> - drop comma for of_device_id table sentinel entry
> - drop unneeded .owner initialization
> - drop redundant license text
> - add missing includes
>=20
> Once accepted, patches 1 and 2 can go through the pinctrl tree and I can
> pick up patch 3 into the Tegra tree. Alternatively I can also pick up
> patch 1 into the Tegra tree to help with validation. We're not quite at
> a point yet where the Tegra DTs fully validate, so it doesn't matter
> much which way these get applied.

Linus,

I've applied patches 1 and 3 to the Tegra tree. Let me know if you'd
prefer to pick up patch 1 along with patch 2 and I can drop it.

Thanks,
Thierry

>=20
> Thanks,
> Thierry
>=20
> Prathamesh Shete (3):
>   dt-bindings: pinctrl: Document Tegra234 pin controllers
>   pinctrl: tegra: Add Tegra234 pinmux driver
>   arm64: tegra: Add Tegra234 pin controllers
>=20
>  .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |   78 +
>  .../nvidia,tegra234-pinmux-common.yaml        |   66 +
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       |  139 ++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   12 +
>  drivers/pinctrl/tegra/Kconfig                 |    4 +
>  drivers/pinctrl/tegra/Makefile                |    1 +
>  drivers/pinctrl/tegra/pinctrl-tegra234.c      | 1961 +++++++++++++++++
>  drivers/soc/tegra/Kconfig                     |    1 +
>  8 files changed, 2262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux.yaml
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra234.c
>=20
> --=20
> 2.40.1
>=20

--oZqmczWLljUjEOrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR/L6QACgkQ3SOs138+
s6EH/Q//e4lA58vLX1uB2T5RNI5NYedfmWmLmtrTPxlSHO4IGma4VR46NOw/5yVx
QKjN6Uvx33uKL2rsN8Brg1owVnN4FIbQGIFG5Y1HOOOdq1TKfH4Q6m4O6Hfuo/oD
8kg54Y+VKeY3o/vigQao3kFSDn5GYBor+eGDDpA8zpIndlcztuwL2VeLBOJL0jH8
m9X4h1ucqLuTPLiObrDnlVnmytsmhVA1Ba7gM6zwuiJ/pDQAbtrtkChNyxSEHaDC
YHspy9k1rPSBUGNWTcxHAe3SXvb7uet7VVTJh6FYBpH8AtmCtq87FlQD2nN8C72l
eHFfaj0rh4Gj4r/hi2vwsozDfWJYQSZ3nayZu7PaU5dZSpi33EMOdUFgx+TBx5ix
/nt/6ZC5jKsQXwQaIlBE2M2X3vuXtQLkUH2PO2DhPCz6i5BIzwMtdUI+G5wrWt5G
Uesi5VQ/bn6DwJOHnwWVmNIA+Uu0IiYYsB7hyd5ALTgbo35idchd/CjTDAw5DJtc
cFx37IIZrFfGx8kyCU4J40UZkhr/qOzSOgtZKMgRs8N6nC8clMDF0IGefAyAf8uq
mA99VNxBJfBUWjdoM9/RJEZAa8YQOVpu7hMlX79AGpvIGp/YBVyiyZnKXXafz/xi
QW2oYSUs9ZbovwuquZm0iCTHuPXz96Gv3OekYN2sJk1m84gPi/8=
=B8Zj
-----END PGP SIGNATURE-----

--oZqmczWLljUjEOrw--
