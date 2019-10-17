Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A57ADAD6C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 14:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbfJQMwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 08:52:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38977 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfJQMwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 08:52:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id v17so2407744wml.4;
        Thu, 17 Oct 2019 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fku2RnOxGv4zaKqVP5kIkNCGUU7a/SQjY418THGkTpE=;
        b=YcGz7/+2KBfu00lJ4kIc6oJFv2Dj65kYVMSk0+yRUdNphnaSUytpTpnJUXveNrG4MF
         bLqy5+bthQEvAX4SY2dRuWERSfyF1ocpW6WT0eYsSPSrLXbb+psT2X3hUMAtzFeofP9b
         VGPoHeFGkW3bQ00824SjG9+p5Tmzcb4sUe7rvrbnXf4phaG0yIMWq/yXNVgkZ2mtTD9r
         MC0PzA07DMWv5Bn68l/rK2EZtEvhYYkhw8X7BN5UQniDMlEXHf2MMwtnl8OyHA/mo99M
         COfyvlo4j8NYC15muLR3o7qca4SakNMoYWUljbQQyvEhceoY6NfT63F+jc08Zytiad20
         ya/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fku2RnOxGv4zaKqVP5kIkNCGUU7a/SQjY418THGkTpE=;
        b=jz3DJLV9gk1Rg7uW0PDJmgSe/vgxuH3QDWETTxlmrpxQ4+XoEynThPi7ZP6B1UXcB5
         kcFHU8bFYQigsjLu91dn0mJHpFl5jI9aw5O1tWq/qwlA77jhdFiGgcaNUvNC0S2gMM8r
         w91W38XFDZ1+YLs9dPJuWqM5VycFSiV/DwCLDJmSwFawE4hRFaCc5eeJT5Av6tKcbx6D
         mSE8z/Of1xj9wnpJvtlK5UShV3wZ5WHrmT3sMeVAt6GJhmhFUGLSxyHHW+SXpEWJRgpB
         pOFwFeYp8I1TGWTxgG+RloJSBBd5MIy1xpKFxTXtjafeydFD/R6aM5N0cj0FHRIeBrob
         4t4Q==
X-Gm-Message-State: APjAAAWlkb/GN4JYQGr2kYE8s3VBSXoH+Djg9stQ6JTZqRZuLxYfN5XR
        jk8yQLO15rV8W6Prrn8+Zkk=
X-Google-Smtp-Source: APXvYqxXVdwZKFcae4UW9WkJTpM0WU2xLxCUyMYPr6Iqbbvkq1A3T7bAB+o7wt/5KP+X/chk/Eh6+w==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr2968261wmc.0.1571316733871;
        Thu, 17 Oct 2019 05:52:13 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 63sm2283799wri.25.2019.10.17.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 05:52:12 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:52:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org,
        afaerber@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        jesper.nilsson@axis.com, lars.persson@axis.com,
        ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, baruch@tkos.co.il,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        vz@mleia.com, narmstrong@baylibre.com, geert+renesas@glider.be,
        daniel@zonque.org, haojian.zhuang@gmail.com, wens@csie.org,
        jonathanh@nvidia.com, agross@kernel.org
Subject: Re: [PATCH -next 10/30] pinctrl: tegra: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017125211.GA3768303@ulmo>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-11-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-11-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 08:26:20PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 4 +---
>  drivers/pinctrl/tegra/pinctrl-tegra.c      | 3 +--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl=
/tegra/pinctrl-tegra-xusb.c
> index f2fa1f7..6f7b376 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -873,7 +873,6 @@ int tegra_xusb_padctl_legacy_probe(struct platform_de=
vice *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl;
>  	const struct of_device_id *match;
> -	struct resource *res;
>  	struct phy *phy;
>  	int err;
> =20
> @@ -894,8 +893,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_de=
vice *pdev)
>  	match =3D of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
>  	padctl->soc =3D match->data;
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	padctl->regs =3D devm_ioremap_resource(&pdev->dev, res);
> +	padctl->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(padctl->regs))
>  		return PTR_ERR(padctl->regs);
> =20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index e9a7cbb..692d8b3 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -781,8 +781,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < pmx->nbanks; i++) {
> -		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
> -		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
> +		pmx->regs[i] =3D devm_platform_ioremap_resource(pdev, i);
>  		if (IS_ERR(pmx->regs[i]))
>  			return PTR_ERR(pmx->regs[i]);
>  	}
> --=20
> 2.7.4
>=20
>=20

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oY/kACgkQ3SOs138+
s6FgNw/+NID79dubYxesxorqI1f3Qx/IwcfoDiRN4AKvBhcJwBc3NKVGf/hLYpqL
YuiRdhCR9PDTEAhuX5Hk86vPnUn4G9c7PXHjcCnXJS05Bf4HOuCvrEvKhn1aBSJg
BKpQYyXht8ekGsWrhu6lHAs5TGDL+mqaw6OrDh0llnlnRSrWMeYIntmqhN9hWNUA
r0dlzs3Kt4uxPwJ+LD/yLHdaMLHsL7FVzZOyODJgrS7iepKhPNFNxshPH75xVQo7
FxzRu3voR+YjModyfO5X83hg8FnKh85Lvc5Ovhm7rjjWrQo73xCv2YfYjL6O5opg
Ig2FBF2R3zyUzxNvg2xOuLD29Jf0Rbb48V8A3VkTzcSTSU4I6Pp91O+IJzSI3NPV
Q+JtwCuflch6NG4JcvDJPCfqy6gUftF9c7/jcd8XFF/fFYdbwcpouUyOkifrbZh6
uRyvEvKoR5Tdy+wolglL2srp9kHFUJbBgUKmvkuN9IP5297f1/SMeHhQTJ9NRWOd
YcnQZsbNoJsUjNiE4v81BsXcWle7IANdhhY2vZShNcJxZATiektLeCO4FmN+pCIV
nII5+ZV2MPnJk0xxu3w0/0AYbQbJAFaXHLvB/zhYcJcAyAC47qyv6K1s24zj/i1T
FWPpngjetj8eTK50ENzsHDS46hyVpvQsVHsjuckItF1R3bmExPo=
=hNUZ
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
