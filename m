Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B24BB1B9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 11:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407046AbfIWJyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 05:54:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50181 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406222AbfIWJyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 05:54:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so9147228wmg.0;
        Mon, 23 Sep 2019 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D3NUSh4gFA6ywvkt5FGyz8+80/ol5tJ2yX4gabNO82A=;
        b=Wc8S8qxg6MGJRlQbR9KQy7z1oSOJuQ3zvDTfNeUeh4qzgx51J+4j681xYFDehya9S0
         +l6NL/xKoa33HF47AfZJlxKzDHxPHxSipuS6/AhULJ+LdYX5FmDp9JPaEpOpzUiIcf9K
         mwB0eS7YyddlaJUNfChlHvMlLLxWS+9L9GhGFWHGJrAlmVvoLY/TMNiiOChpPlR+5X4F
         i4iWxlIofgSKAxdaKF+2BBNW42EMkOqQhCweOqVyj/+JFQLJAphQvBhoU31d1VZhbQ+B
         3nUQ6bPTDCrgGH6+vBrM8d2/w5mKK/Gx3XEuAO/ih1HVNRoZVpRAuoTsRrRCQi6Jqlfd
         uMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D3NUSh4gFA6ywvkt5FGyz8+80/ol5tJ2yX4gabNO82A=;
        b=SLKwaDqd28k4wvmmM30nvhmUwlWcLuBDYQ6O8ZUl3bkkUY3MQiOEnK98+owiuIRXgX
         jqB13erU+Bi17QdlzCIrjVnMVjEvtyF4jLGqtsNfI+HZiOMQRU3YndGRjXAMCET5pg7d
         2C0yda4yvqoygC/IetgFKw3Xi8tI6QzBRYzriOj7JxZZTfm1zJdbhUxD5P+BxFUUuOXI
         7rnIzJo28k12+8T53x8DnWP69KmTzgOg417M1T5oq6qbL2gbE7HMBhjB6HwCF53p2ZmR
         LHOvL2HsxpP1gvLz/GAZoHOeLgGhuNTzp5Zdfw7ZmCU6XcrMPKlCwJpGnEJzjq7y1l7N
         4ZqA==
X-Gm-Message-State: APjAAAXL7rX6EzYZirHtEusxQjMOpe9Nw6S6zuuiMKDMYVtU2zAFyHK8
        FkW9Ds6JXso1piaBLNegkMaxPHdg
X-Google-Smtp-Source: APXvYqy7WAf6PL6leEqa+k56NuOAEH+aM7NPJmdKhDGgQtp6A0UqyRasZuB5nwVgtlcWqn3Q29EUKg==
X-Received: by 2002:a05:600c:20e:: with SMTP id 14mr12604474wmi.73.1569232443011;
        Mon, 23 Sep 2019 02:54:03 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h17sm6186285wmb.33.2019.09.23.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:54:01 -0700 (PDT)
Date:   Mon, 23 Sep 2019 11:54:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tegra: Use of_device_get_match_data()
Message-ID: <20190923095400.GA11084@ulmo>
References: <20190923093637.27968-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20190923093637.27968-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 11:36:37AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Use the of_device_get_match_data() helper instead of open-coding.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Actually, scratch that. We can't do this because the match table is
different for the legacy case from what the new PHY driver uses which
calls this only for the legacy case. Instead, I'd propose the attached
patch.

Thierry

--- >8 ---
=46rom 6c96f18a2608b21d178007c97337400b788c3f9e Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 23 Sep 2019 11:47:25 +0200
Subject: [PATCH] pinctrl: tegra: xusb: Add note about legacy status

Add a comment about why the call to of_match_node() cannot be replaced
by of_device_get_match_data(). This will hopefully prevent people from
attempting to clean this up in the future.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/t=
egra/pinctrl-tegra-xusb.c
index 95002e3ecaff..f2fa1f76ebb7 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -885,6 +885,12 @@ int tegra_xusb_padctl_legacy_probe(struct platform_dev=
ice *pdev)
 	mutex_init(&padctl->lock);
 	padctl->dev =3D &pdev->dev;
=20
+	/*
+	 * Note that we can't replace this by of_device_get_match_data()
+	 * because we need the separate matching table for this legacy code on
+	 * Tegra124. of_device_get_match_data() would attempt to use the table
+	 * from the updated driver and fail.
+	 */
 	match =3D of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
 	padctl->soc =3D match->data;
=20
--=20
2.23.0


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2IljUACgkQ3SOs138+
s6GMyhAAnMU6OG3FW7Tn+QwPqlQRsCYzbOmtI7su4dFQyVczPNKbAB6K7Qrzel0p
eSX4LXgGvZApUklIAz5bUg3YOs6XqVsrjyrftVHqVT72ZgonRgm56eawAF1px0AF
Kr9VtZZYP3mj866Q6RLq+l7OwfSBiHz/HzC/xrqPOx8b7Dpypyd2CSAmaD5baxjX
gZ2d4lCxItdLyMTPzYOlgSwBlkn/uOZiLe9So/KIhcIrxJEywNmAgdyDgsk8MRvB
wLKzDuKjleNkc88DxW0S1tvv1oGTDcmz17DICegBCHMDq1GDs4v2a0lmrVtQlytN
YPi1RcmN+m9s/dCg54TVRf2H/fnD+r34+cSissNlXP1Fvl3RcNopq/NKOGyixHiY
5P5Mgi8dTBSLp2UGBThawXAbhCGLqac4ebGZ451RTfS0FuW3CiFavx9uflFT9I+2
cH9XkVSIdZhiUQShuoJIl83lcPn8llmhqkAiW3CR8/T5hlDpJCycsGAQcjR6Dtjk
66WC4la8WrdTLbfQVlw96q6IZ1Bz+u0nJpB+yx7pGQUkUHU75w8LEHBGJKH1HMUy
2OWk3Hdh0wZNdfyMaUPFs6USdWe+Jz6SwtkCmdDfsCgcGikeLNvjg0B3M7aECfuu
hZ9f3/X+kpJlXRfc9TpcTx5Ez2GvPrLI0Z9JKYTY1EQZHKWQjfs=
=/GeM
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
