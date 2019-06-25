Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 971F855096
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbfFYNkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:40:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40463 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfFYNkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:40:36 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so3008329wmj.5;
        Tue, 25 Jun 2019 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QJ3vVIahs8Gyu6o4xBxgNpPv/R2B40HTjKibjIh27os=;
        b=MjpTBDGAkMtRwPjH+//H8EJ/MWqjs4M+v3aRalto2IlqB7ngwlJ390Tpkt+7GXhMpo
         TexjJIuAuUS3pLozIuSJRPdQ+iF/b1ahALGQnip+SKd1x2uWUDge2NRJYsCBLonY8SXE
         x+VMFqFWhvpKDmFPcRS2ssRQ5Q99M9gd1CFl2wuVps/f+2mHfeyo/rECxM1Mob3NY9X0
         KxxL9i2KGsqMFXKEexUPO0CunMep33lfeEuGyvLrIklJ3t2WeNSmefKuXgtjqK6dpFcJ
         HQLtfs9TjJ8Iy7/qFXCU7lJj7NBSnvx1+wv67M502MkIaB5Z0oufzFsC6AvaWBCOz0Fj
         vdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QJ3vVIahs8Gyu6o4xBxgNpPv/R2B40HTjKibjIh27os=;
        b=G7h/IERhV8nwnAYYp8cXs9UcbOV9S7WFMAj160l2bresvCkrmG20miCbmo9fuoPLfb
         JgEldCI/j3YqjlQYwf1qj1bjMdlq/8jNpBacqjMrlQdHJMA6YLCcpF86VLc0aNrTbSAH
         oRj4wgTORIcTXibq9mGnc4jPkCEP2P5ffOVyXgV6uAHaQn5Ujeh87B6iLKPWMbeAQ0Jp
         kvxARXYoQxoUXRj3GnFeyKMEbQ4Nhe0TVVVPwiuWTiDEeARK9e5u2risCdDLX3yNu6Nh
         g7IglMIafi3EcUgO5rYWzvCB+BrzGIBfvu2Ty0NMkZKOGUSKdsQhsKALi3nbTzh3sKwl
         sycQ==
X-Gm-Message-State: APjAAAVpPxbMGmMNyIcg3AUuNyk0NA0HbqndAmCmb9f7U6AYf+zUGbWL
        S0ThZ+do2pABEuO+IgxHcJ4=
X-Google-Smtp-Source: APXvYqxlXKjVk17RP8Zhg4eoVhsbQZMM5EjUjUE+3lmuhZpEBA/oCKVvP3rJqt4BUFNb3QlRd38gkg==
X-Received: by 2002:a1c:be05:: with SMTP id o5mr2665591wmf.52.1561470033332;
        Tue, 25 Jun 2019 06:40:33 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j18sm17333213wre.23.2019.06.25.06.40.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 06:40:32 -0700 (PDT)
Date:   Tue, 25 Jun 2019 15:40:31 +0200
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
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio
 resume
Message-ID: <20190625134031.GA22491@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:44PM -0700, Sowjanya Komatineni wrote:
> During SC7 resume, PARKED bit clear from the pinmux registers may
> cause a glitch on the GPIO lines.
>=20
> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
> to keep the GPIO lines in a known good state prior to clearing PARKED
> bit.
>=20
> This patch has fix for this by moving Tegra GPIOs restore to happen
> very early than pinctrl resume.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0SJEsACgkQ3SOs138+
s6Gc4RAAuL9MGdkEhgzl61Ta2oBYD0aZWJ66SqDoCR4N4IOJUbUigecf27fp/Aq2
hSdNG1GPkruQ9M2Dr/R7aQAVgYnZZRbxTTtGvylvkSa8nPDRWVESZSBGlKERb1oE
tbBTktBKqYuZNv5tfxAoUnG7elNy/6LLbw942vtoblJdLPDGnuIiJw0wWhUj6bMM
iaskxrSUg5K8ekrAqc5XTkZm92lxCGKHDYucMxyUF/nZCW8iczUGo+d2hzd3JFvj
ruyTZuaYf6Pw2VhNJbsMpK+hqi3ou8RdVUjhc2DmUT/f5CTcjp0bO5UqjSH0U2LZ
7v4aqh12UFukfwgb3UGq5Zj/qJoCXJKcIYeD4mZa/kKJUjgA0P6mCmrv+Qq6lEbB
2+n2dMn1GmJdr9wTYATGeCIY794k2bWBOwYKiKx3AcOwBa4yp6rtLDbdPefKZsp7
id8JXupBhHFiWbF4G7vLg9lmnPwTBHnJ1gD5oqBrtoryZMJyTD1XQNHMudiOyGL/
ENdep/ewpV3jK7zVVpOomS8CDNa/0joXlyvGjHBtK341eCEyIxGD9nFytIPzqvFP
+zdfiN5ioTRBBNpEaKcP5JRZiLMpUC00uT32vJlTKJb51V5q0MP1YxO8BGQ6EV8m
dceqZShedBlFvgND7IuZ3JhX2Kgo6YtoGpdy0jzsSlDVi7xTU/Y=
=Xgxt
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
