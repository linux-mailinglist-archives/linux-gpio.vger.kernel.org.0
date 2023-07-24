Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC78575F55B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 13:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjGXLoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 07:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGXLoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 07:44:15 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0154E5C;
        Mon, 24 Jul 2023 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690199054; x=1721735054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AhAV6EXXTRBcrPub9eD6b5LPrOcw+eceIVL16f8Xp7s=;
  b=ncx2rnNoUcZeDKs1NGBZnRvMyQd7Z5qWPZRF8t1QdnfQnEBTRd++j4Y3
   LfBJ5ik34kVKelMXX5n22Kk2Floh+bKxU6iV483UU/xYLT9nbPPAvgDmb
   NLFLqzU3isP2aX4FYBb0/Jmf1C8BgRJPxIsJujW03F8G7h5gNFmIOQ8so
   BjZdt9b31iOpk9uSG3ZWr8uBW+cKGau2bQXUaGDxZn9FPrHlyuIyNLbr0
   75LO4gn5+RF6JyJAj/AcgeCIt190irGKgkzECMVFwcFqC3Oj13yp065aa
   hfYdx1Wm0+UMPlsMZyFd0Dox2rrpDPyVOcI3Qb92H2BkyyGwokI6BrbIv
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32080086"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 13:44:11 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6F9B2280078;
        Mon, 24 Jul 2023 13:44:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE GPIO
Date:   Mon, 24 Jul 2023 13:44:11 +0200
Message-ID: <4285919.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com> <21957396.EfDdHjke4D@steina-w> <29b62cc6-bc54-9a43-211b-b2d7579218b7@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 24. Juli 2023, 11:54:12 CEST schrieb Krzysztof Kozlowski:
> On 24/07/2023 09:58, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
> >> On 24/07/2023 08:35, Alexander Stein wrote:
> >>> This is a gpio-controller, so gpio-line-names should be allowed as we=
ll.
> >>> stmpe2403 supports up to 24 GPIOs.
> >>>=20
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>> Changes in v2:
> >>> * Add min/maxItems
> >>>=20
> >>>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>=20
> >>> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>> b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
> >>> 22c0cae73425..4555f1644a4d 100644
> >>> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >>>=20
> >>> @@ -28,6 +28,10 @@ properties:
> >>>    gpio-controller: true
> >>>=20
> >>> +  gpio-line-names:
> >>> +    minItems: 1
> >>> +    maxItems: 24
> >>> +
> >>=20
> >> I am sure there is no variant with one GPIO.
> >=20
> > That's true. But if only one GPIO is actually connected there is no use
> > enforcing to add empty entries.
> > AFAIK it is also allowed to provide an incomplete array.
>=20
> Did you test it? Linux prints warning. Warning means "not allowed".

I did and I don't see any warnings.
I using the following (modified) GPIO subnode on an stmpe811 chip:
gpio {
	compatible =3D "st,stmpe-gpio";
	gpio-controller;
	#gpio-cells =3D <2>;
	interrupt-controller;
	#interrupt-cells =3D <2>;
	/* GPIO 5-7 used for touch */
	st,norequest-mask =3D <0xf0>;
	gpio-line-names =3D "GPIO_ADC_I2C1_1";
};

I only see the warning "stmpe-gpio stmpe-gpio: DMA mask not set", but that'=
s a=20
different matter.
Only GPIO 0-3 are connected. Original property is
gpio-line-names =3D "GPIO_ADC_I2C1_1",
	        "GPIO_ADC_I2C1_2",
	        "GPIO_ADC_I2C1_3",
	        "GPIO_ADC_I2C1_4";

Also gpioinfo shows that the gpiochip has 8 pins while only the first one i=
s=20
named.

gpiochip7 - 8 lines:
        line   0: "GPIO_ADC_I2C1_1" unused input active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:      unnamed       unused   input  active-high=20
        line   4:      unnamed       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20
        line   6:      unnamed       unused   input  active-high=20
        line   7:      unnamed       unused   input  active-high


If 4 GPIOs are named the output shows names for lines 1-3 accordingly, but =
no=20
errors/warnings as well.

> The expectation is that the rest are named "NC".

Where does this expectation come from? Is there any pending change I am not=
=20
aware of?

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


