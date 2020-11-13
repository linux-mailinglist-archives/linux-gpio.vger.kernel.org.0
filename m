Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8362B2763
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 22:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgKMVpB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 16:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgKMVoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 16:44:54 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C10C0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 13:44:52 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h2so11353777wmm.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BR5+3LFA8r0c9JDlLtSGl4pZYsR9RDM5WddUZ0ezacg=;
        b=ul73Er9tekrt/a8h/BV+rCgaDhgiSmcNMuBeKLMbsAPnc6ABddW/zISuVfx6uBD21g
         NjTqk9EoddBmD5CSrsfi5YiCpDl8nBr3Q9qzEC/sHH8tZ75Fx0pesE7SCBMJmpAXimT+
         cde8kBjKxXvTHqAS/rHS46uQW28wMF2UxsI6/4bACecGlMVn73iez5eop8D07R23Lvc1
         S5OSUGdUZZpXpHC7VdQl+K6FkdQHUPmDCJUFy788eN4e1+pw/OVShYRdKjV1BkJAhT+F
         JpdGgh/s8ktYWHwYfclrmAaJkx18wXDlvqnbmd1w4WfMxzKedO3g14M7FC2wzrxdi7Z4
         QSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BR5+3LFA8r0c9JDlLtSGl4pZYsR9RDM5WddUZ0ezacg=;
        b=bJssr8tnMh/Tiu/LSadupWb5HkfHOUUXKIqkxk7QtYjg4u1Znd93v2xREZLeAre71E
         fJ4Z5aNI0IP8jqO0cfMM18wdRS00kwy8zIvZITcgWeijl1AsDbtMprp6WuVHGWwtzJnK
         mW2v0kHsPChEwuKpvJA93dn7pCoM3IVmgYb2lW2Ac2GkMrEB+IlRPYCUp1ae3W3ldfn7
         MmGGX6mcYtGvXov7hju/bfokL6qCIoB+x6U2yCjmdLVy92DkZTaGfy7rzjLVCO5NSJ9N
         nR4/a4FrCmU6PEFe58NfSK1R6OkACQtwmJPBNrnvtUe24vhtDHRSYgZaSPCx66OeoKr8
         syVw==
X-Gm-Message-State: AOAM531kQE1fRpco5b1jKK1B1+iXiqjLFZE0QF/O/1sQJJAIB0iK0+Oy
        p7UHEOM7lT2uLjNhQGOfPmLBwjwh8eg=
X-Google-Smtp-Source: ABdhPJybrTmM1wVy5xrexsBryK2A4G9lDACAfBCjwsZjrpBkUES58n62R/v5tAy4wO6Xc1dCiHasyQ==
X-Received: by 2002:a05:600c:2c4c:: with SMTP id r12mr1404779wmg.157.1605303891559;
        Fri, 13 Nov 2020 13:44:51 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i10sm12363243wrs.22.2020.11.13.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:44:50 -0800 (PST)
Date:   Fri, 13 Nov 2020 22:44:48 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 2/2] RFT: gpio: tegra186: Set affinity callback to parent
Message-ID: <20201113214448.GA2138577@ulmo>
References: <20201111140628.24067-1-linus.walleij@linaro.org>
 <20201111140628.24067-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20201111140628.24067-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 03:06:28PM +0100, Linus Walleij wrote:
> This assigns the .irq_set_affinity to the parent callback.
> I assume the Tegra186 is an SMP system so this would be
> beneficial.
>=20
> I used the pattern making the hirerarchy tolerant for missing
> parent as in Marc's earlier patch.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Vidya Sagar <vidyas@nvidia.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tegra186.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9500074b1f1b..5060e81f5f49 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -444,6 +444,16 @@ static int tegra186_irq_set_wake(struct irq_data *da=
ta, unsigned int on)
>  	return 0;
>  }
> =20
> +static int tegra186_irq_set_affinity(struct irq_data *data,
> +				     const struct cpumask *dest,
> +				     bool force)
> +{
> +	if (data->parent_data)
> +		return irq_chip_set_affinity_parent(data, dest, force);
> +
> +	return 0;
> +}
> +
>  static void tegra186_gpio_irq(struct irq_desc *desc)
>  {
>  	struct tegra_gpio *gpio =3D irq_desc_get_handler_data(desc);
> @@ -690,6 +700,7 @@ static int tegra186_gpio_probe(struct platform_device=
 *pdev)
>  	gpio->intc.irq_unmask =3D tegra186_irq_unmask;
>  	gpio->intc.irq_set_type =3D tegra186_irq_set_type;
>  	gpio->intc.irq_set_wake =3D tegra186_irq_set_wake;
> +	gpio->intc.irq_set_affinity =3D tegra186_irq_set_affinity;
> =20
>  	irq =3D &gpio->gpio.irq;
>  	irq->chip =3D &gpio->intc;

This does seem to mostly work, but I do get this new warning during
boot:

    [    6.406230] genirq: irq_chip gpio did not update eff. affinity mask =
of irq 70

Any idea what that's supposed to mean? I can probably dig in some more
early next week to see if I can track down why exactly that happens.

Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+u/kwACgkQ3SOs138+
s6FdJw/9EfQRDW+uY8QtO5C8zZgiIOYT4Xn00tV/AlrTu2Iq9E0CVmvAqZqQLDx3
6jWjpvOHj70pJyzMj7KkOyIAvPNLkOCqYajMivqhI3HT3z4egIEKDFp8ST1mqXyG
9rwRjRNMS2yOO6W0ut3FLAFZpKbL6F+8oztom5dso3CGfLjXwSFc+Thwc5EX7YX4
D1KO3XjARq7vwCkusGah+a923Gvd58YBYHA4cV4tDu0oT/jmK8nulvm86MmXOxun
JS0WOXaZixk1FiqrhPiHsVltjeWei0Ck6DjnAn2kQO91zoCudW0pVRLX8T3JTdvh
hF5wXhl2Q7naPQxtMj0bSxjJzx2xdTO+4B3RA2C48vtGhBQm9Br5fzSaCzdHAa/c
BqzuHpxwjLicvFlN7mFs7sl0JDwUhNsKse/nVYviZAiKNBZZk1hyGqpQgCbJ0pWj
ti6I8GSY137Ut6Mjy6xgGUEkYv+/NQDVS7LeWvbTolJrO2zK/6GU9bnhrA7dAk0d
krxMeM5uzStb2jseAsQCf99ixwo1JxST9dq70nyJNM200SjSV8fU2UVmvSM3ZW3X
C32bUy3A1rQHiDKesT9b9NEjr6myHhSTXCqRyWxlE+KlQ1Ap3ChGM+meTokYwzrq
l1bZfFNr8b33ZyDrtYTZYfSteOe1zhJfH17DMh51bHW9Rr1MmTs=
=PvH7
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
