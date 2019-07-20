Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 071946EEBD
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfGTJoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 05:44:04 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47809 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfGTJoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 05:44:04 -0400
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E1E72200002;
        Sat, 20 Jul 2019 09:44:01 +0000 (UTC)
Date:   Sat, 20 Jul 2019 11:44:01 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/8] dt-bindings: clk: sunxi-ccu: add compatible
 string for V3 CCU
Message-ID: <20190720094401.rdx5breuvjb4gvp6@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="osywhxx3mepoorol"
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-4-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--osywhxx3mepoorol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:29AM +0800, Icenowy Zheng wrote:
> Despite Allwinner V3 and V3s shares the same die, one peripheral (I2S)
> is only available on V3, and thus the clocks is not declared for V3s
> CCU.
>
> Add a V3 CCU compatible string to the binding to prepare for a CCU
> driver that provide I2S clock on V3, but not on V3s.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Rob Herring <robh@kernel.org>

Queued for 5.4, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--osywhxx3mepoorol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLiYAAKCRDj7w1vZxhR
xT8iAP9PgNA6a4FclZagDfDG0HI7h+CTux3t0n9LdDM5AFTVJgEA5Y+LmaQTX59Y
bLQb+rAdZTWg+rFyUkgxaqPisf1yWww=
=RXY8
-----END PGP SIGNATURE-----

--osywhxx3mepoorol--
