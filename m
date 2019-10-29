Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92585E9007
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 20:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbfJ2Teo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 15:34:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44555 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbfJ2Teo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 15:34:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id s71so9963593oih.11;
        Tue, 29 Oct 2019 12:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xxBSHOJOiVx9xUjgJDjdIRv3ddP3A9uo0gsTNXhupls=;
        b=TxFPOzwXufLJT2JVXpgiFMpFXCkkfCTUaTnwj1F5pmQ/Jd155uxRE46edl3UOLXR8Y
         DYSwzfnmgdBypfMDTCZiyO2yyx8G7kHNBr7owVC/hSrWNzXLK+WIOmrsL78NlUJbDJu9
         iLOIGu3LPHXmu72nVRBgb8HN4QIu3rYMOFGTz/6R8aY0DMv+bSM2PVCqhlHxlOWYAloF
         DVS69U5Occ5WzMnWVgu2euhZLVE8bbm5hQWvgXYd/6HCujYgp85kOm30wiMnptkbfM74
         olX1c4jg9UM9WivzWXx4xXtB3JhgK7qcxBHDenISaH056ZNEr5RKBeoM6+dbr8ergara
         IDEw==
X-Gm-Message-State: APjAAAVyJV1zPcXdI3gyoez2JCip/xWefFsa/S0/hEMKDjcCOa7CKbOW
        1TZ9TYYXDmVZRdPwrzr4Jpa6fyU=
X-Google-Smtp-Source: APXvYqzS5ffkFMfaYBYQyvW5I894+RhkZnJR4QlEUSJUdJKrrGrJLgRQjPJ+xByV/MfE6+1fE/0Kyw==
X-Received: by 2002:aca:55d3:: with SMTP id j202mr3472769oib.152.1572377682389;
        Tue, 29 Oct 2019 12:34:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t32sm5047216otb.28.2019.10.29.12.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 12:34:40 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:34:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Message-ID: <20191029193440.GA1812@bogus>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
 <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 25, 2019 at 05:49:17AM +0000, Vaittinen, Matti wrote:
> Hello Dan,
> 
> Thanks again for checking this :)
> 
> On Thu, 2019-10-24 at 14:35 -0500, Dan Murphy wrote:
> > Matti
> > 
> > On 10/24/19 6:41 AM, Matti Vaittinen wrote:
> > > ROHM BD71828 Power management IC integrates 7 buck converters, 7
> > > LDOs,
> > > a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> > > and a 32.768 kHz clock gate.
> > > 
> > > Document the dt bindings drivers are using.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > > 
> > > No changes since v1
> > > 
> > >   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180
> > > ++++++++++++++++++
> > >   1 file changed, 180 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> > 
> > I will let maintainers weigh in here but if this is new this should 
> > probably be in the yaml format to avoid conversion in the future
> 
> Oh... This is new to me. I guess there are reasons for this - but I
> must say I am not excited as I have never used yaml for anything. I'll
> do as you suggest and wait for what others have to say :) Thanks for
> pointing this out though.

Sorry for your lack of excitement. It could be XML...

There aren't many MFD examples yet, but there is max77650 in my tree and 
linux-next.

> > > diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-
> > > pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71828-
> > > pmic.txt
> > > new file mode 100644
> > > index 000000000000..125efa9f3de0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> > > @@ -0,0 +1,180 @@
> > > +* ROHM BD71828 Power Management Integrated Circuit bindings
> > > +
> > > +BD71828GW is a single-chip power management IC for battery-powered 
> > > portable
> > > +devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500
> > > mA single-cell
> > > +linear charger. Also included is a Coulomb counter, a real-time
> > > clock (RTC),
> > > +and a 32.768 kHz clock gate.
> > > +
> > > +Required properties:
> > > + - compatible			: Should be "rohm,bd71828".
> > > + - reg				: I2C slave address.
> > > + - interrupt-parent		: Phandle to the parent
> > > interrupt controller.
> > > + - interrupts			: The interrupt line the device
> > > is connected to.
> > > + - clocks			: The parent clock connected to PMIC.
> > > + - #clock-cells			: Should be 0.
> > > + - regulators			: List of child nodes that
> > > specify the
> > > +				  regulators. Please see
> > > +				  ../regulator/rohm,bd71828-
> > > regulator.txt
> > > + - gpio-controller		: To indicate BD71828 acts as a GPIO
> > > controller.
> > > + - #gpio-cells			: Should be 2. The first cell
> > > is the pin number
> > > +				  and the second cell is used to
> > > specify flags.
> > > +				  See ../gpio/gpio.txt for more
> > > information.
> > > +
> > > +The BD71828 RUN state is divided into 4 configurable run-levels
> > > named RUN0,
> > > +RUN1, RUN2 and RUN3. Bucks 1, 2, 6 and 7 can be either controlled
> > > individually
> > > +via I2C, or some/all of them can be bound to run-levels and
> > > controlled as a
> > > +group. If bucks are controlled individually these run-levels are
> > > ignored. See
> > > +../regulator/rohm,bd71828-regulator.txt for how to define
> > > regulator voltages
> 
> > The rohm,bd71828-regulator.txt should be yaml if the maintainers want
> > it 
> > that way.
> 
> Let's see if this should be changed then :)
> 
> > > +for run-levels. Run-levels can be changed by I2C or GPIO depending
> > > on PMIC's OTP
> > > +configuration.
> > > +
> > > +Optional properties:
> > > +- clock-output-names		: Should contain name for
> > > output clock.
> > > +- rohm,dvs-vsel-gpios		: GPIOs used to control PMIC
> > > run-levels. Should
> > > +				  describe two GPIOs. (See run-level
> > > control in
> > > +				  data-sheet). If this property is
> > > omitted but
> > > +				  some bucks are marked to be
> > > controlled by
> > > +				  run-levels - then OTP option allowing
> > > +				  run-level control via I2C is assumed.
> > > +- gpio-reserved-ranges		: Usage of GPIO pins can be
> > > changed via OTP.
> > > +				  This property can be used to mark the
> > > pins
> > > +				  which should not be configured for
> > > GPIO.
> > > +				  Please see the ../gpio/gpio.txt for
> > > more
> > > +				  information.
> > > +
> > > +Example:
> > > +
> > 
> > This example does not look right.
> > 
> > I see that I2C is referenced above so the example could look like
> > this
> > 
> > osc: oscillator {
> >                  compatible = "fixed-clock";
> >                  #clock-cells = <1>;
> >                  clock-frequency  = <32768>;
> >                  clock-output-names = "osc";
> >          };
> > 
> > This is an external oscillator and is not really part of the pmic 
> > itself.  I am not sure you even need to define that since it is not
> > part 
> > of the pmic.
> 
> I think you are correct. I'll drop this oscillator for next patch.
> 
> > 
> > i2c {
> > 
> >          pmic@4b {
> > 
> >                  [...]
> > 
> >          };
> > 
> > };
> 
> I don't think the I2C node is needed in example. It is not part of the
> PMIC - and I don't see the containing bus in other examples I just
> opened. (the two other rohm,xxx PMIC docs - well, biased as I wrote
> them), da9150.txt, lp3943.txt, max77686.txt, tps6507x.txt, tps65910.txt

It will be needed for the schema because the examples are compiled and 
validated.

Rob
