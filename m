Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5BA21F66E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGNPtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgGNPtS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 11:49:18 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D15BC061755;
        Tue, 14 Jul 2020 08:49:18 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p20so22524167ejd.13;
        Tue, 14 Jul 2020 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1H4dhNeluJc6PmfPVu2dwjJilc9M0K3+/pSSegsHSMU=;
        b=M7oahEXEKXEwJgKF/Bp1/K8h6eZI+M/87e6IbpHARagYHM3JDWTh1vkZZRhXzNs6R/
         /t6AEMz71eBb5D1xJ1MT124wj/0rHWDnuuWgACFm5f4GdYbz/Mb1BNzTKqpcNL6Bif7i
         smaFJnGw6aH5Nr/PK8Zjt54lhQQlH10l/4C8mI4wPGQ0buBGuROq3IhWVFyNj+Z37W7i
         gH4sg5ei4YM2Y9HsFa9t7QgLEteOtsewIdzs40uZ6Vu4doWxcWcoeVWg5bN2xbyz2f+x
         oRex7Gb18A7trMHYiDlPZNNouhIaeS3RHajOWKupiB0aEK1l5UDJ5dAbVXPKa/QSzJkz
         nLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1H4dhNeluJc6PmfPVu2dwjJilc9M0K3+/pSSegsHSMU=;
        b=iaaqRa1/TMtBm7P14zuJ1DxyiPrOYRKeINVjLe+hWK5HsmaUpEP11GcBh6BnOONvQS
         kZCsV0ToPQBtB06YDLNHZlbHIPsUcDdozENK6zFSlaUTgtrIdajaxDhIQVG3uY/lwYO9
         jOuCIsD3WoB5ZKBA0p+8sn/UzyFByqkSGygSD+uoEuNX7Hl/FxQjWGJ8demGZ9j3Hfdk
         naY5iE+nw9ZtXgvJ+ifoAkvZj7QIiQlypoYV5l6durc4Txyuv8ERi2QqNNQr7oFk+ypj
         ohlUdibzCLNXbhHT8mI6a6qcK2fxKLPf1bKCGwSqm8pDhnxRAQ3n+fJxPxBCejsyna+W
         2u2w==
X-Gm-Message-State: AOAM532GC8F4p6uCEPpfk1waWW8BkiZZyAVx3V3PTxQwhLjwAdHn96ZM
        t7M3NLZF5TEWZCmXtO46Nf3Y21M+
X-Google-Smtp-Source: ABdhPJzC4iiO39pixEVj0uU66VZOzVnJ2fABhUrOPzIg2s1poH5/ZYA9GU+ZkthPgPCFlGEw7mJZYQ==
X-Received: by 2002:a17:907:20d1:: with SMTP id qq17mr5151818ejb.214.1594741757383;
        Tue, 14 Jul 2020 08:49:17 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d26sm14470879edz.93.2020.07.14.08.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 08:49:16 -0700 (PDT)
Date:   Tue, 14 Jul 2020 17:49:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 22/25] pinctrl: tegra: pinctrl-tegra194: Do not
 initialise field twice
Message-ID: <20200714154914.GA251696@ulmo>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-23-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-23-lee.jones@linaro.org>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 03:49:27PM +0100, Lee Jones wrote:
> Both PIN_PINGROUP_ENTRY_Y() and DRV_PINGROUP_ENTRY_Y() macros are
> called for each of the 2 pin groups defined here, and both of them
> initialise 'drv_reg', causing the compiler to complain.
>=20
> Only initialise 'drv_reg' once.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized fie=
ld overwritten [-Woverride-init]
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_clkreq_n_pgg0=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, =
0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initializati=
on for =E2=80=98tegra194_groups[0].drv_reg=E2=80=99)
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_clkreq_n_pgg0=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, =
0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized fie=
ld overwritten [-Woverride-init]
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_rst_n_pgg1=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initializati=
on for =E2=80=98tegra194_groups[1].drv_reg=E2=80=99)
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_rst_n_pgg1=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
>  | ^~~~~~~~
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
>  1 file changed, 1 deletion(-)

Indeed, looks correct to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N0/cACgkQ3SOs138+
s6EyDg/8DvdSsh/xAJCs/CnR7MTGLh60dManNXVZn2FQihuEEXhDyqs7WC+JLmiw
5mxbGiNt+0I6GsVizGeyuqtFUY0t4HpLLAY6mrMatr2lRnJ7+5VWnKhvj3ouRDqU
Xmw96Gkc+aoQY2he1VyJ41OnZrdSNoaniDN7GUZ4rSg+oRYsv/7GzMcUGuH021oc
MtOFXZZeaelUIE+AUqT7V4WBurTNW0EFmCC/l7n7ZWQBz4eZ1cbRS3XNZBDArqsv
acF+a7W6RlgmiTYyQtVvew1KttdW8vXPLE4IvhibWe5EVW8x6ra7CeYDnsUZE7RY
JuOImmlImnjwoJbRLuHcuOL9tGU6f5Lvchmt8moR/rADue3D0ltswJZE+jslleyp
9aM4wtOOmymbbPLzNeNPwMU4FWmA3KR2DSa0GxLMuLOJR7s1bTyOb4ygWAPGnBUY
gHxAjYLCTS+ZpLMEh0mHaSAxAt0pSq7j/wZVyEUe/QXTGrvq3D0LiL7jHJKcX46R
x6mkVt7vFHlv4lhkUIpsE56BYws+9q1s5g63OHuJ+8VFkUwCaPFXX1MaLaBpXNTa
9SmovIo0mG99ExVK1RZmba0Dd/SUF20cxK5NRtRTvEYMRAdzhNMHNa7vgDFlZLF2
oplZw4k0f61kijz2+u8GF+gpyzEDsxJgBM1yOm+7JAy1L9OLQwg=
=1tXh
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
