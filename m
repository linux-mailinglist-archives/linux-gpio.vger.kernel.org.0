Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6DF3A8412
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 17:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhFOPhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 11:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230487AbhFOPhY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 11:37:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF32161628;
        Tue, 15 Jun 2021 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623771320;
        bh=bdX3AMbWyhVXruwbjaE34McyzOJL3Jr1GERY0z/RZPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ujZRxkUwNxdzF/KNfASkyHO1e+H5Uz79J4oyEmegDARkcl5tofoaqTxfYyHFo/Wx5
         UHPDwxKWflhSY2zWNCq9IaPGZsR3yI8HmJU4T1W2ChraltN2nryH0FYTbkoeNHhb/C
         QYfx4xgi6WovLBGxFWoHPMT/VBdYk42F1A3dTd0zRP2FjsrqUhl0BUQa7mmKfBZJFF
         XhtcaHvdI0tZcTxuvCpnj30yPXeDy0Ffc8bHuAr4TQsL/7YZCd/H3HdWCzkqOeVGk3
         CksOX0csLNvG83ogAAeqLDQ+pM3WPopARszbL2jAr5fgs27pwPeNcJBpSj3xNKFcaQ
         xYX91CtocSb7Q==
Date:   Tue, 15 Jun 2021 16:35:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 06/10] regulator: qcom-rpmh: Add new regulator found
 on SA8155p adp board
Message-ID: <20210615153501.GK5149@sirena.org.uk>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-7-bhupesh.sharma@linaro.org>
 <20210615111228.GB5149@sirena.org.uk>
 <CAH=2NtwAsvU9x3pTKdf2e5YAG7N9=uT4EQZ9aPWp26THXntdNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1y1tiN5hVw5cPBDe"
Content-Disposition: inline
In-Reply-To: <CAH=2NtwAsvU9x3pTKdf2e5YAG7N9=uT4EQZ9aPWp26THXntdNw@mail.gmail.com>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1y1tiN5hVw5cPBDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 08:08:38PM +0530, Bhupesh Sharma wrote:
> On Tue, 15 Jun 2021 at 16:42, Mark Brown <broonie@kernel.org> wrote:

> > This is adding a new compatible so it needs a matching update to the DT
> > binding.

> Yes, [PATCH v2 01/10] from this series 'dt-bindings: qcom:
> rpmh-regulator: Add compatible for SA8155p-adp board pmic', updates
> the dt-binding with the new compatible.

> Please let me know if I am missing something here.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--1y1tiN5hVw5cPBDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIyKUACgkQJNaLcl1U
h9CG0gf7BGrgHg/iW6D07GqPzhY1z1FAk1LIWWMOa8ljQTOxEVfYStEA0o24Jm6u
YspeL71jHas7z5tG/tt0OkeynuVl2E/KoS7Dsea3rPcXOVAlA0hqi/pgyss5EwMv
YFascZLDFcLLrGH9lqsf98XH4TV04dG129M0SremQYo6dYqBXTiiUhO8NDFca2Ik
nH7czC8zijyGudCgkTJnFtuzghszMZ/GVoxgQt0wZtG5sLdgH4BxVtD+GM0Cly0s
uxSNISYqna5CaDutBbudjyi3lumRZYIHM+CQqWTVeFBKMysbcghj6Mh7eQuHNcfP
AUfbTM5GtQBRGcuhoC01fUXT+N1mgw==
=4ZR0
-----END PGP SIGNATURE-----

--1y1tiN5hVw5cPBDe--
