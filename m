Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1236049F5A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfFRLkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:40:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41096 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:40:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so13586920wrm.8;
        Tue, 18 Jun 2019 04:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bCHasR2xVFY7bhr2Gq07GCMJZsjM10TvNttwdRr0fis=;
        b=ZywaZRDcf1I213mmH/b06o8HoRWpUfogxU23B4pdwYaGIKoZfHP9tb+v0cYY5kG6AR
         S1JI9/oZrzn3cYqU7rzV/y2mmy51rW0nzdy1ZsP8dp0Kf5dqCr6Rxj7BeX7drSEkPv5g
         rIPDQsPY/mAP61/0TJYBZsq0Kl2uonTilyjuQIYp/lEGFYn9K//T3yH5wu4qZC2mCqMS
         PTPDqA0zK4gXB0q2EI2eA0lnYUb/HcoF6rfJJILN3+Pu5rVrNMfxp9K2rAv7k7aNep0t
         78nCW2om6p5HesScCoTGI6JhDIBpRnBzsJqtxygCQAveCgI3zhOOO9i/VTAB9L/go5iG
         9VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bCHasR2xVFY7bhr2Gq07GCMJZsjM10TvNttwdRr0fis=;
        b=f+7mAgek9WlzowBx/x3nFVS80tSWZEKKFUFMVAn/UBwX8JHz6QoCy3nn4sryK/W1Pg
         ZGcGdr/Z0qcp+ATH1JhWsncZVBkTmYh7W88qrgwPBWtP9r67ExF859eVidhK9ovwZHTl
         FSFCsVU7oOVXYY4ZoC1RhfgABlwMhOZ+Ggy2sGi4ZgP/iBJQGS2dQP1ZHeuoN9gdg5nz
         Wf9sKLWQEgXjrL8nSWmrcejA13vZoEfdq7dNVMC8ncmD6zBS/xf/ccTQefSy0zYpt6LA
         VjWywsnZs7mWCrsCxT7gHQkrIWqIIAgD7vNrq47UMVebCAaRR3D/CP49+9Hw/HuUhlKA
         YmRQ==
X-Gm-Message-State: APjAAAW5efwMWojK7PU+DHI/Vwz1iGHLlowDwhEZq9KkMqKYrEnhGclP
        RguVgmbt1QuOBke7Tex4h1I=
X-Google-Smtp-Source: APXvYqwsnH1G3+SK41XDKf2weMFtKPnZLD//7PNRLe0aBHvPAZdoAS0EtBs9+skMmd2fzgnhLFad8Q==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr35054723wrj.260.1560858048088;
        Tue, 18 Jun 2019 04:40:48 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id u18sm1551136wmd.19.2019.06.18.04.40.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:40:47 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:40:46 +0200
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
Subject: Re: [PATCH V3 04/17] clk: tegra: save and restore divider rate
Message-ID: <20190618114046.GG28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-5-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DNUSDXU7R7AVVM8C"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-5-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DNUSDXU7R7AVVM8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:18AM -0700, Sowjanya Komatineni wrote:
> This patch implements context save and restore for clock divider.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry the context of clock divider is saved and
> on resume context is restored back for normal operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 23 +++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |  2 ++
>  2 files changed, 25 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--DNUSDXU7R7AVVM8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Izb4ACgkQ3SOs138+
s6GtwxAAviO/ThuX4ybgSd/ZL/GOirDmu02i4uTsQ5Wm4kTRBo3Jc8aeblP0Kszo
Ox1mHplhKTN89iKlj3GmvojZg/xCWMgxvBwCuwQq4LFi/6gdqqOGswf8l3TTr6tT
kKedG8pIp6ATttA9oj8OULPfNDgqvW9vllrCg9mMlHN97NwRND0QNQCiAML2WBV9
BrH/idFUGJrbr/0rYDbtUt3laRIqh52D/iTT2SQyOmLySiqCMnYRL/X7t9sENj8u
VS8CVRaOqOFDUMLhf8a8FULq03cmS003N39gWJ6MTmbF3CRpEFGoCtnWhkGeQ3Dh
pjEqHfOVmLFxYweDIZApplLuQOPSiqQ939ylThCefvKfgDtjkNYVxOE6MK6KmLc1
EYWf4vYx3OQhT8a3FhvPSvxkdeRkLQ/1B+YPFBG03//b5Dr3gc4hPssoLbMF5fYg
IBY1iyX+9Iblg/pbGX89kSnC4fEuIwnKno0cs7X23r3sCINUSujTJ4loTNAt9cwJ
V/kK3o4Znb0zNJkmM3tO+R/yyVZDIKZFvE8Rdzr08EtLYKxsDm8mN5b4u1uWlsg3
OT+mdPggLc12ZEVaQ/TwHaFE3lYEMir8aDqfB0nLgIB97g12Dp+psgbAhuZd0193
yocFb7wxUT5a7f3myqobBZF8oTmG3gTS5fDo7XoLd1sPUzyj+ok=
=NUzB
-----END PGP SIGNATURE-----

--DNUSDXU7R7AVVM8C--
