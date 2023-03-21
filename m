Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183AD6C37A5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Mar 2023 18:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjCURFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Mar 2023 13:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCURFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Mar 2023 13:05:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B8428E5C;
        Tue, 21 Mar 2023 10:04:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C65CB818B9;
        Tue, 21 Mar 2023 17:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34633C433D2;
        Tue, 21 Mar 2023 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679418268;
        bh=6/1OwnwDR5ngQ1kgeL+G+n1lPgIlB5gjxbjViN6yr6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NvGU4MaW7FkpbV1xMSfL8kQ/e+mlSYg+DJrK3oh93jNorQfIhxpGhxDR2RyNqZxni
         CU70CgQUFFrY0G7CkDMgAbrwAJODxmP7RC9H/eDwvkOUgzL8CB9KbicQmsvcnWpV+f
         yYA1NE8+aKWYHJ+vUvgHINXKfRX6GAVookKLF/4S/eZbBAE2nWn5QfoJcX0QeHWi1f
         tWX+Iz7BNRLDHVRYNXn76dVsWWMM2oP17hk1Nv5VtBEbR7Uf6n8fBZyvcMkiPPmQMy
         yTNUNtujC6TXBC/PMPQswesNz5XLwDnipteFA6nvdI0IPfln9QiQn0JKr8nWwwxCWo
         yAiAAr/xntfyA==
Date:   Tue, 21 Mar 2023 18:04:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: core: Drop unneeded #ifdef CONFIG_OF
Message-ID: <ZBnjlXjBarzKhcP5@sai.fritz.box>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <55d72ce46b43ec2f41681cb5ba7ca7fcebdb98d1.1679416005.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="683ymHmNu6+/zMr4"
Content-Disposition: inline
In-Reply-To: <55d72ce46b43ec2f41681cb5ba7ca7fcebdb98d1.1679416005.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--683ymHmNu6+/zMr4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 05:28:00PM +0100, Geert Uytterhoeven wrote:
> As the of_node member of struct device always exists, and there is a
> dummy of of_device_get_match_data() for the !CONFIG_OF case, there is no
> longer a need to protect code using these interfaces with an #ifdef.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--683ymHmNu6+/zMr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQZ440ACgkQFA3kzBSg
KbZumQ/7BwUEWiLTHI7YyUTEFuRnoZYJ+djldq4MLE5ft/DnJnHx2OTXnjY48FN5
Xg4j4TUtDR14rPo3O1+eonnR0ZfaWB8xb679488jzPx1EZsA6F5C9ZuDql/dnMUd
3mzfL1MrrXaoSw/syjuppB1Fub6ca4RZRI8752EY+r8ZQ1aR+oMuuVQZ4QCqpi/y
MX5kH7R/dPlpAjsc/69iTgsKLZ8JmKRVxX5vazIe/JIL7qrkZk/dpycwgA1LFPBD
u2c108kr4+NxyiZkaxoWdlrsHcm7MgM4zppsC5yHllrcCfRuBmoce2OZMeJP9VsO
9Vrsh5ab9It0g6dS1+ttxE8Et6EX1vF4soXdIcpgc2t3UA4jWlU0l//jJic2EoV1
QiiGEfhcrMTLGAz08Q0/zsHZCxVuQlSU2+RImx8wUeEXKGNR46GNcILuk9h6ZQKm
kMvjay5O2858raiphYLMmomft2iAaN8y9M6V7OJBntJGy+W/ZN+BeyjEs+oDO0CU
3IFkNN1CrBmB2OdOkpk9y9i50m67hakyB53uswvvJCN0cNhTbNy6AkV4ChQogzcL
WbR7D9IS6KtipF1EO/yj6aHufEIjdWF4+M+c+RhVRzQmVHEhovhO8NLVKS0WSyW4
1LHkVH47kZd4yhwJxvaN9ak8lv6kl3xmfKL3Uu+6uh4qHrc/pGQ=
=MCoN
-----END PGP SIGNATURE-----

--683ymHmNu6+/zMr4--
