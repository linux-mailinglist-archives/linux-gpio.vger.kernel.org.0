Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A59202CE7
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbgFUVNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:13:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40656 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730729AbgFUVNa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:13:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D74B91C0C0B; Sun, 21 Jun 2020 23:13:27 +0200 (CEST)
Date:   Sun, 21 Jun 2020 23:13:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200621211327.GA22512@amd>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu 2020-06-18 19:33:32, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
>=20
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
>=20
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>


> +              Pull up setings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are describe=
d as below:
> +              0: (R1, R0) =3D (0, 0) which means R1 disabled and R0 disa=
ble.

Typo =3D> disabled.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7vzXcACgkQMOfwapXb+vIqqwCglTA0lEa8VEKxU0Vujg79oJBg
HVcAnix1JziV2PtZF5QBj/5FevH3NIA3
=xAOo
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
