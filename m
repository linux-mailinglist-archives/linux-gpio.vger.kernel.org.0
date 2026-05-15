Return-Path: <linux-gpio+bounces-36950-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIiqF9FTB2pIygIAu9opvQ
	(envelope-from <linux-gpio+bounces-36950-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 19:11:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DC554927
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 19:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E43D301C8A7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39784DBD7E;
	Fri, 15 May 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv+CMK0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4F4CA26E;
	Fri, 15 May 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864287; cv=none; b=eev7pfZHd5DbFn5pywLyBVX2/ysxEBpJKY09zriwa9WMHAUP0vY2NxaT2OMFe6S6CQ5X6gB3zftyFFcqrR3BQCAs4t9iom0kgXHgNGcRt5iL/ZxsOZHmEC6JVxdlJ6B1R2NFOI76cv7d4cYnZUmCa/uGogI4NSpZ5rMLPB+qVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864287; c=relaxed/simple;
	bh=+uvwRRXb0+ag+SzLI9XwgxVtGQw0racVNBs8qolbmd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ5cMl5Aldyy+aX/rBaVsYUHJit+WAr44vFS5OT190Oa6yASFV/7HePLtPbiXVEvfBLaXzwZLAA4vNvzQ/wx2YiNuplChBjtOPmC+zgrgfRVx8d/A6MXNeM7rtVS74KtPhHvHj7As2FSA6rlJKNtHHSI7+dEDdzEsguJYnsnvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv+CMK0d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB3FC2BCB0;
	Fri, 15 May 2026 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864287;
	bh=+uvwRRXb0+ag+SzLI9XwgxVtGQw0racVNBs8qolbmd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nv+CMK0dIIDJ16d8jDglGtsTecbrA3gz6no2bADm+YJFI43q6uvZAjo8+1dryXXhz
	 hn3f6ALLPmrtT2d5zIviNvwOPOXEILIkqvUj3B1feh3myA4YnGccVIK9sRFBsw1rg5
	 6h7hGS9+o4CAjKGa9lgk+bZbKUxHb8vGuWRZcPIk26YsbcQZtI31iVUKMwMIKIeQ/s
	 shO1d8E5i5esuR/n7OGH3LDuRZAEaQ8VqXyGGg7EpDX5bJRxd3wtCu/nHn4wGYIOmT
	 vB7PyebUZsUN7gyBqAn86N0q1/WyGd7G6N0ZzsUy7YvBrfplNnOr+gjDJqLV9P4KpK
	 h32H2/e0EdWoQ==
Date: Fri, 15 May 2026 17:58:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260515-outplayed-java-635f7231d394@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-dandruff-shorts-d7417c6e977a@wendy>
 <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-bounce-lather-23de8e36754c@wendy>
 <ZQ4PR01MB12021791B5A255F9EB91D9F6F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZZhM5VJBeP8Nh3yc"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB12021791B5A255F9EB91D9F6F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-Rspamd-Queue-Id: 9D5DC554927
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36950-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--ZZhM5VJBeP8Nh3yc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:30:38AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the comments.
>=20
> > On Fri, May 15, 2026 at 08:23:55AM +0000, Changhuang Liang wrote:
> > > > On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> > > > > > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrot=
e:
> > > > > > > Some pinctrl subnodes only need to configure pin properties
> > > > > > > (e.g., power-source, bias, drive strength) without assigning =
any mux
> > function.
> > > > > > >
> > > > > > > Currently, the driver requires a valid "function" property for
> > > > > > > all pinctrl subnodes. This forces the addition of dummy or
> > > > > > > redundant "function" entries when only pin configuration is n=
eeded.
> > > > > > >
> > > > > > > Example use case:
> > > > > > > gpios-configs {
> > > > > > >     config {
> > > > > > >         pins =3D <0 1 2 3>;
> > > > > > >         power-source =3D <0>;
> > > > > > >     };
> > > > > > > };
> > > > > > >
> > > > > > > Make the "function" property optional. If it is missing, skip
> > > > > > > adding the mux map and only process the pin configuration.
> > > > > >
> > > > > > I looked through the series though and all controllers appear to
> > > > > > have pins and functions, is it the case that gpio is the default
> > > > > > for these pins, so you are omitting the functions property when
> > > > > > you are using
> > > > the pin in gpio mode?
> > > > > > Saying that the functions property is "redudant" makes it seem
> > > > > > like this might be the case?
> > > > > >
> > > > > > I've got some feedback here, but I can't really provide it
> > > > > > without knowing the answer to that question.
> > > > >
> > > > >
> > > > > "From v1, copying Linus's suggestion:
> > > > >
> > > > > > +  This domain contains 4 IO groups which support voltage levels
> > > > > > + 1.8V and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through
> > > > PAD_GPIO_C4.
> > > > > > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > > > > > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > > > > > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > > > > > +
> > > > > > +  Each of the above IO groups must be configured with a voltage
> > > > > > + setting that matches the external  voltage level provided to
> > > > > > + the IO
> > > > group.
> > > > >
> > > > > So your hardware has groups and support some properties on the
> > > > > group
> > > > level.
> > > > >
> > > > > So expose these groups and make these properties configurable per
> > > > > group instead of inventing per-group properties.
> > > > >
> > > > > > +  gpioe-spi-vref:
> > > > > > +  gpioe-qspi0-vref:
> > > > > > +  gpioe-qspi1-vref:
> > > > > > +  gpioe-qspi2-vref:
> > > > >
> > > > > Create proper groups in the pin controller then use the standard
> > > > > pincfg property power-source =3D <...>; for this.
> > > > >
> > > > > Example for a simple default hog:
> > > > >
> > > > > pinctrl {
> > > > >     /* Hog the QSPI pins */
> > > > >     pinctrl-names =3D "default";
> > > > >     pinctrl-0 =3D <&qspi_default>;
> > > > >
> > > > >     qspi_default: pinctrl-qspi {
> > > > >         config {
> > > > >             groups =3D "gpioe-qspi-pins";
> > > > >             power-source =3D <2>;
> > > > >         };
> > > > >     };
> > > > > };
> > > > >
> > > > > The groups can be orthogonal to other pin handling, that's fine.
> > > > > Implement .pin_config_group_set in struct pinconf_ops.
> > > > >
> > > > > However, I found that
> > > > > pinctrl_generic_pins_function_dt_node_to_map()
> > > > > does not handle the groups property,
> > > >
> > > > That's kind of the whole point of the function, see the comment
> > > > about
> > > > it:
> > > > /*
> > > >  * For platforms that do not define groups or functions in the
> > > > driver, but
> > > >  * instead use the devicetree to describe them. This function will,
> > > > unlike
> > > >  * pinconf_generic_dt_node_to_map() etc which rely on driver defined
> > > > groups
> > > >  * and functions, create them in addition to parsing pinconf
> > > > properties and
> > > >  * adding mappings.
> > > >  */
> > > >
> > > > If you have the groups property in your devicetree, it contains
> > > > strings that the driver uses to match against the groups it has def=
ined in it.
> > > > See my recently added microchip,pic64gx-pinctrl-gpio2 for an example
> > > > of that if you like.
> > > >
> > > > However, if you are using the pins or pinmux properties, the groups
> > > > are not defined in the driver, and need to be created at runtime.
> > > > That's what
> > > > pinctrl_generic_pins_function_dt_node_to_map() is for - it creates
> > > > the groups at runtime when using the *pins* and *function* properti=
es.
> > > > It's in the name!
> > > >
> > > > Judging by your drivers, and how many structures you have that look
> > > > very like groups from a quick glance, probably you can still make
> > > > use of the groups property. The equivalent function to
> > > > pinctrl_generic_pins_function_dt_node_to_map() when you're using
> > > > driver defined groups is pinconf_generic_dt_node_to_map().
> > >
> > > I feel that for the current platform, initializing pin voltage is
> > > suitable for using `pinconf_generic_dt_node_to_map()`,
> > > and configuring pin mux is suitable for using
> > > `pinctrl_generic_pins_function_dt_node_to_map()`. Should I use both of
> > them at the same time?
> >=20
> > No, pick either groups or pins across the board and then use the approp=
riate
> > function after that. Mixing and matching just adds complication for no =
real
> > reason.
> >=20
> > > > Also, I notice that you never actually answered the question that I
> > > > asked:
> > > > > > I looked through the series though and all controllers appear to
> > > > > > have pins and functions, is it the case that gpio is the default
> > > > > > for these pins, so you are omitting the functions property when
> > > > > > you are using
> > > > the pin in gpio mode?
> > > > > > Saying that the functions property is "redudant" makes it seem
> > > > > > like this might be the case?
> > > >
> > > > Are you omitting the functions property from your nodes when they're
> > > > using gpio because it is a default, or is there some other reason
> > > > why you're omitting the functions property sometimes?
> > >
> > > Sorry, I missed that question. What I meant by making 'functions'
> > > optional is that I don't care whether the current pin's default value=
 is GPIO
> > or some other function.
> > > Here, I just want to initialize the default voltage of these pins, not
> > > configure their pin function.
> >=20
> > You're making them gpios in all the cases that I saw, so I think you're=
 best
> > served by using the "gpio" function and thereby being able to have func=
tion as
> > a required property. Unless the pins are unused, you need to set the fu=
nction
> > anyway, and if they're unused and survived on the values set by reset o=
r prior
> > boot stages, why do you need to set the voltage anyway?
> >=20
> > Looking at this node, it looks completely wrong to me:
> > +&pinctrl_sys2 {
> > +	gpiow0_configs: gpiow0-hog-grp {
> > +		gpiow0-hog-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A36
> > +				PADNUM_SYS2_GPIO_A37
> > +				PADNUM_SYS2_GPIO_A38
> > +				PADNUM_SYS2_GPIO_A39>;
> > +			power-source =3D <JHB100_PINVREF_3_3V>;
> > +		};
> > +	};
> > +
> > +	gpiow_inner_configs: gpiow-inner-hog-grp {
> > +		gpiow-inner-hog-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A40
> > +				PADNUM_SYS2_GPIO_A41
> > +				PADNUM_SYS2_GPIO_A42
> > +				PADNUM_SYS2_GPIO_A43>;
> > +			power-source =3D <JHB100_PINVREF_3_3V>;
> > +		};
> > +	};
> > +
> > +	uart6_pins: uart6-grp {
> > +		uart6-tx-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A38>;
> > +			function =3D "uart";
> > +		};
> > +
> > +		uart6-rx-pins {
> > +			pins =3D <PADNUM_SYS2_GPIO_A39>;
> > +			function =3D "uart";
> > +			input-enable;
> > +		};
> > +	};
> > +};
> >=20
> > The pins used by uart appear also in your hog node and...
> >=20
> > > This part of the voltage configuration only has one register, but it
> > > applies to many pins, so currently it seems I can only use pinctrl ho=
g to
> > initialize it.
> >=20
> > ...I think that relates to the point you make here. If a setting for the
> > power-source applies across an entire set of pins, there's no need to
> > preemptively apply this across the whole set. It's usually sufficient t=
o just set
> > the power-source in the nodes that describe pins that are actually in u=
se, for
> > example:
> >=20
> > | &pinctrl_sys2 {
> > | 	uart6_pins: uart6-grp {
> > | 		uart6-tx-pins {
> > | 			pins =3D <PADNUM_SYS2_GPIO_A38>;
> > | 			function =3D "uart";
> > | 			power-source =3D <JHB100_PINVREF_3_3V>;
> > | 		};
> > |
> > | 		uart6-rx-pins {
> > | 			pins =3D <PADNUM_SYS2_GPIO_A39>;
> > | 			function =3D "uart";
> > | 			input-enable;
> > | 			power-source =3D <JHB100_PINVREF_3_3V>;
> > | 		};
> > | 	};
> > | };
>=20
> I think this approach is suitable for cases where each pin has its own in=
dependent register filed.=20
> I'm not sure if it's suitable for this kind of voltage configuration wher=
e multiple pins share a=20
> single register field.
>=20
> With this approach, the driver would end up writing the same value to the=
 same register twice,=20
> once for A38 and once for A39. Is that acceptable?

IMO, yes. This wouldn't be the only driver that does this. Only problem
is potentially using the wrong voltage in two nodes that affect pins in
the same vref group - but that's a flaw with the current setup too,
since nothing stops you putting power-source into multiple nodes at
present either. It's not ideal, but it's definitely more acceptable than
what you have here at the moment.

>=20
> If that's acceptable, the code would indeed become much simpler.

And you can make pins and functions required properties then too I
think, which is a win. Or groups and functions if you pivot there.

--ZZhM5VJBeP8Nh3yc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdQmQAKCRB4tDGHoIJi
0nMjAQC21w7gXszUg0gQDJ/WIXbLjOt/jmJMTZulnr/4B8XojAEApJ9RI5ZwjiUU
wevelOpAo4+3T0VNQGPxGgXfPyJK+gI=
=jV/c
-----END PGP SIGNATURE-----

--ZZhM5VJBeP8Nh3yc--

