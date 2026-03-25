Return-Path: <linux-gpio+bounces-34167-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ESTDOAdxGmZwgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34167-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 18:39:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16E329FB2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 18:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90121300D778
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 17:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3F94070F2;
	Wed, 25 Mar 2026 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKcBY6a7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D623406281;
	Wed, 25 Mar 2026 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774460103; cv=none; b=Eyp5wecb5bCIhsWgxiIZy+gxxPeuYaRdbxBju6CAXmDvYqHFGmog3sje2sqIZ9lJvIYcVzo6DIUPotQTcZHJRtoG1aFaewrO/ak+POCtGlMruH79sxK92uSXvAZuhXbbyXh4b68pNXXcw+r2Bq6urxsH7bZpAvIcGhM1Lj4yTlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774460103; c=relaxed/simple;
	bh=EbLhVB6iS1vlGuGUCtBUkhmq/icBUn65MiS+x1rEuCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y02fRj4ZvI1mmOqjU463sAnbiPg2qZhc2EIYDGIMbanfLNtPYcTvtPiTWAJUNRD39/U7QbWA+xNDprV/4ZWGD7eRUzEGtv4VRWgpeJlm/BTFYQqxcgFnhEu16c1Pb9CyjPfYwhCW3656E4Ls6MpR57yqjePfuFeboqZteXPoBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKcBY6a7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F855C4CEF7;
	Wed, 25 Mar 2026 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774460102;
	bh=EbLhVB6iS1vlGuGUCtBUkhmq/icBUn65MiS+x1rEuCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKcBY6a791jkx5gHCq4ysr7GBZz7gmQITFvcNlX6dMlMJEdujsVrD10TuUdxKphgK
	 vDjPavA1epu+sqJkkXrUFOIGYXIEvtFFRlwQE5pQPM5+2qGdFov5p+oDx+9k+4tebN
	 +g2j7XcEzN5OuXLATS5W5tdWUTXCzutiSXS84vx5RltHbFqt6YIfMQxWYt0c9rzM0e
	 nCcom3m459y+W5sCUtcKBDGAczJa8r4YawhGq+BqbnSpvrgZU6pGdCBpVmyOVgKfIz
	 j2rTS9SENMw4tS8iRSDB/8DWW3R9tqxi99Jyp7FCCXoGti1XZBPh+N0wOu/o37YesT
	 9/wPhJVRq5UJg==
Date: Wed, 25 Mar 2026 17:34:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260325-rectified-filtrate-32a8f7345d37@spud>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
 <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
 <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
 <20260325-riding-browbeat-293b47f43d82@spud>
 <acP6oFsaD8PddWjg@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CY/CCDWk7hyJWyAw"
