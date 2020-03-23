Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7332B18F57B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 14:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgCWNQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 09:16:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37226 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgCWNQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 09:16:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id d1so14760044wmb.2;
        Mon, 23 Mar 2020 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ORf2w/9FF0BxtCkOLiJMVWgEDX2LkwMSef0JQI9tROI=;
        b=QxYOkltnVTvfSCIvJ3A0W6Achxq5xAW15A2ViUtESmbvS+HzPTLGqg1YCn1jTN1aVu
         nLVEL3sfYQ69UEOhLejH0BStu1fzlJIHW2ukj7pRyirqBd5jcw3/h3RPE5YWuUMvbeEt
         dqZ4W/qr1NL3CVCTCWX6fcGKAdU8UjJB2LXfNK0Pb/7NZTjlhsh4xhJd4zE4fdunU3PP
         GiwOin+FVbGEjfzUYJ0Mvebwwkw5N/3W+fvHfiL3+tRDxsChQIBXW4xCs0+4IpWse5tV
         LCgndpYjcu8vn4eVjlMN1Vyzqi1zjjDThf7Rqpk+J0vblXl3813wUVGWBIvzGQKY94dh
         wLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ORf2w/9FF0BxtCkOLiJMVWgEDX2LkwMSef0JQI9tROI=;
        b=HKfgofas5jAm6zIerew5WwJH2PCp4RX/JmemJTsxpyZ+M9N+v5u18B360MBnqfN02X
         nVSh/l3s0ZXX1CepQ3PzQXtkp33mi7I/lcwx9Yqorr6g+EuwlSO8AacrB0r8TrgEbuSU
         tlQSU0nOPcnV5xIWfeUAW4npr8+0CIbPmeyytqdQS/y+wA05Q8L6EfuhC55wGEdKsA+k
         cJQNLHpcq00hfoQBBOK7vsT4uixX38WQVOOxRJiuv9e+agmpxq9Pd2luhu28gACAd7+6
         KQz3Xd5SwNaO57au0cFB7fR/HPmEg7cR2iJlTAbrkI00bkK2qHQryNNc2A2vXXFQW6Wv
         iEpA==
X-Gm-Message-State: ANhLgQ3em63cLHjb5oqP0l0NHMCVx7h7Pn3lPJWoilZZqAnC3+Zqk/ZX
        jXeXK5YvgUEOn2gsIUmX30M=
X-Google-Smtp-Source: ADFU+vuB2mMvGnpsepoopjQdP40suAURAfi95DKJ78DBWdCJtxh/IpQHPwakC2Fr0xo3a9lidHjqDg==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr26021099wma.182.1584969408394;
        Mon, 23 Mar 2020 06:16:48 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id r15sm18136711wra.19.2020.03.23.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 06:16:47 -0700 (PDT)
Date:   Mon, 23 Mar 2020 14:16:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
Message-ID: <20200323131646.GF3883508@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline
In-Reply-To: <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 08:37:48PM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > This series of patches establishes the mapping of these two pins to
> > their GPIO equivalents and implements the code necessary to switch
> > between SFIO and GPIO modes when the kernel requests or releases the
> > GPIOs, respectively.
>=20
> Is it possible to apply the gpio and pinctrl patches to
> each tree separately?

Yes, that should be possible. There's a dependency from patches 2 & 3 on
patch 1, but since they are all for the same tree that should be fine.
The dependency also is only a runtime dependency where the GPIO driver
would defer probe indefinitely because no pin range would ever be added.
So as long as patches 1-3 are applied in the order given in this series,
everything should be okay.

Thierry

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54trsACgkQ3SOs138+
s6Hraw//WDcWXOjZtfCWb+CApaca6PA3gsr6NZLrK4iudTDwEG8zoyxLJxcA9zm/
0OBbHHh13Wrs6JfYtNu5EIywxYBTbXBBHeHqlSMX+cJUQpetdG/QOk8AbhRNTZ6y
a/wGxPl8Sueu0bSKedPnPkJbjF8qhb9rCz5MxhCNiEm77TszYyUJLle+LxVuZCuA
GKPqq7wfua2SUm94tdaP9NM15NBGYvQHPei9ZuLWFv28ZAQYsKFUNY5SkOBfrjkd
XEQGWpgmuDh/MP1+fB7XgLyl7t0GyOMbo1J1DNenfkwfqPSvdZk22wSRAzAs5Z1P
9G5zbn6lBv0o3ndG67VbgDi8+DtSJ9i3okYpugPcRFiUJRLfsx0U3SwmeUaUJZas
V3GMxlR9wnor8haY+ZUmcUo7i7+Omak/i3W4t5YYuOmm8+nYJjD3Vn40VQVTsJFQ
hW7r+LiGxp0MVbg4F1h9bamoNpqiswM/nhS0zUO5DvZepHyzLxpxMABLilTE8Ssn
09X3sgFYBZ1z0ia5qqj/5eE4vXYZR/Giln6jEuCos26vthCNCb4PYDYXuLyipciQ
/0W+BQAI+emKc6vp09f852tOzthJwNXGpUmNZdyGeWQac6PR1GwiXiZywThVS2wc
sbYPh3MkM40vMkMUpxUaB2snjPxbbBvtNQozaaZq3c/V/8azjxQ=
=2kno
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
