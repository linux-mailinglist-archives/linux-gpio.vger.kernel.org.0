Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5201B56644
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfFZKJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:09:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51392 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZKJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:09:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so1462713wma.1;
        Wed, 26 Jun 2019 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eh72jYgq1NzpoJM5GSmuS2w6GC2KJuJcmy3C/KF8pOo=;
        b=NxWG7d2hsU8+G8B+sd6acROP9qiVfzFqGwM5+Um+4E31aiHqecuQHX0sSBikcOx5o9
         D9KplpB0Fae5BYlPx52E9MOxMDTcdPR1AInrtZBQDq2GJu9iMqf1ZXKucGQAxlddk2/7
         tlyyGPJ3FHP0s5CfM6sTrwZcQbM2fgeRNqaVEZgEt0uIVoQ6Bkalav+oCi9hEXe7cLhz
         N/WkMm3QNiCo+0DujMxzMp6ceKZTHTn2vO7LP967BkFSroigY1abp481PGaWEWiXzDNd
         Rvnh/v+lcHrrExVLppPy9HAJCg2sX1RKfNQJIfY7yPvXBhzrprtFM1zI0stHcP1/wfQe
         nKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eh72jYgq1NzpoJM5GSmuS2w6GC2KJuJcmy3C/KF8pOo=;
        b=fd63sfQOdK6e8cOPTtk5PD12Jr6nf9xdlxZQkSXpIqoP3chjhzTukOnioS9r4uA2cs
         qsvfb43Xf5ifwYgHN6nq20VI8BSdtxLXgimMfOwnjfJ8b8B8J+Ik1LmVsTGKqeAgDAK7
         kG1aTbl07xSekb3Sfn+nC2KsV7KihzxO88Jlb1p2sM3KKGtEHoCpzSvcssWctfz1rnIR
         nyxNhPHatGbyMLsXVJgA7cQg93WkdyeL/6U1pqn2OMrMD5xCfy2lp32p4UzCzweEFfZ5
         A0KVbQqN/mETZdVUSZqxM1PdmkZPgaaJePpAQ72n1pZnvfWr2p8SB3RH2XMXvbsvS/mU
         ndWQ==
X-Gm-Message-State: APjAAAWMhzA9PKGOIKYFVpI5bVK9TIFiNpl7xcp1gTS3gLWFfZIl2gGZ
        6UJ5CMu+/Pxf1ja5/O+LdWM=
X-Google-Smtp-Source: APXvYqzoA6QrxagizSCN3/1xiuVTfua3S6di9JlBeGe8VSiJJ/5Vd7rsm01UbWZyaC21FwnCwR7IKQ==
X-Received: by 2002:a1c:9813:: with SMTP id a19mr2097774wme.11.1561543738215;
        Wed, 26 Jun 2019 03:08:58 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x17sm15782750wrq.64.2019.06.26.03.08.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:08:57 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:08:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V4 02/18] pinctrl: tegra: add suspend and resume support
Message-ID: <20190626100856.GB6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:43PM -0700, Sowjanya Komatineni wrote:
> This patch adds support for Tegra pinctrl driver suspend and resume.
>=20
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 47 ++++++++++++++++++++++++++=
++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  6 ++++
>  3 files changed, 57 insertions(+)

With Dmitry's comments addressed, this is:

Acked-by: Thierry Reding <treding@nvidia.com>

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRDUACgkQ3SOs138+
s6GvzxAAiFH/gYSVcwCuGy396VD5pJeLGEfJDzcnWqlSTP7KjyLuPUbzCaT79xLd
d3YULAplbjAKrhKnlWQJdI/8yFkOUB8fVsj1Dsxw6uMsPvh9UeRjGS7QV1a5ophH
xLTPD3WuXqY8BHmQ2uTQ8gTGq2/6JT3F+wNl/Uv7jj3i0EieUo0/o1nvUhkX6obL
hW1quyskaRdTtJDGlGwOqbV/eqCSoW1nRoCGHL/4JTcuVa6hovz86g0jgl2ugMxu
Rn2jHHHhVoq3WA856YGzSGn453Oj7ddh1gCX8ZG0NfjA2JfBLjb6s1EB35FNtot/
jI68p7QZV0AVwE4CFjEy4Dc7YUP/I8xQvwOeaFu3/++v6EPckyNP00grYhsf42GW
oZQoQ0LgyCL1BGzxfD3AoioDVIxqtI4H8jCObu1Hond7B+4FI+mXa+SGf+vm25y4
doXsqjgv4Nu1QkFd+xToWK1irVnQoXYIYsub96XnX6+AsPb6EOB50rtl6zXfCzZn
ZWa8KCk00T/ur2CI2Sk12rHxlQ0nA9IDq2eFeEuQwz3O2R6+ZUwISeLLRvI1bGji
dhwO65R/a9FQc5PM0tzkrfhoxKatl/vVxmBFIeEIVpFBhaJ7rA1HlPoscQQ5J50C
lv+T2xtIODfuEchmgf4tZc4QMnZ8gw1UG+2n71EZZRX3qp5QQ6s=
=iW3N
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
