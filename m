Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC0C5665D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfFZKMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:12:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33108 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZKMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:12:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so2067361wru.0;
        Wed, 26 Jun 2019 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qtrtj++mHK5StqAXXXNpN3E6e7ze0VKwEn/hQgcsepo=;
        b=TwwRz0HDM9PWSlGfs6pmAx4CMx0yiKqp21HSGujzByvMwOW13oBDpMVQrFnf3LWHEB
         u/TOND8AZS9hWT0oQJ2C37ynPi9bXtxR6AJcWrViXtVr6CW4tY3umvEafDl27R3XDRxA
         TTgGijV/ZKqxJI8eE4Wvuv5ggKgib+wvI9xxtnW2QsEiD0K9EGQ+3lJsifEA5r2vKHP7
         /S7LjxNAGM3b3v9bCkFnLv6Jsb0wBiRVCoAAe62GHOooe+aGVH8sdVgnyJOgmXTgtqCi
         mjnCxBnMjYTbpvgExxub0p21n7kjJByaTWn2v1rCyMcS+Ybnzh1m740ibCxXzgPPeTxR
         y3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qtrtj++mHK5StqAXXXNpN3E6e7ze0VKwEn/hQgcsepo=;
        b=d/B7XjlabOYIENbOr6eFzS5JYK2CLilcKBvAGC8LL6npplo/9F0A4Ip/KT+S+NVuEF
         m/67HPy2aL/QZXVvuEUahfRPG074OAGjYDbxQJn4hFDzhHl1tr9BeTQ5QqvhxlISyx2x
         d0QP6AyU6HF1BCv3+fqxTabAWuC3o9MbG2O1S/cRcN84f5FD85m/Td9hpZJo5EFA2j4o
         Ambnu/mxxoXWjdkKsEz+2rSuUuirdaHGj615gNzxQY39QOPL1tyWNQsFlKfmu8IgSTZu
         CJ1l1cp9xYt0R8aGzd2cndT8ISrgQxaj70sB/qD68Iifv6Zo5LVur2aVPUA6YrwWVV4L
         7ZXg==
X-Gm-Message-State: APjAAAWACYAlezlzmebpboyQrFXljIa/KipPmJmH0106F5K9vGXUbH24
        Pi/1aWp/NxHvP7nzRBFOjZk=
X-Google-Smtp-Source: APXvYqyEdIpkEhzWrobQp314/h9W+m+5ALceKHXGo4g2XWwx9yMT+JCcpimw+HzpIpg5ddF4lAqZgg==
X-Received: by 2002:adf:c614:: with SMTP id n20mr3117096wrg.17.1561543950134;
        Wed, 26 Jun 2019 03:12:30 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id n14sm36381639wra.75.2019.06.26.03.12.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:12:29 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:12:28 +0200
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
Subject: Re: [PATCH V4 11/18] clk: tegra210: use fence_udelay during PLLU init
Message-ID: <20190626101228.GD6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-12-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-12-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:52PM -0700, Sowjanya Komatineni wrote:
> This patch uses fence_udelay rather than udelay during PLLU
> initialization to ensure writes to clock registers happens before
> waiting for specified delay.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRQwACgkQ3SOs138+
s6EECBAAt983RKDFZsDzVg2lEPVZgSiZ/mMjKovPSk3AqmF0/JH4M5X6AD6qjDuO
smN43eRR9Wq+WHL2FMUsf5Dvl0DPAWLw1i/ptulYJy34DHyrzMHFDzoDuC4WwJhw
HYtYZeHoYpRh8bBbpKuMCCtTFM8QR+At5/EQmGqG7Pqc5txnVzFMJYKh1WLxTVFL
th0zX1naYsRAHLah6qkM+m1/LzYd+kBLZBe+K5OyjOS4Huc2I3LA5hcye7OPTEGp
6t/U81LqcvwO0DqKBl7QJIhnDfPDASa2GBPrd1s29ryl1y5/C8ZWKs4mU56tTmKh
xMOCEYwRXjKWbZkGHAq9xsHxlhOn95/3QwR/807QAPk5tTxOaPtYsfA7dTcPj7xW
4WNRMfke6/46tQuhc8DHypBjcXdw1Rj3ypFJVBnlEWUIQRCurabL/EyLM2DDm1We
9oBJgQYLPiB4cMvjAXkRa5TmdGH35JDHQ4c+ce+vAfNawL55cpaNykpe4OeOBkx5
dWJmS5WvLPaKmdmLg0x+3Bg5/7aEAWGpwu+3vUm3uOL0hGW+E0AdqXAG34u+CxVj
A8a0yGA6Kbv30UYO5P1/AZhvxYaefvXzHDH+F/BLHgqNCn0JIEDNdnF7pCct3sgy
/Pkt5F/kDPpM+m0B2jnuWyXTJpS1YGM2Jf6tBgEbb6b5azCcBTg=
=NGxm
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
