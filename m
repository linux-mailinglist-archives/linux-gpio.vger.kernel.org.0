Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDF749FBA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbfFRLvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:51:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50254 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbfFRLvq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:51:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so2928867wmf.0;
        Tue, 18 Jun 2019 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q72kjHR6ejX7kBWUZvtnfZ1zZPaJRgM8xc5EcO/j9h4=;
        b=P7WaSuAECKFZP2pYUsbnWmpVPVAwTMR4JEjfB1e7+eM3KsK1WVraw+eZOh5Wpms2pc
         zDwfG5vABXw812ojC8hdK/XLc9WXjDt68JlxY2F7w1gzoc0gSCK4kdUm84RQF2yyUw9H
         K9ESk1R/QwZODQqEUXhbPDI/QwMJAMPbl5URlnT1jwXu7guaTVY0drXCrn14YanesS3G
         idMRaDF8UMNg8NdqvpuXIv2fiH5AcXH7edO3/Mg209vQec0CzgSVmmNNYvY0ZWGyx+bu
         RmD4XDwA07IKm8PIwoGW8Z69vVDAL5+lQJuohZ0uuTJJBjxdUuWclefotusPqtMkeLYE
         Jp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q72kjHR6ejX7kBWUZvtnfZ1zZPaJRgM8xc5EcO/j9h4=;
        b=LtoYRSJQ8CKPd7Y+wdmmqYrbSLdQmuL0q1zOtcQQZ4SwO5TlHXMVIw+xyolgKi2/wG
         xESLz8/ekS1Amc8MFu0CEhbIkMHiNgjPfg0bvzTnEz5wG+1e35KFUBISskzhFpHteRWG
         Ds7vgYca4gTikClsuGj7zxyxyKmTGdL+5bAylhgrr8GPT6e3/zNTAMaBv+rs/ON2gHD+
         4Uw5C/xioB4fKs9reryUO7Br9rQ47xLW1r3H8Jt+mYQ31gaJ12GVWdAXm5JxmtUeIjkH
         6nG9dAUBU+6SidM8dvZBvlL6NjlKRmqdFajJrvVR0prSavdn0/Nd3lCKTUwreGFsmZmy
         h3uA==
X-Gm-Message-State: APjAAAXFF6KVYT9Lb0e1gdwOcee+GkXcKLwWIfgOckQzrz/o/lNm44s8
        AMb8gnFensefWZ9YYdsyRV0=
X-Google-Smtp-Source: APXvYqzPKLvJ8/iB0VSF2erODHuimx0EiX2Lv2zrH5dtRcsXdLjGUNChbIvgNCmIKZe5nnQKrv4OgQ==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr3468491wme.31.1560858704049;
        Tue, 18 Jun 2019 04:51:44 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x11sm2322798wmg.23.2019.06.18.04.51.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:51:43 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:51:42 +0200
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
Subject: Re: [PATCH V3 09/17] clk: tegra: support for saving and restoring
 OSC clock context
Message-ID: <20190618115142.GL28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-10-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GU3/x65mZ6MFE8p3"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-10-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--GU3/x65mZ6MFE8p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:23AM -0700, Sowjanya Komatineni wrote:
> This patch adds support for storing OSC clock frequency and the
> drive-strength during OSC clock init and creates an API to restore
> OSC control register value from the saved context.
>=20
> This API is invoked by Tegra210 clock driver during system resume
> to restore the  OSC clock settings.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-fixed.c | 14 ++++++++++++++
>  drivers/clk/tegra/clk.h             |  1 +
>  2 files changed, 15 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--GU3/x65mZ6MFE8p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I0E4ACgkQ3SOs138+
s6GxLw/+OxIXQLuP5OvaapQAKg6vVmpGZhVjAP62Q6c66ykv24Ph+jLXsJo+vpm9
jBeQhjpiEVGyPoc3ONfiOS0tvt4JvDNwChjxKw8YtVYShBYUDRi79JIgfrzhsZWX
vKSozb0EHtrjrjbZNUVIXYq64iblgqKk4KsYi4wDsfqMCiqNeV3I3d7IjDA4mNTt
qlGxvltMXgsrnUzJxGdLYW6GEag5eCuiF19nv/9+uq8Sb90Z1+CBo7NaAlO59545
m1RBSLnRMQ/TVrnX6PyfygZlXNFwfXAVr1Oxp2JIgtdKQcNombhVFitTJwF5eKMe
gf8silIq8AQrFxeZ9ojdh+A99GADYTg8WN81y6uFn1ZYyB557X9DGLRl4aYDeO6V
mJUTrOc/O5E9W+fZLUYDTNkiZ9MVUi1AK+H+xEitePlC0zKxcf4WdT7uAm36qWnv
EXhMxxebLGZGSbkS+iKGQ3PIT3ofPoQrn9We0Fu8vySuD+NOqP+MtfdsrbQ/PyYq
Qs85AGlkg5tYbxW3HVy4oTTFu/mB/pJW184oNDeHqf6kRzLFcVnoGdUF1qCvnEru
27OzodaP6Nv+af801lC6x7MaB2+RajmP4Ic5N83AtBEu+RVxyzd9zahR+uiCDPnC
tdstFpewSTYtgufqZiHqJIUSodRppqaJzigx6XqCwoylsyTVsIc=
=KKeu
-----END PGP SIGNATURE-----

--GU3/x65mZ6MFE8p3--
