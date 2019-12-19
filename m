Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9CE126540
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 15:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfLSOxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 09:53:47 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34213 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfLSOxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 09:53:47 -0500
Received: by mail-wr1-f67.google.com with SMTP id t2so6294948wrr.1;
        Thu, 19 Dec 2019 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=01d2gKZkJOH7YhD865nJbGooLC6bhXHzXr9512PTLlc=;
        b=BxnoeLQes+YjrmmG4OTy/48AZHav+Dt5GpOaL3hMU+F4oppqTj8h4gqN2IGwBNYDh/
         yYO/r7jtiLxS6CGumCLBPxdBDA8wyWbdKXfMmpAtdRJph6b/3NTE6A1uCOWiydC/VYGW
         Aa++D0PiA+2zJBCMCVTF8m0JsHF6zwmPg0/3r60X7zmQ6xOqGxYam8CsiR/XXgzcqL5M
         00b6iwhISyn5bTb7iAskcftlCcbODZgn9wL2ybxTRhq3iisB1FccX7E9xgg3bY2CfmRJ
         zzz9UuxUnpJ0W/Wk5hY3wCQhcfg8bRUkpAL2gm2RqkdspDJU82bm1ywStdKTaWgi7Nsz
         RqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=01d2gKZkJOH7YhD865nJbGooLC6bhXHzXr9512PTLlc=;
        b=bYLV30OBP9prEvnbZtcq92ULYCFgw8M4PraNR9zTtVWdwE0RkIDsi7ao/GJoZn1J+u
         I0s+bfCz39C+pjrT5YcSPlZWkhB93dBM8mV815+fKntJ0nt5TF237qXdfIhQVbbx4ocB
         cZyXlBinTTTRNEBzxfDPc5niCNCWvHDXR3CeE3ttAtEs3aICwO9Q9c+rm/mL9X/DGIQT
         zYgDI30QkytOoLnA3mwW1Vsh9HHjBLzyqK5Qx0xrnDH1dm59XZ8GMWaK+m3IZLIzyEgd
         3CJeIk8FxWj189r0xbFqUknZVr/BmKpQGJ5YZ45pq8PGPGLbYgd8n7NN2zHNWqlKCETh
         S6xQ==
X-Gm-Message-State: APjAAAWutKdctYSoj64Zdwfv100AalEFQfhJqseQEoY7bI5GAMRGZ244
        LnI5W/EGm/WKxEDYgKE8Z1k=
X-Google-Smtp-Source: APXvYqxtcDi/kFePMXlvYf2lp9TovOeQHaEGqXYMgs/QzTIXtDNWbb4uLwN21d0Buj8R8pQZwYj0ug==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr10409326wrr.340.1576767224435;
        Thu, 19 Dec 2019 06:53:44 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id o1sm6728363wrn.84.2019.12.19.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 06:53:42 -0800 (PST)
Date:   Thu, 19 Dec 2019 15:53:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Message-ID: <20191219145341.GL1440537@ulmo>
References: <20191215183047.9414-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yQDbd2FCF2Yhw41T"
Content-Disposition: inline
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--yQDbd2FCF2Yhw41T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 09:30:44PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> I was investigating why CPU hangs during of GPIO driver suspend and in
> the end it turned out that it is a Broadcom WiFi driver problem because
> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
> may cause a bit weird CPU hang on writing to INT_ENB register during of
> GPIO driver suspend. Meanwhile I also noticed that a few things could be
> improved in the driver, that's what this small series addresses.
>=20
> Dmitry Osipenko (3):
>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>   gpio: tegra: Properly handle irq_set_irq_wake() error
>   gpio: tegra: Use NOIRQ phase for suspend/resume
>=20
>  drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)

Patches look good:

Reviewed-by: Thierry Reding <treding@nvidia.com>

I also applied this series on top of v5.5-rc1 and ran it through our
test system:

    Test results:
        13 builds:  13 pass, 0 fail
        22 boots:   22 pass, 0 fail
        34 tests:   34 pass, 0 fail

    Linux version:  5.5.0-rc1-g3d0b4fced39e
    Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
                    tegra194-p2972-0000, tegra20-ventana,
                    tegra210-p2371-2180, tegra30-cardhu-a04

All tests passing, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--yQDbd2FCF2Yhw41T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37jvMACgkQ3SOs138+
s6HZYA/+KkwZWvDrOQ/xInN24cWeziIx62H3vJwfR9+Tjbdww4+9yMeMtj5ZWqMy
fXJZ5t/UokIk+x9MoUYHUIOB6Iv0JhobZ9vWW9IikMfPKbHUPsQI8PrDG5Irnqxg
AehGhD5Z11O3CSR/N1AEP5iv5udWFuhcb23FJMBNYhNxx7+DfU0iDJ54BmRKoaTG
xWH5wBIJIXR06J80bJUaJezl5yocm6I7LgC/rzbiM1R+8hNz/nkyLoon5MEJOvUy
dfNNn+2upmavuoG+EMcZgKCHPHb8CILSciNrcDmSp2EP1/OOYgm9urytQRrnHwWn
0a/P//Zasnmb7kUYqcSNa9b8xD7aZ/lMS2zvLmtWHeF9uQigJtxmeFcFEU/DofeV
LMfxE+ePRof2N7EztSgOxpVqS6V0OMzr5TquUq9d0CxDVkfzq1LHZO+9XY4MCTzi
xD+Ncn/te+xJmLoiXMMVOnlpa4e3BzO583aBMAR6cLwzNHRhKOAhCws1pxieH9aR
Bg2vGbwkrDK4c2AouHoNROlu/DN2n+GVhlH+b93P0xRJJAvgvwOhuUnwYj4Nt4Hf
oTWbSN9AVBRSBQQdnH4R3N6idMPj4SInVWWF2jgvl5IJGGWOtKQCHYI/TmFmu69i
LKcAZPJjK+eOdWMaoCrhnv0QMN7Of+4Rhx1OLSRm9MX9QF40E6I=
=CltG
-----END PGP SIGNATURE-----

--yQDbd2FCF2Yhw41T--
