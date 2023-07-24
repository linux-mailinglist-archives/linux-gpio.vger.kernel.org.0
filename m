Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2B875ECF3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 09:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjGXH7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 03:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjGXH65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 03:58:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5DAF3;
        Mon, 24 Jul 2023 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690185535; x=1721721535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ltxnX2YkLxc1mlUpJTfiZUtpEKMS1HNVGtECbRDSkgE=;
  b=RdC/Jh8YYTPsMxyC9IfmlTWmAg73abFx1jsl2VkdF6qy1EBoIMAzbF9c
   hMeQA0l/2L6cawF051vAJOCUufdQtQRFdCdJP9A1lZVqx4Uw7i+PA9d19
   BrE/W+Ms1hatEDI1WVZ1tY69c05NtLtoGPIs2cA/sPyrAXDj9pBv6A+Bj
   aMfPc0eCQrujbDqVyWiqEWAb03bJ1xx74f8SSrRHTLkNjxzXRcBCoJ7Nx
   74GYcHttY/RREwVVXj8CAsUwvB8Hw993mqYGe/dvkPq8dUHgDRmJv+gcC
   87uaih2j61s28FlB409EUxM6sLrTMO59x5yLBIesJo76uqG7YBqCF7Kt+
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32073505"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 09:58:52 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B418A280078;
        Mon, 24 Jul 2023 09:58:52 +0200 (CEST)
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
Date:   Mon, 24 Jul 2023 09:58:52 +0200
Message-ID: <21957396.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com> <0f016242-2380-274e-c6a4-118a5872412e@linaro.org>
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

Hi,

Am Montag, 24. Juli 2023, 09:23:09 CEST schrieb Krzysztof Kozlowski:
> On 24/07/2023 08:35, Alexander Stein wrote:
> > This is a gpio-controller, so gpio-line-names should be allowed as well.
> > stmpe2403 supports up to 24 GPIOs.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Add min/maxItems
> >=20
> >  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> > b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml index
> > 22c0cae73425..4555f1644a4d 100644
> > --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> >=20
> > @@ -28,6 +28,10 @@ properties:
> >    gpio-controller: true
> >=20
> > +  gpio-line-names:
> > +    minItems: 1
> > +    maxItems: 24
> > +
>=20
> I am sure there is no variant with one GPIO.

That's true. But if only one GPIO is actually connected there is no use=20
enforcing to add empty entries.
AFAIK it is also allowed to provide an incomplete array.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


