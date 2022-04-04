Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8944F1894
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 17:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378619AbiDDPkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 11:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378622AbiDDPke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 11:40:34 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C592ADE
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=P3Xkbw3h/b/muryEkLbV1RE6cXc0
        /+RMxN1HAD9qeqY=; b=gV25l+sNd9IBjBiD630K155ecSGTcbLt/ZHbNcp9HjfT
        ZX6TwEmRJjQxyRwN/TQTL8V0BV2MMn4N1J7JjyfN5CTHSrh2ml3NcRuTferl5yCK
        GbShdVMITM9gsWWMMLIssX3Zu9HZsE64iK7DowP8Soer1/WewVW25gz5ruHz6Xg=
Received: (qmail 1927704 invoked from network); 4 Apr 2022 17:38:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 17:38:35 +0200
X-UD-Smtp-Session: l3s3148p1@XCPW69XbbqkgAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 17:38:34 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: renesas,rcar-gpio: Add
 r8a779f0 support
Message-ID: <YksQ+tB4nHIvieyn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1649085875.git.geert+renesas@glider.be>
 <fb9dacf4c4e656355795f1086ea21376ea34a9eb.1649085875.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AUpOxihWUZJvYD8a"
Content-Disposition: inline
In-Reply-To: <fb9dacf4c4e656355795f1086ea21376ea34a9eb.1649085875.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--AUpOxihWUZJvYD8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 05:29:48PM +0200, Geert Uytterhoeven wrote:
> Document support for the GPIO controller blocks in the Renesas R-Car
> S4-8 (R8A779F0) SoC, including a new family-specific compatible value
> for the R-Car Gen4 family.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--AUpOxihWUZJvYD8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJLEPoACgkQFA3kzBSg
Kbb2EA/+MeTaXnji0GYRaLRkpzh6fB66/HYWFntDnZMWOGCx42TQXA7b4hfBdito
cezwcULsR2RDmcV3eNbOUwA2cdIlZIOVmUy00k12K7otvJvcWubOONV3g1VnvbJM
LUAbjKqKZmwJaLwA/095pcmXCzn7KYSJfOPXIc5e5/IUwBJD8WZ8gUWi7sXxoN0p
3VuQQF7nd/xOhd6P876xa+asP+Xwk3yDRIikSA0EfRbFT/MC5Dk7ZI5HvJf/q0Qr
hgyyFO1LauTMMBxUSWeMU31gfxb2nI27uZlquDJ0NyS3OzPpDtLsra0zG3/344R9
YCvLJcImDoWpI+5476cOVoQqULvgxF8YfOj+LibPZs22rb5P9b7ZQuh/nFItnsMA
hZibMYNDrynWaJckxLatBhnFo6wtq+ECBW82SasSXkeITRlwRSnJ8KxtQB2bWnmg
He2S3QgWv4bU1cNQtBGn8LoRh3L+112sTmZAYrBF6WyoU6scaBkM6DwVBxFalMUS
v8eSF99CX4NHaRGaNEK3nH68EuCSO60XmUiVJiWKNUiUrRyF0ddVfFrwpCL6QfPF
d3pHXAZhtjMejM2gu7QfkfAgJ+ku4REacpE/6EKTKuyBM08oSx02Vwo9b44A63kZ
u4Icxop/nvprLfNkduDlT/MmmOY6UqDR/8rtbv/f5SmFHwvEL10=
=SQn1
-----END PGP SIGNATURE-----

--AUpOxihWUZJvYD8a--
