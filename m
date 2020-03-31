Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B704019A031
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 22:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgCaUxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 16:53:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55301 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728189AbgCaUxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 16:53:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id r16so4100369wmg.5;
        Tue, 31 Mar 2020 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XSvftjjIUpAxbZI1dSM7HAARR9x3+Q0tTJPz/Q6bTaA=;
        b=bd4zzy2ilKp4TCTKUIc0NmYskAYv8w3ZldN4AOXDzl9g9RTCc2WlvK3Ezlt0SSJat+
         xkoLWwFPIefMdHSntDvS77g50UNbvR+YqZgqvupjbReSFRKPh2AdZ23jthpsio2hRij/
         9s9UKE6skuIua9zWVt4S2fkSE+iKLYrW37N5dqsEw1/7IQQuehHfSEwYD/NgF5itip+P
         ZOOdFIudh2xFAbd5bvKOjMTA0SDnqplHcNGHkZwOdqccZeY1+MuK4xO2QqcJuJINVFVv
         Og+nBz/lM7UH3x3NDRtc5xhBFp06rZbuz6OTYKq77bOAMZPAZqg+9PnOVRbRLF/h0WK1
         vd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XSvftjjIUpAxbZI1dSM7HAARR9x3+Q0tTJPz/Q6bTaA=;
        b=O3a3Y+JGJev9L0gJrDz/xRVKwmvQ1M1i7f3RF+K2jsK0C3KgpL8dQJ23IJfNqukYrj
         kPwfRi9VH2qZa3JITeQ506FH7CTv8m4xJBhjfgvSjDcgZoH42y5vJveiEgQgDsW4TQto
         w7Kcvi82SkNdc9mt33Ac6ci37GPthbjJbuWd8tPrqPXYV8eFXiXx+PN/GG5puM5te8FS
         jZBwHBrw1yYwv1YbdOH95Lq0DPqyA7tECnjwrJA16T9wFHcq++boAB9nOiqSTRoOpsdc
         1bWl/r0W4SQAimV7Xsh6twCkK1vG+48NSFpiDPpgfMTWMI49VWmHQSxWVAjxcKz+WECA
         WkJw==
X-Gm-Message-State: AGi0PuagBSa/+MQ/cahPw6/AxrwmwAV50BCAKi6haM70Z3k22x9ebYqJ
        r1aIizgR8KWp1tHmn66BiQU=
X-Google-Smtp-Source: APiQypKgmpyU7HZgYITK9sT8OMH+nDkoun1bzhj4neyV+G+AYOic3uIkGC1p3FX0z8BQGHK2gn14Ww==
X-Received: by 2002:a05:600c:2c4d:: with SMTP id r13mr685629wmg.146.1585687987027;
        Tue, 31 Mar 2020 13:53:07 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id a186sm5198758wmh.33.2020.03.31.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:53:05 -0700 (PDT)
Date:   Tue, 31 Mar 2020 22:53:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
Message-ID: <20200331205304.GD2954599@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-3-thierry.reding@gmail.com>
 <CACRpkdZ-7Fm8uPYoE6fL7WXQYbdV-nW_Ttt1ggXSApxMi55ODQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Content-Disposition: inline
In-Reply-To: <CACRpkdZ-7Fm8uPYoE6fL7WXQYbdV-nW_Ttt1ggXSApxMi55ODQ@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:39:35AM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Add support for Tegra SoC generations to specify a list of pin ranges
> > that map GPIOs to ranges of pins in the pin controller.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Patch applied!

Hi Linus,

I see patch 1 applied to gpio/for-next, but patches 2 and 3 don't seem
to be in linux-next yet. Did anything go wrong with those?

Thierry

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6DrbAACgkQ3SOs138+
s6Fjig/+ITFzu90AVbO2aoJvVTkwo257Rmutpy+shRroAqnbY0/JvKMDCnESkeYU
lWH/LBVf5dxgmr+z6E7zlEHHyHM8atMziMVVLgu9st9GAOljFXf4Ia031HNVZNTb
1L+XnasEKcYtInDbw0d0PrdzQVXQ9QV1/mU+FZX700wRRz3TvOqFHybztn7dZ1Yg
x0KIVC13UNUIvFFiMb184SgPCgCxWVybVqSCbjSd+VgSuwCmfwCTkFYXQ95YWF5F
zOcVAScfUtbl2e2E/hK0yDgwEarNDrDUhsZeOFO2Z6MLeSXyPP9uI8Dj9eFQTVJq
JXYEiUL3eKGhXIQ68F7kHdrl2i210Z0GzzfQR0zJm6REOn06yJcpUaUIk4ZrG/a8
HY/bEggZvz+XlSST8fd1+e1BLzLkcp+lXwb55WoWluKND8WZACjn4qkS/uA4faFH
aWoPdCef9LzbOqHlZjZlT4pMApWv5Jtw32AXW4hH5uhTAl+L6YbIiFYfy1UB2BFU
/ynGkvyhsjwi0aHLsjW4xs4pwIpRssz41s2jYjrMQBuyjinfF2WMsKB+XLvrYwBK
bU+0XTHDouN4eNh0OltOdLiV5XljIP6/mzF9bZN03LDwiqwB05Y/yz7/Gq2wnmXB
5nYU9hkjIWJLX5JrTvtYY5z5u527He38NZRQEKDMvILC6/TUWSE=
=Ezrv
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
