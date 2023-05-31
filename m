Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC371773B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 08:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbjEaGxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 02:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbjEaGxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 02:53:46 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCF0136;
        Tue, 30 May 2023 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685516007; x=1717052007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VqRvmrG5sHcZnzblcSUWkZtoj2m0EObUfcakPJXfVMw=;
  b=b4ZzMaob9EMClcuaLzaHrsLdVYEiMd2eL1ykwC7J98qr9uLIdcPoRy2v
   vOt2bQzONNxrCPNsuq4RK2J30L/QEUuBUL4wHv1OWOQruCuASSDCsxQeG
   kUYDQYR5LMOybcWA3Jdtks3yMGwI7ZMLetyBDu5898ull2tvZpZwTwTTB
   E7+o6HT4A1XupW5akXaSsX+v7oQwiGG/tiqFmdiWDdsBps29L6t60qRwX
   CX8mW/wVhU6PVy2hTxh0plkPWHJ8V5LK+K61pmt8oEyOSpy1HhPzmfquo
   ZeHy0TiGWIi677/GE6s9lO5kdU/rgxrqkMJXJEVtSwxfgbcUR3XDb0wQC
   g==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31182494"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 May 2023 08:53:24 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 May 2023 08:53:24 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 May 2023 08:53:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685516004; x=1717052004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VqRvmrG5sHcZnzblcSUWkZtoj2m0EObUfcakPJXfVMw=;
  b=pbLeU4MiZ2+4S+/Mw2Qjlc5OjcHdj57z7Jru1zBVs34kDmAe0ovW0eP5
   esVvDMm8zR0Msa7zxS3JmIHmXGXPdzN8Bm9mbPQuaqWaEq73Tg+L+bnfF
   VuJFdy0W2o2skgMhfVp0DwIU4gwpl6PoLDM3KqWWXAuV6aluMCl0C58yl
   dLnUE7BCmPH8hz2fPvy4YHOgee+OGsxelGMw2cCgih7vWfCZCVPdGBt9A
   u306WiO2I/XJKpQz1e5XfpHoF/6Mcj9EOrr2uqyKVjIv5fqXmAU+Ymb5j
   bB14+zZIUq29lfsDdzdZwTglsTdlwaRIOpPEKB67g+XKw+CESxFLHVmdN
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31182493"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 May 2023 08:53:22 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ECE62280099;
        Wed, 31 May 2023 08:53:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Date:   Wed, 31 May 2023 08:53:21 +0200
Message-ID: <4810610.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com> <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org> <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi everybody,

