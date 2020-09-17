Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1392E26D4A1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 09:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIQHZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 03:25:57 -0400
Received: from mout.gmx.net ([212.227.15.19]:48429 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgIQHZ4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 03:25:56 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 03:25:54 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600327547;
        bh=zXWtad0JIIFPcwVYIpkWAbxd5f/Xglqob2hHG1bVTJw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=QMccrluTswFKdC4vzqLbTwsDnY5Fi6s62lnyubzZXYqReT/meO2gx6E4FPmy/yJJA
         JvhMt23jQ0tJuXIBGeA/ouC5sBW8yelnG6747VoyShStPAOoXlY3eCfyC0nTb2bIg/
         I4EiphjIC3JuzEc4SVKXdCR1osbhauOQJ0nCIYnQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.151]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1jvWjJ31tl-00Tylu; Thu, 17
 Sep 2020 09:19:40 +0200
Date:   Thu, 17 Sep 2020 09:19:32 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] ARM: dts: imx: align GPIO hog names with dtschema
Message-ID: <20200917071932.GF3306@latitude>
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline
In-Reply-To: <20200916162250.16098-9-krzk@kernel.org>
X-Provags-ID: V03:K1:YorKu7pZDQvPgwcW74yxwuNVFEWXjpKmR+QQ6aCm2kjASQe781T
 gyUNKzv6xZx4M4wwltaekmcBFF56mIMGiApidvEyvD91soIu76ecvOnAWz9Y7Rovj2sShwX
 32LYp5Gxiqo7cY8aSzhwh/VfYZsBtibMCT8gNTUvzpGI4VLobehqvbg7P5fMmCM8MgIzAmo
 8uIUIEgW8UoeyErWXINdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y7I6dMnRb2k=:ExMK8jy0Hy6akrnQXgge2U
 2lZyxPYOqgYe5iMPk/CVzt3Ndhq6ZwIhd5v/x1Jr3O2qXg3MIUPNO1Ux9omlkeRI1dDs0cpwq
 uiVy/j2hysoMJbPbx+seuo0vNWrqHwihtPYSwdW8Pm+RHzjZgew3osZUkoPbdd2PXiWaTHG7Z
 z73UNyIK8rdZzvJ7tw7VdlRA0lTwnbili5irQ4EY2bYVh66MzguQH/YhNIAZmqMZwq1599vtM
 qzDTSy0aMYYisS6Yb77Zk8z5mY2HWxStdwx7qm6YN1u6HjrEM20QlAdlVcTRWyIPTLhj7amtZ
 G/QQvb7liwYx497e8Dl6YV04JaTX2St51RBNbp5QgAgz0USJTg2yc7RRbVvm3wAAZGlmABbld
 eevwaBm/wBHFTdoni63EoMwiEr1o7qDnnhwrIp1ltq/1P7r1hmLmzlPmKRjSiRNgyaAo1CuvP
 DsXANagkKzz2eXRCFvlVVwc0bR14YGUzB4/0cwwFrMb/YzD9gC7AH8+hL+i7XkBPC8QFVM8xa
 l5NHNjlf/7dLuG84gzBXx3N4vMVaF+9DH4wTLrM5iUBcox1pWV47StAZ8IgMFtKVt9hwV3AOc
 YI/IspB3MBCDnu2duH7cSxPL2lRnvbtY8gtSGVH2qNozvrHQCG9T3iR8IO+Ukf/5lvD0LuGVi
 a3DA5+fEUD5fSeR0uzBdkhLO+IecK0A+v21ufsB0jNcFsqAYYGiFJf0Pt1frHoxULS71/RWvX
 dwQ8ryYbMvbfOiat/yp7KN/ddydSMumW+qAIA89pGfjZP/euCbkaS49uhFckQYIi38Ykyg9Nq
 mzY0RXepOxy+lLjZoAfrQMEebCpWZOsZMXBEnb3/984bh18hLHS/aOH+VW3e0NC+aba4F7HIb
 fuW0MtRh6Km8jmVh1gll0nh3eN7G7pJUZsIq/rl5KST0+PDfDHv7TyCrWuUX1VuwrASHrhpqL
 xeWxJjUUkXSLyCob548sr4MPFJH8VFV5P0ye7D4FRpwTh8CQsbetIOu99DsFY6I8xLkiP9Ie+
 s47fcWGAYUhImFnN5f/D6xpfdfbO4YF5i5vLpxIzl/VWFDQZUS9gNv4m1tou3MbksBoi/xrRO
 eQi7VpsbXG4decRCv7DSQ2undAKXwqL8ENnUW4s9ZNseawwg6plMRV0wd1N4nIE7yIq9JSDUG
 sUL5jnSLpLLLSL/oXobvW43U+HUZ8D0NHAHcpMl2DzaT+NRyv0IznCuGwtcKncpH3NyYeIJP+
 BhhZa6dk5iei0R3QeDJoJfhaW7owR7rZs5ai3rg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 06:22:50PM +0200, Krzysztof Kozlowski wrote:
> dtschema for GPIO controllers expects GPIO hogs to end with 'hog'
> prefix.

Nit: It's a suffix if it's at the end.


Thanks,
Jonathan Neusch=C3=A4fer

--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl9jDfwACgkQCDBEmo7z
X9tyrRAAil2Ws9RX5xEhOM4JTYZZs2cN+39EFsN/UxgAFfH6d5DSDAvTwsAKLVYu
fN2VXncB+EnJuFS1poUbhIHVv8UKAhd51hVXveutQjhCXRCqTRxhsTbE2NamacUZ
TMUzWwXkZbmeH3GFQ07pgxKh8SSvrqeVn95IupKHWtSIHNomGY4ZccO4iuaRlD1e
Ginacpkf107eon+YEJgoAX6CMumZbzCFM9LVyaWiT9psJQvdS9aDp26ER785IaYH
UT+9LtBrXytog7EzrJHJEMbDboewPKtJ+yMWfmP33FnqR+9MvUkt+N+d7g5H0Mkb
fUPqL0NFd01jkVWAmUOGem1baRHQlupf4hcm609RGakdHyZUB0g8MBhL6O5inUZO
/m/HkeO4Gx2Y7FR3aVfIC2sDwUzglI4fHqRdoHC+4lexbvhsBfoVZw5XHe2LmSX1
lvVW3jYfGQaiJiBhFR2nWZU2CkRm7Ur4bGBa0z6Rthv0BUYNdZ9JvOuVJRKzKl0D
deUbMLt1YdCVvELm1SbG6y0ItP9EkVJVK5cTtPr1H5PIP8zl7JdAnxkR3YOEbpxt
Hkthrhjh48Cvb5id6Xqf5O6g17rAtKqKxZGjjSLDvwxDu5tQCfSad7M3gxNIb/KV
a4eXNUuwJYhawOtgrFyjvg0jJ2PXZbfZLZqIfvhepUz5Xv9gQ94=
=n42d
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--
