Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED485066B5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 10:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244786AbiDSIST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 04:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349900AbiDSISL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 04:18:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28A1344C2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=4d/2xkCKnDT6wxv3Hyep4qQ9eKD8
        I2rpVGPmVbyHRtE=; b=CYltEme0LKKdqqrt+uFvnntN0iC/WeTF3qHPVsgicvz9
        ivw6Eq/VcrR9iPu00RK6r4Tes3Qvbl3g95vME/4sHj+dDpZuuSGk8rfatuKM+A7c
        VnSUeCNIfdYcmU42tFrncg+za0e/V7ok6crqleNx0Y9LEqLniRoyduwYg1IpYs4=
Received: (qmail 3573551 invoked from network); 19 Apr 2022 10:14:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Apr 2022 10:14:15 +0200
X-UD-Smtp-Session: l3s3148p1@JMI1dv3cSt8gAQnoAFIOAGKYjQtAOHeP
Date:   Tue, 19 Apr 2022 10:14:11 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: renesas: checker: Rework drive and bias pin
 iteration
Message-ID: <Yl5vU62IxRpBbtk9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <5051ae56a1388ccf2d283dfc9624de2991cce914.1650355619.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l1J6pPreQKGqEpKK"
Content-Disposition: inline
In-Reply-To: <5051ae56a1388ccf2d283dfc9624de2991cce914.1650355619.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--l1J6pPreQKGqEpKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 10:08:32AM +0200, Geert Uytterhoeven wrote:
> The checker code to iterate over all drive strength and bias register
> description items is cumbersome, due to the repeated calculation of
> indices, and the use of hardcoded array sizes.  The latter was done
> under the assumption they would never need to be changed, which turned
> out to be false.
>=20
> Increase readability by introducing helper macros to access drive
> strength and bias register description items.
> Increase maintainability by replacing hardcoded numbers by array sizes
> calculated at compile-time.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yay, no hardcoded maximum anymore and much better to read. Win-win!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--l1J6pPreQKGqEpKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJeb08ACgkQFA3kzBSg
KbYQug/+Ia0W/lEh64M/WlpavY/5tUc0DBdYdK3G47UiS+TUQPNb1DeaEaDTEPL7
mEfnMrT0/9M8qM9IrKzDIjxM5UtxsVVjbor18kTwMbsPcTYLegFTgL4JDVOmuAME
KpYBhquHcQx4kZkxrRY9YHir5wI2/DLu3fF7Jsq6pwi+zVzTdZMhLeA130W7JxXn
+D6/rba563DDRYPANXT9lKRyXJpgq42KuV3C9HN0Q68dcYuJddCKiKh9UR0SQDd4
Dh8tfvtst8O4HU2pYKRInfv8eHJidiEzz0Q8THf5tBehayYsgfn7/Y0ImxKkjd1D
EH2wbfbkeADD6OlOPNvg+oNDj4v5HO7MCbksNsT358MoSV8YlXAGC6iDF0hlb4zP
Wcv0ek4x+GfFnKHCH9dj0nAFLXLMVCoHb0f0K+rC6j9yYawwALXd4FP8vC37wM+V
jjNJTqZESfVJQtLpa5cjrCKgqqRQrHQC+34fGXUhFzrf7gu7qqb1K92mN3HR/n6F
zJHb1mVQmehT2loYp320lpxtnGonzPmGpYw2ego/8NOqhOjWbN4mLHlU7y3k3K85
tf3C1ZlRpG+u9HAf+KmQL3gEj6vTxwpiqql/sJr81q6bUvzyq30Tt92cdi2ROkfR
IrChSzKgw2iYuh3JU3k9RUkWMAPVtixr/zkA54Xn16fmEvm7qNQ=
=LSc+
-----END PGP SIGNATURE-----

--l1J6pPreQKGqEpKK--
