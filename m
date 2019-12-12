Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B9311D1F0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfLLQKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:10:22 -0500
Received: from foss.arm.com ([217.140.110.172]:52050 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbfLLQKW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 11:10:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5435030E;
        Thu, 12 Dec 2019 08:10:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7FCC3F6CF;
        Thu, 12 Dec 2019 08:10:20 -0800 (PST)
Date:   Thu, 12 Dec 2019 16:10:19 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191212161019.GF4310@sirena.org.uk>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 06:09:18PM +0100, Marco Felsch wrote:

> so one argument more for my solution. Also we don't configure the "pad"
> to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
> function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
> Instead we tell the regulator to use _this_ GPIO e.g. for voltage
> selection so we go the other way around. My last argument why pinctrl
> isn't the correct place is that the GPIO1 can be used for
> regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
> have different states which is invalid IMHO.

Note that there's two bits to my concern - one is if we should be using
gpiolib or pinctrl, the other is what's driving the input (whichever API
it's configured through) which didn't seem to be mentioned.

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yZmoACgkQJNaLcl1U
h9Ax8Af+NzakOK4jJKQRyY0wT3cczNnHphTUSbJ1zrH7fM+0K/2I8E6301iWfElB
un6MYIjc8w5BMwLzMZ+Vjd6ZTheXHXnKeJPNNv69Fh4tUOS2vUQ2qRCtKvkLKF5q
g5xwlTsMi3sBeFJljAoDfttiTvqj5XT1BERgNNPp8MSzQ2FWvKj+rDn+kvNq//Os
Qf425pla6Go2FYVUSuauWZCQxWkqW7uDzCeDxpNurGvHhTCYNHQf8hAtkyGoGm6V
UfGnSkypXK7vDrS25gYNIuyDN1RAjGhQIhBHuU3QLzLFNa1ozZ7xtNxnl3pcFvk9
fzbFegJweraLhfQ7SYhcpiTJUZKQfA==
=pK4s
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
