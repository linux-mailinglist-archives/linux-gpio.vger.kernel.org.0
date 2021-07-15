Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBE33CA16A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 17:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237791AbhGOP1g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 11:27:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231438AbhGOP1g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Jul 2021 11:27:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C91260FF4;
        Thu, 15 Jul 2021 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626362683;
        bh=Ey2CvB65wW2JyRx6EZjidCehPj5wJfTrxxVY1iQuBIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kxcOFVOCAFPQ/xwAphqCKkbT6lfTgQLqsq/YcNssRqLLE02pBlbmZuRt75YpLSF4s
         q22yGcicEc6s25R8Ha+uLH1XJk8X3/JnGxIvmuAoUAsfK72PaBrzyu8j6/thXzE9zQ
         kfQ7aJ4BsZwOteOZNc5jd46IllpI0vhwjFA5hQI5gLZvtdLJBgcLTeS/7NFwQ+JCwj
         gZUdTWJgXie1YITY0/l570BrIy6ydvNR9H07oUDIVp2+ndydgR671cBGczD5EjjRTS
         C3YVMkPSJ+wqfmL6DCFiSbBrpU8q25EoUekxcNqZkAYdOutcvEDKinsJ4lrfgOBi1g
         1Ljex+NxZDggg==
Date:   Thu, 15 Jul 2021 16:24:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
Message-ID: <20210715152405.GA27092@sirena.org.uk>
References: <20210715151625.394960-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210715151625.394960-1-linus.walleij@linaro.org>
X-Cookie: The world is not octal despite DEC.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 15, 2021 at 05:16:25PM +0200, Linus Walleij wrote:
> The Tosa device (Sharp SL-6000) has a mishmash driver set-up
> for the Toshiba TC6393xb MFD that includes a battery charger
> and touchscreen and has some kind of relationship to the SoC
> sound driver for the AC97 codec. Other devices define a chip
> like this but seem only half-implemented, not really handling
> battery charging etc.

Acked-by: Mark Brown <broonie@kernel.org>

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDwUxQACgkQJNaLcl1U
h9Bo9gf/aWENOMI5QOYgfdAa5atNN6V0rj0B49t/uOksgP039uH/WU/o63WoI7+W
ZfhYwo2d3a1a17s46Kz4yNAq76SW0BjWl58qq3UtousmaXzQtpU4S1tuymDrQjoC
9gVdAodVsJKwfXyGqULJ+uZoE7VRb9dqA+qAp47B9aNzEUUGzr9dokaw9DNR/7sT
rJA2hvpDfhkfpUop5zzWqkCleUkoJ7HACtOVMo82BOrO8GGh5hIqr9PpAQ+BBcn1
X8kozPccUISaI3iE+zmrAarJ29pxfNi/HzTFUg9vtsWgHs3Uc8D6k3uyuxTuwk9g
KXe4LUqy3datyGDbXhl1ym2xQkXlIQ==
=ictz
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
