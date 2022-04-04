Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325204F188E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 17:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358657AbiDDPjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 11:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243990AbiDDPjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 11:39:18 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CDC3A5FB
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=QO5zREPS/CNnnQH/u2792fTIoOsw
        Qd0PoZ+Q5Dqead4=; b=Aq1g2MkS1smtqxDbzjUnYia9S2Y8IVACe5RZXESK2W3S
        fqBn3eQ1VppKPtB71OiJbEDmaECWsS+4kMRFPXSnAes3127Geux2qloDhS5W7dij
        9p+gRYqRBVvJNcO8iOsxl5B1WjNKhOCX2ZiFtw+9EzT5YbgumylewkHRFjsAqCM=
Received: (qmail 1927434 invoked from network); 4 Apr 2022 17:37:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 17:37:17 +0200
X-UD-Smtp-Session: l3s3148p1@gvov59XbbKkgAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 17:37:16 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: rcar: Add R-Car Gen4 support
Message-ID: <YksQrMiBQODflWRp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1649085875.git.geert+renesas@glider.be>
 <9ee064071b7d9b06df471e981cc6123ff19fead9.1649085875.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UdGosCephGessIbj"
Content-Disposition: inline
In-Reply-To: <9ee064071b7d9b06df471e981cc6123ff19fead9.1649085875.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UdGosCephGessIbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 05:29:49PM +0200, Geert Uytterhoeven wrote:
> R-Car V3U (R8A779A0) was the first member of the R-Car Gen4 family.
> Generalize the support for R-Car V3U to other SoCs in the R-Car Gen4
> family by adding a family-specific compatible value.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--UdGosCephGessIbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJLEKwACgkQFA3kzBSg
KbZXFg//R4Ru+llw3530+xpN3o/SZVYoNl5aJydikpER4RinQbGyMDTtoOdsOLZL
xmuDfV2+OVpEW7ATpYZMbtMSird+1Co14fWvQUMQ8u+BqR84TKRnUUhAoq8nelTu
gGySBezy+skFFvupJGCLlV7dzZKYKPDz4C7WQLbLYhJFQP50WY473QfXK3iK5MnR
B8xzWcdDWFFPke5sVeUaujYjb7JmmLlr7dxPTY0+ob0VNqwG2pMcbMthNHj9L6gs
Jz3YX5B218dxg5Ki3xboHkSg1Qc34gnejvImZca7WDIRBIvhe+un/6Ypbf5AyW/4
rIYkkppJQY1oQB57nMyAc+sBVfPfJ8HoioiedDwYAp7WwWuPH7SdqL1JBIktmq8x
nuqLUJwkMCLAY+NneDDURzfOMCZOM0Zg+mnYHlx4VR1ENwkM1YSMaBCJNzkKGd4T
JkhO14EpkNsD0312a/mAJvspdazI0IevMjbor5Tahc0sL6mtIEQBq5sPvHxSDs/8
5kvxz/Yd94gqE91RAvkuc1maesFXQhtYzHorY9bdjJJob5MqGCJDQeKZ2/jn42Y+
BQP8V0BllGySo8xWgBiPfxCUpwV8PNKU8FF8SR40SehjAgoU5DLEqeodaRWK4ULr
qrqakpRHgl2uHVMDhBUc3R0PpvzWgBAynF0BllJ6dUpCFhe/E5I=
=tV+5
-----END PGP SIGNATURE-----

--UdGosCephGessIbj--