Am Sonntag, 16. April 2023, 20:46:43 CEST schrieb Andy Shevchenko:
> On Sun, Apr 16, 2023 at 2:42=E2=80=AFPM Krzysztof Kozlowski
>=20
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 16/04/2023 13:33, Andy Shevchenko wrote:
> > > On Sun, Apr 16, 2023 at 2:21=E2=80=AFPM Krzysztof Kozlowski
> > >=20
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >> On 16/04/2023 13:14, Andy Shevchenko wrote:
> > >>> On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM Krzysztof Kozlowski
> > >>>=20
> > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>> On 16/04/2023 11:36, Andy Shevchenko wrote:
> > >>>>> On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
> > >>>>>=20
> > >>>>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>>>> On 15/04/2023 17:06, Andy Shevchenko wrote:
> > >>>>>>> On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> > >>>>>>>=20
> > >>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> > >>>>>>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy=20
Shevchenko:
> > >>>>>>>>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> > >>>>>=20
> > >>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
> > >>>>> ...
> > >>>>>=20
> > >>>>>>>>> So, taking the above into consideration, why is it GPIO prope=
rty
> > >>>>>>>>> to
> > >>>>>>>>> begin with? This is PCB property of the certain platform desi=
gn
> > >>>>>>>>> that
> > >>>>>>>>> needs to be driven by a specific driver, correct?
> > >>>>>>>>=20
> > >>>>>>>> True this is induced by the PCB, but this property applies to =
the
> > >>>>>>>> GPIO,
> > >>>>>>>> neither the GPIO controller output, nor the GPIO consumer is
> > >>>>>>>> aware of.
> > >>>>>>>> So it has to be added in between. The original idea to add a
> > >>>>>>>> property for the consumer driver is also rejected, because this
> > >>>>>>>> kind of behavior is not limited to this specific driver.
> > >>>>>>>> That's why the delay is inserted in between the GPIO output and
> > >>>>>>>> GPIO consumer.> >>>>>>>>=20
> > >>>>>>>>> At the very least this is pin configuration (but external to =
the
> > >>>>>>>>> SoC),
> > >>>>>>>>> so has to be a _separate_ pin control in my opinion.
> > >>>>>>>>=20
> > >>>>>>>> Sorry, I don't get what you mean by _separate_ pin control.
> > >>>>>>>=20
> > >>>>>>> As you mentioned above this can be applied theoretically to any
> > >>>>>>> pin of
> > >>>>>>> the SoC, That pin may or may not be a GPIO or a pin that can be
> > >>>>>>> switched to the GPIO mode. Hence this entire idea shouldn't be
> > >>>>>>> part of
> > >>>>>>> the existing _in-SoC_ pin control driver if any. This is a pure=
ly
> > >>>>>>> separate entity, but at the same time it adds a property to a p=
in,
> > >>>>>>> hence pin control.
> > >>>>>>> At the same time, it's not an SoC related one, it's a PCB. Hence
> > >>>>>>> _separate_.> >>>>>>=20
> > >>>>>> I don't think that anything here is related to pin control. Pin
> > >>>>>> control
> > >>>>>> is specific function of some device which allows different
> > >>>>>> properties or
> > >>>>>> different functions of a pin.
> > >>>>>=20
> > >>>>> Sorry, but from a hardware perspective I have to disagree with yo=
u.
> > >>>>> It's a property of the _pin_ and not of a GPIO. Any pin might have
> > >>>>> the
> > >>>>> same property. That's why it's definitely _not_ a property of GPI=
O,
> > >>>>> but wider than that.
> > >>>>=20
> > >>>> I did not say this is a property of GPIO. I said this is nothing to
> > >>>> do
> > >>>> with pin control, configuration and pinctrl as is.
> > >>>=20
> > >>> Ah, I see. But still is a property of the pin on the PCB level.
> > >>=20
> > >> No, it is property of a circuit, so property of two pins and a wire
> > >> between them. Not a property of one pin.
> > >=20
> > > Electrically speaking -- yes, software speaking, no, this is the
> > > property of the one end (platfrom abstraction in the software) and as
> > > you said, consumer which may be SoC, or the device connected to the
> > > SoC (depending on the signal direction), or both (like pull-up for
> > > I2C).
> > >=20
> > >>> That's
> > >>> why I said that it should be like a "proxy" driver that has to be a
> > >>> consumer of the pins on one side and provide the pins with this
> > >>> property on the other.
> > >>=20
> > >> Not sure, why do you need it for anything else than GPIOs? What is t=
he
> > >> real world use case for proxy driver of non-GPIO lines?
> > >=20
> > > I2C is an example where we have something in between, which both of
> >=20
> > Are you sure you have RC (not just resistor) in I2C?
>=20
> I'm talking about an analogue. In principle the pull-up is part of PCB
> and not of the SoC.
>=20
> > > the ends are using and this is the property of PCB, but luckily we
> > > don't need anything special in the software for that, right? But from
> > > the electrical point of view it's exactly a non-GPIO property. That's
> > > why "proxy".
> >=20
> > Still I do not see any reason to call it anything else than GPIO. If you
> > think that there is any other usage, please bring it as an real,
> > non-theoretical example.
>=20
> The first, which one I found, is time-stretched ADC. The idea is that
> the portion of the signal is split to the phases and each phase is
> passed via time stretcher for the low-speed ADC to be digitized. So,
> if we have an SoC with 4+ ADCs, on the PCB one can add an externally
> clocked mux and then 4+ time stretching lines and on the SoC side it
> will be ADC (note, not a GPIO!).

What do I need to do to get progress on this topic? Without this kind of de=
lay=20
handling the DSI-LVDS bridge on our hardware cannot be used in mainline.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