Content-Disposition: inline
In-Reply-To: <acP6oFsaD8PddWjg@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34167-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,axentia.se,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B16E329FB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--CY/CCDWk7hyJWyAw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 11:09:20AM -0400, Frank Li wrote:
> On Wed, Mar 25, 2026 at 10:33:05AM +0000, Conor Dooley wrote:
> > On Tue, Mar 24, 2026 at 04:16:10PM -0400, Frank Li wrote:
> > > On Fri, Mar 20, 2026 at 09:54:45AM -0400, Frank Li wrote:
> > > > On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> > > > > On Thu, Mar 19, 2026 at 12:04=E2=80=AFAM Frank Li <Frank.li@nxp.c=
om> wrote:
> > > > > > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> > > > >
> > > > > > > That said: in this case you're just adding a parameter, just =
add
> > > > > > > the parameter and change all of the in-tree users to pass fal=
se
> > > > > > > or whatever you need, these is just one (1) in-tree user anyw=
ay.
> > > > > >
> > > > > > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > > > > > .dt_node_to_map() callback, add parameter will impact too much.
> > > > >
> > > > > Why do you say that. It already has many parameters, one more
> > > > > or less doesn't matter. It's not like this call is performance-cr=
itical.
> > > > > Just change the users.
> > > >
> > > > In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
> > > > 	.dt_node_to_map =3D pinctrl_generic_pins_function_dt_node_to_map;
> > > >
> > > > pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_=
to_map()'s
> > > > declear.
> > > >
> > > > So it can't direct add two parameters in pinctrl_generic_pins_funct=
ion_dt_node_to_map()
> > > > Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
> > > > pinconf.h.
> > > >
> > > > If add two parameter in .dt_node_to_map(), need change all function=
s, which
> > > > .dt_node_to_map =3D xxx_to_map(). and OF core part.
> > >
> > > Linus Walleij:
> > > 	Is my explain clear enough? I am preparing respin it?
> > >
> > > 	is okay use wrap function
> > > 	pinctrl_generic_pins_function_dt_node_to_map_ext()?
> >
> > I don't understand this patch. The function is called
> > pinctrl_generic_pins_function_dt_node_to_map(). You have no pins.
> > You're adding a parameter to make a function with *pins* in its name not
> > use pins. The new function doesn't use pins but has pins in the name.
> > At the very least function names should not be misleading.
> >
> > I was going to suggest pulling out the relevant portions and creating
> > some helpers that could be used by multiple different-but-similar
> > functions, but I don't actually even think that there's much in common.
> > Most damningly I think, you don't actually read either the functions or
> > pins properties at all and neither are permitted by your binding.
> > So turns out you use neither pins or functions...
> >
> > You don't actually have any of these properties which runs counter to t=
he
> > goal of the function, which is parsing. With this in mind, it feels to =
me
> > like you're trying way too hard to make use of a generic function when =
the
> > right thing to do is probably just have an entirely custom function.
> > Maybe that's a custom implementation in your driver, or a new function
> > here, but I think writing that will highlight just how little of the
> > code would be shared between the existing function and what your
> > use-case needs: no pin configuration stuff, no reading of the devicetree
> > other than the node names and no dealing with the label pointing to the
> > "wrong" place.
> >
> > I recently bought a spacemit k1 board to go and write a sister function
> > to pinctrl_generic_pins_function_dt_node_to_map() that deals with pins
> > and groups (because that's a pretty common pattern).
> > I would be calling that pinctrl_generic_pinmux_dt_node_to_map(),
> > because it that's the property it deals with. I have honestly got no
> > idea what to call one for this situation since you don't have any of the
> > properties in pinmux-node.yaml. Maybe that's a sign.
>=20
> At v2, I implemented customize dt_node_to_map(), Linus Walleij think it is
> too similar with pinctrl_generic_pins_function_dt_node_to_map(), so ask me
> to enhanance and reuse pinctrl_generic_pins_function_dt_node_to_map().

Sure, and he's right that there's a lot similar. Everything you want to
do, other than looking at the mux state, is something that
pinctrl_generic_pins_function_dt_node_to_map() does. But bastardising
a function that's explicitly about reading pins and functions properties
to do things that have _neither_ is not a good implementation of that
review feedback.

If you're going to make something generic, the right level to hook in
IMO is at the pinctrl_generic_pins_function_dt_subnode_to_map() level,
I already know that 95% of the code in that function is identical to
what will be used for the spacemit k1 that uses the pinmux property
and changing its API is a lot easier than changing the API of something
that is written to match the dt_node_to_map callback.
You don't even benefit from the extra functionality that
pinctrl_generic_pins_function_dt_node_to_map() provides, because you
don't have ambiguity about where the phandle you're parsing from points.
In your case, it has to be the group node.

pinctrl_generic_pins_function_dt_subnode_to_map() could probably be
split into two parts, one that does the dt parsing portion and a second
portion that does the mapping to kernel data structures. The first
portion of that is the for loop. The second portion is everything after
the for loop and the bit that names the groups. IOW, do something like
what I am pasting here, and you create your own function that wraps
pinctrl_generic_to_map() in the way you want. I personally think this is
more tasteful than what you've done, and more importantly I am pretty
sure that this is what's needed to be able to maximise code reuse for
the devices that use pinmux. I didn't compile this or anything, it's
just speculative.

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-ge=
neric.c
index efb39c6a67033..7f02af6d9f3e4 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -17,56 +17,30 @@
 #include "pinctrl-utils.h"
 #include "pinmux.h"
=20
-static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_=
dev *pctldev,
-							   struct device_node *parent,
-							   struct device_node *np,
-							   struct pinctrl_map **maps,
-							   unsigned int *num_maps,
-							   unsigned int *num_reserved_maps,
-							   const char **group_names,
-							   unsigned int ngroups)
+static int pinctrl_generic_to_map(struct pinctrl_dev *pctldev,
+				  struct device_node *parent,
+				  struct device_node *np,
+				  struct pinctrl_map **maps,
+				  unsigned int *num_maps,
+				  unsigned int *num_reserved_maps,
+				  const char **group_names,
+				  unsigned int ngroups,
+				  const char **functions,
+				  unsigned int *pins,
+				  void *function_data)
 {
 	struct device *dev =3D pctldev->dev;
-	const char **functions;
 	const char *group_name;
 	unsigned long *configs;
-	unsigned int num_configs, pin, *pins;
+	unsigned int num_configs;
 	int npins, ret, reserve =3D 1;
=20
-	npins =3D of_property_count_u32_elems(np, "pins");
-
-	if (npins < 1) {
-		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
-			parent, np, npins);
-		return npins;
-	}
-
 	group_name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
 	if (!group_name)
 		return -ENOMEM;
