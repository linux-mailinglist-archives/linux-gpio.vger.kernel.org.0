Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF4149F6D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbfFRLly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:41:54 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40713 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbfFRLly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:41:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so13610089wre.7;
        Tue, 18 Jun 2019 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G40j/Nzkdl2CTqIXlYK3mXMlUbPHSgML6O47dCP4epg=;
        b=iJDLWvDz41LVTFJYr5Q+jqbHPTSpZdcuG8zfIULf5az1I+qo3nUWK1o/1qxP6I+q/B
         OibmUExajk1h6VOGuXy5cQda7PjOLZcRhmBOcPGufReQYlpEdQD2AYWzd4ranNvGXprI
         RM6FZbXdcvPjK1En/AgMGAG0ai6OPMTl6ZJNLRFtzALxpjhApcaoDZGWpirG0m5xF9ZC
         Mn5LkNpnExczuDlYThuFqNJZOIpNl+qVELd1ecY6HXxj3YRTi3+JfpK3rdthN5iYY9t/
         R6QZ/AjPk+TQ6BP/48e6L/rg6pDfD/MYSXqJyzeqMBTmdBigWnv5acDaJel++pB1PR7E
         ASjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G40j/Nzkdl2CTqIXlYK3mXMlUbPHSgML6O47dCP4epg=;
        b=AqSEN/Jy1Tv+PJ9QMIJRnxSdsRe07jI1f/cPTWXGfsbd4ZvThQn3wlp4yxDZYyzC7F
         xtuJZPvTPz9gdU/Hf6PBvrEJ6NxbhQtLHArsoz1hjb5Hq1JXUSA4RvOz9mqinnHXuoxV
         c6EYFWTOgb3hXPQSzgWNLZ8nyjXjTmQpbrsGJjV+RFn5XuV/GhfJFqfiAFaSubD4yGwG
         s3c2aLtM9BIkrcTXVIvqC+Rp3ReSh4tEjBFGYwRTK+RcXyWIFzH9J2t2LtRtjvL4Owz8
         Z/0k/5YJ+zgv0CqNf1nsCIT8rg2icdGhux+FBJ5SkPLH+d3QhMntk4J4pXdIRf8j7Kab
         bIyA==
X-Gm-Message-State: APjAAAXdaHgvmEmT2uGBKGbeDw4DcrxB1jyP8NQXn+jBAiN1O/USz3z1
        5Uo9B9PP/xgRYYTnpiBP2LY=
X-Google-Smtp-Source: APXvYqyWOrpkA2WysOQtPeiDDYUV6LJ5QgaxQ6Kb0Oov8r4fgD/jUb3GftkV6uzdO8MBzuXOGfZPPA==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr15571277wrx.208.1560858111547;
        Tue, 18 Jun 2019 04:41:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f204sm3904542wme.18.2019.06.18.04.41.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:41:50 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:41:49 +0200
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
Subject: Re: [PATCH V3 05/17] clk: tegra: pllout: save and restore pllout
 context
Message-ID: <20190618114149.GH28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-6-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FLPM4o+7JoHGki3m"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-6-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--FLPM4o+7JoHGki3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:19AM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore of pllout context.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry the state of pllout is saved and on resume
> it is restored back to have pllout in same state as before suspend.
>=20
> pllout rate is saved and restore in clock divider so it will be at
> same rate as before suspend when pllout state is restored.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll-out.c | 28 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |  3 +++
>  2 files changed, 31 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--FLPM4o+7JoHGki3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Izf0ACgkQ3SOs138+
s6HACRAAoY2W4UsKZljxr2IYcO5jw3l6eed1Pi5LyaUGbDHH9gVYo2xPr4WVid2t
MYuTEaFNH8Okh4+F8YC/HjfxcixZvmHCWRD7u3s89gdN3ElUv/jpHuQ9KKn7xsql
AC5mdlK6pqlOJK3hlFFsiiWVxegzGKHoVpfOscMmWJS10SlyMbp2WVX0IhPmz7Bp
swDcc18qxhHP7CVHBPf0CTosYqvwcBPQpY7/KnXyN4ayHJmAINl4xA1iZiuUxh/G
IKC9c4mK1a3x6QPP4YL4XLtnIVdzbE4Aw7fwQ0YEz/bKPQzLoIk9ZT1id1YaoRXJ
TGEVYVB42SmTpgIJxhOSIbjBxZl9m9KyCrTxAH2vJgRQ0f19mO9JFGzCG9vUKP6/
deO9943vDMKAh72qxQPbwd1+QEqje/O1N56NTR2IedFoiuiax8SrgssXo7J64nGO
62lzo7OSo3EAeipyK0kO74NP0K7BJ/3iae2ntE73u+1o25WlXRjsMzc9hfm8boIE
oG16ybi1XGKxeaqIo9p7YjovIttveS76TRWv/CEXL1X6XPnbnejYPIzZdrTr4qIE
ohLWgWKxu/zVuoPZtdn1QdS4sVo0bgWsBHzDSyeNEZxsSpRdJn3ZqRSjJgKlTRVt
0ok9Wdv+5sxWqVPZf4puIloLQVD3QRbFWDGSfpo2yKNHFrqyjTk=
=vltX
-----END PGP SIGNATURE-----

--FLPM4o+7JoHGki3m--
