Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDEE2ADD3F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 18:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbgKJRog (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 12:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJRog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 12:44:36 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485BEC0613D1;
        Tue, 10 Nov 2020 09:44:36 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c9so3975634wml.5;
        Tue, 10 Nov 2020 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6B8wjHoaVW72XtAVUWe2wZEGfXfDpa4klG93o01JXig=;
        b=Uvb7p+HSKcUHjRh+IvER/W3ypNASLoZWNd6grwVTGkEVqksXLPBOuqNvCNf9FXwvJN
         yXHUPecdTwXH+LdCkC6gLyvYBtNDyR/t3hH7Y0QgwFopQisHL2GjVDeOyimnhXN6eBlH
         ckFSn+omctg7snuH+AMR6cRaE1RhE8GN37bCh5eMfBl1EkupKVEGvtH47stZm1XElDC4
         B/s3UNRS5/D9t5UYF2YlqrXRYaTsftYdUdskHdVeON9xjXwU48FNf+uuX1mXcR+l1juM
         rK+gIdwWLw53QiDTDTAb5ysVkAq/GBAl2nuNY/vPKJ3A8fdaTurd8r6R+9Bc6ZcIPVO4
         WRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6B8wjHoaVW72XtAVUWe2wZEGfXfDpa4klG93o01JXig=;
        b=FzrhFhJ+Tx/8ljeEBlOANXduRYNAqga/NzvxQE5aJ5vJQCHPy3CtlksIOAq0+JVg9V
         805PbjtF3OqOeP7sG0Uibanqc3dQKkxeFI1FnT65MWcdk94W1V60WnpMzCFydu/Ayjdn
         5uu5hlfGOPP4fdinNtouDSuIkWJEi7uD8l+27ZgQ94bNYxmV8zyCk2YKr8jwEdlUP3Ow
         KZ9t5Gx+wvtvYn5sI1WGq2IfSMf5Z0WTd21YhSgX0haTcDJO0FNE0flscxDwgC8bcHHJ
         YKPhHpctuGvLnBi9sX/WDx+iG6Kon59Cowlc5HD4Cx8SRXYxOZ71nVIcseIbgL3+ryKJ
         /Qew==
X-Gm-Message-State: AOAM532BeBwxYqynrkiWu6h4r5Y2lrLA/MRBzzVOqF9aXHi75k6f12Mo
        UfIXdcojTA+s9jnXG+mA/no=
X-Google-Smtp-Source: ABdhPJyS1xufnh3qBP9Gnc2AXQ0TUdtpLaeYMga7vvxYO9uMYuHlcQgJtcXEZGynqcG8mIgPkT93YQ==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr229504wme.51.1605030275015;
        Tue, 10 Nov 2020 09:44:35 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q7sm17573896wrg.95.2020.11.10.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:44:34 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:44:32 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     robh+dt@kernel.org, jonathanh@nvidia.com, jckuo@nvidia.com,
        kyarlagadda@nvidia.com, lorenzo.pieralisi@arm.com,
        amurray@thegoodpenguin.co.uk, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: Fix entry name for I/O High Voltage
 property
Message-ID: <20201110174432.GF2297135@ulmo>
References: <20201026063902.14744-1-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline
In-Reply-To: <20201026063902.14744-1-vidyas@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 12:09:01PM +0530, Vidya Sagar wrote:
> Correct the name of the I/O High Voltage Property from
> 'nvidia,io-high-voltage' to 'nvidia,io-hv'.
>=20
> Fixes: 2585a584f844 ("pinctrl: Add Tegra194 pinctrl DT bindings")
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  .../devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks.

Thierry

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q0YAACgkQ3SOs138+
s6Et1A/+PB1xRpHesNfSuidBntCGoacEg55fAqa+2ElNGdMixsiSP6srYBogQOdE
pnXgC9qTrAwYOJeTYOao4De56/Wm+eospIjjZIeXsVyMe02tPeR8vNaEQCy9mAA4
XmXE8BefEos5ZRZ+qDzjj5BW7+fTNedkm94KDj5coR7T3VjvrteVamGP0A8+DEAk
J0q/tALx0x5A5CXsBLRAtRnbdEmFWR15GAvIYIQLqTGvyFGXrnQNKjI3U0g8PwrJ
8Bp61grVQeGQvWvYHQcF0/mlSYnLhPQPhhwm9SB1Of5wcqD3Z8L1/NeZ2/8O6PRF
GaCBK7xs2re4P/B/G+EaKttYLlfy9GxGRljZWFf+QHT3Fi5zvgtHWB3qb9zSH+Op
KAtmBsamKOczJTIkdo9qkkC2c8/GG010iXNY0Xs+FG3kdUM8p/oxm0tlDthXSLQI
ChdWfKOWNpOP9U+iM9Qo2zgVbYmm40ADm0cIiIIzP3Er+1GTvgfgtpyFUmB/l6cc
TAKgoNJuMLXTCGQ+LED9JYg6HITtYihAJUUe9gELjWbEGmoMU71I+NSspPUV5lDb
pYwU8UPBQ2CS8VdsnOYn06E8xF5lbTysqoxpqezeaRMPN9AS46+QMSmjsdulBgjs
9DkyOKYomXnWgLFcYOzQNNSOuesAKkFJwyVi0Xvut0a2FwAONpA=
=e8Li
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