=20
 	group_names[ngroups] =3D group_name;
=20
-	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
-		return -ENOMEM;
-
-	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
-	if (!functions)
-		return -ENOMEM;
-
-	for (int i =3D 0; i < npins; i++) {
-		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
-		if (ret)
-			return ret;
-
-		pins[i] =3D pin;
-
-		ret =3D of_property_read_string(np, "function", &functions[i]);
-		if (ret)
-			return ret;
-	}
-
 	ret =3D pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_m=
aps, reserve);
 	if (ret)
 		return ret;
@@ -101,6 +75,52 @@ static int pinctrl_generic_pins_function_dt_subnode_to_=
map(struct pinctrl_dev *p
 		return ret;
=20
 	return 0;
+}
+
+static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_=
dev *pctldev,
+							   struct device_node *parent,
+							   struct device_node *np,
+							   struct pinctrl_map **maps,
+							   unsigned int *num_maps,
+							   unsigned int *num_reserved_maps,
+							   const char **group_names,
+							   unsigned int ngroups)
+{
+	struct device *dev =3D pctldev->dev;
+	const char **functions;
+	unsigned int pin, *pins;
+	int npins, ret;
+
+	npins =3D of_property_count_u32_elems(np, "pins");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	functions =3D devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
+	if (!functions)
+		return -ENOMEM;
+
+	for (int i =3D 0; i < npins; i++) {
+		ret =3D of_property_read_u32_index(np, "pins", i, &pin);
+		if (ret)
+			return ret;
+
+		pins[i] =3D pin;
+
+		ret =3D of_property_read_string(np, "function", &functions[i]);
+		if (ret)
+			return ret;
+	}
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				  num_reserved_maps, group_names, ngroups,
+				  functions, pins, NULL);
 };
=20
 /*



--CY/CCDWk7hyJWyAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQcwAAKCRB4tDGHoIJi
0nufAQC7IzecDMz+IrNzep7T25HQ6q+Wz7UOlRjqLF09T+nBpwD/bdchu60ojsQu
Zgpf0gxXCq/NriMhr7Etk/Epp9gobQ0=
=T+72
-----END PGP SIGNATURE-----

--CY/CCDWk7hyJWyAw--

