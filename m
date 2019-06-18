Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3487C49F56
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfFRLjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:39:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34625 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:39:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so2101203wmd.1;
        Tue, 18 Jun 2019 04:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pmUt8lFiUPWZLjBFgsF3jpurujBshdu03eQoe96VKqQ=;
        b=b1+lB03TmvASIGZoa8HEqIYLiwH+oLOeOsQgwFyuqTij7Woidf+MDTS4vMmSZ7XLwu
         DdxT81ijbrzlCDfKfBRqKPBBi93FHf5RpsF/KRWaMOmvsBPND/ZfdYNaCmUBhmvCYCXd
         KdA0AVmx3cjLwP2dsC+PCpbIKymah+8/d9fWPAAMKd1pdUX12NmbBoargNmxNLEL0W92
         z0NEZAY+4EpaOEE1B911cV0NTL4cwl8JI4VjW4VuxYxY9u9E41kysGR14P2irIaKJu2g
         gz5o897LYz4+dVsSUW9qSE9zrhdlP7Jxvk6dqIRxMOj+4b2WnebbTUC2YhBrYi7StzT7
         9n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pmUt8lFiUPWZLjBFgsF3jpurujBshdu03eQoe96VKqQ=;
        b=K5o6hax51Q6bypE60jCHNIh5gRLqBtyhZbKt9D1kyOYCAtm84kYzc5JZvbZKTlDGcT
         CjqEPEdLlPZI1RT5HXPrXBJQL523jlsso3VmhjaxYQ98NxB4s7YfjLXJt97PjT5sXVim
         ritVKGoSHrdzF2Qy9WF+RPm8ldSYZNAbz3fJ/Md0xfJu2pIbaZXkW+RPyaZPNnvMBWMc
         dVfJ3/r8IzOrhvhLsy4+grw3CvUYAs4kjo4KZpLTtBBUsw/tcWxmA4ne6Oi+/IpFJe4j
         xW4vdl5SbrAh6vv81lgpTnTdpTw3nMfH/NzPzJghBLgI+/i4li2aNArVutnXvgG1h7W5
         EEjw==
X-Gm-Message-State: APjAAAVWQoy+LZCXLW8hr0j2OObew+KBwdKEkQseOxlIQXnQiKdbS8Dj
        THav1LZDmmizAbKQjfo9YVc=
X-Google-Smtp-Source: APXvYqxpFdQipyUacfPF//MyvbOs9+KN+3Nmm2IG0sm8DCrJVSFT6UM5LI6HdRMfXvcRjgRLabUfMw==
X-Received: by 2002:a1c:7a15:: with SMTP id v21mr3234180wmc.82.1560857987831;
        Tue, 18 Jun 2019 04:39:47 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t4sm2011203wmi.6.2019.06.18.04.39.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:39:47 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:39:46 +0200
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
Subject: Re: [PATCH V3 03/17] gpio: tegra: use resume_noirq for tegra gpio
 resume
Message-ID: <20190618113946.GF28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DEueqSqTbz/jWVG1"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DEueqSqTbz/jWVG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:17AM -0700, Sowjanya Komatineni wrote:
> During SC7 resume, PARKED bit clear from the pinmux registers may
> cause a glitch on the GPIO lines.
>=20
> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
> to keep the GPIO lines in a known good state prior to clearing PARKED
> bit.
>=20
> This patch has fix for this by moving Tegra GPIO restore to happen
> during resume_noirq.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index f57bfc07ae22..f3c58c597ab9 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -410,7 +410,7 @@ static void tegra_gpio_irq_handler(struct irq_desc *d=
esc)
>  }
> =20
>  #ifdef CONFIG_PM_SLEEP
> -static int tegra_gpio_resume(struct device *dev)
> +static int tegra_gpio_resume_noirq(struct device *dev)
>  {
>  	struct tegra_gpio_info *tgi =3D dev_get_drvdata(dev);
>  	unsigned long flags;
> @@ -506,6 +506,15 @@ static int tegra_gpio_irq_set_wake(struct irq_data *=
d, unsigned int enable)
> =20
>  	return irq_set_irq_wake(bank->irq, enable);
>  }
> +
> +static const struct dev_pm_ops tegra_gpio_pm_ops =3D {
> +	.suspend =3D &tegra_gpio_suspend,
> +	.resume_noirq =3D &tegra_gpio_resume_noirq
> +};
> +
> +#define TEGRA_GPIO_PM	(&tegra_gpio_pm_ops)
> +#else
> +#define TEGRA_GPIO_PM	NULL

This seems completely unnecessary...

>  #endif
> =20
>  #ifdef	CONFIG_DEBUG_FS
> @@ -553,10 +562,6 @@ static inline void tegra_gpio_debuginit(struct tegra=
_gpio_info *tgi)
> =20
>  #endif
> =20
> -static const struct dev_pm_ops tegra_gpio_pm_ops =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
> -};
> -

=2E.. because this should work correctly irrespective of how PM_SLEEP is
configured. So I think you just need to:

	s/tegra_gpio_resume/tegra_gpio_resume_noirq/

in the above to make this work. No need for this preprocessor macro
business.

Thierry

>  static int tegra_gpio_probe(struct platform_device *pdev)
>  {
>  	struct tegra_gpio_info *tgi;
> @@ -706,7 +711,7 @@ static const struct of_device_id tegra_gpio_of_match[=
] =3D {
>  static struct platform_driver tegra_gpio_driver =3D {
>  	.driver		=3D {
>  		.name	=3D "tegra-gpio",
> -		.pm	=3D &tegra_gpio_pm_ops,
> +		.pm	=3D TEGRA_GPIO_PM,
>  		.of_match_table =3D tegra_gpio_of_match,
>  	},
>  	.probe		=3D tegra_gpio_probe,
> --=20
> 2.7.4
>=20

--DEueqSqTbz/jWVG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0IzYEACgkQ3SOs138+
s6FGjg/9EGz5ycP+0PZmOZwyw1l2zDmBrWAlVWiszC+jmSx8ghpvec6GrWNY9SG7
MFyk02a0hjBcxu2IxYdzWEB/ew1ukakPTcHTg88muaEB8ObcEYrqpO4tw9M9X2yQ
TZo8yALvpFr8KnCAy/CSEjqZ33N3ziVOf/O0ZJzYLOWtAi2FNWtMlTdBL4g40C7N
i3RuUx/kvSEV4P7d3WBf37+Z5SwwviR/KsRb2A+jCBkFfwsm5v+bZ17I+Cw9//S/
f2n48c+YhWSLHOV2pG00BiCAhTQDtP7ErY1wT53b768H019s/0yfCDKRusuVAnzo
ZRsJsuvz0gC65CKwYtNT0F2uFCCSIIhtFU430sUE5eFnXVyqUfuH4ke+GJ6L7Dtv
3Ze5yR0Yi9mB5ESaRHHSjsoY6NQElQbclaisLWFiYyV06Sh0Gne7d6FA9nrsluan
T90mgqcHyPc7DpYcrWUeQqYqpMNkx/2+erZqESll+RBoZJyFJAIbu1Fl6gpAefia
MvQit1FrVJyvHPGLl+jY2KnfiQJMH6gXwk4aNjDcE0wFBomUbmS1giDaGJIjfHSK
7wNTvOZGaB6LIACWcW7oNLIqgtimQTxUzCehm6FuyABqlaRrlA4Z9KTN6LFfY3IV
jUyGm6BfiKkRwAx6xYDD56/wVdEiW+eDtxvxiMt6MIe8TG5zAjM=
=H5rG
-----END PGP SIGNATURE-----

--DEueqSqTbz/jWVG1--
