Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B332DF90
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfE2OWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:22:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39269 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfE2OWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:22:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so1750283wma.4;
        Wed, 29 May 2019 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=piTIfcrxT+m/1eze+y0yLUEjtl4PTANEem410RM+iPc=;
        b=nhLJNl6koYL9UfOsz8+Op63z8h0WQeGoq0+Y9n9DRfDhTv/YT6YM5Td7/1ZMSLZBtO
         VQrcdx0h6r+YMmx5kew89NqUASUQeu+U5emzSjyBXORd4/MbOssWLmFT53I7PWLN1R4W
         HytSbZTQwUUaQ+Jv6U7gKB7OY7lg281sovNy5hrTvSbc95KyDjSf5b8Xe48vEbFZyKhe
         ubffCGqDgF7Gto6fgQou56MPAQMq3ucML9xNCPIich5T6oQq88V9/V2MBLTxvGp3UX3B
         hEddK+JoaqrroRsBv0t9IoyEVztkGKgNJVLLaYSbA/E3ZefKJ4MHCg+dmIBE5H0wVavZ
         DPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=piTIfcrxT+m/1eze+y0yLUEjtl4PTANEem410RM+iPc=;
        b=lgcKn2bCke0/1ZaYJwCk0b9tNuNhWoftRhIRU3DXZ1kf/j1tv4pB90lTAGd2SREF55
         yJM66tIm4NLvg6L9oq+fAd0ycO2wHeh1a5fOTad2tUYH4kLPTvEijG3400E7LQVhatWn
         GinpR6JyIqvJDF5ojpptCY70hg9Dzn09cdqXTUpDhpG7WPZ+FMx/4fKPWeM+XZjOTu9H
         WPpCb0beNcfD/SQFhnZcxH7vGJMkc7X/GBd7vPTAkGJkdIHB2Foisb5wnE6HnzcLr3h1
         MXsvKzbmKjY1FMVwf4pTCsWqdYjiFZABqFDJo/aSSbnbW/I7fAKs3KULiBwucX6S66y5
         fvlg==
X-Gm-Message-State: APjAAAWBEhFOX5C4CaQNI3Q6TcVjcS+uxckf7AKoukCHXjGjeNq3yDlA
        /JimJG6659YUfbEJEuX2KkI=
X-Google-Smtp-Source: APXvYqxKgMa4FPSXftZO0Lfsq6gSxQ69dPJJvUiLYenblUlLIATocsQVPHJWCTxRhb7pTt8iD+xJmg==
X-Received: by 2002:a1c:2082:: with SMTP id g124mr6809825wmg.71.1559139721669;
        Wed, 29 May 2019 07:22:01 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l190sm3032421wml.16.2019.05.29.07.22.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:22:00 -0700 (PDT)
Date:   Wed, 29 May 2019 16:21:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 01/12] irqchip: tegra: do not disable COP IRQ during
 suspend
Message-ID: <20190529142159.GE17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:45PM -0700, Sowjanya Komatineni wrote:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>=20
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
>=20
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> index 0abc0cd1c32e..deab3ba606e2 100644
> --- a/drivers/irqchip/irq-tegra.c
> +++ b/drivers/irqchip/irq-tegra.c
> @@ -53,18 +53,22 @@ static unsigned int num_ictlrs;
> =20
>  struct tegra_ictlr_soc {
>  	unsigned int num_ictlrs;
> +	bool has_bpmp_fw;

This seems slightly inaccurate to me. My understanding is that we need
the AVP/COP to enter/exit SC7 irrespective of whether it runs the BPMP
lite firmware. Perhaps something like "supports_sc7" would be a little
more accurate?

Other than that:

Acked-by: Thierry Reding <treding@nvidia.com>

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzulYcACgkQ3SOs138+
s6HEBw//Q+MADNzhRU304IXsiqDvLCwobymEQiOcOlGrqzB2r/Wbw2WGXy8gJM7v
A4HBsN6QVD7NQ4Ep1HdCV8LEUM2387snlUTC23wrt1rS6aW5d1vWrmpDi4o7ZM5I
rM5OxWYV/SJNwEXFrBByFdlS0YYfqE9ieW0ShnQV3tWgffxdHa7xE2+RBzkme2Mg
YWef8OTz/b5u7IvY/lGsu0+5g0JZwjLU2kf8WUwwr+5SzjxJwAJzgyV/pSUzu5Nu
tYXON2qpV+hqrNCQX/VYiRWa/UX85gZpIretuAYw68XMXGNRQR4WehPTHODO3Wx/
FV9o23TAJObsYYc7JDEJQXoPVOcm/kLE1fOdVXyWdlMoBUvOipQq73ZVFZQ06Rrv
3YjdQHpz7jZjPZgLcpJ4PFm1l4v9otPlgehF8/Iag+5t3Dhoq6XXMQAXRcjFI/et
v3+wcocAx0a7agqL0M9f2epLwttsGsTW0bfPM7sEJMooI8pl8WgMlNFwEpBdOsTv
0kvzZvMGePF8aTBhWXEjZ1YWFqEKNBWPweKO2o+HEMWkTgCN3UtnKa6dfTQNyF6Y
Cgd1vj8doMGZ7KTKev/kqHZTSmpnlsystOPScHyqvD92ULka+DJVphlmQLSbbdli
dO4AUVPasg/Mulxfv4j292ptk8bt+P6o2oHTOpLTSTGqu6DvLyw=
=J8le
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
