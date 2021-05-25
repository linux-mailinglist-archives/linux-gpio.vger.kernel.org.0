Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15638FD5A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhEYJFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 05:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:45642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhEYJFL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 05:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB3A2613F7;
        Tue, 25 May 2021 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621933422;
        bh=REyNORGfAxSeIaU9THUqQrLTEFZLcDHWp7MLn3Mg0Dk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+X+txtMXe2Cezy7uAjCLBxK9R85dt3GBFQTenZ3vykwhKz13tOxyqfvjwyVWI0TU
         rwhbEbijOnypIIPF/EOqAP2QB4xnvUL0nzFQofDt/FGN2geS1bBqkq0uaAADOzRzg4
         qsXYyV4rVUM1ox+sU4btihidIWe9xzYDARf/odiWYGo+dDOsGkD5pIBwwaz9CIYZbt
         i4+1TnzGnQ5F/MBfAmxHYJXNeIq7HMYPwAHbH3rVgSbbU4n+g9aTN0etfpZe0vlJgt
         9R396EPpmlGavfq8lRSRfONpdSK/QIkAuLxA6cElbmgYzt8JCXE7OZzw5DgyvfPr63
         2ZQCsntGHI1nA==
Date:   Tue, 25 May 2021 11:03:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 09/12] pinctrl: renesas: r8a7794: Add bias pinconf support
Message-ID: <YKy9Z1JKxexcrr8D@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <cover.1619785375.git.geert+renesas@glider.be>
 <f78da2ba937ce98ae9196f4ee54149a5214fd545.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cwnO65bnqa+SMNQs"
Content-Disposition: inline
In-Reply-To: <f78da2ba937ce98ae9196f4ee54149a5214fd545.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cwnO65bnqa+SMNQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 02:31:08PM +0200, Geert Uytterhoeven wrote:
> Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
> handling for R-Car E2 and RZ/G1E SoCs, using the common R-Car bias
> handling.
>=20
> Note that on RZ/G1E, the "ASEBRK#/ACK" pin is called "ACK", but the code
> doesn't handle that naming difference.  Hence users should use the R-Car
> naming in DTS files.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested on my Alt board with SW2 switches (DTS addition soon to be sent):

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--cwnO65bnqa+SMNQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCsvWIACgkQFA3kzBSg
Kba8Ig//Rrt7raksICqZJonKRNpeBzlO+wgNIBimQzq9uKPVcm2MI/dqolYt8gCd
X9AsISxFxy4G6iJMHviF8BuAUByPEGL7dcZ1YbOl0IIJrqH+i1VxcYNExSMxLMq1
lP6sScqYYB7pXRlUNGAdF4lARd7ZQOUgGKVcsrVHtGujHwamsZZr3K54OnKwSZUu
z9P+Spw3hmXgtmczoigD1ot6ofkcuXIGaS43921oQTc+QDY+Eou2/1qCO+VHnzD0
NfZVBL8DjglXC5xmyqnN97gcsehREmCe500K6ulf4f/IFyeq0jKXaD40uErVs3YJ
geuRmSchyO27CBErzV18JYj9qJgqqzjByLpzSXJ2vvh5DNEUnZ22IIILXvTA9LoM
JJrmQc+UDoh/tfpw4gFCvPFzKx51txnZrHlFsZ6iF/VBoFQkDjkp8cYXpqg/PGy8
CIdvL/sSJF1MSRxZSeeU9GBly9pFcmd7MZB5hQgRiUeJuF9S/Mnnc7+XCzTYiIyv
nDRIo42CjyuXPZX4o9OYrRGq9MixfPUdKXLiJSFPsvfDA4Y9mbSY+p9p3C2073BW
BruxmlCmTgLmO3zMjCzJ3CXU+DOEOr5VixossjQ7PT3eDIIr4ceEyX2QdemYsqFl
0D632EtvIyigqIhMC4i6MflfokFB4ZNMUnWEYDzgbQxjSssasUs=
=brvR
-----END PGP SIGNATURE-----

--cwnO65bnqa+SMNQs--
