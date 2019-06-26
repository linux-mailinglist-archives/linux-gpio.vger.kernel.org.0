Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967C1566BA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfFZK22 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:28:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43990 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfFZK22 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:28:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id p13so2072574wru.10;
        Wed, 26 Jun 2019 03:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kCaYA/FnXYJJu+TrRy4BKJsDWzoGNXiaayKbDb94w+c=;
        b=al0bdWjaXkyCAS0ALgnrSOkTpGyasqItumozaBvYJ9hKll3uPqhNuo0j8JBUgn6Bss
         01ltiSi2eTbREMnFv/OvMWWfICrmgPDqlAT171DJDrMF8UmjtdBxFkmegsK10yg0nfKE
         Wv/uuLppeicqllMyoUa+xKzwMOKDRnrwuAas2oTHR9muXb3FDJnL9P8Vu0owk/CIRx0o
         AkK8bRttG1k2XVK+ipSzf1D0UwBFppp5TzLxZJSPmsPacioK/MF8uhRs6m82m1lwDFea
         QAEQYzw8Se/dXO5TtXcfxr+NUynP6i4FWTg6EIxjBUP+6zYQWu6/W/cqjGxbQdD1DoDB
         4udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kCaYA/FnXYJJu+TrRy4BKJsDWzoGNXiaayKbDb94w+c=;
        b=Tgc6xAy28eM3DMetuDIePu4KK7iQxOUhK55VDo8iDD1Ki4i5V0EulCrx6ZNSUpwK2J
         eXs+Iy2uonOhBqxR/BbZXeoRqum2fiHCMY7H+eUpzdf/YwIU4v2mYMn+Bd+b5+ZRGpvI
         KVQ5MJUbXDHit3mkPM1pgF0jBp3ncgzIV5SC5NuRuFAcnmyzBAhH3pviy2rd7f7xMCCa
         8Ljt9qqbClSfX0gytR1YYX6jiKLAXJGr42AIDyeeBENciGLlvC6rW7PmDlfKvga/7S4k
         MzIFgzY9vEu8Ul0TwL4iO4GsX/XV20j6Vy+OPG7zNt1oqug1T3gszhP0x11ybY2aaALD
         LWtQ==
X-Gm-Message-State: APjAAAW82xCuifiDx3mSK743vuysRTF4WBkK0WLkQMzv2qwUEYrEotq7
        itrMSjxIef8sc1XwUk2btqs=
X-Google-Smtp-Source: APXvYqwzL9B7b8q6dp307iySl6j91+IQ7iFGWkUjNojhUJMBDYWB/J9F0rnm0ZW538lTIC7sUVzO6w==
X-Received: by 2002:adf:f104:: with SMTP id r4mr3290900wro.140.1561544905806;
        Wed, 26 Jun 2019 03:28:25 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r79sm1567240wme.2.2019.06.26.03.28.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:28:24 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:28:24 +0200
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
Subject: Re: [PATCH V4 18/18] arm64: dts: tegra210-p2180: Jetson TX1 SC7
 timings
Message-ID: <20190626102824.GG6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:59PM -0700, Sowjanya Komatineni wrote:
> This patch has Jetson TX1 platform specific SC7 timing configuration
> in device tree.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Can you provide a similar patch for Jetson Nano (p3450-0000)? It'd be
great if we can make new features like this available across all boards.

Thierry

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2180.dtsi
> index 27723829d033..cb58f79deb48 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -279,6 +279,13 @@
> =20
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode =3D <0>;
> +		nvidia,cpu-pwr-good-time =3D <0>;
> +		nvidia,cpu-pwr-off-time =3D <0>;
> +		nvidia,core-pwr-good-time =3D <4587 3876>;
> +		nvidia,core-pwr-off-time =3D <39065>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
>  	};
> =20
>  	/* eMMC */
> --=20
> 2.7.4
>=20

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TSMcACgkQ3SOs138+
s6Hobg//bHL6IZg0MNnz6irMk4CtJYVFtTftwwB09UP8JKkxLxrMaYT9yjBG9AjT
bjtGZeRdj66yVRCU0sj8xPSNJZjXMepVk6TXaEjuzFtQcJtrSH1kAz8b+dCPHspT
5+GT3DXacuBqBB6rRQdbSA4MXFC7HWOoMgVPj9afqR4vu50+qhuimRjYQChjE6vF
OM/IcV1NoGwoYWuWmg6JDgPIydS/XoEfifaSLxnCiJ/Xkx13xdTY7FFrcPWGHIjT
X68dbzqKk/6nREuQaT/U9xsTkijD92PW0qTK4jfGEFK6d+DrMfNszfDudIYatw1/
IkP0wgUN7ldmbVCvwArBaSWxZRfIBgAixFniBNjYhaFJ8ctNkXGkedNio20TDdne
CRxgVQXQtmqgSXCbgFryl1NQk8vJGTOVDsYZlaJEBpPSlANx9IZNTOVpqXnD52FN
jcJ+PrD83WUVvT1RCRw0p43Bjc2iCpxcfuYsSxU5AWpvf9P/Om6A0WmpMyZADIXB
K5IUhJtRjBKZblfWPkJv6qX9eYLKx+QqwNy8AAl9Rqf3vjN0aH4J+JWuqSXHK/ko
9hlH7D2x+dQv4PzCvq/FAmquMz+RIo9fT4IZk4Voi0iZ9Zolm7lbTFcOpFJWye5E
wHh7HUyfgxxNYKYGzJFqPeBXPO30Ib6MaYUUQZdL4mM5D1M1IUg=
=DNYf
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
