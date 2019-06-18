Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2DB49F84
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbfFRLp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:45:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54349 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbfFRLp7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:45:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id g135so2883221wme.4;
        Tue, 18 Jun 2019 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hmk5A34hevTih65ONqJk6gJ3pW2w0gAUTQ6jMje+Uj4=;
        b=ZF1zVPehgmfyehYR+cbzThXdlcZDCmrJIyuLRSJ1IrMHRkDsD3ct6BMuzP9MWo6A0j
         IR0IvIXMGr5Zpqdnjh9lOKG6sszGMQz1K/AZF3MrCB0GBcI3nVAeFzU9uQimqi8A0OpS
         qMEt/pkg0PMyGu6S0lgq1ccT3QtCx043WpEWu6iqevbImPEgfKEi6ADUXjaKx+LAdtXZ
         XrUC4sYz5al+ZtiQs28dPeesPssBcQq+3AXN8Rz/jyK5YJ+kMPH3P4VCN2BfNYij8K1N
         iutBW8CMsQo/EKS4HXH5Wulm21BzfdDNWnyzkQI3fvqW9a6xbULi4AGiJW7UzDQ5oQ4q
         Wxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hmk5A34hevTih65ONqJk6gJ3pW2w0gAUTQ6jMje+Uj4=;
        b=raRG74tUZBr8R8dR8YvaTh1c74QmWdj6W92yVQA7Xo9ZtJ2yF0wOCXF8ij/JjsUkUH
         EMRORH9e6/1X5FKalO/aPA5n5eVTjtR0K8TOCqCWAL4nq3sem4CW986EWr7BHOZSmRU/
         4TzQNUFPT41z8M2+ZtzzG8ptYo322VEc0oxNq4P/MCritjTDDN+hIeaKE/bGA3FrO51D
         IyaXCCDuHamyeoDc0ltK2adIAbRY4HycurFqfQUDl5BXYqNthQ1Cx7Q9CJNaP380noXG
         akHk4aAehBoL5MefKvXORxkKRRIV+eqQkY6Mmk65LGwAsP0HDiETWnUOjqIf1xKRdiMK
         4LHA==
X-Gm-Message-State: APjAAAVtBs/26whddzzImXVUtpc1cqKtVO6gG3H5Yb/quFoPD/j4mLh5
        DEW+NDg3qBjntU9hRDNvO8Q=
X-Google-Smtp-Source: APXvYqz3MAaHI3dRTEdsjIx4qOUPlTViVmJqHguDFGORtVNrPF/Y+Tzi5GZjf/61Y3+7LKPOcdwPOg==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr3427859wmb.130.1560858356319;
        Tue, 18 Jun 2019 04:45:56 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r12sm21351821wrt.95.2019.06.18.04.45.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:45:55 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:45:54 +0200
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
Subject: Re: [PATCH V3 06/17] clk: tegra: pll: save and restore pll context
Message-ID: <20190618114554.GI28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wjoFZxbW4tu+iR6v"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--wjoFZxbW4tu+iR6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:20AM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore of pll context.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry pll rate is stored and on resume it is
> restored back along with its state.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 115 ++++++++++++++++++++++++++++++++------=
------
>  drivers/clk/tegra/clk.h     |   6 ++-
>  2 files changed, 88 insertions(+), 33 deletions(-)

Nit: s/pll/PLL/ in the commit message, but it's up to Stephen and Mike
how important they consider this to be, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--wjoFZxbW4tu+iR6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0IzvIACgkQ3SOs138+
s6GbwhAAl81K7Fn0u6zVdK0Bb/EEToU7rUYTHyjjoF6pL7asgcFklYoc2+H0zeUr
LQxgQ0QX4OdvjY/JkI7MoSnIMJxOjj8vYNXmavAdgLQWSCDsiNzfjmoFBIA2ZB0W
zXikPpSrpHac3YzW4GwiR5qeFvv5YYA0PmIk9ojBTxb4pSbGIobhdjnAVrskBSp9
5gICaaIOaAo+0YhZWHo2PdyAvOZpgf1KWKMik2RRO9M/LBJxm4v8Q3XC/sm4uko/
95Tl8sFnIoLDZ6ZeOjIxa0YjDQgiVBdDNkPCWPdnzzwm+zIjJPUD7Mpd7si+jRfi
/uNQaBwaL62sgX7pooVeEEIVJIlTcL1nYQNGH0rNzADxfThYGETM+/BTTaJeouJU
iXT0XN9CGcXNlS/+0lShNEvUBmKhksAdOV0r3d+gdk2X++o4bg18oVZ5LeLaxiw9
PKNwQivrb2f7IqPbFDB8vPIaa9JizgXCGw2/NHnuOMU6lW0Ddk3cRx+h6GGW2GnZ
Kp/8GyTKe1eE2o+bnDBlcD5TxuwSk9GIN4T3snFeImmJtHBEA/e2kRMQvtTLoYX9
xXYuNttR+hSoWhxirWHekS7EWpORz1EpxEvgIhztjI5Swz1BEyKHvK7NgEuLlJbE
EnKwcp2Biak3DMMVdZLml8668uzm9i6dvILHYtzgFNw8jJhOKfQ=
=qvUJ
-----END PGP SIGNATURE-----

--wjoFZxbW4tu+iR6v--
