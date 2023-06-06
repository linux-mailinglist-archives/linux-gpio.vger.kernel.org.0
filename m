Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2E0724060
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 13:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjFFLDS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 07:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFFLC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 07:02:28 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7207212B;
        Tue,  6 Jun 2023 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686049183; x=1717585183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NlcsB2aUjrZ1GJIhbfkglEErq14m0qVOrwEcSKW5nQ8=;
  b=aG79oPRiPT0jD9/2vRi9XTsk1jOM1dgUE2TlfrQWgxTOhzOy/giqe/vO
   GCD6sZSHys4hW6Rwwv00qKrwphM/Z+UtpW8cM0DTBjKI/47Zu8L8GDttM
   PufwIbEQ2zdSEqU+zzmIkDZUjU/nrOfRQ4sHGIRKBGvBSSsenmNJmKwnU
   569JJA1biTqw+CIVJe+KG2M5P/dyz4moYjF0mccZ13xo+CxR+8f+MJi7S
   nHZxfVAgihhdCYbblOdVzLQ9aTiQV8s6MQLYHB3kFXcYDgg3mcIi3zYRs
   vMJ3tbsaSnkcyXCJdM/jWkypz4lnt4DL9HwHGQn8beri+xu+JoVOOWjOR
   A==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681164000"; 
   d="scan'208";a="31300378"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Jun 2023 12:59:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 06 Jun 2023 12:59:33 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 06 Jun 2023 12:59:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686049173; x=1717585173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NlcsB2aUjrZ1GJIhbfkglEErq14m0qVOrwEcSKW5nQ8=;
  b=H5yAyxcM7DhUL5CN3WTqPNQQmXMXmlHsmZmqMcG1rJIIwMQJWFJpC1kk
   +aGzwPrS7ynANhszKH3etVvWHHi8eWhBChKTAe9kh6YonkvqnDoW5qe3j
   kZqQOpk7rgz1D/mJAhmGPHR+kX1DgRMHXtLbtfhcTvndKmdUHxrT98Sry
   3USGEP1CY/XWAITVOdWOOSAIItQf+02OXWN+MKBiLVAVA41brMmVV8EEI
   OO8+lTXyqSVn2tARWTHrTSYdSHoWWiXdq/0oXMHJNCFO4RtzYcPE8EXJP
   /tz/UJrQnlmo2JrdNfSq8ro4SJ19H+yGkh5d2jiurtHDGIvEO9eEu7saX
   w==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681164000"; 
   d="scan'208";a="31300376"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jun 2023 12:59:33 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 683EF280090;
        Tue,  6 Jun 2023 12:59:33 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <linux@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Spelling s/curcuit/circuit/
Date:   Tue, 06 Jun 2023 12:59:34 +0200
Message-ID: <6194803.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
References: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
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

Hi Geert,

thanks for the fix.

Am Dienstag, 6. Juni 2023, 12:01:40 CEST schrieb Geert Uytterhoeven:
> Fix misspellings of "circuit".
>=20
> Fixes: c7239a3da1628767 ("dt-bindings: gpio: Add gpio-delay binding
> document") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml index
> 7c16a4e1a768ef72..1cebc4058e272660 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> @@ -11,7 +11,7 @@ maintainers:
>=20
>  description: |
>    This binding describes an electrical setup where setting an GPIO output
> -  is delayed by some external setup, e.g. RC curcuit.
> +  is delayed by some external setup, e.g. RC circuit.
>=20
>    +----------+                    +-----------+
>=20
>    |          |             VCC_B  |           |
>=20
> @@ -30,7 +30,7 @@ description: |
>                             GND
>=20
>    If the input on the consumer is controlled by an open-drain signal
> -  attached to an RC curcuit the ramp-up delay is not under control
> +  attached to an RC circuit the ramp-up delay is not under control
>    of the GPIO controller.
>=20
>  properties:


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


