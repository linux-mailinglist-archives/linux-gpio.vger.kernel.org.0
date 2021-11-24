Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFA045CDB2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 21:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhKXUQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 15:16:05 -0500
Received: from www.zeus03.de ([194.117.254.33]:41524 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235334AbhKXUQF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Nov 2021 15:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=5h+lbC2uEFO5eMdrljkXLD3H2lYi
        /fQp5F0AEsOmHOg=; b=BO8O/XK6qe/sWBWEdu/Ot0fUjaT3xqTSwXtVku349r/b
        zeDfMzbsKR/Jv33XFcElBmzoCSm8AycClDGmKce38oxcaqvbznjR6QDbrnmqu/Az
        LsqSsI9udID3nbS0QLVGxXhTFarUk8vXk/CS3XL+fcB/aLjIdpEJBqTsNDqiSYo=
Received: (qmail 1783178 invoked from network); 24 Nov 2021 21:12:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2021 21:12:53 +0100
X-UD-Smtp-Session: l3s3148p1@3q9Se47RMKogAwDPXwvgALdEH2HxEp75
Date:   Wed, 24 Nov 2021 21:12:46 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZ6cvkvdVM1Ui0Ck@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com>
 <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
 <CAMRc=McG6fn_VX7+OPXUWjX1tYozQPg1eyEz-3fJMx35DiXimg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8kTIr+wg0g78RnTl"
Content-Disposition: inline
In-Reply-To: <CAMRc=McG6fn_VX7+OPXUWjX1tYozQPg1eyEz-3fJMx35DiXimg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8kTIr+wg0g78RnTl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'd argue that debugfs isn't really the right interface for a useful
> tool that is this LA.

I have to disagree. This is a kind-of logic analyzer, it is sloppy. To
emphasize it is for debugging only, I think debugfs is the proper place
for it.

But thanks for finding it useful :)


--8kTIr+wg0g78RnTl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGenLoACgkQFA3kzBSg
KbZTHBAAl53joTubydDtvDudsOhnY1cCG3jItCrq6QwPsm4d/4gw3fsgCuZiWNKB
tuismw4Fp8Heq5krH4D7n0lWw36VzIo8UrMZeocI1LW9SV8DL9os1ZjVh5wIMKen
LEa8rjnFsOg29TKjxw5Yuo0K2td0zNQalvF51VwU21QoD++kfhYdcDJkIfT4/3GO
uafwKgudSwBzw3X71fUi4LVjEYcTHHcv00dlazfrKxYWXdib79ZF+0i/mHJPjKcr
icR26/rJ9fWa26zRyFjajq14oE+fgWGFfWkrfFfVmtX/NDR16NcbYrHItcRpi9p/
pB2tqopqoweMA3B8YV1IWypKuiYSk9AhZcAad3dXPeee+pnpW+25SgnR2vtS5pHf
eEOko+yzep/LongwLeE7qySt8k3+N7LadxRJ41o7QMbRQuTVrdZLaQTidzRpWd88
UKGQd1fQZBLnwWYLr5PTcK60LLC/oZ6SGYQe2LBwQdp6c8h0cSK7i06nm0i1/GkZ
toP5AbhvkLA6BW5Sv8ZB6ZOeDBVE/8AUkh8ZCP3Y7QVgT2cn0y218I/llOHZMdNW
XJjdACTO9A40srGu4RePqiomv5G6KDJfRX5Dd5xgOvk/rbu7HvVSDYj7Hi5onePT
WXE4ZigI3JuYx6yK50Mn8sxSOb3pn7ej61uvekUHkUgpOZxRZUw=
=VLxN
-----END PGP SIGNATURE-----

--8kTIr+wg0g78RnTl--
