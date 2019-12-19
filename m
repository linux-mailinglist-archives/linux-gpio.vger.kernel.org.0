Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8A41262CE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfLSNCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:02:19 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54424 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfLSNCS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:02:18 -0500
Received: by mail-wm1-f66.google.com with SMTP id b19so5337637wmj.4;
        Thu, 19 Dec 2019 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=okuPUIyHHPxQ7OWLIYuoTdlLR46yS3KFSDODbIAwh5g=;
        b=lDU8pRm12TPnLlZn6PZCWYB9UU8gml0kVNpg28ei+O/3LWOtI8x3wxzxIvg+kH0qJb
         m5pOxMijUEgUd5K2bkWpIaVBNYU3Hd5lM6GdBbE9XeKsDshM5JnPJY3R5bQP9HqaItKi
         A27ztnoE67q3uGBweMa4pxVdmjjTVQuZiaiDGUb5oQqEJhXopcNR6nuiWQ2gzv+s9usl
         lv05iUI9nIXsnBSM1q3nyVtWmZQ3+F6oBK7+wua6efbj5V8Mawoilk73UefzqePsEOrA
         FWJNflNA9r2PB7VDTYECRMW4qTAMyS4gaYYdHRRhv0ZyM1ogcS/SgUJmOGuIkEqC1Xs5
         usfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=okuPUIyHHPxQ7OWLIYuoTdlLR46yS3KFSDODbIAwh5g=;
        b=ch4lIvTX1vhTJiYjwiqUFR5q18wIyaOvxlwKPxAnctVaRnBZ0vnPNcGYnNfEv828fv
         beVbkUz+NLyrNVXGEW4aJfpsQZXfwFFySG8mPlstx0axw+No0veTm20Ycj3OM3huyOZm
         ZwsXSv2QIoiA4rdzwxwmYKGCOwzseZG/gZPARSJ6BBXq1Yxhd7K1fLEMh4oIoBLvYGRq
         gHW2zVR0Plu8xDBIh0Pr9DdMavTM12BHVG8fP5PmG2qURo19ND8E48W/hwRh4/L6HU4x
         bJ+9PSBOGCY2nIoqu9n4xgVc3zYc5/gIRuv5xmPpqCXowgVHvQYtn23iUSowSiZhNm83
         UwIQ==
X-Gm-Message-State: APjAAAU6sKCFDt1ScIzgID60b6fL/p/BxjekWMGpR3NeFT93MZoeUbmV
        EGoBSErvOFr8mfP1SPKDvGI=
X-Google-Smtp-Source: APXvYqx1wHpOv/1/buQ5Fd+qhQMtmiuM0pARXR/8JiOMgg4TdC45IRYzRWErWKUpJPKWDZn0k6uL6g==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr9518756wml.115.1576760536521;
        Thu, 19 Dec 2019 05:02:16 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c2sm6422895wrp.46.2019.12.19.05.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 05:02:14 -0800 (PST)
Date:   Thu, 19 Dec 2019 14:02:13 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tegra: fix missing __iomem in suspend/resume
Message-ID: <20191219130213.GF1440537@ulmo>
References: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline
In-Reply-To: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 11:04:56AM +0000, Ben Dooks (Codethink) wrote:
> The functions should have __iomem on the register pointer
> so add that to silence the following sparse warnings:
>=20
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22: warning: incorrect type in =
assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    expected unsigned int [u=
sertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    got void [noderef] <asn:=
2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42: warning: incorrect type in =
argument 1 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    expected void const vola=
tile [noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    got unsigned int [userty=
pe] *
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22: warning: incorrect type in =
assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    expected unsigned int [u=
sertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    got void [noderef] <asn:=
2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25: warning: incorrect type in =
argument 2 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    expected void volatile [=
noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    got unsigned int [userty=
pe] *
>=20
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37dNUACgkQ3SOs138+
s6GZJw//aFS8hSpfqd0GKaC9F+4SGGrGqYE/8A2zRfODoBZV/3f68xpTz18WWY/4
hKXVSJ9P7ue0bqj86a1z7zo539MSMXMyc1ggDm/Ei4oZKPn35dDuKMWvgn/1fvHg
1Hndi0XB5grLBsmHslkdblqa/YQsa6Zynlcu4rL52L2vxhdtf3NwzuIyoC6kJ4cb
Jd1R/77EPPKMqY3mbim85igwrjCIzOwRBwYEvKm/TcLA3yKgA58VRlFnpckjeR5D
4BshsbHOlqhm9En2+nzHd3KPPoxg0uKpxGKt3u22EdELQJdE8/oHNIAF6MguqXVF
8J/4FnQJiiBLyLHbbjHFP25CG1oKKzXDf0KIXgMbcN0UnW9qfPBdHMSMVaNLSGwb
EcUSTFMnLOTBwWN/eei/YIGgtoDrkLeuZHiDFuYIB0Fu/O56/hCwfGC1oGcKHA1T
URtLflt2899mufGyqS8tzJxOA2hriVnWGAg9WwxFZr9lgELIFOQKJI/w/EjeUlLm
B1ZOgQufW4mwBUDBgMgBeUnqI3ehDhaiuf33qxw42qsE4ubVXp22lMgcNKHAWz9/
WLsF+k9LLXjeaGavze+gOeQHarD7Jg1WRgURswzoV+nIK/eMIf36C+88QOl0rX4f
tQwQHC2gN4SJphBtJr1mqG9MVRlHj1eZrXQAx/2ewfA1G9ciizg=
=Ssbm
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
