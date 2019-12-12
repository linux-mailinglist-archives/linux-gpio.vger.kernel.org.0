Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFE911D2BE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbfLLQv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:51:28 -0500
Received: from foss.arm.com ([217.140.110.172]:53290 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729804AbfLLQv1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 11:51:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3E3630E;
        Thu, 12 Dec 2019 08:51:26 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 431F63F6CF;
        Thu, 12 Dec 2019 08:51:26 -0800 (PST)
Date:   Thu, 12 Dec 2019 16:51:24 +0000
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
Message-ID: <20191212165124.GJ4310@sirena.org.uk>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline
In-Reply-To: <20191212162152.5uu3feacduetysq7@pengutronix.de>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 05:21:53PM +0100, Marco Felsch wrote:

> "... what's driving the input ..":
> Sorry I didn't get you here. What did you mean? The input is driven by
> the host. This can be any gpio line and in my case it is a gpio line
> driven by the soc-hw during a suspend operation.

Something needs to say what that thing is, especially if it's runtime
controllable.  In your case from the point of view of software there is
actually no enable control so we shouldn't be providing an enable
operation to the framework.

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ycAwACgkQJNaLcl1U
h9B0+Af/VqUSeJpE19kobOJNyxukShzWkjvn9zBGGTGch6WlXuTTNWPT3to6NmBZ
h9MnIKzpjLfRlv6iAlnWJRxzMh5yeAZv7BBOwdqpO+pLwsJ/xcTpcT8IEqioaIYx
Vgq3TQKDv5I9NJoz33MUu6RZ/FwFcPx7rF+9Hs/O43gAjeQy4EW4o25ZTqSJivZe
BXocX/5YTPwTuFBpYbLLvu0YX/joFGU50yiN3IcMPUMWkf8My0aSD5FjWZDTZD07
+KMKZi5qHkLZ1icKON2BhiYDMNH69+ormalcBZMrXiS7rVeoIGQ+d4ox2l+Osieq
J3w1vPOljnw05pXWu43tWEgA2h9ung==
=OQvA
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--
