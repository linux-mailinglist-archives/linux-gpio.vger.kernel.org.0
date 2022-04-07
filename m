Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5311D4F769C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 08:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbiDGGxE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Apr 2022 02:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241411AbiDGGxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2022 02:53:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900E3E72BD;
        Wed,  6 Apr 2022 23:51:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B24A7CE26BA;
        Thu,  7 Apr 2022 06:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB4FC385A4;
        Thu,  7 Apr 2022 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649314259;
        bh=4oVEZkitbUyJ2WcA8xnEcAUG11WYeSMx4D4hUHxh2S4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GOaeKSSipVHnAmCCRwNQxYNcM4uIBQ3w83D4N/xxVG3waAmjLFeZ8EQdGPJ/Jl+0i
         BecBMVzH142WkJ2PSf00+N9TY7dbxDLhp3MC16dN3sA9u2b9m3OXwf7f3bDLdXTSsd
         dSpJ38oaJ3q3/xAvE6eEtWPcM3b2YUb6R7/EqIYBeTeALZxpdYlbKwtBlkb83yr782
         H1/3HPbvr0q/uOWxQ/XD8vJVidjbUuEY0jymARP5+/D7oG+0yXnhhRpeBySxf13zvv
         OeE5l+kiwjtcLAZT29vWhZ8AZSLWcXWS1mcE5u+0e4YbtqfrCNRn3PvWlMGJz1YNbt
         5gp/pZxiQxoNA==
Date:   Thu, 7 Apr 2022 08:50:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: renesas: r8a77990: Add RPC pins, groups,
 and functions
Message-ID: <Yk6Jzyqegso3Iec8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <cover.1648547080.git.geert+renesas@glider.be>
 <ec9735bb3468225e04ac6cb95e11a0e237b2b9ed.1648547080.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PMaWAcIGVQtKV1m9"
Content-Disposition: inline
In-Reply-To: <ec9735bb3468225e04ac6cb95e11a0e237b2b9ed.1648547080.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PMaWAcIGVQtKV1m9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 11:48:50AM +0200, Geert Uytterhoeven wrote:
> Add pins, groups, and functions for the SPI Multi I/O Bus Controller
> (RPC-IF) to the R8A77990 PFC driver.  They are to be used when an
> Octal-SPI Flash or HyperFlash is connected.
>=20
> Redefine the QSPI[01] pin groups using the RPC DQ[0:7] pin data, to save
> memory.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I trust you with the pinctrl patches :)


--PMaWAcIGVQtKV1m9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOic8ACgkQFA3kzBSg
KbYGZBAAptv6VEPXqNtyqYVQcON8va0f6eSfCnTrY10Dk5BZ7LGfsS84AioWpFYF
ZtbXsCKIeDPPUIz5GhevVKIDZ5jj/MsZsSjBaUWZcyGiPEIG+8+tpj0q5BSsffSs
qQ5Oz2qBudFtPUICIZX7Mp4K19J3Fyzwf166IbCzK8Oli5VwQ0P8Dbr1V3ZUtiV2
oOpyx1OJ0wB7kQ43SPuoCGW3AWwUEF93mNT4WMVUojl0346drKhbEFKs1+QNpRdS
y8CUiAO6Y5uPfN5yYvuzC9I/167rGmEomd8mIQYTgwCZeqilIdk+3NTy1s/b6pFt
9b1uZpxPCtQdLS0TULQ+c02pZ0P7pL8sRfcWSMX2U/oaYWRTnxKSFHRjZ4lNBeT8
XdSeTerM2wfzKAWYG4cCTMR9WAL1z6TOXFSDq5Hfshj/RSCOvxALJtmjLEvYwNx5
e/Ug/xRFaOCfQti+FcwgQj8eIM+iSJHvyZMQUca4hf6hliWirzL4T23rPRHOQ1wN
1ZLvXjCclAZ3WZjY1fpzQK74tv5o8+QkPylFVdE1BBMF3KRNdCuVY3npUCw0SwpW
ZZ3Cw8wMIInogbyxTXRQ3E2u60UsRH4yVM475WB/cb+leix1CSEjdf7fXlk9f4m9
1LfF2bNZnndeR7mFXOv/PPvpAhHNu/CVL5v5cFl+KDyXnx9nHlI=
=sTd1
-----END PGP SIGNATURE-----

--PMaWAcIGVQtKV1m9--
