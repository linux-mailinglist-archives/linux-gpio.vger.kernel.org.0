Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0EA7176B7
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 08:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjEaGST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 02:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjEaGSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 02:18:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D263F9F;
        Tue, 30 May 2023 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685513897; x=1717049897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j0wWi76fQ0wDtCQgiYmR4rSGfexj1RzQ3UKzwhMVl9o=;
  b=MR5XqYHmBDkDn9JxzV3f6y6mLC5mXbXAhps1szoTYbLAPCqEHCXQdrn2
   wzvBoipAQHu+eAHs2ISCipSKvsSZBQmrXhKH3XZ/17PABWAGPaDZAS3B0
   FpHi0oxlopWghFxjkGHDvSDdHSaKZ6UIv17nadPX26LnhrmQvfJj9vuW3
   +lJWF2Kf0UNFj25BB2o7UG6yQ/1NuwbdiiOoURQm6DKN+4LNrfcKhplot
   dp51pDMMtoEYgpPqEjEtkWnlZlUNofKiis86I7CfmAlH8jyvWM2YrnRkk
   ueAELwOT/BV7pbYFoLR7J5CAGVr3pawvx6e1aQKl5dtPVX8rck7JIRhh/
   A==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31181399"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 May 2023 08:18:14 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 May 2023 08:18:15 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 May 2023 08:18:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685513894; x=1717049894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j0wWi76fQ0wDtCQgiYmR4rSGfexj1RzQ3UKzwhMVl9o=;
  b=CefChO4tiUsXU35oRzpwUIB4cQDq0uYx9G4SnqhQqD8Zikuw7e9vls96
   ZS09B1GSe429NqWPok7/jq61uPLDhTZMq1Ov73j/z2+Ttvvvc3QHP0Qlx
   3S+WLWBZij4omZOzYle0H+tSXkTK0QqO4zszjuG5rvgO1g9pVnU/z86MT
   6c/1aH+x+wQSd+XkIMmeKf51X6t5qNL+LxkRcRRLchbbWzhsd2ir/weqO
   xN51oZ+K17MfL/Kav3wkYn5ggZq4vyHB4CbhisPrxFeRQ8zPKrqCoBIgu
   cSTecFGEFcOTAbhhc3EPFZ70RWP/ewICyS9mqSgTfILrBnm/D42TfYaD+
   w==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31181398"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 May 2023 08:18:14 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8ADB0280099;
        Wed, 31 May 2023 08:18:14 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with less ambiguity
Date:   Wed, 31 May 2023 08:18:14 +0200
Message-ID: <4491320.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de> <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Dienstag, 30. Mai 2023, 17:19:45 CEST schrieb Uwe Kleine-K=F6nig:
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
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
> b/Documentation/devicetree/bindings/gpio/gpio.txt index
> d82c32217fff..2f037bbd3ffa 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -209,15 +209,21 @@ Required properties:
>  - gpios:      Store the GPIO information (id, flags, ...) for each GPIO =
to
>  	      affect. Shall contain an integer multiple of the number of=20
cells
>  	      specified in its parent node (GPIO controller node).
> +
>  Only one of the following properties scanned in the order shown below.
>  This means that when multiple properties are present they will be search=
ed
>  in the order presented below and the first match is taken as the intended
>  configuration.
> -- input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output
> with -	      the value low.
> -- output-high A property specifying to set the GPIO direction as output
> with -	      the value high.
> +- input:             A property specifying to set the GPIO direction as
> input. +- output-inactive:   A property specifying to set the GPIO
> direction as output +		     with the inactive value=20
(depending on the
> line's polarity, +		     which is active-high by default)
> +- output-active:     A property specifying to set the GPIO direction as
> output +		     with the active value.

I know this is essentially just renaming currently existing properties.
But these mutual exclusive (boolean) properties make it impossible to chang=
e=20
them in DT overlay. Any ideas how to support changing the output level onGP=
IO=20
hogs in DT overlay?

Despite that, this change looks sensible to me.

Best regards,
Alexander

> +For backwards compatibility "output-low" and "output-high" are supported=
 as
> +aliases for "output-inactive" and "output-active" respectively. Their
> usage is +misleading for active-low outputs, so their use is discouraged.
>=20
>  Optional properties:
>  - line-name:  The GPIO label name. If not present the node name is used.


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


