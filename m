Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1349FF3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfFRL7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:59:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38550 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfFRL7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:59:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id d18so13668574wrs.5;
        Tue, 18 Jun 2019 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DEWG2BH5s+bceHzj1OrNgR0N1NtX/mrCz6t22kRGhD0=;
        b=b/qKKvqX8WCBDeIb2YpQuHltoaLm6n+7OLE2IJ62n0vIAAD2nmQlOb6euGIhG8Lx87
         aq00jDSlajL+csqXtDipmaDYFOGjlzB0bdbAVcC9CRsx+GZuGkCO3TzpANPso+SKZPLk
         2Tr8QSOoJmdD3LBuQ43+zsRMLxUOUXz4bxVptVTHBtlf6VJJpGM85YvEuqEpyMRaj7VR
         30SmClE5f3ehcrwGx7TB+Gd3pfA71J6wqY1vau+Bd8hpmkdC/OptlvRkh4K8KEQ1P6gr
         xC++uY3qpNT7cynkCXqMn5YDqp9RMK4HvhPPG48S78QKKsN/wKq9FyMvJnkEcZ/hhPfo
         nUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DEWG2BH5s+bceHzj1OrNgR0N1NtX/mrCz6t22kRGhD0=;
        b=WGxaxafBet91lbf+7LK9+9ZEYU1tO25tm3svgTcP597jEanU67jTt7SFt0dOTyH/yi
         fbKNxauIzPtbqK5BgZbh4aCkCF+FagpZMTYxfuAGHErr5BijpzPk3RfcrDEeQLQhUy0v
         5OfcpLapjW+UeTriqNOKxYMI+r/W3Pc2pr9ZoAYP4WnR3mJGNMDnwJsfX0Q5d1hMLPUv
         UI7jkeW5KZUOotYWhNLaynmjhPTrXGsNiQ1AC9eyg5ztjoRPu4kNsE4lAeyVQJGIUbeG
         3q98VBFD9dqYoR+zjtVu7jG0N1aiS9CF5l5XztFoabNOX4SiiHsLmwjio6Eh2M5tIHJ8
         yMrA==
X-Gm-Message-State: APjAAAXlLCW2h/AFi3OlG3p3Ew+oA/X1SSsId+cmvxVqvRu+H/OPEabS
        SCyV2P8WrKdLXRSXzfq9MRY=
X-Google-Smtp-Source: APXvYqwn3Pkbmvszrd5BJKqACm8lVeSy+vC3seguauYahizMsBuYeCJCixhWLdcwkP2gwz/r65unDw==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr18898657wrw.323.1560859155283;
        Tue, 18 Jun 2019 04:59:15 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j189sm3292003wmb.48.2019.06.18.04.59.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:59:14 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:59:13 +0200
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
Subject: Re: [PATCH V3 10/17] clk: tegra: add suspend resume support for DFLL
Message-ID: <20190618115913.GM28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-11-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VB1oQhYtJt8uuzk+"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-11-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--VB1oQhYtJt8uuzk+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:24AM -0700, Sowjanya Komatineni wrote:
> This patch creates APIs for supporting Tegra210 clock driver to
> perform DFLL suspend and resume operation.
>=20
> During suspend, DFLL mode is saved and on resume Tegra210 clock driver
> invokes DFLL resume API to re-initialize DFLL to enable target device
> clock in open loop mode or closed loop mode.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-dfll.h |  2 ++
>  2 files changed, 80 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--VB1oQhYtJt8uuzk+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I0hEACgkQ3SOs138+
s6EKmA/7BKKxe4K40G19IsWN0t2GnZNUe6alysAl7lWVuw4DHcAHG1DTpZGqAPJU
5eP6/jwJZYVC7cR1bDT4S/tnErF4ZJZSPGDPwtEPTpiX27hEGWnJl/PiFrAEf1m2
0XhBlK7P5j/n957G3pRJrvfz1RkSxT5J/0wZwkJIPaU43v6Sw1pxB/NiwHRW+eIT
PUaw2bNytrTJWoVmyyxDXHc9R8KCbtkJNtIAXxSE52Clde/uaSyDhBfqbbzBs4kV
YGZEqkh3uAG/Q9/ZGDd5XAFR3ZToNJqAac+QYVhV26Xo9UwV9Rsy7eLxYsLO3KvW
szw+frexcDuuV7Ecx75VeFhf7oaam33TvQPUcrWAO9NWfMiNzAzbtGVS41PjQM06
f+3y+4OnSSdc6z6RlfKqFzuzfs9b3qeOlsR0CRLDiD6/wgJ725UeFsbga3vqCD+3
AH0euxJCJCRkLjOuEXO/p/So/TA46OstJmJm6QZYgGwwVFWYjlUT756TVY7xrlqg
NAn4PxiJvaY+JkR+bWKH7+6KfpOzo6mbvQax43QsX0CmoKUHvCwKyY5/4jkZ25lI
QBQkmmXCMrgPlACpPjtcKfTlJ5ExDJQqW13r4wg9MIiSKGoXMuvUbuz+WPDDFxVq
ZdcJixDmfeYsrLm9eCwV5IaFy9V35f2M4Y7qfqL7KyDFTCE1WTg=
=BZR8
-----END PGP SIGNATURE-----

--VB1oQhYtJt8uuzk+--
