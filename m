Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C400334A217
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 07:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhCZGma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 02:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhCZGmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 02:42:08 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA7BC0613AA
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 23:42:07 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h3so4196800pfr.12
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CiZdufWmsX43zn76kK4I0LUgTAWtJ0UEvoLTWSFDpmM=;
        b=NU1kY/edz0gOiDswVwgfK35qxSFz7IzVTMj8UGXOrbVB/CxdrS86+DbWc8E3mnZNms
         G34QuPs17zYi2XMNJL42CF1p4Tm4Lq214OfgofUDkh+i7ptZ1lRbt93f0z5+BRPa97EL
         tYOMBmJ95fENxqjtLyAVjQe8iKJ4J2Zp1J0Qd8tGYlq0Gd9webw9oItM4PohTr3EudcJ
         XuaOkiiuBTyva6BNtExVPMKD1BkiCpFq84eX+j1Csf93i0Ofq4qSGCHc5Wf/c1e2SmIB
         m5fv9InBGyZpqZoqB8aoiK4gp8XWcRaBEuaEq8S6JKaRoWsdz70N2BCln5kx1KlgFPkx
         FnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CiZdufWmsX43zn76kK4I0LUgTAWtJ0UEvoLTWSFDpmM=;
        b=T40m25wSaVR+0PppXnxtOT/SZc/zC1NWVAaSvenkWdc8wpJB5LRY6XCBkr35AXoTCB
         Cm/mu4wKN7Z2QW6kehTR3JVdqSwDfu/55ClRzF5QHS3ViapwwJlPyD5wfcVVT+gH61fh
         2CvAO8COobgTRNMaeXOZqLMb3crpm1/nMhqm2pzIR3s1Hzr6+2Vd5M+kW48Ti5a5GrjR
         Ccp0wjfVN+xMjTUPOui8l2McgTIHBM8TLkOYk/yLVJ5430RP6+lU3N2sP7IG7f3ADtrc
         F2gQRBV0K+TnfMniTllsFYi/IFtikJjb3IeeC8hGloKsbdvbAZMEeouGeIKh+18IClgh
         ZAkw==
X-Gm-Message-State: AOAM5329cG2Efo7c/Gf11pfaWW6hlIfnt4pxPNSsMumsto8tSwvRC8fy
        k71TkUZaYwoLaRX/jnVIyZY=
X-Google-Smtp-Source: ABdhPJyuhVNjJAXKj69qJyoYZEvTtFXHog59l1V9+Sr6ZyfDufZhcUZjviNearfIWWhGb3WP15a0sg==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr10522971pgf.254.1616740927195;
        Thu, 25 Mar 2021 23:42:07 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
        by smtp.gmail.com with ESMTPSA id gz4sm7206388pjb.0.2021.03.25.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 23:42:06 -0700 (PDT)
Date:   Fri, 26 Mar 2021 15:42:01 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Pignat <marc@pignat.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Alexandre Courbot <gnurou@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH,v2 0/1] gpio: add NCT5104D gpio driver
Message-ID: <YF2COe1ye2xk0GOG@shinobu>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
 <20170222210420.GA15290@sophia>
 <b1834c0a-52bb-56a4-5c52-dbf7a5a02dec@pignat.org>
 <CACRpkdZpCAGTfmn51rfUO-uhmrZB-nK8Ni_R8=wHiLikEBNsxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3EiaT/+c6V9Q6NBq"
Content-Disposition: inline
In-Reply-To: <CACRpkdZpCAGTfmn51rfUO-uhmrZB-nK8Ni_R8=wHiLikEBNsxA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3EiaT/+c6V9Q6NBq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 09:23:17AM +0100, Linus Walleij wrote:
> On Tue, Feb 28, 2017 at 9:14 AM Marc Pignat <marc@pignat.org> wrote:
> > On 02/22/2017 10:04 PM, William Breathitt Gray wrote:
> > > On Wed, Feb 22, 2017 at 03:52:05PM +0100, Linus Walleij wrote:
> > >> On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:
>=20
> > >> I'm not thrilled by this "plug-and-play" that seems very far from au=
todetection.
> >
> > Sure ISA driver seems a little more clean, but it seems recent kernel a=
re
> > not compiled with CONFIG_ISA_BUS_API.
>=20
> Has this changed these days so we can get this driver in using
> the proper ISA abstractions?
>=20
> Yours,
> Linus Walleij

It's been some years so I don't quite remember how we had things back
then, but at least nowadays we typically have a "select ISA_BUS_API"
line for the driver's Kconfig block. I suspect this is no longer an
issue then because CONFIG_ISA_BUS_API will be compiled along with the
drivers that select it.

William Breathitt Gray

--3EiaT/+c6V9Q6NBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmBdgiYACgkQhvpINdm7
VJIY4BAA6h0bI2fblhbHCYEUJkokxLzw8aNxmO6ntpsSdoEPyGbYQJGxjSm7j8yn
Oq+RoJ2P5KPVxOplzgbHoHEVLBntGAj06Z2wnoszL5/E8U5h3zsQYxz3xZXN8kRJ
huu6TZMGUMbvANJ7CYbGUhoNKXznVu/5YE+/th5wivoYAAxYnlE/OuUKB5kzXOKF
0WVjODuT5tSuAPisrvOA+PN2Xjj5/UnaX+Pghel+4MKnLFwFjE6Rk9OF95uKqeDa
TWSTw+b0Ldlp3bLSR/wuSVxnW9/I7VcdHirFvy7u11OsJt4W93dmGDhRktGxqBMo
ZzXR+CZoqUbwnvquGQgg0Cj4kehadjtJUn+Di3+ehX4oOYc08PeX1TXcOw6h1QS2
1bQesWXrGbmZcpWHqKRpBN/kmF/si3Y/uW4DqHpI0VeWFU8erSbSqKIdBzzvQi3h
w4ud/kZqbZcbi5/TnYehOlouEBUy+uTmKt/z6r7UtJdk9OYn6u+pcUbYLfkM6MO5
Koikmrn2lswWMJ/lP84AgmMRAqWH1WRMZeJJ81XXNPppvrP331UwdnGsSjFwS67S
FeAfBVx7ypYTd05/ROZmmD7guKa/9btlmqnzMwBWbJCIFoZ3JvMojkyhHHh+5/E9
2F6KFGkt3DUegn6U2cF8uofDRlD0J66maz8SZyUcX/7gsZc1KJU=
=pywk
-----END PGP SIGNATURE-----

--3EiaT/+c6V9Q6NBq--
