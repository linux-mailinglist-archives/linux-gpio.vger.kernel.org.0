Return-Path: <linux-gpio+bounces-3-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190F7E7F1C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Nov 2023 18:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 802CF1C209FC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Nov 2023 17:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5F73D971;
	Fri, 10 Nov 2023 17:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EF3C6BF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Nov 2023 17:46:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B92153A886;
	Fri, 10 Nov 2023 07:24:16 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D18AC12FC;
	Fri, 10 Nov 2023 07:25:00 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694FC3F6C4;
	Fri, 10 Nov 2023 07:24:14 -0800 (PST)
Date: Fri, 10 Nov 2023 15:24:04 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Takahiro Akashi <takahiro.akashi@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [RFC v5 5/5] dt-bindings: firmware: arm,scmi: Add support for
 pinctrl protocol
Message-ID: <ZU5LFC23JaEidEGZ@pluto>
References: <cover.1698353854.git.oleksii_moisieiev@epam.com>
 <e9285b4377242e4d888391be987cbb99caf8c573.1698353854.git.oleksii_moisieiev@epam.com>
 <CACRpkdYW-xmejyOo9H9XSkcabvYgBqPvpjppvNe_RF6RLxyxKA@mail.gmail.com>
 <ZU2AP7leDcIZIN+b@octopus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZU2AP7leDcIZIN+b@octopus>

On Fri, Nov 10, 2023 at 09:58:39AM +0900, Takahiro Akashi wrote:
> Hi Arm folks,
> 

> Do you have any comment?
> I expect that you have had some assumption when you defined
> SCMI pinctrl protocol specification.
>

[CC Souvik]

@Souvik for context see:
https://lore.kernel.org/all/CACRpkdZ4GborirSpa3GK_PwMgCvY0ePEmZO+CwnLcP6nAdieow@mail.gmail.com/

Hi,

I am not sure what is the full story here, BUT the spec was mainly aimed
at supporting PINCTRL in SCMI with the idea to then, later on, base GPIO
on top of it, "easily" building on the PINCTRL spec features in the future
with a separate series from the one Oleksii is working on...but it like
seems the future is already here and maybe we have discovered something
to be clarified...

Souvik/Oleksii can tell you better what were (if any) further assumptions
related to GPIO on top on SCMI/PINCTRL, but the aim of this series was
always to be just the basic Generic Pinctrl support when dealing with an
SCMI server backend.

Regarding the current Pinctrl series by Oleksii, I would also notice that,
indeed, some "non-spec-dictated" naming assumptions are ALREADY present
somehow, because, currently, the spec and the pinctrl SCMI protocol layer
speak/refer about pins/groups/functions, as usual, only in terms of numeric
identifiers/IDs (with an associated name of course), while the pinctrl
driver (thanks to the Linux pictrl subsystem layer) describes and refers
anything in the DT in terms of names: so all of this really works only
because the names used in the DT happen to match the names reported by
the backend server.

My test DT uses just what Oleksii exemplified in the cover letter:

	pinctrl_i2c2: i2c2 {
		groups = "i2c2_a", "i2c2_b";
                function = "i2c2";
        };

	pinctrl_mdio: pins_mdio {
		groups = "avb_mdio";
                drive-strength = <24>;
        };

        keys_pins: keys {
		pins = "GP_5_17", "GP_5_20", "GP_5_22", "GP_2_1";
                bias-pull-up;
        };


with a dummmy test driver referring to it, so as to trigger the drivers
core to initialize the pinctrl stuff.

But all of this works just because, in the example of my emulated setup,
my fake server exposes resources that are exactly named just as how the
above DT expects pins/functions/pins to be named, because this is how
the Generic Pinctrl subsystem in Linux is supposed to work, right ?

The difference is that the names, in the case of pinctrl-scmi, are not
hardcoded in the specific pin-controller driver BUT are provided dynamically
by the SCMI server at runtime.

And this is just a naming convention, between the Linux picntrl subsys AND
the SCMI server, that allows the Linux Pinctrl subsys to map, under-hood,
names to type/IDs as expected by the SCMI protocol layer (and by the spec):
so when you will define and describe a real platform with a DT, you will
will have to provide your name references, knowing that the shipped platform
SCMI fw will advertise exactly the same (or a superset of them)

As such, personally, I would find reasonable to use, equally, some
conventional function name like 'gpio' to advertise and configure groups
of pins as being used as GPIOs.

Maybe, though, both of these expected naming comventions should be
explicitly stated in the spec: indeed if you look at some Sensor protocol
extensions added in v3.0, in 4.7.2.5.1 "Sensor Axis Descriptors"
regarding naming we say:

"It is recommended that the name ends with ‘_’
followed by the axis of the sensor in uppercase. For
example, the name for the x-axis of a triaxial
accelerometer could be “acc_X” or “_X”."

...so maybe some similar remarks could be added here.

Souvik is really the one who can have a say about the opportunity (or
not) of these kind of explicit advised naming conventions on the spec,
so I have CCed him.
 
> On Mon, Nov 06, 2023 at 02:12:36PM +0100, Linus Walleij wrote:
> > On Fri, Oct 27, 2023 at 8:28???AM Oleksii Moisieiev
> > <Oleksii_Moisieiev@epam.com> wrote:
> > 
> > > +                keys_pins: keys-pins {
> > > +                    pins = "GP_5_17", "GP_5_20", "GP_5_22", "GP_2_1";
> > > +                    bias-pull-up;
> > > +                };
> > 
> > This is kind of interesting and relates to my question about naming groups and
> > functions of GPIO pins.
> > 
> > Here we see four pins suspiciously named "GP_*" which I read as
> > "generic purpose"
> > and they are not muxed to *any* function, yes pulled up.
> > 
> > I would have expected something like:
> > 
> > keys_pins: keys-pins {
> >   groups = "GP_5_17_grp", "GP_5_20_grp", "GP_5_22_grp", "GP_2_1_grp";
> >   function = "gpio";
> >   pins = "GP_5_17", "GP_5_20", "GP_5_22", "GP_2_1";
> >   bias-pull-up;
> > };
> > 
> > I hope this illustrates what I see as a problem in not designing in
> > GPIO as an explicit
> > function, I get the impression that these pins are GPIO because it is hardware
> > default.
> 
> If you want to stick to "explicit", we may rather introduce a pre-defined
> sub-node name, "gpio", in a device tree binding, i.e.
> 
>   protocol@19 { // pinctrl protocol
>       ... // other pinmux nodes
> 
>       scmi_gpio: gpio { // "gpio" is a fixed name
>           keys-pins {
>               pins = "GP_5_17", "GP_5_20", "GP_5_22", "GP_2_1";
>               bias-pull-up;
>               // possibly input or output
>           };
>           input-pins {
>               groups = "some group"; // any name
>               input-mode;
>           }
>           output-pins {
>               pins = "foo1", "foo2"; // any name
>               output-mode;
>           }
>       }
>   }
>

I suppose your proposal of a specially named "gpio" node would be
another way, BUT it would also mean describing something in the DT that
could be discoverable dynamically querying the server (while making the
above assumptions about conventions).

Thanks,
Cristian

