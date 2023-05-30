Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8018171709D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 00:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjE3WUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 18:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjE3WUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 18:20:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C717BFC;
        Tue, 30 May 2023 15:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42E6E63409;
        Tue, 30 May 2023 22:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73582C433EF;
        Tue, 30 May 2023 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685485242;
        bh=hRi2EL3pbJrAwbGUTa1rViqoxT9AzgP1VP3t/CH9xFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MQRsHKSaV89ukuK3/XTnKl84tZbpD/c0pBmlh3V+PMfGcnuHZbEa23mv+Dw3aCuN8
         vdei+/Od20iJs7Jkpf9/1yW9Nqk4JNezl9Pa2GhiIkbW8MfC9RzloLxG+YygpdJbpS
         LHywIljFVIp5D+bIkLbHLysfDwLQGkZWwYqR4ITuqvXuCnisBLJXyZlmbp26w4IJ7W
         T/DPW2lNHXjLrGwz1bbeHG3PbPk2jvFTF9W+8HD4mrsnD3W2IN2h9Ll91G+trNE+Zp
         hmrH1mXsbHUFis02IGwlqjztQIHccBTIA9OcmgFcXfW3GTtStqxTv/8nHfCYnmBk37
         CVDe7TD2rBA7A==
Date:   Tue, 30 May 2023 23:20:38 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20230530-gag-doorway-e13660d45161@spud>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sPNx0e24FF2VkRn0"
Content-Disposition: inline
In-Reply-To: <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--sPNx0e24FF2VkRn0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Uwe,

On Tue, May 30, 2023 at 05:19:45PM +0200, Uwe Kleine-K=F6nig wrote:
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>=20
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentat=
ion/devicetree/bindings/gpio/gpio.txt
> index d82c32217fff..2f037bbd3ffa 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -209,15 +209,21 @@ Required properties:
>  - gpios:      Store the GPIO information (id, flags, ...) for each GPIO =
to
>  	      affect. Shall contain an integer multiple of the number of cells
>  	      specified in its parent node (GPIO controller node).
> +
>  Only one of the following properties scanned in the order shown below.
>  This means that when multiple properties are present they will be search=
ed
>  in the order presented below and the first match is taken as the intended
>  configuration.
> -- input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output =
with
> -	      the value low.
> -- output-high A property specifying to set the GPIO direction as output =
with
> -	      the value high.
> +- input:             A property specifying to set the GPIO direction as =
input.
> +- output-inactive:   A property specifying to set the GPIO direction as =
output
> +		     with the inactive value (depending on the line's polarity,
> +		     which is active-high by default)
> +- output-active:     A property specifying to set the GPIO direction as =
output
> +		     with the active value.
> +
> +For backwards compatibility "output-low" and "output-high" are supported=
 as
> +aliases for "output-inactive" and "output-active" respectively. Their us=
age is
> +misleading for active-low outputs, so their use is discouraged.

Seems like an improvement to me,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Rob did note that gpio-hog.yaml in dt-schema would need to be updated,
but he's not around right now to approve anything there.

Cheers,
Conor.

--sPNx0e24FF2VkRn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZ2tQAKCRB4tDGHoIJi
0preAP9K8mm6OvwijIATfwHV+lAxAGEPpow8o0JuEfnRtjwgiAD/XfZXPqpwg8jl
cPGzwUIhK3s3FIZo8OENobzcXlqNYA4=
=dZB3
-----END PGP SIGNATURE-----

--sPNx0e24FF2VkRn0--
