Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3982EB1E4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 18:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbhAER7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 12:59:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbhAER7C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Jan 2021 12:59:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1718F224F4;
        Tue,  5 Jan 2021 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609869501;
        bh=59oP12n/BNrHO8k+nxHOMSQJXJo1QRsvZOX/099OoKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JcJ3Vm/43JFcgJQhr9VIaoOqvzeiCWYCHpNXn4KJKqmdpufTzOOnPQotoxk+frLV/
         NXo2K97opSJFdpxxEaMgv6G8rPMEiC51HCBS5i5C3Ow5GsHcCvazMFcALhzayUZmJk
         cXgfRG1wlvlQ/UewtyzeQUlJs0OFHEoq53wtnM3yUW/MU6f658rEWln1lSkuuo6w1y
         fCifCJoQRnrM/cFNZsvXPqMSnHH1OZrHF9KcvKyyo1AwXACHZFcxb/8GY5BrK7WgTm
         ZWz6Dqx/ZuhYRlMyaW3cShJjdl/wer++ZorvBdPbkVPICOvMEiBaAZYqraGTSAZS/v
         IwESTUfZn5kDA==
Date:   Tue, 5 Jan 2021 17:57:53 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 04/12] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Message-ID: <20210105175753.GH4487@sirena.org.uk>
References: <1608888807-3117-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608888807-3117-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8sldprk+5E/pDEv"
Content-Disposition: inline
In-Reply-To: <1608888807-3117-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 25, 2020 at 06:33:19PM +0900, Yoshihiro Shimoda wrote:
> To simplify this driver, use dev_get_regmap() and
> rid of using struct bd9571mwv.

Acked-by: Mark Brown <broonie@kernel.org>

--a8sldprk+5E/pDEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/0qKEACgkQJNaLcl1U
h9C1BggAg3Jsv5HvsvqISeSDxNyzIZTxbwLMD2dW11mMR7Sn0j3okz7htm09g9jr
Lkj8eukDgKq/8G8vRpsawksxgL92EL4XMbKrms3zC3Zu2GMvx3EpWC8Fx+murKW5
Xyxqb/cIJ5dH8wjlM1Cy+BCgRXfyPQPk4LDuCalx+JB7wtw8b4xR0gfCm+X9ci+T
KkOtWODsnU1bcf/M/qDibj81xkbFRHkQeptS6RApE9hS1W2nK3c/QfueM9NNhsT6
YGt2G+aD9IoqiwNyLP4Hs/4gEQ5BWO8GGwdDWa/JxtviAKiHwn+uRCFKQDjh/HTu
dnIS+BOQ+IGV/X1IZVNai2SOaUSXCw==
=HBGd
-----END PGP SIGNATURE-----

--a8sldprk+5E/pDEv--
