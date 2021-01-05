Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728DB2EB1EB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 19:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbhAER7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 12:59:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:53910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbhAER7U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Jan 2021 12:59:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB20D22525;
        Tue,  5 Jan 2021 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609869520;
        bh=EJz0/nIQziaZvn0beEGIWrbtwUlfliHpdEOzvmzQYLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TjMmAsEMvhLWauuFavU3TLVdBlf01WNMZE29TUSdG0VSmZT6UVAqHUEjtTUQwEoLx
         iFEy75LypDunskys4yvTNTb3h+I26dMZZ9S0Khu0f8yAzbH8cooRGOTdoaS6qFHDJE
         HPxgshcvjxAZ4LusbrC4nMbNbmheGlzFw8nwAy9cHwwxG1haD6WXUCF8wC5uQflapc
         hT/TjvA04h7hqD/0K2kV9jZoPs+kSrFuOhKYPMssZZ9f0KwEzs9i/E5aL6G5+kDlKc
         7rOktSYm6rHXQfZYd9e7vs5HvCYIXgQ+AExLPoJeLK2yEiusqCTWw2eNxNltNfcsfL
         VKtOjb7YaTKOg==
Date:   Tue, 5 Jan 2021 17:58:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 05/12] regulator: bd9571mwv: Add BD9574MWF support
Message-ID: <20210105175812.GI4487@sirena.org.uk>
References: <1608888807-3117-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608888807-3117-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline
In-Reply-To: <1608888807-3117-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 25, 2020 at 06:33:20PM +0900, Yoshihiro Shimoda wrote:
> Add support for BD9574MWF which is similar chip with BD9571MWV.
> Note that we don't support voltage rails VD{09,18,25,33} by this
> driver on BD9574. The VD09 voltage could be read from PMIC but that
> is not supported by this commit.

Acked-by: Mark Brown <broonie@kernel.org>

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/0qLMACgkQJNaLcl1U
h9C8BQf/Z6e1brXkNCdk8ymaTUdOduDquKXG5scRDwDEypJIExDKZhQ9Mc5lLQ0a
80WFJzic49FEV5A2TV0U6paWW/MFrotJTYhxwIF7BlqADHKhEjjnfJaDhDRWHAH7
08trjF1yYI9u2rZVWqppfDdoaiA6PTPer367elwFenED7+36sOYCKsHOhGxtQtfh
7r0qRDMa+Ui0rj7t7Ez6bUNk1M1SlvXKVxTWUVBCWfwfVhPoiMtbVsvRPYHY2B2d
gzC2nwyMFHv+h3B6A35AsraqweVFGgP19eRIm+PuSqp6wY56TvnvP90MwE2sVVCA
yO6NuUnmj3136EE447cX3vNrHbUpnQ==
=3qVe
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--
