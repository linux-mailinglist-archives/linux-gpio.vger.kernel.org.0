Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DD91956E5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 13:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgC0MN5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 08:13:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39392 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgC0MN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 08:13:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id e9so145174wme.4;
        Fri, 27 Mar 2020 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9iaDmSUKmxy4MplNRG0lgdo3RxFqTWGt2OBwvA1lXXc=;
        b=pbCkSC0W37evpqV3fXh8Fl1hQJMePJa8Hcp6VZI9hvqs3bSIHkWw8S0TI18tVLlrdL
         2P5ZHudgCcvM9FY11djQeTIZH/us+e77DIUk+oMRXQSxl7FlxIpdZq8TgHHg7UpwZDcI
         E/QX5B4rv745UDPRZXYEQznH80ru6h4YBIeMD/Mh7J+kIIbKaok3JjtngxOS2ocEqcvA
         zXS+d/F897ErSwZIpRKzxKqQLg2Wqh4H0vx/AaWeKa+i+xjugVMg4+pfsmRCiJMaKdY/
         abHGwn+T9fguifc6m+z39wxIstfysN1SnADTETy3PfU3dTSmDrgUfEpw4MMGg0qmX9Qn
         EGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9iaDmSUKmxy4MplNRG0lgdo3RxFqTWGt2OBwvA1lXXc=;
        b=pqy/eXChq+nLH8+YFkDTIBPlS+OcSjneLONeEsn+NmcpLTCaUh8UW1RgfeBknMB+49
         fpvxhuQt+Y+iUrUbi2QcUG2bTZUonrb6pZvuzTnglkC3peffHak7sxKzxWSaGKhOY4Fu
         /y3yK2qYs+EBnfzGKUKW3BEzWlNPPCjjVQuqjckLmwrpWrBGW/SXHJIiKkLQwoCpQGrl
         VykMayaYWb1k6bpwoGXmQn17t1Scgnn9GbS1l5g/vPAp8q36wa4oaaot6fp14rS7His1
         gW3h8nCLRLkeok+rOwsmwS/ZlZJIYrKYH9cd0nwZc32TN8l1iKODK8EFp9k1gbzFGz+4
         3hjw==
X-Gm-Message-State: ANhLgQ0RCi0iCKBP0oK6dTw5HKnf9KxS7v0vmLyycTtm6Ass7zK4pcFm
        7zyxlSpC/L++Cc/GXcREkuk=
X-Google-Smtp-Source: ADFU+vvWKyzLcpXi3WGO7h6afkeLVwgYz3XZTq446EdsGFAoJ3O3CZE0jg+n87CFSZsso39H4lW1kA==
X-Received: by 2002:a05:600c:54f:: with SMTP id k15mr4987908wmc.76.1585311234932;
        Fri, 27 Mar 2020 05:13:54 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id v21sm23006wmh.26.2020.03.27.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 05:13:53 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:13:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
Message-ID: <20200327121351.GA2229783@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-2-thierry.reding@gmail.com>
 <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:37:07AM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> > GPIO controller had any pin-ranges assigned to it. This allows a driver
> > to unconditionally use this helper if it supports multiple devices of
> > which only a subset have pin-ranges assigned to them.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Patch applied.
>=20
> We have some drivers like this:
> drivers/gpio/gpio-pl061.c:
>=20
>         if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
>                 pl061->gc.request =3D gpiochip_generic_request;
>                 pl061->gc.free =3D gpiochip_generic_free;
>         }
>=20
> Should we just make a patch assigning these callbacks
> unconditionally as a follow-up?

Yeah, that's a good idea. I'll look into it.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl597foACgkQ3SOs138+
s6Gtww//f2wgHp8+oZLyJJoqc6KL8UkvcBfrJRzcHr37THvP7BGCNWS7KIIvyR6Z
7NYjQOm5daGIQJ1FQSBZHOKOPJ8t6Yocsf8sisIq53pW9EjUYjmJUKkwB1rNnD2Y
/eh/szX/Z60bfuFlPNiYJgSWfIoRw4crM5yTrxjfIoV+HjX86zAkt8Ko7JLYYB/7
5gGS4SEGwhyDvFNJwwdyW0CurFRmQbUWsSB1BPOzNYB30kubmB5HxBws/xaE3Pqk
Z53TgLNemQ4hRcDzm0PeiPdvDWjI3Khy0j04+ivOUONzq7w7S+y+sTRha6mCykD8
SNm92eegAtpSOrt/Ji4Qja1d7CQFO5SKvs4JlqifTuJ/PMuxH0aDmIUsVmKHPTqq
rTrdvGWT3rV0TLWgZ1Q/j3nZrqp18pGGGSRaAZesE9dHVXrWfpO3WS+nGo2/Yb4q
86XzxbIStJ17vrkrOI5ntSOdXVgouEgBR+XYkr8l4Yde4FoZTeAHQfM+0dhys0nG
rIXMo74gRouOLhhz/tzvAYCnVTRWX4rrrfY5/bkSnlwGNmrLAYKbg02+faJVNFQy
mSTjB7BtZ4C7w0ZsPCCwSYBXSPZZATgHJMjwf1FlO+j6AZ7l8URXC2HGuVfhmzl3
qyGEfDlIRES9gbNzYyyMH21viwL3+6eA5GN9AVzA8e3G6PQvbwo=
=0srh
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
